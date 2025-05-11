# Implementation

## Step 1: AWS console login

- visit the amazon aws [website](https://aws.amazon.com)

![login](./assets/aws-login.png)

## Step 2: Find EC2 on the console

![aws-console](./assets/aws-console.png)

## Step 3: EC2 Instance Setup

![ec2-instance-setup](./assets/ec2-instance-setup.png)

## Step 4: EC2 instance Network Settings

![ec2-instance-network-setup](./assets/ec2-network-settings.png)

## Step 5: Launch EC2 Instance

![ec2-instance-launch](./assets/launch-instance.png)

## Step 6: SSH Client Remote Login

> Open your terminal
> cd into directory with pem key
> use the SSH client
> connect to the instance

```bash
ssh -i "ubuntu.pem" ubuntu@public_ip_address
```

![ssh-client](./assets/remote-login.png)

## Step 7: sudo apt update

> update package list

```bash
sudo apt update
```

![sudo-apt-update](./assets/sudo-apt-update.png)

## Step 8: sudo apt install

> install tree package to view directory tree structure

```bash
sudo apt install tree
```

![sudo-apt-install](./assets/sudo-apt-install.png)

## Step 9: sudo apt upgrade

> update installed packages

```bash
sudo apt upgrade
```

![sudo-apt-upgrade](./assets/sudo-apt-upgrade.png)

## Step 10: sudo apt remove

```bash
sudo apt remove tree
```

> remove an installed package

![sudo-apt-remove](./assets//sudo-apt-remove.png)
