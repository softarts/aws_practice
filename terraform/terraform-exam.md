https://www.examtopics.com/exams/hashicorp/terraform-associate/view/

https://www.freecram.net/question/HashiCorp.TA-002-P.v2021-04-20.q98/terraform-variables-and-outputs-that-set-the-description-argument-will-store-that-description-in-the


1. The terraform.tfstate file always matches your currently built infrastructure.
A. True
B. False
> B

2. One remote backend configuration always maps to a single remote workspace.
A. True
B. False
> B

3. How is the Terraform remote backend different than other state backends such as S3, Consul, etc.?
A. It can execute Terraform runs on dedicated infrastructure on premises or in Terraform Cloud
B. It doesn't show the output of a terraform apply locally
C. It is only available to paying customers
D. All of the above
> A
https://www.terraform.io/docs/language/settings/backends/index.html

4. What is the workflow for deploying new infrastructure with Terraform?
- A. terraform plan to import the current infrastructure to the state file, make code changes, and terraform apply to update the infrastructure.
- B. Write a Terraform configuration, run terraform show to view proposed changes, and terraform apply to create new infrastructure.
- C. terraform import to import the current infrastructure to the state file, make code changes, and terraform apply to update the infrastructure.
- D. Write a Terraform configuration, run terraform init, run terraform plan to view planned infrastructure changes, and terraform apply to create new infrastructure.
> D

5. A provider configuration block is required in every Terraform configuration.
Example:

- A. True
- B. False
> A
https://github.com/hashicorp/terraform/issues/17928

6. You run a local-exec provisioner in a null resource called null_resource.run_script and realize that you need to rerun the script.
Which of the following commands would you use first?
- A. terraform taint null_resource.run_script
- B. terraform apply -target=null_resource.run_script
- C. terraform validate null_resource.run_script
- D. terraform plan -target=null_resource.run_script
>A

7. Which provisioner invokes a process on the resource created by Terraform?
- A. remote-exec
- B. null-exec
- C. local-exec
- D. file
> A

8. Which of the following is not true of Terraform providers?
- A. Providers can be written by individuals
- B. Providers can be maintained by a community of users
- C. Some providers are maintained by HashiCorp
- D. Major cloud vendors and non-cloud vendors can write, maintain, or collaborate on Terraform providers
- E. None of the above
> E

9. What command does Terraform require the first time you run it within a configuration directory?
- A. terraform import
- B. terraform init
- C. terraform plan
- D. terraform workspace
> B

10. You have deployed a new webapp with a public IP address on a cloud provider. However, you did not create any outputs for your code.
What is the best method to quickly find the IP address of the resource you deployed?
- A. Run terraform output ip_address to view the result
- B. In a new folder, use the terraform_remote_state data source to load in the state file, then write an output for each resource that you find the state file
- C. Run terraform state list to find the name of the resource, then terraform state show to find the attributes including public IP address
- D. Run terraform destroy then terraform apply and look for the IP address in stdout
>C

11. Which of the following is not a key principle of infrastructure as code?
- A. Versioned infrastructure
- B. Golden images
- C. Idempotence
- D. Self-describing infrastructure
>ABD

12. Terraform variables and outputs that set the "description" argument will store that description in the state file.
A. True
B. False
> B

13. What is the provider for this fictitious resource?

- A. vpc
- B. main
- C. aws
- D. test
> C

14. If you manually destroy infrastructure, what is the best practice reflecting this change in Terraform?
- A. Run terraform refresh
- B. It will happen automatically
- C. Manually update the state fire
- D. Run terraform import
> A

15. What is not processed when running a terraform refresh?
- A. State file
- B. Configuration file
- C. Credentials
- D. Cloud provider
> CD

https://www.terraform.io/cli/commands/refresh

16. What information does the public Terraform Module Registry automatically expose about published modules?
A. Required input variables
B. Optional inputs variables and default values
C. Outputs
D. All of the above
E. None of the above
> D
"The registry extracts information about the module from the module's source. The module name, provider, documentation, inputs/outputs, and dependencies are all parsed and available via the UI or API, as well as the same information for any submodules or examples in the module's source repository."

17. If a module uses a local variable, you can expose that value with a terraform output.
A. True
B. False
> B 如果没有在output中定义应该不能output,如果在output中定义了=local.xx，可以refresh后看到

18. You should store secret data in the same version control repository as your Terraform configuration.
A. True
B. False
> B

