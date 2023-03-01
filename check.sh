#!/bin/bash
count=$( aws s3 ls s3://app-id-104385-dep-id-104386-uu-id-883uvj59jojc/intraday/"$1"/ | wc -l )
if [ ! $count == 40 ]
then
        if [ $count -gt 40 ]
        then
                echo "Interval has files for other times"
                aws s3 ls s3://app-id-104385-dep-id-104386-uu-id-883uvj59jojc/intraday/"$1"/ | grep -L $1
        else
                echo "$((40-$count)) Files missing"
                if [ ! -d $1 ]
                then
                        mkdir $1
                fi
                aws s3 cp s3://app-id-104385-dep-id-104386-uu-id-883uvj59jojc/intraday/"$1"/intraday-15-$1.tar.gz $1
                tar -xvf $1/intraday-15-$1.tar.gz -C $1/
        fi
else
        echo "All 40 files found"
fi
