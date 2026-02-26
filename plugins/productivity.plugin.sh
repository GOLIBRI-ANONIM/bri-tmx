BRI_PLUGIN_NAME="Productivity"
BRI_PLUGIN_VERSION="1.0"
BRI_LAZY_CMDS="mkcd extract"

mkcd() { mkdir -p "$1" && cd "$1"; }
extract() { tar -xf "$1"; }
