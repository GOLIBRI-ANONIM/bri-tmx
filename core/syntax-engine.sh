# =========================
# BRI-TMX NATIVE SYNTAX
# =========================

autoload -Uz colors
colors

BRI_SYNTAX_ENABLED=1

bri_syntax_highlight() {
  [[ $BRI_SYNTAX_ENABLED -eq 0 ]] && return

  local words=(${(z)BUFFER})
  local _syntax_highlight=()
  local pos=0

  for word in "${words[@]}"; do
    local start=$pos
    local end=$((pos + ${#word}))

    if whence "$word" >/dev/null 2>&1; then
      _syntax_highlight+=("$start $end fg=green")
    elif [[ "$word" == -* ]]; then
      _syntax_highlight+=("$start $end fg=yellow")
    else
      _syntax_highlight+=("$start $end fg=red")
    fi

    pos=$((end + 1))
  done

  # merge highlight (tidak overwrite global)
  region_highlight+=("${_syntax_highlight[@]}")
}

autoload -Uz add-zle-hook-widget
add-zle-hook-widget line-pre-redraw bri_syntax_highlight
