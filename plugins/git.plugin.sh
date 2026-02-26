BRI_PLUGIN_NAME="Git Tools"
BRI_PLUGIN_VERSION="1.0"
BRI_LAZY_CMDS="gst gco"

gst() { git status; }
gco() { git checkout "$1"; }
