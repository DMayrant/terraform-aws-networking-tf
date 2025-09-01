module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "17-local-modules"

    # if you have a multiple vpc data in your module you can pass a config variable" 
  
 vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "17-local-modules"

 }

  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1"
    }

    }
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
        public     = true
      az         = "us-east-1"
    }

  }
  subnet_3 = {
    cidr_block = "10.0.2.0/24"
    public     = false
    az         = "us-east-1"
  
  }

    subnet_4 = {
        cidr_block = "10.0.3.0/24"
        public  = false
        az         = "us-east-1"
    }
}

