provider "aws" {
    shared_config_files      = ["/home/your-user/.aws/config"]
    shared_credentials_files = ["/home/your-user/.aws/credentials"]
    region                   = "eu-west-2"
}