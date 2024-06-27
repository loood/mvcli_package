packer {
  required_plugins {
    docker = {
      source  = "github.com/hashicorp/docker"
      version = "~> 1"
    }
  }
}

source "docker" "build" {
  discard    = true
  image      = "tenzer/fpm"
  privileged = true
  volumes = {
    "${path.cwd}" = "/deb_dist"
  }
}

build {
  sources = ["source.docker.build"]

  provisioner "shell" {
    scripts = ["scripts/build.sh"]
  }
}
