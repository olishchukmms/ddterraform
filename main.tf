terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

# Example Ordered Layout
resource "datadog_dashboard" "MAAC_dashboard" {
  title        = "Monitoring as a code"
  description  = "Created using the Datadog provider in Terraform"
  layout_type  = "ordered"
  is_read_only = true

  widget {
    hostmap_definition {
      request {
        fill {
          q = "source:kubernetes"
        }
      }
      node_type       = "container"
      no_group_hosts  = true
      no_metric_hosts = true
      style {
        palette      = "yellow_to_green"
        palette_flip = true
        fill_min     = "10"
        fill_max     = "20"
      }
      title = "Random widget"
    }
  }

  widget {
    note_definition {
      content          = "Note text"
      background_color = "pink"
      font_size        = "14"
      text_align       = "center"
      show_tick        = true
      tick_edge        = "left"
      tick_pos         = "50%"
    }
  }
}