BRI_BOOT_START=$EPOCHREALTIME

bri_boot_time() {
  local end=$EPOCHREALTIME
  printf "Boot time: %.4f sec\n" "$(echo "$end - $BRI_BOOT_START" | bc)"
}
