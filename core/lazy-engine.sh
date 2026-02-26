# =========================
# LAZY ENGINE
# =========================

bri_lazy() {
  local cmd="$1"
  local file="$2"

  eval "
  function $cmd() {
    unset -f $cmd
    source \"$file\"
    $cmd \"\$@\"
  }"
}
