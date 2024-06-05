# Gitlab

## Gitlab-ci

### Reference
- [Tutorial: Create a complex pipeline](https://docs.gitlab.com/ee/ci/quick_start/tutorial.html)
- [Writing .gitlab-ci.yml File with Examples [Tutorial]](https://spacelift.io/blog/gitlab-ci-yml)

## Using OIDC - OpenID Connect

OIDC is a way to let developers authenticate services and users without having to manage keys or passwords. An Identity Provider (in this case GitLab) sends a signed JWT read ‘jot’ (JSON web token) to AWS Security Token Service Api via an `AssumeRoleWithWebIdentity` call and receives in return a Temporary Security Credential, that allows the GitLab Runner certain actions (depends on the defined AWS Role) on the AWS account.

### Setup at AWS

- You need to create identity provider in AWS IAM.[^1]

- Create role. Change `trusted entities` to limit authorization to a specific group, project, branch, or tag.
```yaml
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::AWS_ACCOUNT:oidc-provider/gitlab.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringLike": {
                    "gitlab.com:sub": "project_path:kimhan9/*:ref_type:branch:ref:*"
                }
            }
        }
    ]
}
```
- Attached policy to that role.

### Setup at Gitlab

- Set the `ROLE_ARN` variable created above. (Settings -> CI/CD -> Variables)

- Sample `gitlab-ci.yml`[^2]
```yaml
assume role:
  image:
    name: "amazon/aws-cli:latest"
    entrypoint: [""]
  id_tokens:
    MY_OIDC_TOKEN:
      aud: https://gitlab.com
  variables:
    AWS_PROFILE: oidc
    AWS_REGION: ap-southeast-1
  before_script:
    - mkdir -p ~/.aws
    - echo "${MY_OIDC_TOKEN}" > /tmp/web_identity_token
    - echo -e "[profile oidc]\nrole_arn=${ROLE_ARN}\nweb_identity_token_file=/tmp/web_identity_token" > ~/.aws/config
  script:
    - aws sts get-caller-identity
    - aws s3 ls
    - aws ec2 describe-instances
```

### Reference
- [Streamline AWS Deployments with GitLab CI and Terraform](https://community.aws/content/2dquEzIKfm2wVH77AYmApToZdWj/gitlab-with-terraform?lang=en)



[^1]:[Configure OpenID Connect in AWS to retrieve temporary credentials](https://docs.gitlab.com/ee/ci/cloud_services/aws/#add-the-identity-provider)
[^2]:[Configure OpenID Connect between GitLab and AWS](https://gitlab.com/guided-explorations/aws/configure-openid-connect-in-aws)