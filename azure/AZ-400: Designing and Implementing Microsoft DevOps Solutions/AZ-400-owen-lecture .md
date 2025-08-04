### Microsoft Certified DevOps Engineer Expert - AZ-400 - Microsoft Certification Training

# 1. Introducing DevOps Core Principles

## What is DevOps?

- The contraction of "Dev" and "Ops" refers to replacing siloed Development and Operations. 
- The idea is to create multidisciplinary teams that now work together with shared and efficient practices and tools. 
- Essential DevOps practices include agile planning, continuous integration, continuous delivery, and monitoring of applications. 

![Collaboration DevOps cycle with plan, build, continuous integration, deploy, operate, and continuous feedback.](images/devops-cycle-98924900.png)

- Plan

- Build

- Continous Integration

- Deploy

- Operate

- Continues Feedback

  

## Understand your cycle time

**OODA**

- Observe
- Orient
- Decide
- Act

![Observe, orient, decide, and act as cycle.](images/devops-road-3eb79373.png)

## What is CICD?

**Continuous Integration** 

- drives the ongoing merging and testing of code, leading to an early finding of defects. 
- Other benefits include less time wasted fighting merge issues and rapid feedback for development teams.

**Continuous Delivery** 

- of software solutions to production and testing environments helps organizations quickly fix bugs and respond to ever-changing business requirements.

## What is Agile?

- refers to a group of software development methodologies based on iterative development, where requirements and solutions evolve through collaboration between self-organizing cross-functional teams. 
- Agile methods generally promote a disciplined project management process that encourages frequent inspection and adaptation, a leadership philosophy that encourages teamwork, self-organization and accountability, a set of engineering best practices intended to allow for rapid delivery of high-quality software, and a business approach that aligns development with customer needs and company goals.

### What is Scrum?

- Scrum is a subset of Agile. It is a lightweight process framework for agile development, and the most widely-used one.

- A “process framework” is a particular set of practices that must be followed in order for a process to be consistent with the framework. (For example, the Scrum process framework requires the use of development cycles called **Sprints**

### What are the Scrum roles?

The three roles defined in Scrum are the:

- **ScrumMaster** 
- **Product Owner** 
- **Development Team**

## What is Source Control?

- refers to tools that help you keep track of your code with a complete history of changes.

- the practice of tracking and managing changes to code

### What is GIT?

- is a free and open source distributed *version control* system designed to handle everything from small to very large projects with speed and efficiency.

## What is Virtualization?

- is technology that you can use to *create virtual representations of servers, storage, networks, and other physical* machines.

### What is Containers?

- are lightweight packages of your application code together with dependencies such as specific versions of programming language runtimes and libraries required to run your software services.

# 2. Getting Started with Git

## Initilized a project

```
git init
```

```
mkdir git1

mkdir git2

cd git1

git1> npx create-react-app app1
Need to install the following packages:
  create-react-app@5.0.1
Ok to proceed? (y) y
```

``` 
cd git2

git2> npx create-react-app app2
Need to install the following packages:
  create-react-app@5.0.1
Ok to proceed? (y) y
```

## Basic Rollback

### Difference Table

|                   git checkout                   |                          git reset                           |                    git revert                     |
| :----------------------------------------------: | :----------------------------------------------------------: | :-----------------------------------------------: |
| Discards the changes in the working repository.  | Unstages a file and bring our changes back to the working directory. |  Removes the commits from the remote repository.  |
|          Used in the local repository.           |                  Used in local repository.                   |          Used in the remote repository.           |
| Does not make any changes to the commit history. |             Alters the existing commit history,              | Adds a new commit to the existing commit history. |
|     Moves HEAD pointer to a specific commit.     |              Discards the uncommitted changes.               |  Rollbacks the changes which we have committed.   |
|   Can be used to manipulate commits or files.    |         Can be used to manipulate commits or files.          |    Does not manipulate your commits or files.     |