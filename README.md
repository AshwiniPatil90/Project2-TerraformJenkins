Use Case:
Develop a scalable and repeatable AWS infrastructure using Terraform including VPC’s, subnets and security groups

Implementation steps:
Define Terraform modules, create resource configurations, implement state management, and integrate with CI/CD for automated deployments.

Tools:
Terraform, AWS CLI, Git, Jenkins

Project architecture:
![image](https://github.com/user-attachments/assets/67c60c98-ff22-4157-9588-9f5cd53c7ee4)

Prerequisites:
•	Create S3 bucket for storing Terraform State
•	Create Dynamo DB table for providing lock capability
•	Jenkins server is up and running
•	Terraform is installed in Jenkins server
•	Terraform configuration files already created in your SCM (GitHub repo)
•	Make sure to have necessary IAM role created with right policy and attached to Jenkins EC2 instance. 
