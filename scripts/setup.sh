#!/bin/bash

# Setup script for Terraform repository

set -e

echo "🚀 Setting up Terraform repository..."

# Install pre-commit if not installed
if ! command -v pre-commit &> /dev/null; then
    echo "Installing pre-commit..."
    pip install pre-commit
fi

# Install pre-commit hooks
echo "Installing pre-commit hooks..."
pre-commit install

# Install TFLint if not installed
if ! command -v tflint &> /dev/null; then
    echo "Installing TFLint..."
    curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
fi

# Install tfsec if not installed
if ! command -v tfsec &> /dev/null; then
    echo "Installing tfsec..."
    curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash
fi

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Configure your backend state storage (S3 for AWS, GCS for GCP)"
echo "2. Set up GitHub secrets for cloud credentials"
echo "3. Create your first module in aws/modules/ or gcp/modules/"
echo "4. Update environment configurations in */environments/*/"
