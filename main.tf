terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

# Configure the Datadog provider
provider "datadog" {
  api_key = var.DDAPIKEY
  app_key = var.DDAPPKEY
  api_url = "https://api.datadoghq.eu/"
}
