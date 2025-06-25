# 🛡️ Understanding AWS IAM (Identity and Access Management)

**AWS Identity and Access Management (IAM)** is a secure and flexible way to manage access to AWS services and resources. It allows you to create and manage AWS users and groups, and use permissions to allow or deny access to resources.

---

## IAM Core Concepts and Components

| Component     | Description                                                                                                                     |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **User**      | An individual identity (e.g., `alice`, `developer1`) with long-term credentials to interact with AWS services.                  |
| **Group**     | A collection of IAM users managed together (e.g., `Admins`, `Developers`). Policies assigned to the group apply to all members. |
| **Role**      | An AWS identity with temporary credentials that a user, application, or service can assume.                                     |
| **Policy**    | A document that defines permissions. JSON-based.                                                                                |
| **Principal** | The entity (user/role/service) performing the action.                                                                           |
| **Resource**  | The AWS service or object to be acted upon (e.g., S3 bucket).                                                                   |
| **Action**    | The operation being requested (e.g., `s3:GetObject`).                                                                           |

---

## IAM in Practice — Imaginary Use Case

### Example Organization: AcmeTech Inc.

- **Departments**: Engineering, HR, IT Support
- **IAM Users**: Alice (Engineer), Bob (HR), Carol (IT Admin)
- **Services Used**: EC2, S3, RDS

---

## Creating IAM Resources (Hands-on)

### 1. Create IAM User

```bash
aws iam create-user --user-name alice
```

Give Alice programmatic access and console access using the AWS Console or via CLI:

```bash
aws iam create-login-profile --user-name alice --password 'Alice123!'
```

---

### 2. Create Group

```bash
aws iam create-group --group-name Developers
```

Attach a policy (e.g., full access to S3):

```bash
aws iam attach-group-policy \
  --group-name Developers \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```

Add user to group:

```bash
aws iam add-user-to-group --user-name alice --group-name Developers
```

---

### 3. Create IAM Role

Let’s create a role that allows EC2 to access S3.

**Trust policy (trust.json):**

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

Create the role:

```bash
aws iam create-role --role-name EC2S3AccessRole --assume-role-policy-document file://trust.json
```

Attach a policy:

```bash
aws iam attach-role-policy \
  --role-name EC2S3AccessRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
```

---

### 4. Create Inline or Custom Policy

**Example: Allow listing and reading objects from a specific S3 bucket**

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket", "s3:GetObject"],
      "Resource": [
        "arn:aws:s3:::acmetech-reports",
        "arn:aws:s3:::acmetech-reports/*"
      ]
    }
  ]
}
```

Create policy:

```bash
aws iam create-policy \
  --policy-name AcmeS3ReadPolicy \
  --policy-document file://acme-s3-read.json
```

Attach to a group or user:

```bash
aws iam attach-user-policy \
  --user-name bob \
  --policy-arn arn:aws:iam::<your-account-id>:policy/AcmeS3ReadPolicy
```

---

## Illustration: IAM Resource Hierarchy

```
                    ┌──────────────┐
                    │    Policy    │
                    └─────┬────────┘
                          │
        ┌─────────────────┼────────────────────┐
        │                 │                    │
   ┌────▼────┐       ┌────▼────┐         ┌─────▼─────┐
   │  Group  │◄──────┤  User   │         │   Role    │
   └─────────┘       └─────────┘         └───────────┘
                                              │
                                   ┌──────────▼──────────┐
                                   │ EC2, Lambda, S3 etc.│
                                   └─────────────────────┘
```

---

## Best Practices for IAM Security

### Principle of Least Privilege

> Give users only the permissions they need.

### Use IAM Roles over IAM Users

> Prefer roles with temporary credentials over long-term user credentials.

### Enable MFA (Multi-Factor Authentication)

> Especially for root and privileged users.

```bash
aws iam enable-mfa-device \
  --user-name alice \
  --serial-number arn:aws:iam::account:mfa/alice \
  --authentication-code1 123456 --authentication-code2 789012
```

### Use AWS Managed Policies When Possible

> They’re maintained and updated by AWS.

### Rotate Access Keys Regularly

```bash
aws iam create-access-key --user-name alice
aws iam delete-access-key --access-key-id <old-key> --user-name alice
```

### Use IAM Access Analyzer

> Identifies unintended access to your resources.

### Avoid Using Root Account

> Use it only for setup and then create IAM admin users.

---

## IAM Policy Simulator

Use the AWS **Policy Simulator** to test:
[https://policysim.aws.amazon.com/](https://policysim.aws.amazon.com/)

---

## Clean Up

To delete a user:

```bash
aws iam delete-user --user-name alice
```

To delete a role:

```bash
aws iam delete-role --role-name EC2S3AccessRole
```

---

## Summary

- IAM helps **secure and control** access to AWS.
- Core components: **Users**, **Groups**, **Roles**, and **Policies**.
- Use roles for service-to-service permissions.
- Follow security best practices like **MFA**, **least privilege**, and **access key rotation**.
