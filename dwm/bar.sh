#!/bin/bash

while true; do
	status=""

	# Battery
	status+=`acpi | grep -oP ":\s*\K.*%" | sed -s 's/U.*n,/CHR/; s/Full,/FULL/; s/D.*g,/DCHR/'`
	
	# Volume
	vol=`amixer get Master`

	perc=`echo "$vol" | grep -oE '[0-9]{1,3}?%' | head -1`
	muted=`echo "$vol" | grep -oP '\[(off|on)\]' | sed -s 's/\[//; s/\]//' | head -1`

	status+="  │  ${muted^^} $perc"

	xsetroot -name "$status"
	# echo "$status"
	sleep 0.5
done
