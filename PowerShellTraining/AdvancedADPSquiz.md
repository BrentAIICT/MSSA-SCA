# AD User Recovery
Recover deleted user from Domain controller Recycle-Bin

Probable outcome
Your script do a search for the user in dsa.msc and it should be back without any info loss. This script is very handy and I wish to have it rather than doing with GUI.

Download 
You can download the script via the highlighted link. 

AD User Recovery
2. Adding server to domain
It is a huge task when it comes to add a server to domain, change IP this and that sometimes becomes frustrating so why not automate it. The scripts works spotlessly without any hiccups.

How it works
Usually the script ask to provide the domain controller IP which is the foremost requirement when you add the server to domain. After that it generally ask to provide the domain name it is something like xyz.com, anything and reboots the server without permission as wo require the permission when you ought to restart the server or system anyways.

Probable outcome
After you run this script first thing first login to the system with domain credentials to test whether you are able to login or not or else there might be some issue we need to check. If you face any issue let me know so that I can show you the demo.

Download 
You can download the script via the highlighted link.

Adding Server to Domain
3. FSMO Role Transfer
FSMO Role transfer via GUI is a huge task and it is simplified in some sets of commands. I have created a choice pattern in which you can which role you prefer to send from one DC to another.

How it works
Usually the scripts ask to provide the preference from 1-6, which role you want to send to the other DC. Likewise if we do with GUI it is a huge task, so it is very easy in powershell. In this scripts if the transfer is successful you will get a prompt if the role is successfully transfered.

Probable outcome
After you run this script you will be able to transfer the roles from one DC to another ad you can check as well. FSMO roles is a very important hence do it very carefully.

Download 
You can download the script via the highlighted link.

FSMO Role Transfer
Video Link
FSMO role Transfer

4. Disabling Inactive users in AD
Disabling AD user is a monthly activity and can be hard if you perform it via GUI if there are may users. I bring you a script in which you can disable bulk users via Powershell.

How it works
The script will ask for the user identity for which you want to disable and similarly for bulk provide a sheet of user and it will identify using the Sam account. Looks easy right with powershell, yes it is very easy.

Probable outcome
The user account will be disabled and the following user won't be able to login with the domain credentials. 

Download 
You can download the script via the highlighted link.

Disabling Inactive User in AD
5. Inactive User Report
While you are auditing there will be ask to provide user list who are not using their system or are not logging in for some cerain period of time, well this script does the same and makes it easier.

How it works
The script fetches the report who has not logged in to the system for a certain amount of time say 90 days and send a mail to us. Make sure you have the correct SMTP defined so that you will receive mail.

Probable outcome
The script will show you the results of the inactive users who hasn't logged in for the provided span of time.

Download 
You can download the script via the highlighted link.

Inactive User Report
6. Fetch AD Computer Details to CSV
While you are auditing there will be ask to provide user list who are not using their system or are not logging in for some certain period of time, well this script does the same and makes it easier.

How it works
The script fetches the report who has not logged in to the system for a certain amount of time say 90 days and send a mail to us. Make sure you have the correct SMTP defined so that you will receive mail.

Probable outcome
The script will show you the results of the inactive users who hasn't logged in for the provided span of time.

Download 
You can download the script via the highlighted link.

Fetch AD Computer Details to CSV
7. Enable AD Recyclebin
Enabling a recyclebin of your AD is a must when you don't want to lose the info of a deleted user. Advantage of enabling it is we can easily recover any user in a few clicks or by script.

How it works
It is just a set of commands to enable the Recyclebin without clicking through Windows settings. The script is easy and can be executed without any issues.

Probable outcome
Once the script is executed you can check in the ADUC if it is enabled or also you can check the comment what the output shows after the script is executed

Download 
You can download the script via the highlighted link.

Enabling AD Recyclebin
8. AD Object Deletion
AD object can be a computer or a user and this script provides you the ability to delete the user and their machine from the environment. No need to go and delete the user/computer from GUI anymore.

How it works
This scripts usually uses switch case so that you can select correct option between user or computer deletion and deletes the choice and provide an update on the result screen.

Probable outcome
The user or computer will be deleted from the domain and can be recovered using the scripts which I already have in the AD scripts section.

Download 
You can download the script via the highlighted link.

AD Object Deletion
9. Create Multiple AD Group
Create multiple AD groups in one run. Just provide the details in the CSV and the script will fetch the results and create the required AD groups. One of the handy scripts to be look upon.

How it works
Generally the script will fetch the input from the CSV file and create the required group under defined OU.

Probable outcome
AD groups will be created without any manual efforts to check. Just provide the required details.

Download 
You can download the script via the highlighted link.

Create multiple AD Group
10. Fetch AD user details in CSV
Fetching AD user details is a monthly process like it is used in Audits. Getting to know the AD user details is something every organization is keen about. This is a simple script to fetch the each details about the users.

How it works
After you run the script the script will fetch each details of the user to a csv file format.

Probable outcome
You can determine if any cleaning is required by checking the last logon dates and other attributes.

Download 
You can download the script via the highlighted link.

Fetch AD User Details to CSV
11. ADuser - Memberof - WhenCreated
This was a question asked by one of the user in powershellgallery where I have created the script and asked him to test and it is a success.

How it works
This script will check the user and the membership it has and also it will fetch the user account creation date.

Probable outcome
You will be able to get an idea of which group the user is a part of and when the user was created in the domain.

Download 
You can download the script via the highlighted link.

ADuser - Memberof - Whencreated
12. Last Password Set Date
Last password set date can't be fetched directly from the powershell we need to change the script somewhat. If you try to fetch the last password set it will show a date in 1601 year. So I have created a script to fetch the last password date of given samaccount.

How it works
The script will fetch the user last password set attribute and will modify it to the correct date. The users list can be provided using a txt document.

Probable outcome
You will get the correct date of the users last password set date and it will be a quick one and it avoids using the GUI method.

Download 
You can download the script via the highlighted link.

Last Password Set
13. OU Creation Single and bulk
Need to create a OU without any clicks well I have created a script for the same in which you can create a single or create OU's in bulk.

How it works
OU creation is a single command in Powershell but bulk creation requires an input which can be provided by a CSV or a text file and same is done in this script.

Probable outcome
If you do it correctly then you will be able to see the OU's created in dsa.msc.

Download 
You can download the script via the highlighted link.

OU Creation Single/bulk
14. AD User deletion Single and bulk
Need to delete an user without any clicks well I have created a script for the same in which you can delete a single or delete users in bulk.

How it works
User deletion is a single command in Powershell but bulk delete requires an input which can be provided by a CSV or a text file and same is done in this script.

Probable outcome
If you do it correctly then you won't be able to see the users that are deleted in dsa.msc.

Download 
You can download the script via the highlighted link.

AD User Deletion Single/bulk
15. AD replication Status
Want to know the replication status of the AD's in your domain this is the most suitable script for that. It provides the replication status and if there is any error then it shows the same.

How it works
It is similar to repadmin/replsum gives the same result in html format.

Probable outcome
You can schedule this script to run in hourly basis if your domain replication is inconsistent so that you can check and troubleshoot.

Download 
You can download the script via the highlighted link.

AD Replication Status
16. Stale Object Report
Want to know the lingering objects that are still present in your domain then it is a fine script which fetches it and help you to create the objects completely.

How it works
It will fetch the lingering objects that are not currently being used for a provided span of time.

Probable outcome
You can delete the stale objects if it fits your search criteria.
