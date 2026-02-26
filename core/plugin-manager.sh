# =========================
# BRI-TMX PLUGIN MANAGER
# =========================

bri_plugin_verify() {
  local plugin="$1"
  local base="$BRI_TMX/plugins/$plugin"

  [[ -f "$base/signature.sha256" ]] || return 1
  [[ -f "$base/plugin.sh" ]] || return 1

  local expected
  expected=$(cat "$base/signature.sha256")

  local actual
  actual=$(sha256sum "$base/plugin.sh" | awk '{print $1}')

  [[ "$expected" == "$actual" ]]
}

bri_plugin_load() {
  local plugin="$1"
  local base="$BRI_TMX/plugins/$plugin"

  bri_plugin_verify "$plugin" || {
    echo "Plugin verification failed: $plugin"
    return 1
  }

  source "$base/plugin.sh"
}
