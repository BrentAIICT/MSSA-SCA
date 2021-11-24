# Managing a Local Git Repo

## Making Changes

### 1 Open PowerShell
- Click the Start menu and type PowerShell
- Click "Windows Powershell"

![GitHub Signup page](Pics/clone01.jpg)

### 2. Go to your Git Home folder in your Documents folder
- From the PowerShell windows type: cd ~\Documents
- Hit the ENTER key
- Now type: cd .\githome\*NameOfYourRepo*
- Hit the ENTER key

![GitHub Signup page](Pics/mng02.jpg)
---

### 3. Check the Status of Git
- From the PowerShell windows type: git status
- Hit the ENTER key
- This report tells us that the Git repo has no changes to sync

![GitHub Signup page](Pics/mng03.jpg)
---

### 4. Create a new file
- From the PowerShell windows type: **New-Item -Path . -Name FirstFile.txt -Value "The first line"**
- Hit the ENTER key
- This report tells us that the Git repo has no changes to sync

![GitHub Signup page](Pics/mng04.jpg)
---

### 5. Check the Status of Git again
- From the PowerShell windows type: git status
- Hit the ENTER key
- This report tells us that the Git repo has an untracked file

![GitHub Signup page](Pics/mng05.jpg)
---

### 6. Tell Git to track any new file changes
- From the PowerShell windows type: git add .
- Hit the ENTER key

![GitHub Signup page](Pics/mng06.jpg)
---

### 7. Check the Status of Git again
- From the PowerShell windows type: git status
- Hit the ENTER key
- This report tells us that the Git repo has files that need to be committed

![GitHub Signup page](Pics/mng07.jpg)
---

### 8. Tell Git to commit any new file changes
- From the PowerShell windows type: git commit -m "New file added to repo"
- Hit the ENTER key

![GitHub Signup page](Pics/mng08.jpg)
---

### 9. Check the Status of Git again
- From the PowerShell windows type: git status
- Hit the ENTER key
- This report tells us two things
  - Our local Git repo is up to date with the changes
  - The GitHub copy of our repo is now out of date, meaning we need to push the changes back to GitHub

![GitHub Signup page](Pics/mng09.jpg)
---


### 10. Tell Git to commit any new file changes
- From the PowerShell windows type: git push --all
- Hit the ENTER key

![GitHub Signup page](Pics/mng10.jpg)
---

### 11. Check the Status of Git again
- From the PowerShell windows type: git status
- Hit the ENTER key
- This report tells us two things
  - Our local Git repo is up to date with the changes
  - The GitHub copy of our repo is now out of date, meaning we need to push the changes back to GitHub

![GitHub Signup page](Pics/mng11.jpg)
---
