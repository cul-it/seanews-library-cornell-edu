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
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/197cd2006.pdf
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/198cd2006.pdf
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/199cd2006.pdf
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/200cd2006.pdf
# /Users/jgr25/Documents/seapapers-archive/vientiane-times/2006/201cd2006.pdf

exclude=(
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/1996/1996_49.pdf
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/1996/1996_51.pdf
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/1997/1997_34.pdf
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/1997/1997_73.pdf
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-27.pdf
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-63.pdf
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-95.pdf
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/2001/2001-01.pdf
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/2001/2001-02.pdf
    /Users/jgr25/Documents/seapapers-archive/vientiane-times/2001/2001-04.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2002/102cd2002.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2002/20cd2002.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2004/147cd2004.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-10.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-19.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-29.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-32.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-7.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-8.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-86.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2002/21cd2002.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2002/44cd2002.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2004/75cd2004.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2005/100cd2005.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2005/5cd2005.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2008/17cd2008.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2008/32cd2008.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/08cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/100cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/104cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/16cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/182cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/19cd2010s.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/223cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/229cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/25cd2010s.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/26cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/29cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/59cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/65cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/84cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/89cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/13cd2010s.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2010/91cd2010.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2012/Specail_laonewyear12.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2013/088cd2013s.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2014/006cd2014.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2014/192cd2014.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2014/234cd2014.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2014/250cd2014.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-14.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-28.pdf
/Users/jgr25/Documents/seapapers-archive/vientiane-times/2000/2000-71.pdf

)

skiprest="/Users/jgr25/Documents/seapapers-archive/vientiane-times/2016/271cd2016s.pdf
"

for year in "${YEARS[@]}"
do
    if [ "$year" -lt 1994 ]; then
    continue
    fi
    case $year in
        199[012345678]) 
            STARTSEARCH="v"
 #           DATEMATCH="[A-Z]* [A-Z 0-9]*-[A-Z 0-9]*,.*[0-9]* [0-9]* KIP"
            DATEMATCH="[A-Z 0-9\\\.'!]*[-·][A-Z 0-9\\\.'!]*, [0-9]* 700"
            ;;
        1999)
            STARTSEARCH="v"
            DATEMATCH="[A-Z 0-9\\\.'!]*[-· ][A-Z 0-9\\\.'!]*, [0-9]* [0-9\.]*[KIP ]*"
            ;;        
        200[023]) 
            STARTSEARCH="established 1994"
            DATEMATCH="[A-Z 0-9\\\.'!]*[-· ][A-Z 0-9\\\.'!]*, [0-9]* [0-9\.]*[KIP ]*"
            ;;
        2001)
            # STARTSEARCH="established 1994"
            # #DATEMATCH="[a-z]* [0-9]*-[0-9]*"
            # DATEMATCH="[A-Z 0-9\\\.'!]*[-· ][A-Z 0-9\\\.'!]*, [0-9]* [0-9\.]*[KIP ]*"
            # problem with 01-53
            continue
            ;;
        2004)
            STARTSEARCH="established"
            DATEMATCH="[a-z]*, [a-z]* [0-9]*.*kip"
            ;;            
        2005)
            STARTSEARCH="issue"
            DATEMATCH="[a-z]*, [a-z]* [0-9]*.*kip"
            ;;            
        200[68]) 
            STARTSEARCH="newspaper"
            DATEMATCH="[A-Z]* [0-9]*,.*[0-9]* ISSUE [0-9]*"
            ;;
        2007)
            # filenames are like 'Vientiane Times_2007_01_15.pdf'
            # get the date from that
            continue
            ;;
        2009)
            STARTSEARCH="vientianetimes"
            DATEMATCH="[A-Z]* [0-9]*,.*[0-9]* ISSUE [0-9]*"
            ;;
        201[0123456789]) 
            STARTSEARCH="newspaper"
            DATEMATCH="[A-Z]* [0-9]*,.*[0-9]* ISSUE [0-9]*"
            ;;
        *) STARTSEARCH="v"
            ;;
    esac
 
    FOLDER="/Users/jgr25/Documents/seapapers-archive/vientiane-times/$year/*.pdf"
     for f in $FOLDER
    do
        if [ "$f" = /Users/jgr25/Documents/seapapers-archive/vientiane-times/2016/271cd2016s.pdf ]; then
            # these files are not opening
            echo -e "$f\t********* SKIPPED THE REST *************"
            exit 1
        fi

        for skip in "${exclude[@]}"
        do
            if [ "$skip" == "$f" ]; then
                echo -e "$f\t********* SKIPPED *************"
                continue 2;
            fi
        done
        
        firstlines=`pdfgrep -i -m 1 -B 5 -A 15 "${STARTSEARCH}" $f`
        if [ $? -eq 1 ];then
            echo "error finding $STARTSEARCH: $f"
            break 2
        fi
        firstline=`echo "$firstlines" | tr -s "[:space:]"`
        # grep -i 'volume\|issue\|kip\|established\|1994' <<< $firstlines
        #grep -i 'jan\|feb\|mar\|apr\|may\|jun\|jul\|aug\|sep\|oct\|nov\|dec\|volume\|issue' <<< $firstlines
        #grep -i 'january\|february\|march\|april\|may\|june\|july\|august\|september\|october\|november\|december\|kip' <<< $firstlines
        match=`grep -i -o "$DATEMATCH" <<< $firstline`
        if [ $? -eq 1 ];then
            echo "unparsed $f"
            echo "$firstline"
            break 2
        else
            echo -e "$f\t$match"
            echo -e "$year\t$f\t$match" >> matches.tab
        fi
    done
done
