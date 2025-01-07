# AWS Cloudfront Project

## Terraform Project for S3 & CloudFront Static Website Hosting
### Overview
This project provisions a static website hosting infrastructure on AWS. The setup includes an S3 bucket for storing website files and a CloudFront distribution for secure and high-performance global delivery. With this project, you can easily deploy and serve a static website backed by AWS's scalable and reliable services.
![tf-aws-cf](https://github.com/user-attachments/assets/d6beb2ed-ca33-40e4-8ca8-2a4e2510f40c)


### Components
- S3 Bucket:
  - Stores the website files, including HTML and images.
  - Configured with website hosting and a custom bucket policy to allow CloudFront access.
- CloudFront Distribution:
  - Acts as a Content Delivery Network (CDN) to serve content globally with low latency.
  - Uses Origin Access Control (OAC) to securely fetch files from the S3 bucket.
- Website Files:
  - Example index.html and image.jpg files included for deployment demonstration.
- Terraform Resources:
  - AWS S3 Bucket and associated configurations.
  - CloudFront distribution setup with secure access policies.
  - Outputs to retrieve the CloudFront distribution URL.

### Prerequisites
- AWS Account: Ensure you have an active AWS account.
- Terraform: [Install Terraform](https://developer.hashicorp.com/terraform/install) CLI.
- AWS Credentials: Set up your AWS access_key and secret_key for Terraform.
- File Structure: Place your website files (e.g., index.html, image.jpg) in the ./app/ directory.

### Setup and Deployment
Follow these steps to deploy the project:
1. Clone the Repository:
```
git clone https://github.com/IsaSubhi/Terraform_AWS_Cloudfront.git
cd Terraform_AWS_Cloudfron
```

2. Update AWS Credentials: Modify the provider block in [provider.tf](./provider.tf) with your AWS access_key and secret_key.

3. Initialize Terraform:
```
terraform init
```

4. Plan the Infrastructure: Review the changes Terraform will apply:
```
terraform plan
```

5. Apply the Configuration: Deploy the resources to AWS:
```
terraform apply
```
*Confirm the action when prompted.*

6. Access the Website: Once deployment is complete, the CloudFront URL will be displayed in the output. Use this URL to view your static website.

### Customization
- Replace the default index.html and image.jpg files in the ./app/ folder with your own website files.
- Update TTL or caching configurations in the CloudFront default_cache_behavior block as needed.
- Change S3 bucket name in the [variables.tf](./variables.tf) file.
