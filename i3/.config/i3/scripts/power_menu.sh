#!/bin/bash
options="Reiniciar\nDesligar\nSuspender\nSair do i3"

selected_option=$(echo -e "$options" | rofi -dmenu -i -p "Energia" -lines 4)

case "$selected_option" in
  "Reiniciar")
    systemctl reboot
    ;;
  "Desligar")
    systemctl poweroff
    ;;
  "Suspender")
    systemctl suspend
    ;;
  "Sair do i3")
    i3-msg exit
    ;;
  *)
    exit 1
    ;;
esac

