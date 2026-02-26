bri_update() {
  if [ -d "$BRI_TMX/.git" ]; then
    cd "$BRI_TMX" && git pull
  else
    echo "Not a git repo. Clone from GitHub first."
  fi
}
