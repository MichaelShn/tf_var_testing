terraform {
  required_version = ">= 0.14.0"
  required_providers {
    template = {
      source = "hashicorp/template"
      version = "2.1.2"
    }
  }
}

data "template_file" "template" {
  template = <<EOF
Updated message: $${message}
EOF
  vars = {
    message = var.hostname
  }
}

output "certificateA" {
  value = data.template_file.template.rendered
}
