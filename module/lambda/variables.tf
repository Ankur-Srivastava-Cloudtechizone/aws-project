variable "lambda_functions" {
  type = map(object({
    function_name        = string
    handler              = string
    runtime              = string
    timeout              = number
    memory_size          = number
    zip_path             = string
    role_name            = string
    environment_variables = map(string)
  }))
}
