output "public_dns" {
  value = "${aws_instance.server-hellocs.public_dns}"
}

output "instance_id" {
  value = "${aws_instance.server-hellocs.id}"
}

output "ubuntu_ami_id" {
  value = "${data.aws_ami.ubuntu-xenial.image_id}"
}