19. Which of the following is not a valid string function in Terraform?
A. split
B. join
C. slice
D. chomp
> C

20. You have provisioned some virtual machines (VMs) on Google Cloud Platform (GCP) using the gcloud command line tool. However, you are standardizing with
Terraform and want to manage these VMs using Terraform instead.
What are the two things you must do to achieve this? (Choose two.)
A. Provision new VMs using Terraform with the same VM names
B. Use the terraform import command for the existing VMs
C. Write Terraform configuration for the existing VMs
D. Run the terraform import-gcp command
>BC

21. You have recently started a new job at a retailer as an engineer. As part of this new role, you have been tasked with evaluating multiple outages that occurred during peak shopping time during the holiday season. Your investigation found that the team is manually deploying new compute instances and configuring each compute instance manually. This has led to inconsistent configuration between each compute instance.
How would you solve this using infrastructure as code?
- A. Implement a ticketing workflow that makes engineers submit a ticket before manually provisioning and configuring a resource
- B. Implement a checklist that engineers can follow when configuring compute instances
- C. Replace the compute instance type with a larger version to reduce the number of required deployments
- D. Implement a provisioning pipeline that deploys infrastructure configurations committed to your version control system following code reviews
> D

22. terraform init initializes a sample main.tf file in the current directory.
A. True
B. False
>B

23. Which two steps are required to provision new infrastructure in the Terraform workflow? (Choose two.)
A. Destroy
B. Apply
C. Import
D. Init
E. Validate
> DB


24. Why would you use the terraform taint command?
A. When you want to force Terraform to destroy a resource on the next apply
B. When you want to force Terraform to destroy and recreate a resource on the next apply
C. When you want Terraform to ignore a resource on the next apply
D. When you want Terraform to destroy all the infrastructure in your workspace
>B

25. Terraform requires the Go runtime as a prerequisite for installation.
A. True
B. False
>B

26. When should you use the force-unlock command?
A. You see a status message that you cannot acquire the lock
B. You have a high priority change
C. Automatic unlocking failed
D. You apply failed due to a state lock
>C

27. Terraform can import modules from a number of sources ג which of the following is not a valid source?
A. FTP server
B. GitHub repository
C. Local path
D. Terraform Module Registry
>A


28. Which of the following is available only in Terraform Enterprise or Cloud workspaces and not in Terraform CLI?
A. Secure variable storage
B. Support for multiple cloud providers
C. Dry runs with terraform plan
D. Using the workspace as a data source
>A
?B

29. terraform validate validates the syntax of Terraform files.
A. True
B. False
>A


30. You have used Terraform to create an ephemeral development environment in the cloud and are now ready to destroy all the infrastructure described by your
Terraform configuration. To be safe, you would like to first see all the infrastructure that will be deleted by Terraform.
Which command should you use to show all of the resources that will be deleted? (Choose two.)
A. Run terraform plan -destroy.
B. This is not possible. You can only show resources that will be created.
C. Run terraform state rm *.
D. Run terraform destroy and it will first output all the resources that will be deleted before prompting for approval.
>AD

31. Which of the following is the correct way to pass the value in the variable num_servers into a module with the input servers?
A. servers = num_servers
B. servers = variable.num_servers
C. servers = var(num_servers)
D. servers = var.num_servers
>D


32. A Terraform provisioner must be nested inside a resource configuration block.
A. True
B. False
>B
not must be in resource block?

33. Terraform can run on Windows or Linux, but it requires a Server version of the Windows operating system.
A. True
B. False
>B

34. What does the default "local" Terraform backend store?
A. tfplan files
B. Terraform binary
C. Provider plugins
D. State file
>D


35. You have multiple team members collaborating on infrastructure as code (IaC) using Terraform, and want to apply formatting standards for readability.
How can you format Terraform HCL (HashiCorp Configuration Language) code according to standard Terraform style convention?
A. Run the terraform fmt command during the code linting phase of your CI/CD process
B. Designate one person in each team to review and format everyone's code
C. Manually apply two spaces indentation and align equal sign "=" characters in every Terraform file (*.tf)
D. Write a shell script to transform Terraform files using tools such as AWK, Python, and sed
>A


36. What value does the Terraform Cloud/Terraform Enterprise private module registry provide over the public Terraform Module Registry?
A. The ability to share modules with public Terraform users and members of Terraform Enterprise Organizations
B. The ability to tag modules by version or release
C. The ability to restrict modules to members of Terraform Cloud or Enterprise organizations
D. The ability to share modules publicly with any user of Terraform
>C


