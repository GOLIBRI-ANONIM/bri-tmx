bri_require() {
  for dep in "$@"; do
    command -v "$dep" >/dev/null 2>&1 || {
      echo "Missing dependency: $dep"
      return 1
    }
  done
}
