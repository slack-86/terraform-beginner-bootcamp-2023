require 'sinatra'
require 'json'
require 'pry'
require 'active_model'

# there will be a mock state and database for the dev server set with a global variable. This would not be used in a production server.
$home = {}

# this is a ruby class that includes validations from activerecord
# this will represent our home resource as a ruby object

class Home
  # active model is part of Ruby on Rails
  # it is used as an ORM. It has a module witin
  # active model that provides validations.
  # the production TerraTowns server is Rails and 
  # uses similar and mostly identical validation.

  include ActiveModel::Validations

  # create virtual attributes stored on this object
  # Sets a getter and a setter
  # eg.
  # home = new Home()
  # home.town = 'hello' #setter
  # home.town() #getter

  attr_accessor :town, :name, :description, :domain_name, :content_version

  # town eg. gamers-grotto
  validates :town, presence: true, inclusion: { in: [
    'cooker-cove',
    'melomaniac-mansion',
    'video-valley',
    'the-nomad-pad',
    'gamers-grotto',
  ]}
  # name and description visible to all users
  validates :name, presence: true
  validates :description, presence: true
  # only from cloudfront
  validates :domain_name, 
    format: { with: /\.cloudfront\.net\z/, message: "domain must be from .cloudfront.net" }
    # uniqueness: true, 

  # content version has to be an integer
  # will check if it's incremental in the controller

  validates :content_version, numericality: { only_integer: true }
end

# Extending a class from Sinatra::Base to make this generic
# class utilize the sinatra web framework

class TerraTownsMockServer < Sinatra::Base

  def error code, message
    halt code, {'Content-Type' => 'application/json'}, {err: message}.to_json
  end

  def error_json json
    halt code, {'Content-Type' => 'application/json'}, json
  end

  def ensure_correct_headings
    unless request.env["CONTENT_TYPE"] == "application/json"
      error 415, "expected Content_type header to be application/json"
    end

    unless request.env["HTTP_ACCEPT"] == "application/json"
      error 406, "expected Accept header to be application/json"
    end
  end
  # return hard coded access token
  def x_access_code
    return '9b49b3fb-b8e9-483c-b703-97ba88eef8e0'
  end

  def x_user_uuid
    return 'e328f4ab-b99f-421c-84c9-4ccea042c7d1'
  end

  def find_user_by_bearer_token
    auth_header = request.env["HTTP_AUTHORIZATION"]
    # Check if AUTHORIZATION header and Bearer token is present
    if auth_header.nil? || !auth_header.start_with?("Bearer ")
      error 401, "a1000 Failed to authenicate, bearer token invalid and/or teacherseat_user_uuid invalid"
    end

    # Does the token match database?
    # return error if it doesn't match
    # code = acces code = token
    code = auth_header.split("Bearer ")[1]
    if code != x_access_code
      error 401, "a1001 Failed to authenicate, bearer token invalid and/or teacherseat_user_uuid invalid"
    end

    # Check user_uuid presence in body paylod .json
    if params['user_uuid'].nil?
      error 401, "a1002 Failed to authenicate, bearer token invalid and/or teacherseat_user_uuid invalid"
    end

    # The code and user_uuid should match for this user
    # In Rails: user.find_by access_code: user_uuid
    unless code == x_access_code && params['user_uuid'] == x_user_uuid
      error 401, "a1003 Failed to authenicate, bearer token invalid and/or teacherseat_user_uuid invalid"
    end
  end

  # CREATE
  post '/api/u/:user_uuid/homes' do
    ensure_correct_headings
    find_user_by_bearer_token
    # puts will print to the terminal similar to 'print'
    puts "# create - POST /api/homes"

    
    # a begin/rescue is a try/catch, if an error occurs, result it.
    # Sinatra does not auto parse json body as params. Manually parse it.
    begin
      payload = JSON.parse(request.body.read)
    rescue JSON::ParserError
      halt 422, "Malformed JSON"
    end

    # Validate payload data
    # Assign paylod to variables to make easier to work with
    name = payload["name"]
    description = payload["description"]
    domain_name = payload["domain_name"]
    content_version = payload["content_version"]
    town = payload["town"]

    # printing variables to console to make it easy to see
    puts "name #{name}"
    puts "description #{description}"
    puts "domain_name #{domain_name}"
    puts "content_version #{content_version}"
    puts "town #{town}"

    # Create a new home model and set attributes
    home = Home.new
    home.town = town
    home.name = name
    home.description = description
    home.domain_name = domain_name
    home.content_version = content_version
    
    # Ensure validation checks passed, else return error as json
    unless home.valid?
      error 422, home.errors.messages.to_json
    end

    # generate a uuid at random
    uuid = SecureRandom.uuid
    puts "uuid #{uuid}"
    # will mock save to the mock database (a global variable)
    $home = {
      uuid: uuid,
      name: name,
      town: town,
      description: description,
      domain_name: domain_name,
      content_version: content_version
    }

    # will just return to uuid
    return { uuid: uuid }.to_json
  end

  # READ
  get '/api/u/:user_uuid/homes/:uuid' do
    ensure_correct_headings
    find_user_by_bearer_token
    puts "# read - GET /api/homes/:uuid"

    # checks for house limit

    content_type :json
    if params[:uuid] == $home[:uuid]
      return $home.to_json
    else
      error 404, "failed to find home with provided uuid and bearer token"
    end
  end

  # UPDATE
  # very similar to CREATE
  put '/api/u/:user_uuid/homes/:uuid' do
    ensure_correct_headings
    find_user_by_bearer_token
    puts "# update - PUT /api/homes/:uuid"
    begin
      # Parse JSON payload from the request body
      payload = JSON.parse(request.body.read)
    rescue JSON::ParserError
      halt 422, "Malformed JSON"
    end

    # Validate payload data
    name = payload["name"]
    description = payload["description"]
    domain_name = payload["domain_name"]
    content_version = payload["content_version"]

    unless params[:uuid] == $home[:uuid]
      error 404, "failed to find home with provided uuid and bearer token"
    end

    home = Home.new
    home.town = $home[:town]
    home.domain_name = $home[:domain_name]
    home.name = name
    home.description = description
    home.content_version = content_version

    unless home.valid?
      error 422, home.errors.messages.to_json
    end

    return { uuid: params[:uuid] }.to_json
  end

  # DELETE
  # delete from the mock database
  delete '/api/u/:user_uuid/homes/:uuid' do
    ensure_correct_headings
    find_user_by_bearer_token
    puts "# delete - DELETE /api/homes/:uuid"
    content_type :json

    if params[:uuid] != $home[:uuid]
      error 404, "failed to find home with provided uuid and bearer token"
    end

    uuid = $home[:uuid]
    $home = {}
    { uuid: uuid }.to_json
    #{ message: "House deleted successfully" }
    
  end
end

# This is what will run the server
TerraTownsMockServer.run!