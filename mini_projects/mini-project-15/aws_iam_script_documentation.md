# AWS IAM Management Script Documentation

## Overview

This Bash script automates the creation and configuration of AWS IAM (Identity and Access Management) users, groups, and permissions for a cloud operations team. It's designed for rapid setup of new team members with administrative access.

---

## Objectives

- Create 5 IAM users
- Create an IAM group named `admin`
- Attach AWS managed `AdministratorAccess` policy to the group
- Add all IAM users to the `admin` group

---

## Components

### 1. IAM User Names Array

```bash
IAM_USER_NAMES=("alice" "bob" "charlie" "diana" "eric")
```

This array holds all the IAM usernames we want to create and manage.

---

### 2. `create_iam_users()` Function

Loops through `IAM_USER_NAMES` and creates each user with:

```bash
aws iam create-user --user-name "$username"
```

💡 It checks if the user already exists and suppresses errors for a clean output.

---

### 3. `create_admin_group()` Function

- Checks if `admin` group already exists using:

  ```bash
  aws iam get-group --group-name "admin"
  ```

- If not, it creates the group:

  ```bash
  aws iam create-group --group-name "admin"
  ```

- Then attaches the AWS-managed admin policy:

  ```bash
  aws iam attach-group-policy --group-name "admin" --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
  ```

---

### 4. `add_users_to_admin_group()` Function

Loops through the usernames and assigns them to the `admin` group:

```bash
aws iam add-user-to-group --user-name "$username" --group-name "admin"
```

---

## Execution

### Prerequisite

Ensure AWS CLI is configured:

```bash
aws configure
```

### Run Script

Make it executable:

```bash
chmod +x aws_iam_manager.sh
```

Then execute:

```bash
./aws_iam_manager.sh
```

---

## Best Practices Followed

- Use of `set -e` to safely exit on error (can be added)
- Error messages for missing dependencies
- Checks for existing IAM entities
- Output-friendly logging for CI/CD pipelines

---

## Additional Improvements (Optional)

- Generate login credentials and email to users
- Attach MFA policies
- Create policy JSON documents dynamically
- Use input prompts or config files

---

## Summary

This script enables CloudOps engineers to standardize IAM user setup in AWS with a few lines of code. It’s easy to modify, extend, and integrate into larger infrastructure provisioning tools like Terraform or AWS CloudFormation.
