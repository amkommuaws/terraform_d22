## 
* Create Terraform Settings block
* Create Provider block
* Create resource block
    * VPC
    * Subnet
    * IGW
    * Route table
    * Route
    * Association rt with subnets
    * SG : 22,80
    * Ec2 instance
    * create elastic_ip and assign that ip to the ec2 machine created in the above step
    * Lets use `depends_on` meta argument while creating `elastic_ip`