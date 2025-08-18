## Git
```
Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
```
### Check git version

```
git --version
git version 2.17.1
```

git clone download or clone existing repository from remote repository
```
git clone [git repository URL]
```

### Set config values passwordless push
remote.origin.url (passwordless push )
```
git config remote.origin.url git@github.com:sherwin-ad/my_docker.git
```

### Set config values

git config command used to set or configure author details local and global repository

```
git config --global user.name "sherwin-ad" <br>
git config --global user.email "sherwin_ad@yahoo.com"
```
### Show configuration values
```
git config --list
  user.email=sherwin_ad@yahoo.com
  user.name=sherwin-ad
```
### Need Help
```
git help config<br>
git config --help
```
### Initilize a repository from existion code
```
git init
Reinitialized existing Git repository in  /home/sherwinowen/Documents/my_git_tutorial/.git/
```
### Check git status
```
git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.ipynb_checkpoints/
	Git Tutorial for Beginners - Command-Line Fundamentals-HVsySz-h9r4.mp4
	Git Tutorial.ipynb

nothing added to commit but untracked files present (use "git add" to track)
**Ignore Files in git
```
### Add files to staging area
```
git add -A

git add filename1 filename2

# (dot) represent all the files in the current working directory
git add filename1 filename2
```
### Remove files from staging area
```
git reset
Unstaged changes after reset:
M	.ipynb_checkpoints/Git Tutorial-checkpoint.ipynb
M	Git Tutorial.ipynb
```
### Commit
```
git commit -m "Initial Commit"
On branch master
Changes not staged for commit:
	modified:   .ipynb_checkpoints/Git Tutorial-checkpoint.ipynb
	modified:   Git Tutorial.ipynb

no changes added to commit

# If you want to save a snapshot of changes done in the whole working directory. then run 

git commit -a

```

### Check logs
```
git log
commit acb318234df94419f75fd3c7d45e5fd32da31dbc (HEAD -> master)
Author: sherwin-ad <sherwin_ad@yahoo.com>
Date:   Thu Mar 19 10:23:34 2020 +0800

    Initial Commit
```
### Cloning a remote repository
```
git clone https://github.com/sherwin-ad/my_git_tutorial .
```

### Viewing information about the remote repository
```
git remote -v
origin	https://github.com/sherwin-ad/my_tutorials.git (fetch)
origin	https://github.com/sherwin-ad/my_tutorials.git (push)
```
```
git branch -a
* master
  remotes/origin/master
```

### Show changes
```
git diff

git diff --base [filename]

git diff [sourcebranch] [targetbranch]

git diff --staged
```

### Pull
```
git pull origin master

git pull [repository url]
```

### Push
```
git push origin master
```

### Create a branch
```
 git branch owen-branch
fatal: A branch named 'owen-branch' already exists.
```

### Check branch
```
git branch
  master
* owen-branch
```

### Change branch
```
git checkout owen-branch
M	.ipynb_checkpoints/Git Tutorial-checkpoint.ipynb
M	Git Tutorial.ipynb
Switched to branch 'owen-branch'
```
### Push branch to remote
```
 git push -u origin owen-branch
```

### Merge a branch
```
git pull origin master  
git merge owen-branch
git push origin master
```

### Delete branch
```
git branch -d owen-branch
git push origin --delete owen-branch
```

### Set new remote
```
# if you want to check any remote repository is configured then run below command. if no output the remote repository is not configured else it will list the all remote repository is configured.
git remote -v

# To connect to the remote repository then run the shown commands
git remote add origin https://github.com/sherwin-ad/my_git_tutorial.git
```

### Verify new remote
```
git remote -v
origin	https://github.com/sherwin-ad/my_git_tutorial.git (fetch)
origin	https://github.com/sherwin-ad/my_git_tutorial.git (push)
```

### git revert
git revert command to undo previous/bad commit means it simply creates the new commit that is the opposite of an existing commit and the changes that are rolled back.

```
git revert HEAD
git revert [CommitID]
```

### git show
git show command shows the log message and textual diff.
```
git show
```

### git rm
git rm command used to remove files from the working directory and staging area
```
git rm [filename]
```

### git branch
git branch command used to create a new branch, list all the branch, rename, and delete branches.
```
# To create a new branch, run the below command.
git branch [branchname]


# To list all the branches or check the current working branch then run below command.
git branch

# To delete branch
git branch -D [branchname]
```

### git alias
```
git config --global alias.co "checkout"
```

```
git co main
```

**git checkout main and git pull**
```
git config --global alias.copm '!git checkout main && git pull' 

git copm
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
Already up to date.

```



### Connecting to GitHub with SSH

1. Generate a new SSH key:

```
ssh-keygen -t rsa -b 4096 -C "sherwin_ad@yahoo.com"
```

1. Copy the contents of the file ~/.ssh/id_rsa.pub to your SSH keys in your GitHub account settings.
2. Test SSH key:

```
$ ssh -T git@github.com
Hi developius! You've successfully authenticated, but GitHub does not provide shell access.
```

1. Change directory into the local clone of your repository (if you're not already there) and run:

```
git remote set-url origin git@github.com:username/your-repository.git
```

check