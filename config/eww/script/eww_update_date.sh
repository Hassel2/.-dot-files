#!/bin/bash

months=( 'January' 'February' 'March' 'April' 'May' 'June' 'July' 'August' 'September' 'October' 'November' 'December' );

if [ $1 = 'I' ]; then
	number=$(echo "($(eww get monthd) + 1) % 13" | bc)
	if [ "$number" = "0" ]; then
		eww update year=$(echo "$(eww get year) + 1" | bc)
		number=1
	fi;
	eww update monthd=$number
elif [ $1 = 'D' ]; then
	number=$(echo "($(eww get monthd) - 1) % 13" | bc)
	if [ "$number" = "0" ]; then
		number=12
		eww update year=$(echo "$(eww get year) - 1" | bc)
	fi;
	eww update monthd=$number
fi;

eww update month=${months[($(eww get monthd) - 1)]}
