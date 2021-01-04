
provider "aws" {
  region = "ap-south-1"
  profile = "myshoaib"
}

resource "aws_db_instance" "rdsdb" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.6.39"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "root"
  password             = "shoaib12"
  vpc_security_group_ids = ["sg-091c70c4219c0ee8d"]
  apply_immediately         = true
  final_snapshot_identifier = "ci-aurora-cluster-backup"
  skip_final_snapshot       = true
  
  
}

resource "aws_instance" "web" {
  ami           = "ami-003fc317e2b300fa9"
  instance_type = "t2.micro"
  key_name = "arthkeypair"
  vpc_security_group_ids = ["sg-091c70c4219c0ee8d"]
  

  connection {
    type     = "ssh"
    user     = "bitnami"
    private_key = file("C:/Users/hp/awskey/arthkeypair.pem")
    host     = aws_instance.web.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo rm -rf htdocs/*",
      "sudo git clone https://github.com/shoaib74/opencart-pipeline.git htdocs/",
      "sudo mv htdocs/opencart-pipeline/* htdocs/ ",
      "sudo chmod 777 -R htdocs/"
    ]
  }

  tags = {
    Name = "app1"
  }

}


output "myos_ip" {
  
  value = aws_instance.web.public_ip
  
}

resource "null_resource" "nulllocal1"  {
	provisioner "local-exec" {
	    command = "python automation.tf.py"
  	}
}
output "mydbendp" {
  
  value = aws_db_instance.rdsdb.endpoint
}






/*after above work done we have to run python automation.py file after this we have to run again terraform for below code*/


/* resource  "aws_ami_from_instance" "shoppingkart-ami" {
    name               = "shoppingkart-ami"
    source_instance_id = aws_instance.web.id

  depends_on = [
      aws_instance.web,
      ]

  tags = {
      Name = "shoppingkart-ami1"
  }

}
resource "aws_instance" "web2" {
    ami = aws_ami_from_instance.shoppingkart-ami.id
    instance_type = "t2.micro"
    key_name ="arthkeypair"
    vpc_security_group_ids = ["sg-091c70c4219c0ee8d"]
   

    tags =  {
        Name = "app2"
    }
} 





resource "aws_lb" "applb" {
  name               = "applb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-5c9f8a34", "subnet-98502ad4", "subnet-11e06c6a"]

  enable_deletion_protection = false


  tags = {
    Environment = "shopapp"
  }
}
*/