#!/bin/bash

# the bridge source filename
BRIDGE_FILENAME='ZeroMQ_Bridge_EA.mq4'

# the SSH endpoint of the deployment target
SSH_ENDPOINT='joe@win10'

# the remote MT4 profile location
MT4_PROFILE='C:\Users\Joe\AppData\Roaming\MetaQuotes\Terminal\977DAA59FB4CDBA569AB3A0248922121'

# the remote MT4 install location (omit to skip compilation)
MT4_HOME='C:\Program Files (x86)\JAFX MetaTrader 4'

# closes master connection and exits with code
function closeAndExit() {
  ssh -O exit "$SSH_ENDPOINT" &> /dev/null
  exit $1
}

echo "Deploying \"$BRIDGE_FILENAME\"..."

# start master connection
ssh -Nf "$SSH_ENDPOINT"

# Windows paths used by WSL must be converted into Linux format
WSL_MT4_PROFILE="$(ssh "$SSH_ENDPOINT" "echo \$(wslpath '$MT4_PROFILE')")"
WSL_MT4_HOME="$(ssh "$SSH_ENDPOINT" "echo \$(wslpath '$MT4_HOME')")"
WSL_DESTINATION_BRIDGE_FULLPATH="$WSL_MT4_PROFILE/MQL4/Experts/$BRIDGE_FILENAME"
SCRIPT_NAME="$(basename "$0")"
SCRIPT_DIR="$(dirname "$(realpath -s "$0")")"
SOURCE_BRIDGE="MQL4/Experts/$BRIDGE_FILENAME"
SOURCE_BRIDGE_FULLPATH="$SCRIPT_DIR/$SOURCE_BRIDGE"
WIN_DESTINATION_BRIDGE_FULLPATH="$MT4_PROFILE\\MQL4\\Experts\\$BRIDGE_FILENAME"
WIN_COMPILER_LOG="$MT4_PROFILE\\logs\\compiler.log"
WSL_COMPILER_LOG="$(ssh "$SSH_ENDPOINT" "echo \$(wslpath '$WIN_COMPILER_LOG')")"

if ssh "$SSH_ENDPOINT" "[ ! -d \"$WSL_MT4_PROFILE\" ]"; then
  echo "[ERROR] MetaTrader profile not found.  Deployment aborted."
  closeAndExit 1
fi

rsync -avhu --exclude "/$SCRIPT_NAME" --exclude "/$SOURCE_BRIDGE" "$SCRIPT_DIR/" "$SSH_ENDPOINT:\"$WSL_MT4_PROFILE\""
rsync -avh "$SOURCE_BRIDGE_FULLPATH" "$SSH_ENDPOINT:\"$WSL_DESTINATION_BRIDGE_FULLPATH\""

# compile the bridge if a path to the compiler was provided
if [ -n "$MT4_HOME" ]; then

  if ssh "$SSH_ENDPOINT" "[ ! -f \"$WSL_MT4_HOME/metaeditor.exe\" ]"; then
    echo "[WARNING] The MQL4 compiler was not found.  Skipping compilation..."
    closeAndExit 1
  fi

  echo -e "\nCompiling..."
  if ssh "$SSH_ENDPOINT" "
    rm \"$WSL_COMPILER_LOG\" &> /dev/null
    cd \"$WSL_MT4_HOME\"
    ./metaeditor.exe /log:\"$WIN_COMPILER_LOG\" /compile:\"$WIN_DESTINATION_BRIDGE_FULLPATH\"
    [ ! -f \"$WSL_COMPILER_LOG\" ]"; then
    echo "[ERROR] Compiler log not found."
    closeAndExit 1
  fi

  # convert log to UTF-8 and direct any warnings/errors to local STDOUT
  ssh "$SSH_ENDPOINT" "iconv -f utf-16 -t utf-8 \"$WSL_COMPILER_LOG\"" | grep -E --color=auto "warning|error"
else
  echo -e "\nCompilation skipped."
fi
closeAndExit 0
