variable "allocated_storage" {
  description = "The amount of storage to allocate"
  type        = number
  default     = 10
  sensitive   = true
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
  default     = "db.t3.micro"
}


variable "project_name" {
}
variable "db_username" {
  type        = string
  description = "Database user name"
}
variable "db_password" {
  type        = string
  description = "Database password"
}
