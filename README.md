<<<<<<< HEAD
## Git
```
Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
```
### Connecting to GitHub with SSH

1. Generate a new SSH key:
```
ssh-keygen -t rsa -b 4096 -C "sherwin_ad@yahoo.com"
```
2. Copy the contents of the file ~/.ssh/id_rsa.pub to your SSH keys in your GitHub account settings.

3. Test SSH key:
```
$ ssh -T git@github.com
Hi developius! You've successfully authenticated, but GitHub does not provide shell access.
```

3. Change directory into the local clone of your repository (if you're not already there) and run:
```
git remote set-url origin git@github.com:username/your-repository.git
```



### Check git version

```
$ git --version
git version 2.17.1
```
### Set config values
```
$ git config --global user.name "sherwin-ad" <br>
$ git config --global user.email "sherwin_ad@yahoo.com"
```
### Show configuration values
```
$ git config --list
  user.email=sherwin_ad@yahoo.com
  user.name=sherwin-ad
```
### Need Help
```
$ git help config<br>
$ git config --help
```
### Initilize a repository from existion code
```
$ git init
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
$ git add -A
```
### Remove files from staging area
```
$ git reset
Unstaged changes after reset:
M	.ipynb_checkpoints/Git Tutorial-checkpoint.ipynb
M	Git Tutorial.ipynb
```
### Commit
```
$ git commit -m "Initial Commit"
On branch master
Changes not staged for commit:
	modified:   .ipynb_checkpoints/Git Tutorial-checkpoint.ipynb
	modified:   Git Tutorial.ipynb

no changes added to commit
```

### Check logs
```
$ git log
commit acb318234df94419f75fd3c7d45e5fd32da31dbc (HEAD -> master)
Author: sherwin-ad <sherwin_ad@yahoo.com>
Date:   Thu Mar 19 10:23:34 2020 +0800

    Initial Commit
```
### Cloning a remote repository
```
$ git clone https://github.com/sherwin-ad/my_git_tutorial .
```

### Viewing information about the remote repository
```
$ git remote -v
origin	https://github.com/sherwin-ad/my_tutorials.git (fetch)
origin	https://github.com/sherwin-ad/my_tutorials.git (push)
```
```
$ git branch -a
* master
  remotes/origin/master
```

### Show changes
```
$ git diff
```

### Pull
```
$ git pull origin master
```

### Push
```
$ git push origin master
```

### Create a branch
```
$ git branch owen-branch
fatal: A branch named 'owen-branch' already exists.
```

### Check branch
```
$ git branch
  master
* owen-branch
```

### Change branch
```
$ git checkout owen-branch
M	.ipynb_checkpoints/Git Tutorial-checkpoint.ipynb
M	Git Tutorial.ipynb
Switched to branch 'owen-branch'
```
### Push branch to remote
```
$ git push -u origin owen-branch
```

### Merge a branch
```
$ git pull origin master  
$ git merge owen-branch
$ git push origin master
```

### Delete branch
```
$ git branch -d owen-branch
$ git push origin --delete owen-branch
```

### Set new remote
```
$ git remote add origin https://github.com/sherwin-ad/my_git_tutorial.git
```

### Verify new remote
```
$ git remote -v
origin	https://github.com/sherwin-ad/my_git_tutorial.git (fetch)
origin	https://github.com/sherwin-ad/my_git_tutorial.git (push)
```
=======
Create a new repository, or reuse an existing one.

Generate a new SSH key:

```
ssh-keygen -t rsa -C "your_email@example.com"
```

Copy the contents of the file `~/.ssh/id_rsa.pub` to your SSH keys in your GitHub account settings.

Test SSH key:

```
$ ssh -T git@github.com
Hi developius! You've successfully authenticated, but GitHub does not provide shell access.
```

Change directory into the local clone of your repository (if you're not already there) and run:

```
git remote set-url origin git@github.com:username/your-repository.git
```

Now try editing a file (try the README) and then do:

```
$ git commit -am "Update README.md"
$ git push
```

You should not be asked for a username or password. If it works, your SSH key is correctly configured.
>>>>>>> 80b08ed51b7f8a3dc9d91c3b05d09bafdc879186