37. Which task does terraform init not perform?
A. Sources all providers present in the configuration and ensures they are downloaded and available locally
B. Connects to the backend
C. Sources any modules and copies the configuration locally
D. Validates all required variables are present
>D

38. You have declared a variable called var.list which is a list of objects that all have an attribute id.
Which options will produce a list of the IDs? (Choose two.)
A. { for o in var.list : o => o.id }
B. var.list[*].id
C. [ var.list[*].id ]
D. [ for o in var.list : o.id ]
>BD

39. Which argument(s) is (are) required when declaring a Terraform variable?
A. type
B. default
C. description
D. All of the above
E. None of the above
>E

40. When using a module block to reference a module stored on the public Terraform Module Registry such as:

How do you specify version 1.0.0?
A. Modules stored on the public Terraform Module Registry do not support versioning
B. Append ?ref=v1.0.0 argument to the source path
C. Add version = "1.0.0" attribute to module block
D. Nothing ג€" modules stored on the public Terraform Module Registry always default to version 1.0.0
>C

41. What features does the hosted service Terraform Cloud provide? (Choose two.)
A. Automated infrastructure deployment visualization
B. Automatic backups
C. Remote state storage
D. A web-based user interface (UI)
>BC??


42. Where does the Terraform local backend store its state?
A. In the /tmp directory
B. In the terraform.tfvars file
C. In the terraform.tfstate file
D. In the user's .terraformrc file
>C

43. Which option can not be used to keep secrets out of Terraform configuration files?
A. A Terraform provider
B. Environment variables
C. A -var flag
D. secure string
>C????


44. What is one disadvantage of using dynamic blocks in Terraform?
A. They cannot be used to loop through a list of values
B. Dynamic blocks can construct repeatable nested blocks
C. They make configuration harder to read and understand
D. Terraform will run more slowly
>C

45. Only the user that generated a plan may apply it.
A. True
B. False
>B

46. Examine the following Terraform configuration, which uses the data source for an AWS AMI.
What value should you enter for the ami argument in the AWS instance resource?

A. aws_ami.ubuntu
B. data.aws_ami.ubuntu
C. data.aws_ami.ubuntu.id
D. aws_ami.ubuntu.id
>C

47. FILL BLANK -
You need to specify a dependency manually.
What resource meta-parameter can you use to make sure Terraform respects the dependency?
Type your answer in the field provided. The text field is not case-sensitive and all variations of the correct answer are accepted.
>depends_on


48. You have never used Terraform before and would like to test it out using a shared team account for a cloud provider. The shared team account already contains
15 virtual machines (VM). You develop a Terraform configuration containing one VM, perform terraform apply, and see that your VM was created successfully.
What should you do to delete the newly-created VM with Terraform?
A. The Terraform state file contains all 16 VMs in the team account. Execute terraform destroy and select the newly-created VM.
B. The Terraform state file only contains the one new VM. Execute terraform destroy.
C. Delete the Terraform state file and execute Terraform apply.
D. Delete the VM using the cloud provider console and terraform apply to apply the changes to the Terraform state file.
>B?


49. What is the name assigned by Terraform to reference this resource?

A. dev
B. azurerm_resource_group
C. azurerm
D. test
>A


50. Setting the TF_LOG environment variable to DEBUG causes debug messages to be logged into syslog.
A. True
B. False
>B?并非syslog,而是stderr, 还要设置TF_LOG_PATH


51. Where in your Terraform configuration do you specify a state backend?
A. The terraform block
B. The resource block
C. The provider block
D. The datasource block
>A

52. In Terraform 0.13 and above, outside of the required_providers block, Terraform configurations always refer to providers by their local names.
A. True
B. False
>A



53. What command should you run to display all workspaces for the current configuration?
A. terraform workspace
B. terraform workspace show
C. terraform workspace list
D. terraform show workspace
>C


54. Terraform providers are always installed from the Internet.
A. True
B. False
>B


55. Which of these is the best practice to protect sensitive values in state files?
A. Blockchain
B. Secure Sockets Layer (SSL)
C. Enhanced remote backends
D. Signed Terraform providers
>C, encrypted backend


56. When does terraform apply reflect changes in the cloud environment?
A. Immediately
B. However long it takes the resource provider to fulfill the request
C. After updating the state file
D. Based on the value provided to the -refresh command line argument
E. None of the above
>B


57. How would you reference the "name" value of the second instance of this fictitious resource?

