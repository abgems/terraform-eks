module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "20.8.4"
    cluster_name = local.cluster_name
    cluster_version = var.kuberentes_version
    subnet_ids = module.vpc.private_subnets

    enable_irsa = true

    vpc_id = module.vpc.vpc_id
    eks_managed_node_group_defaults = {
        ami_type       = "AL2023_x86_64_STANDARD"
        instance_types = ["t3a.small"]

      
    }
    eks_managed_node_groups = {
        node_group = {
            min_size  = 2
            max_size  = 1
            desired_size = 1
        }
    }
  
}
