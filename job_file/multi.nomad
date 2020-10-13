job "snapshot-oct" {

  multiregion {  # Enterpise feature

    strategy {
      max_parallel = 1
      on_failure   = "fail_local"
    }

    region "ap-northeast-1" {
      count       = 2
      datacenters = ["ap-northeast-1a"]
    }

    region "ap-southeast-2" {
      count       = 3
      datacenters = ["ap-southeast-2a"]
    }

  }

  update {
    max_parallel      = 1
    min_healthy_time  = "10s"
    healthy_deadline  = "2m"
    progress_deadline = "3m"
    auto_revert       = true
    auto_promote      = true
    canary            = 1 
    stagger           = "30s"
  }
    
  group "cache" {

    count = 0

    task "redis" {
      driver = "docker"

      config {
        image = "redis:6.0"

        port_map {
          db = 6379
        }
      }

      resources {
        cpu    = 100
        memory = 64

        network {
          mbits = 10
          port "db" {}
        }
      }

			service {
				name = "${NOMAD_TASK_NAME}"
				port = "6379"

				tags = [
					"snapshot"
				]
			}
    }
  }
}
