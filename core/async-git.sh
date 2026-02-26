bri_git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

bri_git_prompt() {
  local branch=$(bri_git_branch)
  [[ -n "$branch" ]] && echo "($branch)"
}
