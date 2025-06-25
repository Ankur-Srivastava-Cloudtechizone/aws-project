output "private_key_pem" {
  description = "The PEM-encoded private key"
  value       = tls_private_key.ec2_keypair.private_key_pem
  sensitive   = true
}
