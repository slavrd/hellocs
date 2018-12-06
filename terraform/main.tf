provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

data "aws_ami" "ubuntu-xenial" {
  most_recent = "true"
  owners      = ["099720109477"]

  filter = {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter = {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "server-hellocs" {
  ami                    = "${data.aws_ami.ubuntu-xenial.image_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.ec2-key-pair-name}"
  vpc_security_group_ids = "${var.vpc_sg_ids}"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("${var.ssh-private-key-path}")}"
  }

  provisioner "file" {
    source      = "scripts"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod -R +x /tmp/scripts",
      "/tmp/scripts/deploy-hellocs.sh ${var.hellocs_version}",
      "rm -r /tmp/scripts",
    ]
  }
}
