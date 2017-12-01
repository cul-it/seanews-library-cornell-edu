#!/bin/bash

# loop over all files
YEARS=(
1994
1995
1996
1997
1998
1999
2000
2001
2002
2003
2004
2005
2006
2007
2008
2009
2010
2011
2012
2013
2014
2015
2016
)

for year in "${YEARS[@]}"
do
    FOLDER="/Users/jgr25/Documents/seapapers-archive/vientiane-times/$year/*.pdf"
    for f in $FOLDER
    do
        firstlines=`pdfgrep -m 1 -A 6 'V' $f`
        if [ $? -eq 1 ];then
            echo "error finding V: $f"
            break;
        fi
        echo "$firstlines" | grep -i 'volume\|issue\|kip\|established\|1994' || echo "$f" ; break
        continue
    done
done
