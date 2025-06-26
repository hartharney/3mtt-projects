#!/bin/bash

# AWS IAM Manager Script for CloudOps Solutions
# This script automates the creation of IAM users, groups, and permissions

# Define IAM User Names Array
IAM_USER_NAMES=("alice" "bob" "charlie" "diana" "eric")

# Function to create IAM users
create_iam_users() {
    echo "Starting IAM user creation process..."
    echo "-------------------------------------"

    for username in "${IAM_USER_NAMES[@]}"; do
        echo "Creating IAM user: $username"
        aws iam create-user --user-name "$username" >/dev/null 2>&1

        if [ $? -eq 0 ]; then
            echo "Success: Created user $username"
        else
            echo "Warning: Failed to create user $username or user may already exist"
        fi
    done

    echo "------------------------------------"
    echo "IAM user creation process completed."
    echo ""
}

# Function to create admin group and attach policy
create_admin_group() {
    echo "Creating admin group and attaching policy..."
    echo "--------------------------------------------"

    # Check if group already exists
    if aws iam get-group --group-name "admin" >/dev/null 2>&1; then
        echo "Info: Group 'admin' already exists"
    else
        echo "Creating group 'admin'..."
        aws iam create-group --group-name "admin"
    fi

    # Attach AdministratorAccess policy
    echo "Attaching AdministratorAccess policy..."
    aws iam attach-group-policy --group-name "admin" --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

    if [ $? -eq 0 ]; then
        echo "Success: AdministratorAccess policy attached"
    else
        echo "Error: Failed to attach AdministratorAccess policy"
    fi

    echo "----------------------------------"
    echo ""
}

# Function to add users to admin group
add_users_to_admin_group() {
    echo "Adding users to admin group..."
    echo "------------------------------"

    for username in "${IAM_USER_NAMES[@]}"; do
        echo "Adding user $username to admin group"
        aws iam add-user-to-group --user-name "$username" --group-name "admin"

        if [ $? -eq 0 ]; then
            echo "Success: Added $username to admin group"
        else
            echo "Error: Failed to add $username to admin group"
        fi
    done

    echo "----------------------------------------"
    echo "User group assignment process completed."
    echo ""
}

# Main execution function
main() {
    echo "=================================="
    echo " AWS IAM Management Script"
    echo "=================================="
    echo ""

    # Verify AWS CLI is installed and configured
    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed. Please install and configure it first."
        exit 1
    fi

    # Execute the functions
    create_iam_users
    create_admin_group
    add_users_to_admin_group

    echo "=================================="
    echo " AWS IAM Management Completed"
    echo "=================================="
}

# Execute main function
main

exit 0
