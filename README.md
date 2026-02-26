# Azure Databricks Lakehouse (Terraform-based)

This project demonstrates how to build a secure, reproducible Azure Databricks environment using Infrastructure as Code.

The entire platform is provisioned using Terraform and follows production-oriented design principles such as identity-based access, secure secret management, and cost control.

---

## 🎯 Project Goal

To design and deploy a minimal but enterprise-ready Azure Lakehouse architecture under a controlled budget.

This project extends previous Databricks implementations on AWS to Azure, highlighting architectural and operational differences between both cloud environments.

---

## 🏗 Architecture Overview

The platform includes:

- Azure Resource Group
- Azure Data Lake Storage Gen2 (ADLS)
- Azure Databricks Workspace
- Managed Identity & RBAC
- Azure Key Vault (for secure secret management)
- Databricks cluster deployment via Terraform

Architecture principles:
- Infrastructure as Code
- Security-first design
- Cost-efficient compute
- Reproducible deployments

---

## 🛠 Technologies Used

- Terraform
- Azure CLI
- Azure Databricks
- Azure ADLS Gen2
- Azure Key Vault
- Git
- VS Code

---

## 📂 Project Structure


azure-databricks-terraform/
│
├── terraform/
│ ├── providers.tf
│ ├── main.tf
│ ├── storage.tf
│ ├── variables.tf
│ ├── outputs.tf
│
├── .gitignore
└── README.md


---

## 🚀 Deployment Steps

### 1️⃣ Login to Azure

```bash
az login
2️⃣ Navigate to Terraform folder
cd terraform
3️⃣ Initialize Terraform
terraform init
4️⃣ Review execution plan
terraform plan
5️⃣ Apply infrastructure
terraform apply
🔐 Security Design

No secrets are stored in source control

Terraform state is ignored via .gitignore

Managed identities are used for resource access

Key Vault integration for secret management

💰 Cost Control Strategy

Standard tier resources

No VNet injection (for this demo)

Single-node Databricks cluster

Auto-termination enabled

Budget-conscious resource sizing

Target budget: < $200

🌍 Multi-Cloud Perspective

This project complements prior Databricks implementations on AWS.

Key comparison areas:

AWS	Azure
S3	ADLS Gen2
IAM Roles	Managed Identity + RBAC
MWS Workspaces	Azure Databricks Workspace
Secrets Manager	Azure Key Vault
📈 Future Enhancements

Remote Terraform state backend

GitHub Actions CI/CD

Unity Catalog automation

Private endpoints

Production networking setup

👤 Author

Abdullah Ozisik
Freelance Data Engineer
Multi-cloud Databricks specialist