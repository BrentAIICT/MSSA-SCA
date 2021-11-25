# Git Commands

## Regular Commands

### Configuration

- git config 
  - Changes the configuration of git
  - Examples:
    - git config --global user.name "Katie Oren"
    - git config --global user.email "katie.oren@acme.com"
    - git config --list

### Getting Help

- git help
  - Gets help for git verbs (add, pull, push, commit, etc.)
  - Examples:
    - git help show
    - git help add

### Create Local Repository

- git init *DirectoryName*
- git clone *GitHubURL*
  - Init creates a new local Repository that is not linked to another repository
  - Clone can create a clone of a *local* or a *GitHub repository* on your PC
  - Examples:
    - git init newfolder
    - git clone https://github.com/jowndoe/website.git

### Explore git State and History
- git status
- git log
- git show
  - Status shows the state of the repository
  - Log shows a history of commits
  - Show displays a history of changes
  - Examples:
    - git status 
    - git log --graph 
    - git log --oneline
    - git show 

### Git Commit workflows
- git fetch
- git status
- git pull 
  - (if this is required)
- *Changes you need to make are done now!*
- git add .  
  - or git add *filename*
- git commit -m "Message to store with the commit"
  - These one line messages will be handy, if they are descriptive, when looking at the commit history
- git push
  - This workflow is very useful especially when you are working with a cloned repository
  - Fetch looks at the remote repository to collect metadata (but no file download)
  - Status can then tell us if there are nay chnages to be pulled to our local repo before we make any changes
    - If we fail to do this our changes will be out of step with the remote branch and we will not be able to push our changes
  - Pull will only be used here if there has been changes made to the remote branch that we should sync to our local branch
  - \[Make any changes to the files in the Repo directory or sub directories]
  - Add takes that changes and new files that have happened within the Repo directory and stages them ready for commiting
  - Commit takes all of the changes in the staging area and creates a shapshot of the repository
  - Push takes the commited changes and syncs them with the remote repository

## More Advanced Commands

### Branches
- git branch
- git checkout
- git merge
  - Branch can list of create branches
  - Checkout will change your current working branch to another
  - Merge will take a branch and merge it into the current branch
  - Examples:
    - git branch --list
    - git branch *BranchName*
      - creates a new branch
    - git checkout *BranchName*
      - Move working branch to *BranchName*
    - git checkout -b *BranchName* 
      - create *BranchName* and checkout a new branch in one step
    - git merge *BranchName* 
      - merges BranchName into current branch, make sure you are in the branch you wish to merge into

