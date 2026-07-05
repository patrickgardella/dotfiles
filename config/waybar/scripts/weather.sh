#!/bin/bash

export PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

LAT="38.2527"
LON="-85.7585"
CACHE_FILE="/tmp/weather.cache"
CACHE_MAX_AGE=600
ENV_FILE="/home/patrick/.config/waybar/scripts/weather.env"

if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
fi

if [ -z "$OPENWEATHER_API_KEY" ]; then
    echo '{"text": "no key", "tooltip": "OPENWEATHER_API_KEY not set"}'
    exit 0
fi

# Serve cache if fresh
if [ -f "$CACHE_FILE" ]; then
    cache_age=$(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null)))
    if [ "$cache_age" -lt "$CACHE_MAX_AGE" ] 2>/dev/null; then
        cat "$CACHE_FILE"
        exit 0
    fi
fi

# Fetch weather
response=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&appid=${OPENWEATHER_API_KEY}&units=imperial")
if [ -z "$response" ]; then
    if [ -f "$CACHE_FILE" ]; then
        cat "$CACHE_FILE"
    else
        echo '{"text": "--°F", "tooltip": "Weather unavailable"}'
    fi
    exit 0
fi

temp=$(echo "$response" | jq -r '.main.temp')
icon=$(echo "$response" | jq -r '.weather[0].icon')
humidity=$(echo "$response" | jq -r '.main.humidity')
wind=$(echo "$response" | jq -r '.wind.speed')
desc=$(echo "$response" | jq -r '.weather[0].description')

case "$icon" in
    "01d") icon_char="" ;;
    "01n") icon_char="" ;;
    "02d"|"02n"|"03d"|"03n"|"04d"|"04n") icon_char="" ;;
    "09d"|"09n") icon_char="" ;;
    "10d"|"10n") icon_char="" ;;
    "11d"|"11n") icon_char="" ;;
    "13d"|"13n") icon_char="" ;;
    "50d"|"50n") icon_char="" ;;
    *) icon_char="" ;;
esac

temp_rounded=$(printf "%.0f" "$temp")
capitalize() { echo "$(tr '[:lower:]' '[:upper:]' <<< "${1:0:1}")${1:1}"; }
desc_cap=$(capitalize "$desc")

output=$(cat <<EOF
{"text": "${icon_char} ${temp_rounded}°F", "tooltip": "${desc_cap}\nHumidity: ${humidity}%\nWind: ${wind} mph"}
EOF
)

echo "$output" > "$CACHE_FILE"
echo "$output"
