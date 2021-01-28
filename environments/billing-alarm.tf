module "billing-alarm" {
  source       = "../modules/billing-alarm"
  default_tags = var.default_tags
  phone_number = var.phone_number
}
