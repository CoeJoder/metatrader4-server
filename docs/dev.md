# Development Environment
The main source code file is [ZeroMQ_Bridge_EA.mq4](../metatrader4/MQL4/Experts/ZeroMQ_Bridge_EA.mq4).
It is recommended to use a JetBrains IDE with the [MQL Idea](https://plugins.jetbrains.com/plugin/9291-mql-idea) plugin for syntax highlighting and code completion.
The source code, dependencies, and configuration files are deployed to a MetaTrader 4 server via SSH.
The deployment script is written in Bash, so that either Linux or Windows (via WSL) can be used for development. 

## MetaTrader 4 Server Setup
 - obtain a demo account from a ForEx broker and download their MetaTrader 4 installer
 - install MetaTrader 4 on a server (e.g. an evaluation install of Windows 10 on a virtual machine)
 - install WSL (Windows Subsystem for Linux) on the server
   - run a SSH server within WSL
   - configure password-less login using an SSH key
   - enable SSH master sessions on your dev workstation 
 - create a copy of [zeromq_bridge_startup.template.ini](metatrader4/config/zeromq_bridge_startup.template.ini), in that same folder, and rename it to `zeromq_bridge_startup.ini`
 - edit `zeromq_bridge_startup.ini` and set `Login`, `Password`, and `Server` values pertaining to your demo account
 - edit [remote_deploy.sh](remote_deploy.sh) and configure the variables near the top of the script
 - edit [restart_mt4.bat](metatrader4/restart_mt4.bat) and configure the variables near the top of the script

To deploy the latest code, run [remote_deploy.sh](remote_deploy.sh) on the dev workstation.
This will copy dependencies and the EA source code into the server's MT4 profile directory, and compile the EA.
To apply the changes, restart MetaTrader 4 by running [restart_mt4.bat](metatrader4/restart_mt4.bat) in the server's MT4 profile directory.
