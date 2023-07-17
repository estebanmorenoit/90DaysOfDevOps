variable "filename_list" {
  type    = list(string)
  default = ["/home/ubuntu/terraform/day63/task2/list_task1.txt", "/home/ubuntu/terraform/day63//task2/list_task2.txt"]
}

variable "content_list" {
  type    = list(string)
  default = ["List item number 1 \n", "List item number 2 \n", "List item number 3 \n"]
}

variable "servers_set" {
    type = set(string)
    default = ["Ubuntu", "Windows"]
}

variable "object_server" {
  type = object({
    name     = string
    cpu      = number
    memory   = number
    disk     = bool
    os       = string
  })
  default = {
    name     = "web-server"
    cpu      = 4
    memory   = 8
    disk     = true
    os       = "Ubuntu 20.04"
  }
}