variable "rg_details" {
  type = map(object({
    rg_name     = string
    rg_location = string
    tags        = map(string)
    managed_by  = string

  }))
}
