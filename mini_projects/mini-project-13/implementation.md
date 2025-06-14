# AWS IAM Setup Guide for Zappy E-Bank

## 📘 Overview

This guide outlines the setup of AWS Identity and Access Management (IAM) for **Zappy E-Bank**, a fintech startup. It demonstrates how to securely manage user access for developers and data analysts, including creating users, attaching policies, setting up MFA, and organizing users into groups for scalability.

---

## Scenario: Zappy E-Bank

Zappy E-Bank has just created an AWS account and needs to:

- Grant **John (Developer)** access to manage **EC2**
- Grant **Mary (Data Analyst)** access to **S3**
- Prepare for onboarding:
  - 10 More Developers
  - 5 More Data Analysts

To ensure scalability and security, we'll use **IAM users**, **groups**, **policies**, and **MFA**.

---

## Step 1: Create and Secure Root User

### 1. Create an AWS Account

- Visit [aws.amazon.com](https://aws.amazon.com) and sign up with the official company email.

### 2. Secure the Root User

- **Avoid using the root user for daily tasks**
- **Enable MFA (Multi-Factor Authentication)**:
  - Go to `IAM > Users > Security Credentials`
  - Click "Activate MFA"
  - Choose "Virtual MFA Device"
  - Use an app like **Google Authenticator** or **Authy** to scan the QR code
  - Enter two consecutive OTPs to complete setup

---

## Step 2: Create IAM Users

### User 1: John (Developer)

- **Username**: `john`
- **Access**:
  - AWS Management Console
  - Programmatic Access (CLI/API)
- **Permissions**:
  - Attach: `AmazonEC2FullAccess`
- **Password**:
  - Auto-generate
  - Require password reset on first login

### User 2: Mary (Data Analyst)

- **Username**: `mary`
- **Access**:
  - AWS Management Console
  - Programmatic Access
- **Permissions**:
  - Attach: `AmazonS3FullAccess`
- **Password**:
  - Auto-generate
  - Require password reset on first login

---

## Step 3: Secure User Accounts

After user creation:

1. **Download the `.csv` credentials**
2. Share securely with users
3. Enforce **password change on first login**
4. **Enable MFA**:
   - Sign in to AWS
   - Click the user’s name (top-right) → "Security Credentials"
   - Click "Activate MFA"
   - Choose "Virtual MFA Device" and complete setup with OTP app

---

## 👥 Step 4: Use IAM Groups for Scalability

Creating groups avoids assigning policies to each user individually.

### Group: `Developers`

- **Permissions**:
  - `AmazonEC2FullAccess`
- **Members**:
  - John
  - New developers (10 total)

### Group: `DataAnalysts`

- **Permissions**:
  - `AmazonS3FullAccess`
- **Members**:
  - Mary
  - New analysts (5 total)

To create a group:

1. Go to `IAM > User Groups > Create Group`
2. Name the group
3. Attach appropriate policy
4. Add members

---

## Step 5: Onboarding New Users

When new team members join:

1. Go to `IAM > Users > Add user`
2. Enable:
   - AWS Console Access
   - Programmatic Access
3. Add to appropriate group (`Developers` or `DataAnalysts`)
4. Share credentials CSV securely
5. Instruct them to:
   - Change their password
   - Set up MFA

---

## Best Practices

- **MFA** for all users
- **Do not use the root user** regularly
- Use **IAM groups** for role-based permissions
- Regularly **audit IAM permissions**
- Rotate **access keys** periodically
- Follow the **least privilege** principle

---

## References

- [AWS IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [Create IAM Users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
- [Enable MFA](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html)

---

## Summary Table

| User     | Role          | Access Type            | Group        | Policies Attached   |
| -------- | ------------- | ---------------------- | ------------ | ------------------- |
| John     | Developer     | Console & Programmatic | Developers   | AmazonEC2FullAccess |
| Mary     | Data Analyst  | Console & Programmatic | DataAnalysts | AmazonS3FullAccess  |
| Devs     | Developer x10 | Console & Programmatic | Developers   | AmazonEC2FullAccess |
| Analysts | Analyst x5    | Console & Programmatic | DataAnalysts | AmazonS3FullAccess  |

---

## Final Notes

Zappy E-Bank is now prepared to manage AWS access securely and efficiently as the team scales. IAM users, groups, and policies have been configured following best practices to ensure a smooth and secure cloud environment.
