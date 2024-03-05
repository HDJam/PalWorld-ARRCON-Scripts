# Author:       HDJam
# Repo:         https://github.com/HDJam/ARRCON-Scripts
# SPECIAL NOTE: I did not make ARRCON and am not affiliated with the author(s). I simply put together these script to make server administration/automation easier.
# ARRCON executable source: https://github.com/radj307/ARRCON

# Task Scheduler PowerShell Action
# powershell.exe -executionpolicy bypass -File "C:\Scheduled Tasks\PalWorld Schedule Restart.ps1"

# Server Variabls
$path = "D:\Path_To\ARRCON";        # Path to Palworld/ARRCON folder
$ip = "127.0.0.1"                   # 127.0.0.1 is local server
$port = 25575                       # ARRCON Port
$admin_pw = "MakeAStrongPassword!"  # Admin Password

# Set execution path
cd $path

# Setup calls to RCON server connector.
# Commands and arguments NEED to be wrapped by quotes
.\ARRCON.exe --host $ip --port $port --pass $admin_pw "Broadcast Server_will_restart_in_1_hour."

