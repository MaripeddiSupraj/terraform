# Terraform Multi-Cloud Infrastructure Repository

✅ **SETUP COMPLETE** - Enterprise-ready Terraform repository with multi-cloud support (AWS & GCP), multi-environment setup, and comprehensive CI/CD workflows.

## 🏗️ Repository Structure

```
terraform/
├── aws/
│   ├── modules/                 # Reusable AWS modules
│   └── environments/
│       ├── dev/                 # Development environment
│       ├── staging/             # Staging environment
│       └── prod/                # Production environment
├── gcp/
│   ├── modules/                 # Reusable GCP modules
│   └── environments/
│       ├── dev/                 # Development environment
│       ├── staging/             # Staging environment
│       └── prod/                # Production environment
├── .github/workflows/           # GitHub Actions CI/CD
├── scripts/                     # Setup and utility scripts
├── .tflint.hcl                 # TFLint configuration
├── .pre-commit-config.yaml     # Pre-commit hooks
└── .gitignore                  # Terraform gitignore
```

## 🚀 Quick Start

1. **Clone and setup:**
   ```bash
   git clone <your-repo>
   cd terraform
   ./scripts/setup.sh  # Install development tools
   ```

2. **Configure backends:**
   - AWS: Update S3 backend configuration
   - GCP: Update GCS backend configuration

3. **Set GitHub secrets:**
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `GCP_SA_KEY`

## 🔄 GitHub Actions Workflows

### Automatic Triggers
- **PR Creation/Update**: Runs `terraform plan` and comments results
- **Merge to main/master**: Runs `terraform apply` automatically
- **File Changes**: Only runs for changed cloud providers (aws/ or gcp/)

### Manual Commands in PR Comments
- `/plan` - Run terraform plan
- `/apply` - Run terraform apply
- `/plan cloud=aws env=dev` - Run plan for specific cloud/environment
- `/apply cloud=gcp env=staging` - Run apply for specific cloud/environment

### Security & Quality Checks
- **TFLint**: Code quality and best practices
- **tfsec**: Security vulnerability scanning
- **Terraform fmt**: Code formatting validation
- **Multi-environment matrix**: Runs checks across dev/staging/prod

## 🛠️ Development Tools

### Pre-commit Hooks
Automatically run before each commit:
- Terraform formatting
- Terraform validation
- Documentation generation
- Security scanning
- Linting

### Manual Tool Usage
```bash
# Format code
terraform fmt -recursive .

# Validate configuration
terraform validate

# Run security scan
tfsec .

# Run linting
tflint --recursive
```

## 📁 Environment Configuration

Each environment has its own directory with:
- `main.tf` - Main configuration
- `variables.tf` - Input variables
- `outputs.tf` - Output values (create as needed)
- `terraform.tfvars` - Environment-specific values (gitignored)

## 🔐 Security Best Practices

- State files stored in remote backends (S3/GCS)
- Sensitive variables in GitHub secrets
- Security scanning with tfsec
- Code quality checks with TFLint
- Environment protection rules in GitHub

## 📝 Usage Examples

### Creating a new module
```bash
# AWS module
mkdir -p aws/modules/vpc
cd aws/modules/vpc
# Create main.tf, variables.tf, outputs.tf

# GCP module
mkdir -p gcp/modules/network
cd gcp/modules/network
# Create main.tf, variables.tf, outputs.tf
```

### Using modules in environments
```hcl
module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  vpc_cidr    = "10.0.0.0/16"
}
```

## 🎯 What's Included

✅ Multi-cloud support (AWS & GCP)
✅ Multi-environment setup (dev/staging/prod)
✅ Automated CI/CD with GitHub Actions
✅ PR comment commands (/plan, /apply)
✅ Security scanning (tfsec)
✅ Code quality checks (TFLint)
✅ Pre-commit hooks
✅ Proper gitignore for Terraform
✅ Environment protection rules
✅ Matrix builds for efficiency

## 🔧 Manual Setup (if script fails)

If the setup script fails, install tools manually:

```bash
# Install pre-commit
pip install pre-commit
pre-commit install

# Install TFLint (macOS)
brew install tflint

# Install tfsec (macOS)
brew install tfsec

# Or download binaries from GitHub releases
```

## 🧪 Testing the Setup

### Test PR Workflow Locally
1. **Initialize Git repository:**
   ```bash
   git init
   git add .
   git commit -m "Initial Terraform setup"
   ```

2. **Test pre-commit hooks:**
   ```bash
   # Make a small change and commit to test hooks
   echo "# Test" >> aws/environments/dev/main.tf
   git add .
   git commit -m "Test pre-commit hooks"
   ```

3. **Test tools locally:**
   ```bash
   # Test Terraform formatting
   terraform fmt -recursive .

   # Test TFLint
   cd aws && tflint --init && tflint --recursive

   # Test tfsec security scan
   tfsec aws/
   ```

### Test GitHub Actions (after pushing to GitHub)
1. **Push to GitHub and create a PR** - Workflow will automatically run `terraform plan`
2. **Comment `/plan` on PR** - Triggers manual plan
3. **Comment `/plan cloud=gcp env=staging`** - Runs plan for specific cloud/environment
4. **Merge PR to main** - Automatically runs `terraform apply`

## 🔧 Current Setup Status

✅ **Repository Structure** - Multi-cloud folders created
✅ **GitHub Actions** - Complete CI/CD workflow configured
✅ **Development Tools** - TFLint, tfsec, pre-commit installed
✅ **Configuration Files** - All config files created
✅ **Documentation** - Comprehensive README

⚠️ **Pending Setup:**
- GitHub repository creation
- GitHub secrets configuration
- Remote state backend setup

## 📚 Next Steps

1. **Push to GitHub:**
   ```bash
   git remote add origin <your-github-repo-url>
   git push -u origin main
   ```

2. **Configure GitHub Secrets** (in repo settings):
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `GCP_SA_KEY`

3. **Set up remote state backends** in environment files
4. **Create your first module** in `aws/modules/` or `gcp/modules/`
5. **Test the workflow** by creating a PR
