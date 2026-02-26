# =========================
# BRI-TMX BOOTLOADER v2
# =========================

export BRI_TMX="$HOME/.bri-tmx"

# --- Core Loader ---
bri_source() {
  local file="$1"
  [[ -f "$file.zwc" ]] && source "$file.zwc" || source "$file"
}

# --- Init ---
bri_source "$BRI_TMX/core/init.sh"

# --- Performance & Cache ---
bri_source "$BRI_TMX/core/cache.sh"
bri_source "$BRI_TMX/core/performance.sh"

# --- Async ---
bri_source "$BRI_TMX/core/async-git.sh"

# --- Plugin System ---
bri_source "$BRI_TMX/core/plugin-loader.sh"

# --- Update Engine ---
bri_source "$BRI_TMX/core/update.sh"

# --- UI ---
bri_source "$BRI_TMX/ui/theme-engine.sh"
bri_source "$BRI_TMX/ui/prompt.sh"

# Syntax engine
bri_source "$BRI_TMX/core/syntax-engine.sh"
