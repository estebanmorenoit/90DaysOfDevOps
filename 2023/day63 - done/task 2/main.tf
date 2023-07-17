resource "local_file" "list_file1" {
    filename = var.filename_list[0]
    content = var.content_list[0]
}

resource "local_file" "list_file2" {
    filename = var.filename_list[1]
    content = var.content_list[2]
}

output "server_set_names" {
    value = var.servers_set
}

output "object_server_name" {
    value = var.object_server.name
}