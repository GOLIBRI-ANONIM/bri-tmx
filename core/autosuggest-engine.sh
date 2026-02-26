# =========================
# BRI-TMX AUTOSUGGEST (HIGHLIGHT MODE)
# =========================

BRI_AUTOSUGGEST_ENABLED=1

bri_autosuggest_update() {
  [[ $BRI_AUTOSUGGEST_ENABLED -eq 0 ]] && return
  region_highlight=()

  [[ -z "$BUFFER" ]] && return

  local suggestion
  suggestion=$(fc -rl 1 | awk -v buf="$BUFFER" '
    index($0, buf)==1 && $0!=buf { print; exit }
  ')

  if [[ -n "$suggestion" ]]; then
    local remain="${suggestion#$BUFFER}"
    BUFFER="$BUFFER$remain"
    local start=${#BUFFER}
    local end=$start
    region_highlight+=("${#BUFFER}-${#BUFFER} fg=8")
    BUFFER="${BUFFER:0:${#BUFFER}-${#remain}}"
  fi
}

bri_self_insert() {
  zle .self-insert
  bri_autosuggest_update
}

bri_backward_delete() {
  zle .backward-delete-char
  bri_autosuggest_update
}

bri_accept() {
  if [[ -n "$region_highlight" ]]; then
    local suggestion
    suggestion=$(fc -rl 1 | awk -v buf="$BUFFER" '
      index($0, buf)==1 && $0!=buf { print; exit }
    ')
    if [[ -n "$suggestion" ]]; then
      BUFFER="$suggestion"
      CURSOR=${#BUFFER}
    fi
  fi
  region_highlight=()
}

zle -N self-insert bri_self_insert
zle -N backward-delete-char bri_backward_delete
zle -N bri_accept

bindkey '^ ' bri_accept
