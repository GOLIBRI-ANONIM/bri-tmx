BRI_PLUGIN_NAME="Termux Helpers"
BRI_PLUGIN_VERSION="1.0"
BRI_LAZY_CMDS="update"

update() { pkg update && pkg upgrade; }
