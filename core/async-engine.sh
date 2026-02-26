# =========================
# BRI-TMX ASYNC ENGINE (FIXED)
# =========================

typeset -gA BRI_ASYNC_JOBS

bri_async_run() {
  local name="$1"
  shift

  "$@" &
  local pid=$!

  BRI_ASYNC_JOBS["$name"]=$pid
}

bri_async_gc() {
  for name in ${(k)BRI_ASYNC_JOBS}; do
    local pid=${BRI_ASYNC_JOBS[$name]}
    if ! kill -0 "$pid" 2>/dev/null; then
      unset "BRI_ASYNC_JOBS[$name]"
    fi
  done
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd bri_async_gc
