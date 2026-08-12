#!/usr/bin/env bash
CACHE="$HOME/.cache/polybar_weather"
CACHE_AGE=1800   # 30 minutes

if [[ -f "$CACHE" ]]; then
    age=$(( $(date +%s) - $(stat -c %Y "$CACHE") ))
    if (( age < CACHE_AGE )); then
        cat "$CACHE"
        exit 0
    fi
fi

temp=$(curl -s --max-time 5 "wttr.in/?format=%t" 2>/dev/null)

if [[ -n "$temp" && "$temp" != *"Unknown"* ]]; then
    temp=$(echo "$temp" | xargs)          # clean spaces
    echo "$temp" > "$CACHE"
    cat "$CACHE"
else
    echo "--"
fi
