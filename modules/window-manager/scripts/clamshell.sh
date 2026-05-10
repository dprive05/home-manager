#!/usr/bin/env bash

INTERNAL_DISPLAY=eDP-1

ICON_LAPTOP="computer-laptop"
ICON_MONITOR="video-display"

notify_user() {
	notify-send -i "$3" "$1" "$2"
}

    # --- MODES ---
    mode_close() {
	    MONITORS_COUNT=$(hyprctl monitors all | grep -c "Monitor")
	    if [[ $MONITORS_COUNT -gt 1 ]]; then
		    hyprctl keyword monitor "$INTERNAL_DISPLAY, disable"
	    fi
    }

mode_open() {
	hyprctl keyword monitor eDP-1, 2560x1600@165, 0x0, 1.60
}

if [[ "$1" == "close" ]]; then
	mode_close
	notify_user "Clamshell Mode" "External monitor active. Laptop screen disabled." "$ICON_MONITOR"

elif [[ "$1" == "open" ]]; then
	mode_open
	notify_user "Laptop Mode" "Laptop screen enabled." "$ICON_LAPTOP"

elif [[ "$1" == "check" ]]; then
	if grep -q "open" /proc/acpi/button/lid/*/state; then
		mode_open
	else
		mode_close
	fi

else
	echo "Usage: clamshell [open|close|check]"
	exit 1
fi
