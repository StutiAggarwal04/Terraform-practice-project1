module "shared_vars" {
    source = "../shared_vars"
}

variable privatesg_id {}

locals {
    env = "${terraform.workspace}"

    amiid_env = {
        default = "ami-0dc2d3e4c0f9ebd18"
        staging = "ami-0dc2d3e4c0f9ebd18"
        production = "ami-0dc2d3e4c0f9ebd18"
    }
    amiid = "${lookup(local.amiid_env, local.env)}"

    instancetype_env = {
        default = "t2.micro"
        staging = "t2.micro"
        production = "t2.micro"
    }
    instancetype = "${lookup(local.instancetype_env, local.env)}"

    keypairname_env = {
        default = "elk assignment"
        staging = "elk assignment"
        production = "elk assignment"
    }
    keypairname = "${lookup(local.keypairname_env, local.env)}"
}

resource "aws_launch_configuration" "sampleapp_lc" {
  name          = "sampleapp_lc_${local.env}"
  image_id      = "${local.amiid}"
  instance_type = "${local.instancetype}"
  key_name      = "${local.keypairname}"
  user_data     = "${file("assets/userdata.txt")}"
  security_groups = ["${var.privatesg_id}"]
}
