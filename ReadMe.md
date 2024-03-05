# PalWorld ARRCON Scheduled Scripts
## For Windows!
The scripts were created in PowerShell. There are included Windows Task Scheduler templates that can be imported to simplify the process.

## What About Linux?
It would be pretty simple to convert the ARRCON commands into bash/shell. I might look into this and perhaps use Python. Currently I only setup ARRCON in PowerShell on Windows Server 2022.

# Prerequisits
- Administrative rights of your computer that runs the scripts.
- You will need ARRCON executable, which can be found at https://github.com/radj307/ARRCON. Go to Releases and download the Windows executable.
- SPECIAL NOTE: I did not make ARRCON and am not affiliated with the author(s). I simply put together these script to make server administration/automation easier.
- You will need ARRCON port enabled on your PalWorld server configuration. 
- Note: You may need to add an exception/rule to your server firewall if ARRCON is to be setup on a remote server.
- You will need the Admin Password setup on youre PalWorld server configuration. 
- You will need to modify the scripts in order to use them.

# Preparation
## Download Scripts
Please note, this is how I prefer my setup. You are not obligated to follow any of the steps.
Note: This guide will assume you deploy the server at C:\PalWorld\Server\Scripts
- Create a new folder at C:\PalWorld, name it Scripts
- Copy the AARCON.exe file into the Scripts folder
-   Example: You install PalWorld dedicated server at C:\PalWorld\Server. You may want to copy the executable to C:\PalWorld\Scripts.
- Copy the contents of the scripts wanted to C:\PalWorld\Scripts
- Open the .ps1 scripts in Notepad++, VSCode, or other text editor (just no "Word" processors). Windows "PowerShell ISE" will work too!

## Updating Script Variables
In the PowerShell scripts are variables. These are usually highlighted in N++ or VSC and start with the $ symbol.
Currently, there are 4 variables.

| VARIABLE  | DESCRIPTION                                                                                      |
|-----------|--------------------------------------------------------------------------------------------------|
| $path     | The path to the Scripts folder or where you stored the ARRCON.exe file.                          |
| $ip       | The server IP. Only change this if your PalWorld server is running on a separate computer/server |
| $port     | The ARRCON port setup in the PalWorld server configuration. "RCONPort"                           |
| $admin_pw | The admin password setup in the PalWorld server configuration. "AdminPassword"                   |

In each script:
- Change the path to "C:\PalWorld\Scripts"
- Change the IP if the PalWorld server is on a different computer
- Change the port if the default port is not used.
- Copy the AdminPassword value in the PalWorld server configuration here.

## Testing the Scripts
Now that your scripts are copied to C:\PalWorld\Scripts, configured, ARCON is enabled in the server configuration, and the server is running... It's time to test one of the scripts!

I suggest we test with a harmless script, the "Broadcast Upcoming Script Restart" script. This script only sends the command to the server "/broadcast" with the message "Server_will_restart_in_1_hour." which will show in the server chat.

- Login to your server.
- Right-click the PowerShell script (PalWorld Broadcast Upcoming Restart.ps1) and select Edit. This should open the script in PowerShell ISE.
- On the top is a green play button. Clicking this executes the script. If successful, no errors will appear in the terminal. You should see the message "Server_will_restart_in_1_hour." appear in your in-game chat.

If you made it this far, congradulations! Half the battle is to get past the hurdles of scripting errors...

## Automating the Scripts
Normally this part of the process is a pain in the rear. However, I took the guess work out of making a scheduled task. It is very important that you have administrator rights to your computer that will run the scripts to proceed.

If you are unsure that your account has administrator access, follow these steps:
- Search CMD
- Right-click CMD when it appears and select "Run as Administrator"
- If you are not prompted for a password... Usually you are good to go. To be sure, check to see if CMD opens with "Administrator" in the title bar.

### The Automation:
- Start Task Scheduler in Windows.
- Select Task Scheduler Library on the left pane. Right-click this folder and select New Folder.
- Name the folder PalWorld
- Select the PalWorld folder.
- Select Action menu bar option and select Import Task.
- Navigate to C:\PalWorld\Scripts\PalWorld Task Templates
- Select the "PalWorld - Broadcast Upcoming Restart.xml" file.
- Select Open.
- You should see a window appear with a bit of information on it. You can name this task whatever you want and change the description. The important part is changing the Trigger. You may not want to send the command at 1am. You can change this here.
- The important thing to change is in the Actions tab. Select Actions tab.
- You will see 1 action, start a program, and powershell execution script. Select Edit.
- Copy the Add arguments textbox to a blank notepad. Be sure to copy the entire contents. In this case: -executionpolicy bypass -File "C:\Scheduled Tasks\PalWorld Broadcast Upcoming Restart.ps1"
- Change the path at the end of the command to the actual script in the Scripts folder. Example: -executionpolicy bypass -File "C:\PalWorld\Scripts\PalWorld Broadcast Upcoming Restart.ps1"
- Copy the new arguments, from -executionpolicy to the quote after .ps1. Paste the result into the arguments field on the task.
- Select OK.
- You should not need to change any additional settings but you may before selecing OK to close and create the task.
- You can test the task without waiting. Login to your server, right-click the new task you just created, and select run. In less than 15 seconds you should see the message broadcast.

If you made it this far, congradulations! I believe you have all the necessary tools available to automate some server tasks. If I find more tasks are useful to create, I will add them to the repository...

# FAQs
- I will not assume someone will come along and ask why there are underscores rather than spaces in the broadcast message. This is because currently, PalWorld does not currently support spaces made in the script. (As of version 1.5.1) That said, there is a Reddit post somewhere, where someone used unicode format or something in place of the underscores, which PalWorld reads properly as spaces. I have not dove into this yet but might.
- If anyone wants to create Linux shell scripts, and possibly Python scripts... I would love and appreciate to collaborate on them. I will likely make them at some point as I have several Linux VMs I can utilize for this... Just need the time! :)