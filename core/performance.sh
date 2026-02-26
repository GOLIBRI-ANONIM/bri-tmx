BRI_START_TIME=$EPOCHREALTIME

bri_profile() {
  local end=$EPOCHREALTIME
  printf "Startup: %.3f sec\n" "$(echo "$end - $BRI_START_TIME" | bc)"
}
