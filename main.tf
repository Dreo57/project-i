module "vpc" {
    # source = "../personal-project/vpc"
    source = "git::https://github.com/Dreo57/Project-1.git//vpc"
    
    
}

module "sg" {
    # source = "../personal-project/sg"
    source = "git::https://github.com/Dreo57/Project-1.git//sg"
    vpc = module.vpc.vpc_id
}

module "ec2" {
    # source = "../personal-project/ec2"
    source = "git::https://github.com/Dreo57/Project-1.git//ec2"
    sg_id = module.sg.sg_id
    sn_pub = module.vpc.snpub_id

}

module "db-subnet" {
    # source = "../personal-project/db-subnet"
    
    source = "git::https://github.com/Dreo57/Project-1.git//db-subnet"
    sn = module.vpc.snprvt_id
    sn1 = module.vpc.snprvt1_id

}

# module "rds" {
#     # source = "../personal-project/rds"
#     source = "git::https://github.com/Dreo57/Project-1.git//rds"
#     rds_sg = module.sg.rds_sg_id
#     db_sngp = module.db-subnet.db_sngp_id
# }

# module "launch_template" {
#     source = "../personal-project/launch_template"
#     # source = "git::https://github.com/Dreo57/Project-1.git//ec2"
#     sg_id = module.sg.sg_id

# }

# module "asg-launch_template" {
#     source = "../personal-project/asg-launch_template"
#     # source = "git::https://github.com/Dreo57/Project-1.git//asg-launch_template"
#     snpub = module.vpc.snpub_id
#     snpub1 = module.vpc.snpub1_id
#     ec2-sg_id = module.sg.ec2-sg_id
#     target-group = module.alb-tggroup.target-gp-arn
#     # alb-id = module.alb-tggroup.elb-id
# }

# module "alb-tggroup" {
#     source = "../personal-project/alb-tggroup"
#     vpc = module.vpc.vpc_id
#     dre_temp = module.asg-launch_template.launch_temp
#     alb-sg_id = module.sg.lb-sg_id
#     snpub = module.vpc.snpub_id
#     snpub1 = module.vpc.snpub1_id
    
# }