A. element(aws_instance.web, 2)
B. aws_instance.web[1].name
C. aws_instance.web[1]
D. aws_instance.web[2].name
E. aws_instance.web.*.name
>B


58. A Terraform provider is not responsible for:
A. Understanding API interactions with some service
B. Provisioning infrastructure in multiple clouds
C. Exposing resources and data sources based on an API
D. Managing actions to take based on resource differences
>D???

59. Terraform provisioners can be added to any resource block.
A. True
B. False
>A local-exec, remote-exec etc??

60. What is terraform refresh intended to detect?
A. Terraform configuration code changes
B. Empty state files
C. State file drift
D. Corrupt state files
>C

https://www.examtopics.com/discussions/hashicorp/view/75266-exam-terraform-associate-topic-1-question-70-discussion/
70. You're building a CI/CD (continuous integration/ continuous delivery) pipeline and need to inject sensitive variables into your Terraform run.
How can you do this safely?
A. Pass variables to Terraform with a var flag
B. Copy the sensitive variables into your Terraform code
C. Store the sensitive variables in a secure_vars.tf file
D. Store the sensitive variables as plain text in a source code repository
>A

https://www.examtopics.com/discussions/hashicorp/view/74965-exam-terraform-associate-topic-1-question-75-discussion/
75. You have a simple Terraform configuration containing one virtual machine (VM) in a cloud provider. You run terraform apply and the VM is created successfully.
What will happen if you delete the VM using the cloud provider console, and run terraform apply again without changing any Terraform code?
A. Terraform will remove the VM from state file
B. Terraform will report an error
C. Terraform will not make any changes
D. Terraform will recreate the VM
>D

https://www.examtopics.com/discussions/hashicorp/view/74893-exam-terraform-associate-topic-1-question-77-discussion/
77. Your DevOps team is currently using the local backend for your Terraform configuration. You would like to move to a remote backend to begin storing the state file in a central location.
Which of the following backends would not work?
A. Amazon S3
B. Artifactory
C. Git
D. Terraform Cloud
>C

https://www.examtopics.com/discussions/hashicorp/view/74894-exam-terraform-associate-topic-1-question-80-discussion/
80. You write a new Terraform configuration and immediately run terraform apply in the CLI using the local backend.
Why will the apply fail?
A. Terraform needs you to format your code according to best practices first
B. Terraform needs to install the necessary plugins first
C. The Terraform CLI needs you to log into Terraform cloud first
D. Terraform requires you to manually run terraform plan first
>B

83. Terraform can only manage resource dependencies if you set them explicitly with the depends_on argument.
A. True
B. False
>B

84. A terraform apply can not _________ infrastructure.
A. change
B. destroy
C. provision
D. import
>D


https://www.examtopics.com/discussions/hashicorp/view/74898-exam-terraform-associate-topic-1-question-86-discussion/
86. You just scaled your VM infrastructure and realized you set the count variable to the wrong value. You correct the value and save your change.
What do you do next to make your infrastructure match your configuration?
A. Run an apply and confirm the planned changes
B. Inspect your Terraform state because you want to change it
C. Reinitialize because your configuration has changed
D. Inspect all Terraform outputs to make sure they are correct
>A

98. When using Terraform to deploy resources into Azure, which scenarios are true regarding state files? (Choose two.)
A. When a change is made to the resources via the Azure Cloud Console, the changes are recorded in a new state file
B. When a change is made to the resources via the Azure Cloud Console, Terraform will update the state file to reflect them during the next plan or apply
C. When a change is made to the resources via the Azure Cloud Console, the current state file will not be updated
D. When a change is made to the resources via the Azure Cloud Console, the changes are recorded in the current state file
>BC

99. You need to deploy resources into two different cloud regions in the same Terraform configuration. To do that, you declare multiple provider configurations as follows:

What meta-argument do you need to configure in a resource block to deploy the resource to the ג€us-west-2ג€ AWS region?
A. alias = west
B. provider = west
C. provider = aws.west
D. alias = aws.west
>C


# MEMO
1. The filter block allows a data source to select resources from a provider.

data "aws_ami" "web" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Component"
    values = ["web"]
  }
}
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids#argument-referenc

2. When running terraform init, it will do the following:

- Create a dependency lock file
- Download plugin dependencies

SELECTED
https://www.terraform.io/docs/cli/commands/init.html
- Create a .terraform directory


3. terraform apply -destroy is the same as writing terraform destroy

Is this statement true?
- True