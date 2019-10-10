#!/bin/bash

while true; do
	status=""

	# Battery
	status+=`acpi | grep -oP ":\s*\K.*%" | sed -s 's/U.*n,/CHR/; s/C.*g,/CHR/; s/Full,/FULL/; s/D.*g,/DSCHR/'`
	
	# Volume
	vol=`amixer get Master`

	perc=`echo "$vol" | grep -oE '[0-9]{1,3}?%' | head -1`
	muted=`echo "$vol" | grep -oP '\[(off|on)\]' | sed -s 's/\[//; s/\]//' | head -1`

	status+="  │  ${muted^^} $perc"

	# Date
	date=`LANG=en date +'%H:%M %d/%m/%y (%a)'`
	status+="  │  $date "

	xsetroot -name "$status"
	# echo "$status"
	sleep 0.5
done
