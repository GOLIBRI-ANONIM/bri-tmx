plugins=(git core)

for plugin in "${plugins[@]}"; do
  file="$BRI_TMX/plugins/$plugin.plugin.sh"
  [[ -f "$file" ]] && source "$file"
done
