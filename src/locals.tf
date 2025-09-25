locals {
  public_ssh_key = try(file("~/.ssh/id_ed25519.pub"))
}