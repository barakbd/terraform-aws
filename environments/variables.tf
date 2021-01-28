variable "account_ids" {
  type = list(string)
}

variable "aws_profile" {
  type = string
}


variable "region" {
  type = string
}

variable "default_tags" {
  type = any
  default = {
    repo = "ReDash"
  }
}

variable "phone_number" {
  type = string
}
