#!/bin/bash

# VPN Status Script for Waybar
# Checks for common VPN connections (OpenVPN, WireGuard, NetworkManager VPN)

VPN_CONNECTED=false
VPN_NAME=""

# Check for tun/tap interfaces (OpenVPN)
if ip link show | grep -q "tun0\|tap0"; then
    VPN_CONNECTED=true
    VPN_NAME="OpenVPN"
fi

# Check for WireGuard interfaces
if ip link show | grep -q "wg0"; then
    VPN_CONNECTED=true
    VPN_NAME="WireGuard"
fi

# Check NetworkManager VPN connections
if command -v nmcli &> /dev/null; then
    VPN_CHECK=$(nmcli -t -f TYPE,STATE con show --active | grep "vpn:activated")
    if [ -n "$VPN_CHECK" ]; then
        VPN_CONNECTED=true
        VPN_NAME=$(nmcli -t -f NAME,TYPE con show --active | grep "vpn" | cut -d: -f1 | head -n1)
    fi
fi

# Output JSON for Waybar
if [ "$VPN_CONNECTED" = true ]; then
    echo "{\"text\":\"$VPN_NAME\",\"alt\":\"$VPN_NAME\",\"tooltip\":\"VPN Connected: $VPN_NAME\",\"class\":\"Vpn on\"}"
else
    echo "{\"text\":\"No VPN\",\"alt\":\"Disconnected\",\"tooltip\":\"VPN Disconnected\",\"class\":\"Vpn off\"}"
fi
