output "cluster_id" {
    description = "cluster id of eks"
    value = module.eks.cluster_id
  
}
output "cluster_endpoint" {
    description = "cluster endpoint"
    value = module.eks.cluster_endpoint
  
}
output "cluster_security_group_id" {
    description = "cluster security gorup id"
    value = module.eks.node_security_group_id
  
}

output "oidc_provider_arn" {
    description = "oidc provider arn"
    value = module.eks.oidc_provider_arn
  
}
