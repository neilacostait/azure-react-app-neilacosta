# Azure DevOps: Streamlined CI/CD with Terraform, Docker, Azure Pipelines, Container Registry and App Service

 ![Azure Devops, Terraform, Docker, react js - Architecture by Neil Acosta](https://github.com/neilacostait/azure-react-app-neilacosta/assets/129037426/e3973f91-1cde-4fb2-86af-3a84bf52eb5b)

This repository provides a comprehensive approach for managing an Azure infrastructure and application deployments using a set of tools:

 Terraform: Describe your Azure infrastructure as code to ensure consistent and repeatable deployments.
 
 Docker: Bundle your application along with its dependencies for efficient deployments across various environments.
 
 Azure Pipelines: Automate the testing and deployment processes of your software through a CI/CD pipeline.

Additionally this solution makes use of Azure services to simplify your deployments;

 Azure Container Registry; Safely store and manage your container images.

 Azure App Service; Host your web applications in an highly reliable environment.

 App Service Plan; Specify the resources assigned to your app services to ensure performance.

This combination of technologies enables the following:

 Infrastructure as Code (IaC); Maintain infrastructure configurations that're version controlled.

 Continuous Integration/Delivery (CI/CD); Automate the software development lifecycle to reduce tasks and speed up deployments.

 Containerization; Guarantee application performance by packaging it along with its dependencies, across environments.


# Key Components

Terraform is a tool that helps you set up your Azure infrastructure using code. Docker is used for packaging and deploying applications, in containers. Azure Pipelines is a service that automates software builds and deployments. When working with Azure you can use an Azure registry, an Azure app and an app service plan.

To manage your Terraform configuration files, Dockerfile and pipeline YAML store them in a Git repository for version control. In the Azure DevOps Pipeline changes are triggered by events on the branch. The pipeline applies infrastructure changes defined in Terraform files using the Terraform task. It also uses Docker to build and push container images to Azure Container Registry (ACR). The final step involves deploying the application to Azure App Service with the deployment strategy.

The main benefits of this approach include maintaining consistency, repeatability and version control of your infrastructure through Infrastructure as Code practices. Automation through Continuous Integration/Delivery streamlines build processes while reducing errors. Containerization simplifies deployments by bundling applications with their dependencies for portability.

If you're new, to this process here's how you can get started;


# Further Resources

Terraform: https://www.terraform.io/
Docker: https://www.docker.com/
Azure Pipelines: https://learn.microsoft.com/en-us/azure/devops/?view=azure-devops
Azure Container Registry: https://learn.microsoft.com/en-us/azure/container-registry/

# Command to build the container LOCAL:
 docker build -t azure-react-app-neilacosta .
 
 run this if you have mac m:
 
 docker build -t azure-react-app-neilacosta --platform linux/amd64 .

# Command to run the container LOCAL:
 docker run -p 3000:80 azure-react-app-neilacosta




# Contact Me

https://neilacostait.com 

https://www.linkedin.com/in/neil-acosta
