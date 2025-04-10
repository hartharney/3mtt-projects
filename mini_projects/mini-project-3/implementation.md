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

## Step 4: create Github profile

-visit github official [site](https://github.com/)

![create-github-profile](./assets/4-create-github-profile.png)

## Step 5: create new repository

![create-github-profile](./assets/5-create-new-repository.png)

## Step 6: Obtain url to clone repository

![get-cloning-url](./assets/6-get-repository-url.png)

## Step 7: Create project directory on machine

```bash
cd Desktop/
mkdir 3mtt-projects/
cd 3mtt-projects/
```

![create-project-directory](./assets/7-create-project-directory.png)

## Step 8: Initial setup cloning repository

```bash
git clone https://github.com/hartharney/3mtt-projects.git
cd 3mtt-projects/
```

🔗 ![clone-pr](./assets/8-clone-repository-to-local.png)

## Step 9: Ceate index.html

```bash
    cd 3mtt-projects/
    mkdir mini-project-3
    cd mini-project-3
    touch index.html
```

![create-index-html](./assets/9-create-index-html.png)

## Step 10: Make changes and confim git history

```bash
 git status
```

![git-status](./assets//10-changes-not-staged.png)

## Step 11: Making changes

```bash
git add .
git commit -m "This is my first commit"
```

🔗 ![commit-main](./assets/11-commit-changes.png)

## Step 12: First Contribution

```bash
git add .
git push origin main

```

🔗 ![firts-push](./assets/12-push-to-main.png)

## Step 13: First branch

```bash
git pull
git checkout -b update-navigation
```

🔗 ![check-out-update-navigation](./assets/12-push-to-main.png)

## Step 14: Second commit

```bash
git add .
git commit -m 'update-navigation'
```

![commit-update-navigation](./assets/14-commit-update-navigation.png)

## Step 15: Second push

```bash
git push --set-upstream origin update-naviagtion
```

![seond-push](./assets//15-push-update-navigation.png)

## Step 16: Second branch

```bash
git pull
git checkout -b add-contact-info
```

![second-branch](./assets//16-checkout-add-contact-info.png)

## Step 17: Third commit

```bash
git add .
git commit -m 'add-contact-info'
```

![third-commit](./assets//17-commit-add-contact-info.png)

## Step 18: Merging changes

Tom:

```bash
git push --set-upstream origin update-naviagtion
```

![third-push](./assets/18-push-add-contact-info.png)
