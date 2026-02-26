# =========================
# BRI-TMX PROMPT ENGINE
# =========================

setopt prompt_subst

typeset -ga BRI_SEGMENTS

bri_segment_register() {
  BRI_SEGMENTS+=("$1")
}

bri_prompt_render() {
  local output=""
  for seg in "${BRI_SEGMENTS[@]}"; do
    output+="$($seg) "
  done
  PROMPT="$output%# "
}

# Default segments
bri_segment_user() { echo "%F{cyan}%n@%m%f"; }
bri_segment_dir() { echo "%F{yellow}%~%f"; }
bri_segment_git() { bri_git_info; }

bri_segment_register bri_segment_user
bri_segment_register bri_segment_dir
bri_segment_register bri_segment_git

autoload -Uz add-zsh-hook
add-zsh-hook precmd bri_prompt_render
