#!/bin/zsh

# Nomes das suas interfaces (ajuste se necessário)
ETH_IFACE="enp1s0"
WLAN_IFACE="wlan0"

if [ "$(cat /sys/class/net/$ETH_IFACE/operstate)" = "up" ]; then
    # Se o cabo estiver conectado
    IP=$(ip addr show dev $ETH_IFACE | grep "inet " | awk '{print $2}' | cut -d/ -f1)
    echo "%{F#F0C674}eth %{F-}$IP"
elif [ "$(cat /sys/class/net/$WLAN_IFACE/operstate)" = "up" ]; then
    # Se o Wi-Fi estiver conectado
    SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
    IP=$(ip addr show dev $WLAN_IFACE | grep "inet " | awk '{print $2}' | cut -d/ -f1)
    echo "%{F#F0C674}wi-fi %{F-}$SSID $IP"
else
    # Se ambos estiverem desconectados
    echo "%{F#707880}󰲛 Off"
fi
