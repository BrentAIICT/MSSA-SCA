# Installing and Configuring Git on Your Local Computer 

## Download and Install Git

### 1. Download Git
- Go to this web site [https://git-scm.com/downloads](https://git-scm.com/downloads) (do not use Internet Explorer) 
- Click on the **Download for Windows** link
- *Save the file if you are prompted to do so*

![GitHub Signup page](../Pics/lgit01.jpg)
---

### 2. Wait for the installer file to download
- On the bottom left of the chrome browser you will see the stratus of the download

![GitHub Signup page](Pics/lgit02.jpg)
---

### 3. Start File Explorer
- right click the **Start** menu 
- click **File Explorer**

![GitHub Signup page](Pics/lgit03.jpg)
---


### 4. Run the Git installer file
- Within the File Explorer program go to the **Downloads** folder
- locate the **Git-#.##.#-64bit.exe** file (# represents a number)
- Right click on this file and choose **Open**

![GitHub Signup page](Pics/lgit04.jpg)
---


### 5. If needed, answer yes to the User Account Control
- Click on **Yes** if the User Account Control window appears

![GitHub Signup page](Pics/lgit05.jpg)
---

### 6. License Agreement
- You can read the agreement if you wish
- Click **Next**

![GitHub Signup page](Pics/lgit06.jpg)
---

### 7. Destination Location
- If you wish to change the install loication you can do so here
- Click **Next**

![GitHub Signup page](Pics/lgit07.jpg)
---

### 8. Folder Exists (This may not show on your install)
- If this shows up on your install
- Click **Yes**

![GitHub Signup page](Pics/lgit08.jpg)
---

### 9. Component Selection
- Make sure your window looks like this one
- Click **Next**

![GitHub Signup page](Pics/lgit09.jpg)
---

### 10. Start Menu Folder
- Do not change anything here
- Click **Next**

![GitHub Signup page](Pics/lgit10.jpg)
---

### 11. Choose default editor
- If you do not have VSCode installed Click **Next**
- *if you do have VSCode installed proceed to the next instruction*

![GitHub Signup page](Pics/lgit11.jpg)
---

### 12. Optional (VSCode Editor)
- If you did have VSCode installed
- Change your install setup to look like this 
- Click **Next**

![GitHub Signup page](Pics/lgit12.jpg)
---

### 13. Name of Initial Branch
- Choose the **Override** option
- Ensure the branch name is Main
- Click **Next** 

![GitHub Signup page](Pics/lgit13.jpg)
---

### 14. Adjusting the PATH 
- Ensure your install looks like this
- Click **Next**

![GitHub Signup page](Pics/lgit14.jpg)
---

### 15. Choosing SSH
- Ensure your install looks like this
- Click **Next**

![GitHub Signup page](Pics/lgit15.jpg)
---

### 16. Choosing HTTPS
- Change the settings to looks like this
- Click "Next"

![GitHub Signup page](Pics/lgit16.jpg)
---

### 17. Congiuring Line Endings
- Ensure your install looks like this
- Click **Next**

![GitHub Signup page](Pics/lgit17.jpg)
---

### 18. Configuring the Terminal
- Change the settings to looks like this
- Click **Next**

![GitHub Signup page](Pics/lgit18.jpg)
---

### 19. Default Behaviour of git pull
- Ensure your install looks like this
- Click **Next**

![GitHub Signup page](Pics/lgit19.jpg)
---

### 20. Credential Manager
- Ensure your install looks like this
- Click **Next**

![GitHub Signup page](Pics/lgit20.jpg)
---

### 21. Extra options
- Ensure your install looks like this
- Click **Next**

![GitHub Signup page](Pics/lgit21.jpg)
---

### 22. Experimental options
- Ensure your install looks like this
- Click **Next**

![GitHub Signup page](Pics/lgit22.jpg)
---

### 23. Installing
- Wait for the Install to complete

![GitHub Signup page](Pics/lgit23.jpg)
---

### 24. Finish the Install
- Change the settings to looks like this
- Click **Finish**

![GitHub Signup page](Pics/lgit24.jpg)
---

### 25. Locate the Git Repo
- Right click **Start** menu and type **PowerShell**
- Click **Windows PowerShell**
- In the PowerShell window type **cd ~\documents\githone\YourRepoName**

![GitHub Signup page](Pics/lgit25.jpg)
---

### 26. User Configuration - Git
- In the PowerShell window type **git config --global user.name "Your name"**
- Hit the **ENTER** key

![GitHub Signup page](Pics/lgit26.jpg)
---

### 27. Email configuration - Git
- In the PowerShell window type **git config --global user.email "Your email address"**
- Hit the **ENTER** key

![GitHub Signup page](Pics/lgit27.jpg)
---

### 28. Check the Configuartion
- In the PowerShell window type **git config --list**
- Hit the **ENTER** key
- Make sure your name and email are set correctly

![GitHub Signup page](Pics/lgit28.jpg)
---


<br>
<br>

**Well done, Git is installed**

---
---


[Next Lab - Clone your Repo](https://github.com/BrentAIICT/MSSA-SCA/blob/main/CloneRepo.md#clone-a-github-repo)
