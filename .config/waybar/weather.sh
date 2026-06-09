#!/usr/bin/env bash
# ~/.config/waybar/scripts/weather.sh
# Pulls current weather from open-meteo.com (free, no API key).

LAT="51.5"
LON="9.9506"

URL="https://api.open-meteo.com/v1/forecast"
URL+="?latitude=${LAT}&longitude=${LON}"
URL+="&current=temperature_2m,apparent_temperature,weathercode,windspeed_10m,relativehumidity_2m"
URL+="&windspeed_unit=kmh&temperature_unit=celsius"
URL+="&timezone=Europe%2FBerlin"

DATA=$(curl -sf --max-time 8 "$URL") || {
    printf '{"text":" ?","tooltip":"Weather unavailable","class":"error"}\n'
    exit 0
}

TEMP=$(echo "$DATA"   | jq -r '.current.temperature_2m')
FEELS=$(echo "$DATA"  | jq -r '.current.apparent_temperature')
WIND=$(echo "$DATA"   | jq -r '.current.windspeed_10m')
HUMID=$(echo "$DATA"  | jq -r '.current.relativehumidity_2m')
CODE=$(echo "$DATA"   | jq -r '.current.weathercode')

# WMO weather interpretation codes → icon + description
case "$CODE" in
    0)            ICON=""; DESC="Clear sky" ;;
    1)            ICON=""; DESC="Mostly clear" ;;
    2)            ICON=""; DESC="Partly cloudy" ;;
    3)            ICON=""; DESC="Overcast" ;;
    45|48)        ICON=""; DESC="Fog" ;;
    51|53|55)     ICON=""; DESC="Drizzle" ;;
    56|57)        ICON=""; DESC="Freezing drizzle" ;;
    61|63|65)     ICON=""; DESC="Rain" ;;
    66|67)        ICON=""; DESC="Freezing rain" ;;
    71|73|75)     ICON=""; DESC="Snow" ;;
    77)           ICON=""; DESC="Snow grains" ;;
    80|81|82)     ICON=""; DESC="Rain showers" ;;
    85|86)        ICON=""; DESC="Snow showers" ;;
    95)           ICON=""; DESC="Thunderstorm" ;;
    96|99)        ICON=""; DESC="Thunderstorm w/ hail" ;;
    *)            ICON=""; DESC="Unknown ($CODE)" ;;
esac

TEXT="${ICON} ${TEMP}°C"
TOOLTIP="${DESC}\nFeels like ${FEELS}°C\nWind ${WIND} km/h · Humidity ${HUMID}%"

printf '{"text":"%s","tooltip":"%s","class":"weather"}\n' \
    "$TEXT" "$TOOLTIP"
