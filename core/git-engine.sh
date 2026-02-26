# =========================
# BRI-TMX GIT ENGINE
# =========================

typeset -gA BRI_GIT_CACHE
BRI_GIT_TTL=3

bri_git_info() {
  local dir="$PWD"
  local now=$EPOCHSECONDS

  if [[ -n "${BRI_GIT_CACHE[$dir]}" ]]; then
    local ts="${BRI_GIT_CACHE[$dir]%%::*}"
    if (( now - ts < BRI_GIT_TTL )); then
      echo "${BRI_GIT_CACHE[$dir]##*::}"
      return
    fi
  fi

  local branch dirty
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -z "$branch" ]] && return

  [[ -n "$(git status --porcelain 2>/dev/null)" ]] && dirty="*"

  local result="[$branch$dirty]"
  BRI_GIT_CACHE[$dir]="$now::$result"

  echo "$result"
}
