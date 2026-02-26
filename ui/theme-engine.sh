BRI_THEME="default"

bri_set_theme() {
  BRI_THEME="$1"
  source "$BRI_TMX/themes/$BRI_THEME.theme.sh"
}
