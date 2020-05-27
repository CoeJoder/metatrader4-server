@echo off

rem title:          restart_mt4.bat
rem description:    A dev script for restarting the MetaTrader 4 terminal with a clean state.
rem                 MT4 is shutdown gracefully, its chart cache is cleared, then MT4 is restarted
rem                 with the given INI configuration.
rem precondition:   This script is run in a Windows instance which has powershell.exe on the PATH, MetaTrader 4 (32-bit)
rem                 installed, and a MT4 profile with the `ZeroMQ Bridge EA` installed (see remote_deploy.sh).
rem postcondition:  MT4 will be running with a single chart which has the bridge attached, ready to receive client
rem                 requests via ZeroMQ.
rem
rem configurable variables:
rem ---------------------------------------------------------------------------

rem the MT4 profile
set MT4_PROFILE=C:\Users\Joe\AppData\Roaming\MetaQuotes\Terminal\977DAA59FB4CDBA569AB3A0248922121

rem the MT4 startup configuration (relative to MT4_PROFILE)
set START_INI=config\zeromq_bridge_startup.ini

rem the MT4 installation
set MT4_HOME=C:\Program Files (x86)\JAFX MetaTrader 4

rem ---------------------------------------------------------------------------

set MT4_EXE=%MT4_HOME%\terminal.exe
set MT4_CACHED_CHARTS=%MT4_PROFILE%\profiles\default

echo Attempting graceful shutdown of MT4...
powershell.exe "Get-Process | Where-Object {$_.Path -eq \"%MT4_EXE%\"} | foreach {$_.CloseMainWindow()}"

echo Clearing cached charts...
powershell.exe "Remove-Item -path \"%MT4_CACHED_CHARTS%\*.chr\""

echo Starting up MT4...
powershell.exe "Start-Process -FilePath \"%MT4_EXE%\" -WorkingDirectory \"%MT4_HOME%\" -ArgumentList \"%START_INI%\""

