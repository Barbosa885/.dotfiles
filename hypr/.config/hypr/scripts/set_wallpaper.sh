#!/bin/bash

# Obtém a lista de monitores conectados
monitors=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Define os caminhos dos wallpapers
wallpaper1="~/.config/hypr/walls/1.png"
wallpaper2="~/.config/hypr/walls/2.png"

# Contador para o loop
count=1

# Aplica o wallpaper para cada monitor conectado
for monitor in $monitors; do
    if [ $count -eq 1 ]; then
        hyprctl hyprpaper wallpaper "$monitor,$wallpaper2"
    elif [ $count -eq 2 ]; then
        hyprctl hyprpaper wallpaper "$monitor,$wallpaper2"
    fi
    count=$((count + 1))
done
