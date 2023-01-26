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
    note_definition {
      content          = "Note text. This dashboard was generated by terraform. v1"
      background_color = "pink"
      font_size        = "14"
      text_align       = "center"
      show_tick        = true
      tick_edge        = "left"
      tick_pos         = "50%"
    }
  }

  widget {
    timeseries_definition {
        request {
        query {
          metric_query {
            name        = "All Kubernetes"
            data_source = "metrics"
            query       = "avg:kubernetes.cpu.system.total{cluster-name:dev}"
          }
        }
      }
    }
  }
# some comment
  widget {
    change_definition {
        request {
        query {
          metric_query {
            name        = "Github Actions"
            data_source = "ci_pipelines"
            query       = "env:none @git.repository.id:\"github.com/olishchukmms/ddterraform\" @ci.pipeline.name:DataDog-Test @ci.provider.instance:github-actions @git.branch:main ci_level:pipeline -ci_partial_retry:true"
          }
        }
      }
    }
  }
}