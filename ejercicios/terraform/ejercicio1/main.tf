
# Proveedor de AWS
provider "aws" {
  region = "us-east-1"
}

# Recurso: Instancia EC2
resource "aws_instance" "mi_instancia" {
  ami           = "ami-0c55b159cbfafe1f0"  # Reemplaza con una AMI válida en tu región
  instance_type = "t2.micro"

  tags = {
    Name = "MiInstanciaTerraform"
  }
}
