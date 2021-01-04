
resource  "aws_ami_from_instance" "shoppingkart-ami" {
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
output "myos_ami1" {
  
  value = aws_ami_from_instance.shoppingkart-ami.id
  
}
