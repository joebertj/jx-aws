module "eks-jx" {
  source  = "/home/joebert/terraform-aws-eks-jx"
  apex_domain = "kenchlightyear.com"
  cluster_name = "jx-aws"
  cluster_version = "1.15"
  create_and_configure_subdomain = false
  desired_node_count = 2
  enable_external_dns = true 
  enable_logs_storage = true
  enable_reports_storage = true
  enable_repository_storage = true
  enable_spot_instances = true
  enable_tls = true
  force_destroy = true
  max_node_count = 4
  min_node_count = 2
  node_machine_type = "t3a.large"
  spot_price = "0.03"
  production_letsencrypt = true
  region = "us-west-2"
  subdomain = ""
  tls_email = "joebert@kenchlightyear.com"
  vpc_cidr_block = "172.15.0.0/16"
  vpc_name = "tf-jx-aws"
  vpc_subnets = [ "172.15.0.0/24", "172.15.1.0/24", "172.15.2.0/24" ]
}

output "vault_user_id" {
  value       = module.eks-jx.vault_user_id
  description = "The Vault IAM user id"
}

output "vault_user_secret" {
  value       = module.eks-jx.vault_user_secret
  description = "The Vault IAM user secret"
}
