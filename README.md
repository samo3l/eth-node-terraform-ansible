### Ethereum Infrastructure Automation

This repository contains a set of Terraform and Ansible scripts to automate the creation of infrastructure and provisioning of an Ethereum node. By utilizing these scripts, you can quickly set up your Ethereum network with ease.

#### Prerequisites
- Terraform installed
- Ansible installed
- SSH Key created/uploaded in AWS EC2 keypairs
- AWS IAM user created with programmatic access credentials
- `~/.aws/credentials` file with configured keys to access AWS
- VPC with subnets

#### Quick Start

##### Create Infrastructure
1. Navigate to `terraform` folder
2. Modify the necessary variables in `terraform.tfvars` file
3. Review `provider.tf` file for credentials location
4. Initialize AWS provider by running `terraform init`
5. Review the planned changes using `terraform plan`
6. Apply the changes by running `terraform apply`
7. Obtain the IP address from the Terraform output 
##### Install Node
1. Navigate to `ansible` folder
2. Modify the necessary variables in `group_vars/all.yml` file. Adjust versions and clients arguments for your needs
2. Update `inventory/hosts.ini` file with the IP obtained from the Terraform script output
3. Execute the Ansible playbook using the command: `ansible-playbook -i inventory/hosts.ini run.yml`

By following these steps, you will have your Ethereum infrastructure up and running in no time.
Feel free to explore and customize these scripts to suit your specific requirements. Happy Ethereum node provisioning!

#### To Do
- Research other Ethereum clients. Consider not the most popular to add more diversity
- Implement running clients on separate VMs with distinct roles in Ansible
- Set up backup mechanisms to ensure the safety of data and quick restores 
- Enable multi-AZ (Availability Zone) support for increased fault tolerance
- Consider adding high availability and load balancing (in case it's not redundant and cost effective)
- Implement monitoring solutions to track the health and performance of Ethereum node
- Add functionality to Ansible playbook for seamless updates of Ethereum cliens
- Evaluate the performance trade-offs of running without Docker or fine-tuning Docker parameters
- Optimize system control (sysctl) parameters for improved Ethereum node performance
- Explore multicloud support to deploy your Ethereum infrastructure across different cloud providers
- Apply resource tagging in Terraform to organize and categorize infrastructure
- Explore alternative approaches like logs parsing instead of pausing execution during certain processes
- Implement waiting mechanisms to ensure synchronization