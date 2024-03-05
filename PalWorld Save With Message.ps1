# ARRCON executable source: https://github.com/radj307/ARRCON
# Task Scheduler PowerShell Action
# powershell.exe -executionpolicy bypass -File "C:\Scheduled Tasks\PalWorld Save With Message.ps1"

# Server Variables
$path = "D:\Path_To\ARRCON";        # Path to Palworld/ARRCON folder
$ip = "127.0.0.1"                   # 127.0.0.1 is local server
$port = 25575                       # ARRCON Port
$admin_pw = "MakeAStrongPassword!"  # Admin Password

# Set execution path
cd $path

# Setup calls to RCON server connector.
# Commands and arguments NEED to be wrapped by quotes
.\ARRCON.exe --host $ip --port $port --pass $admin_pw "Save"
.\ARRCON.exe --host $ip --port $port --pass $admin_pw "Broadcast Server_saved."