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
FOLDER="/Users/jgr25/Documents/seapapers-archive/vientiane-times/*/*.pdf"

for year in "${YEARS[@]}"
do
    FOLDER="/Users/jgr25/Documents/seapapers-archive/vientiane-times/$year/*.pdf"
    for f in $FOLDER
    do
        firstlines=`pdfgrep -m 1 -A 6 'V' $f`
        echo "$firstlines" | grep -i 'volume\|issue\|kip\|established\|1994' || echo "$f" ; break
        continue
        case $year in
            199[456789])
                line=`pdfgrep -m 1 'KIP' $f`
                if [ $? -eq 1 ];then
                    line=`pdfgrep -m 1 'Established' $f`
                    if [ $? -eq 1 ];then
                        echo "Didn't match $f"
                        break 3
                    else
                        echo $f $line
                    fi
                else
                    echo $f $line
                fi
                ;;

            200[0123])
                line=`pdfgrep -m 1 'Established' $f`
                if [ $? -eq 1 ];then
                    line=`pdfgrep -m 1 '1994' $f`
                    if [ $? -eq 1 ];then
                        echo "Didn't match $f"
                        break 3
                    else
                        echo $f $line
                    fi
                else
                    echo $f $line
                fi
                ;;

            *) echo "Skipping $year"
                break 2
                ;;
        esac
    done
done

# for f in $FOLDER
# do 
#     line=`pdfgrep ' +700 KIP' $f`
#     if [ $? -eq 0 ];then
#      || pdfgrep 'V[O0][A-Z0-9 ]+[0-9]+ +' $f || echo $f
# done