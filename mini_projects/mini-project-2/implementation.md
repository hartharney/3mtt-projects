# Implementation

## Step 1: Initial setup - Tom and Jerry cloning repository

```bash
git clone https://github.com/hartharney/3mtt-projects.git
cd 3mtt-projects/
```

## Step 2: Tom and Jerry start working

Tom:

```bash
git pull
git checkout -b update-navigation
```

Jerry:

```bash
git pull
git checkout -b add-contact-info
```

## Step 3: Making changes

Tom:

```bash
git add .
git commit -m 'update-naviation'
```

Jerry:

```bash
git add .
git commit -m 'add-contact-info'
```

## Step 4: Merging changes

Tom:

```bash
git push --set-upstream origin update-naviagtion
```

1. Tom creates and merges his PR
   🔗 ![update-naviagtion-pr](./assets/update-naviagtion-pr-merge.png)

Jerry:

```bash
git pull origin main
git add .
git commit -m 'add-contact-info'
git push --set-upstream origin add-contact-info
```

2. Jerry createsand merges his PR
   🔗 ![add-contact-info-pr](./assets/open-pr-add-contact-info.png)
   🔗 ![add-contact-info-pr-merge](./assets/merge-branch-add-contact-info.png)

🔗 ![update-naviagtion](./assets/create-branch-update-naviagtion.png)
🔗 ![add-contact-info](./assets/create-branch-update-naviagtion.png)
