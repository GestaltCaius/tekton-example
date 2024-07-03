tekton installation in GKE cluster using terraform
===

# Structure

```bash
$ tree                                             
.
└── terraform
    ├── environments
    │   └── develop
    │       ├── backend.tf
    │       ├── main.tf
    │       ├── outputs.tf
    │       ├── terraform.tfvars
    │       └── variables.tf
    └── modules
        ├── cluster
        │   ├── cluster.tf
        │   ├── locals.tf
        │   ├── outputs.tf
        │   ├── providers.tf
        │   ├── service_account.tf
        │   ├── terraform.tf
        │   └── variables.tf
        └── tekton
            ├── locals.tf
            ├── outputs.tf
            ├── providers.tf
            ├── tekton.tf
            ├── terraform.tf
            └── variables.tf
```

# How to run

```bash
cd terraform/environments/develop
terraform init -backend-config "bucket=MY_TF_STATE_BUCKET" -reconfigure
terraform apply
```