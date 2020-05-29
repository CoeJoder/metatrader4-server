# MetaTrader 4 -- ZeroMQ bridge
Provides a high-level trading interface to MetaTrader 4 via ZeroMQ.

## Installation
Copy the contents of the [metatrader4](metatrader4) folder into your MetaTrader 4 profile directory, merging the 
folder contents.
Start MetaTrader 4 and add the `ZeroMQ Bridge EA` to any chart.

## Development
This project contains a number of configuration files and scripts to aid in the development cycle.
Below is a description of my development environment.

#### Development environment setup:
 - obtain a demo account from a broker and download their MetaTrader 4 installer
 - install MetaTrader 4 on a server (e.g. an evaluation install of Windows 10 on a virtual machine)
 - install Windows Subsystem for Linux on the server 
   - run a SSH server within WSL
   - configure password-less login using an SSH key
   - enable SSH master sessions on your development workstation 
 - create a copy of [zeromq_bridge_startup.template.ini](metatrader4/config/zeromq_bridge_startup.template.ini) 
 (in that same folder) and rename it to `zeromq_bridge_startup.ini`
   - edit the file and set the `Login`, `Password`, `Server` values pertaining to your demo account
 - edit [remote_deploy.sh](remote_deploy.sh) and configure the variables near the top of the script
   - do the same with [restart_mt4.bat](metatrader4/restart_mt4.bat) 

During development cycles, run [remote_deploy.sh](remote_deploy.sh) to deploy the latest source, then restart 
MetaTrader 4 with by running [restart_mt4.bat](metatrader4/restart_mt4.bat) on the target machine.
Read the headers comments of these scripts for a full description of their behaviors.
