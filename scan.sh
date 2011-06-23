#!/bin/sh

#DEBUG=1

mode="gray" # color ou lineart
res=300 # 75, 150, 300, 600, 1200, 2400, 4800
size="a4" # 5x7, photo, a2_env, b4, b5, 3x5, 4x6, higaki, flsa, c6_env, legal, no_10_env, exec, a3, a5, a4, letter, a6, super_b, oufufu-hagaki, dl_env, japan_env_4, japan_env_3
compression="jpeg"

if [ $# -eq 0 ]; then
	echo "Fichier manquant !"
	exit 1
fi

if [ "${0##*/}" == "scan_gray.sh" ]; then
	mode="gray"
else
	mode="color"
fi

file="$1"

command="hp-scan --mode=\"$mode\" --res=\"$res\" --size=\"$size\" --file=\"$file\" --compression=\"$compression\""

if (($DEBUG)); then
	echo $command
else eval $command
fi
