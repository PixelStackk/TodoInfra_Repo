variable "sql_database" {
  type = map(object({
    name                = string
    size                = number
    tags                = map(string)
    server_name         = string
    resource_group_name = string


  }))
}
