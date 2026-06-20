variable "name" {
  description = "Resource Group name."
  type        = string
}

variable "location" {
  description = "Resource Group location."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Resource Group."
  type        = map(string)
}
