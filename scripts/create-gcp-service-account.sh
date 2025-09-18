#!/bin/bash

# GCP Service Account Creation Script for GitHub Actions
# Run this script to create a service account and generate a key for Terraform automation

set -e

PROJECT_ID="${1:-your-gcp-project-id}"
SA_NAME="terraform-github-actions"
SA_EMAIL="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"
KEY_FILE="gcp-sa-key.json"

echo "Creating GCP Service Account for GitHub Actions..."
echo "Project ID: $PROJECT_ID"
echo "Service Account: $SA_EMAIL"

# Create service account
gcloud iam service-accounts create $SA_NAME \
    --display-name="Terraform GitHub Actions" \
    --description="Service account for Terraform automation via GitHub Actions" \
    --project=$PROJECT_ID

# Grant necessary roles
echo "Granting IAM roles..."
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_EMAIL" \
    --role="roles/editor"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_EMAIL" \
    --role="roles/storage.admin"

# Create and download key
echo "Creating service account key..."
gcloud iam service-accounts keys create $KEY_FILE \
    --iam-account=$SA_EMAIL \
    --project=$PROJECT_ID

echo "✅ Service account created successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Copy the contents of $KEY_FILE"
echo "2. Go to your GitHub repository settings"
echo "3. Navigate to Secrets and variables > Actions"
echo "4. Create a new secret named 'GCP_SA_KEY'"
echo "5. Paste the entire JSON content as the secret value"
echo "6. Delete the local key file: rm $KEY_FILE"
echo ""
echo "🔑 Key file location: $(pwd)/$KEY_FILE"
