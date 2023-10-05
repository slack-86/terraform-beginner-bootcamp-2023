package main

import (
	"fmt"
	// "log"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	// "github.com/google/uuid"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})
	// Format.PrintLine
	fmt.Println("Hello, world!")
}

// in Go a titlecase function will get exported
func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider{
		ResourcesMap: map[string]*schema.Resource{

		},
		DataSourcesMap: map[string]*schema.Resource{

		},
		Schema: map[string]*schema.Schema{
			"endpoint": {
				Type: schema.TypeString,
				Required: true,
				Description: "The endpoint for the external endpoint",
			},
			"token": {
				Type: schema.TypeString,
				Required: true,
				Sensitive: true, // make the token hidden in logs
				Description: "Bearer token for authorization",
			},
			"user_uuid": {
				Type: schema.TypeString,
				Required: true,
				Description: "UUID for configuration",
				// ValidateFunc: validateUUID,
			},
		},
	}
	// p.ConfigureContextFunc = providerConfigure(p)
	return p
}

//func validateUUID(v interface{}, k string) (ws []string, errors []error) {
//	log.Print('validateUUID:start')
//	value := v.(string)
//	if _, err = uuid.Parse(value); err != nil {
//		errors = append(error, fmt.Errorf("invalid UUID format"))
//	}
//	log.Print('validateUUID:end')
//
// }