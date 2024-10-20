#!/bin/bash

# Obtém o monitor primário
primary_monitor=$(hyprctl monitors | grep "focused: yes" -B 4 | grep "Monitor" | awk '{print $2}')

# Atualiza o arquivo de configuração da Waybar
config_file="$HOME/.config/waybar/config.jsonc"

# Usa o comando jq para atualizar o campo "output"
jq ".output = \"$primary_monitor\"" $config_file > "$config_file.tmp" && mv "$config_file.tmp" $config_file

# Reinicia a Waybar para aplicar as mudanças
pkill waybar && waybar &
