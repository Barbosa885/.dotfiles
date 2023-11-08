#!/bin/bash
wifi_list=$(nmcli -t -f SSID dev wifi | awk -F: '{print $2}')
selected_wifi=$(echo -e "$wifi_list" | rofi -dmenu -i -p "Wi-Fi")

if [ -n "$selected_wifi" ]; then
  nmcli device wifi connect "$selected_wifi"
fi

