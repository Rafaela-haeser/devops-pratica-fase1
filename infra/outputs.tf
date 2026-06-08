output "bucket_name" {
  description = "Nome do bucket S3 criado para o site estático."
  value       = aws_s3_bucket.site.bucket
}

output "website_endpoint" {
  description = "Endpoint de hospedagem estática do bucket S3."
  value       = aws_s3_bucket_website_configuration.site.website_endpoint
}
