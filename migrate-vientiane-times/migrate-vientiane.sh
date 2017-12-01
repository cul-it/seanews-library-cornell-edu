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

exclude=(
/Users/jgr25/Documents/seapapers-archive/vientiane-times/1997/1997_73.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-27.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-1.pdf
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/197cd2006.pdf
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/198cd2006.pdf
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/199cd2006.pdf
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/200cd2006.pdf
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/201cd2006.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/special_issues.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2012/124cd2012NG.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2012/240cd2012s.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2012/246cd2012s.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2012/252cd2012s.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2012/Specail_laonewyear12.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2013/088cd2013s.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2014/006cd2014.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2014/192cd2014.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2014/234cd2014.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2014/250cd2014.pdf
)

for year in "${YEARS[@]}"
do
    # two full years when there were just indexes on the first page
    if [ "$year" -eq 2002 ]; then 
        continue 
    fi
    if [ "$year" -eq 2003 ]; then 
        continue 
    fi

    FOLDER="/Users/jgr25/Documents/seapapers-archive/vientiane-times/$year/*.pdf"
    for f in $FOLDER
    do
        for skip in "${exclude[@]}"
        do
            if [ "$skip" == "$f" ]; then
                echo "skipping $f"
                continue 2;
            fi
        done
        
        firstlines=`pdfgrep -m 1 -A 6 'V' $f`
        if [ $? -eq 1 ];then
            echo "error finding V: $f"
            break 2
        fi
        grep -i 'volume\|issue\|kip\|established\|1994' <<< $firstlines
        if [ $? -eq 1 ];then
            echo "unparsed $f"
            echo "$firstlines"
            break 2
        fi
    done
done
