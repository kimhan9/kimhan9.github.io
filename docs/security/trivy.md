# Trivy

Trivy is a Swiss army knife type of tool for security scanning of various types of artifacts and code. It can scan different targets such as your local filesystem or a container image from a container registry.

## Installation
```
brew install trivy
```

## Test Terraform Module
```
terraform init
trivy config .
trivy fs --scanner vuln,misconfig,secret .

# Skipping all files under `examples` folders
trivy config . --skip-dirs '**/examples'
```

## Scan Terraform Plan
```
terraform plan --out tf.plan
terraform show -json tf.plan > tfplan.json
trivy config tfplan.json
```

## Use Trivy in CI
```
# Example
    - name: Run Trivy vulnerability scanner in fs mode
      uses: aquasecurity/trivy-action@master
      with:
        scan-type: 'fs'
        scan-ref: '.'
        trivy-config: trivy.yaml
```