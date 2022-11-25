# !/bin/bash

if !(eww close datetime); then
	eww update month=$(date '+%B') 
	eww update monthd=$(date '+%m') 
	eww update day=$(date '+%d')
	eww open datetime
fi;
