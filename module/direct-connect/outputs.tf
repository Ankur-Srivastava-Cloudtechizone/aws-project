output "dx_connection_ids" {
  value = { for k, v in aws_dx_connection.this : k => v.id }
}

output "dx_vif_ids" {
  value = { for k, v in aws_dx_private_virtual_interface.this : k => v.id }
}
