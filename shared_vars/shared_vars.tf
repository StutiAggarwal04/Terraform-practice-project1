output "vpcid" {
    value = "${local.vpcid}"
}

output "publicsubnetid" {
    value = "${local.publicsubnetid}"
}

output "privatesubnetid" {
    value = "${local.privatesubnetid}"
}

output "env_suffix" {
    value = "${local.env}"
}

locals {
    env = "${terraform.workspace}"

    vpcid_env = {
        default = "vpc-b3ae37ce"
        staging = "vpc-b3ae37ce"
        production = "vpc-b3ae37ce"
    }
    vpcid = "${lookup(local.vpcid_env, local.env)}"

    publicsubnet_env = {
        default = "subnet-cd1a8afc"
        staging = "subnet-cd1a8afc"
        production = "subnet-cd1a8afc"
    }
    publicsubnetid = "${lookup(local.publicsubnet_env, local.env)}"

    privatesubnet_env = {
        default = "subnet-717d3117"
        staging = "subnet-717d3117"
        production = "subnet-717d3117"
    }
    privatesubnetid = "${lookup(local.privatesubnet_env, local.env)}"
}