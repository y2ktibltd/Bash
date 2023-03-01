#!/bin/bash
count=$(ls "$1"/*"$1".csv | wc -l)
if [ $count -lt 3 ]
then
	echo "$((3-$count)) Files missing"
	aws s3 cp s3://sdlkjfghklfjghskdfhg/intraday/$1/$1.tar.gz .
	echo "rm $1/*.csv"
	echo "tar -xcvf $1.tar.gz"
else
	echo "All files found"
	echo "tar -cvf *.csv $1.tara.gz"
fi
