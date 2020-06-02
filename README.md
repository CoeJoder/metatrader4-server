# MetaTrader 4 -- ZeroMQ bridge
Provides a high-level trading interface to MetaTrader 4 via ZeroMQ sockets.

![Diagram 1](diagram_1.png)

## Installation
Copy the contents of the [metatrader4](metatrader4) folder into your MetaTrader 4 profile directory, merging the 
folder contents.
Start MetaTrader 4 and add the `ZeroMQ Bridge EA` to a chart (chart symbol does not matter).

## Development
This project contains a number of configuration files and scripts to aid in the development cycle. 

#### Development environment setup:
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
To apply the changes, restart MetaTrader 4 by running [restart_mt4.bat](metatrader4/restart_mt4.bat) in the MT4 profile directory.
