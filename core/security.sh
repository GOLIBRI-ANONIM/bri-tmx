bri_validate_plugin() {
  local file="$1"
  grep -E "(curl|wget).*http" "$file" >/dev/null && {
    echo "Warning: remote execution detected in $file"
  }
}
