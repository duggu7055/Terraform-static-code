output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.dev_otms_vpc.id
}
