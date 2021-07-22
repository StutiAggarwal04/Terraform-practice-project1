output "vpcid" {
    value = "${local.vpcid}"
}

output "publicsubnetid1" {
    value = "${local.publicsubnetid1}"
}

output "publicsubnetid2" {
    value = "${local.publicsubnetid2}"
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

    publicsubnetid1_env = {
        default = "subnet-cd1a8afc"
        staging = "subnet-cd1a8afc"
        production = "subnet-cd1a8afc"
    }
    publicsubnetid1 = "${lookup(local.publicsubnetid1_env, local.env)}"

    publicsubnetid2_env = {
        default = "subnet-1894df39"
        staging = "subnet-1894df39"
        production = "subnet-1894df39"
    }
    publicsubnetid2 = "${lookup(local.publicsubnetid2_env, local.env)}"

    privatesubnetid_env = {
        default = "subnet-717d3117"
        staging = "subnet-717d3117"
        production = "subnet-717d3117"
    }
    privatesubnetid = "${lookup(local.privatesubnetid_env, local.env)}"
}