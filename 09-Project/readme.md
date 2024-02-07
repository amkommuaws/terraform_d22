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
    * SG : 22,80, 8080
    * Create your own key-pairs, and call them using the resource of EC2 creation.
    * Ec2 instance
    * create elastic_ip and assign that ip to the ec2 machine created in the above step
    * We need to install docker during the infra creation itself and make sure a container is been in the running state , and the same applicaiton is accessible through internet at port 8080.