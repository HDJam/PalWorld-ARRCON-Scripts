# ARRCON executable source: https://github.com/radj307/ARRCON
# Task Scheduler PowerShell Action
# powershell.exe -executionpolicy bypass -File "C:\Scheduled Tasks\PalWorld Restart.ps1"

# Server Variables
$path = "D:\Path_To\ARRCON";        # Path to Palworld/ARRCON folder
$ip = "127.0.0.1"                   # 127.0.0.1 is local server
$port = 25575                       # ARRCON Port
$admin_pw = "MakeAStrongPassword!"  # Admin Password

# Set execution path
cd $path

# ARRCON commands to save and restart server
# Commands and arguments NEED to be wrapped by quotes
.\ARRCON.exe --host $ip --port $port --pass $admin_pw "Save"
.\ARRCON.exe --host $ip --port $port --pass $admin_pw "Broadcast Server_restarting..."

# Kill processes if still running
Get-Process -Name "PalServer" | Select Id | Stop-Process
Get-Process -Name "PalServer-Win64-Test-Cmd" | Select Id | Stop-Process
# Get-Process -Name "Cmd" | Select Id | Stop-Process # Not necessary if dont have a pause in your startup script.

# Restart Server Process, update startup script to your script
Start-Process -FilePath $path + "\!Start Palworld Server.bat"
