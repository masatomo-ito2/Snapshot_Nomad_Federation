job "snapshot-oct" {

	multiregion {

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

	group "sidecar" {

		# set the reschedule stanza so that we don't have to wait too long
		# for the deployment to be marked failed

		reschedule {
			attempts       = 1
			interval       = "24h"
			unlimited      = false
			delay          = "5s"
			delay_function = "constant"
		}

		task "sidecar" {
			driver = "docker"

			config {
				image   = "busybox:1"
				command = "/bin/sh"
				args    = ["local/script.sh"]
			}

			# this script will always fail in the east region
			template {
				destination = "local/script.sh"
				data        = <<EOT
if [[ ${NOMAD_REGION} == "ap-northeast-1" ]]
then
echo FAIL
exit 1
fi
echo OK
sleep 600

EOT

			}

			resources {
				cpu    = 128
				memory = 64
			}

			service {
				name = "${NOMAD_TASK_NAME}"

				tags = [
					"snapshot"
				]
		}
	}
}
