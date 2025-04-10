# Implementation

## Step 1: Download git

- visit the official [website](https://git-scm.com/downloads/mac)

![download](./assets//1-download-git.png)

## Step 2: Install git via CLI

- use the command :

```bash
brew install git
```

![install-git-via-cli](./assets/2-install-git-cli.png)

## Step 3: Confirm git installation

- run the following command

```bash
git -v
```

![confirm-git-installation](./assets/3-confirm-git-installation.png)

## Step 1: Initial setup - Tom and Jerry cloning repository

```bash
git clone https://github.com/hartharney/3mtt-projects.git
cd 3mtt-projects/
```

🔗 ![clone-pr](./assets/clone-repo.png)

## Step 2: Tom and Jerry start working

Tom:

```bash
git pull
git checkout -b update-navigation
```

🔗 ![check-out-update-navigation](./assets/checkout-update-naviagtion.png)

Jerry:

```bash
git pull
git checkout -b add-contact-info
```

🔗 ![check-out-add-contact-info](./assets/checkout-add-contact-info.png)

## Step 3: Making changes

Tom:

```bash
git add .
git commit -m 'update-navigation'
```

🔗 ![commit-update-navigation](./assets/commit-update-navigation.png)

Jerry:

```bash
git add .
git commit -m 'add-contact-info'
```

🔗 ![commit-add-contact-info](./assets/commit-add-contact-info.png)

## Step 4: Merging changes

Tom:

```bash
git push --set-upstream origin update-naviagtion
```

🔗 ![push-update-navigation](./assets/push-update-navigation.png)

1. Tom creates and merges his PR
   🔗 ![update-navigation-pr](./assets/update-naviagtion-pr-merge.png)

Jerry:

```bash
git pull origin main
git add .
git commit -m 'add-contact-info'
git push --set-upstream origin add-contact-info
```

🔗 ![push-add-contact-info](./assets/push-add-contact-info.png)

2. Jerry createsand merges his PR
   🔗 ![add-contact-info-pr](./assets/open-pr-add-contact-info.png)
   🔗 ![add-contact-info-pr-merge](./assets/merge-branch-add-contact-info.png)

### full set of commands

🔗 ![update-naviagtion](./assets/create-branch-update-naviagtion.png)
🔗 ![add-contact-info](./assets/create-branch-update-naviagtion.png)
