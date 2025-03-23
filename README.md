# tech_function# 🚀 Terraform GCP Infrastructure

This repository contains Terraform configurations for deploying a **Google Cloud Function** with an HTTP trigger, secured IAM policies, and a **Load Balancer** for external access.

## 📌 **Prerequisites**

Before running the Terraform scripts, ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads) (>= v1.0.0)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- A Google Cloud Project
- Service Account with required permissions

## 📂 **Project Structure**

```
.
├── main.tf            # Root Terraform configuration
├── variables.tf       # Input variables
├── outputs.tf         # Output values
├── modules
│   ├── storage        # Google Cloud Storage module
│   ├── cloud_function # Google Cloud Function module
│   ├── load_balancer  # Load Balancer module
│   └── networking     # Networking module (if applicable)
├── README.md          # This file
```

## ✅ **Step 1: Configure Google Cloud Authentication**

Terraform needs to authenticate with Google Cloud. Follow these steps:

1. **Create a Service Account & Download JSON Key:**
   - Go to **IAM & Admin → Service Accounts**
   - Click **Create Service Account**
   - Assign necessary roles (**Owner**, **Editor**, or **Cloud Functions Admin**)
   - Click **Create Key** and download it as a JSON file

2. **Set Up Authentication:**

   **For Linux/macOS:**
   ```sh
   export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your-service-account-key.json"
   ```

   **For Windows (PowerShell):**
   ```powershell
   $env:GOOGLE_APPLICATION_CREDENTIALS="C:\path\to\your-service-account-key.json"
   ```

   **For Windows (Command Prompt):**
   ```cmd
   set GOOGLE_APPLICATION_CREDENTIALS=C:\path\to\your-service-account-key.json
   ```

3. **Test Authentication:**
   ```sh
   gcloud auth application-default print-access-token
   ```

## ✅ **Step 2: Initialize & Deploy Terraform**

1. **Initialize Terraform:**
   ```sh
   terraform init
   ```

2. **Validate Configuration:**
   ```sh
   terraform validate
   ```

3. **Preview Deployment:**
   ```sh
   terraform plan
   ```

4. **Apply Changes:**
   ```sh
   terraform apply -auto-approve
   ```

## 📡 **Step 3: Retrieve the Load Balancer URL**

After deployment, Terraform will output the Load Balancer URL:
```sh
echo $(terraform output load_balancer_url)
```
You can visit the URL in your browser to access the Cloud Function.

## 🛑 **Step 4: Destroy Infrastructure (If Needed)**

To remove all deployed resources:
```sh
terraform destroy -auto-approve
```

## 📝 **Notes**

- Ensure that you have set up a **Google Cloud Storage bucket** for function deployments.
- If you encounter authentication issues, verify that your `GOOGLE_APPLICATION_CREDENTIALS` environment variable is correctly set.
- The Terraform state file (`terraform.tfstate`) should be stored securely if using remote state management.

## 🎯 **Next Steps**
- Configure **Terraform Cloud** or a remote backend for state management.
- Implement **CI/CD** for automated deployments.
- Enhance security by restricting Cloud Function IAM policies.

---

🚀 **Enjoy deploying on Google Cloud with Terraform!**