#!/bin/bash
# seapapers_s3_csv.sh - list contents of seapapers.library.cornell.edu/issues as a csv file
#

echo "issuekey,partkey,publication,year,volis,part,extension,title,url"

aws s3 ls seapapers.library.cornell.edu/issues/ --recursive | while read line;
  do
    formcheck="([0-9\-]+) ([0-9\:]+)[ ]+([0-9]+) issues\/([a-z\-]+)\/([0-9\:]+)\/([^\/]+)\/([^\/]+)\/(.+)\.([a-zA-Z]+)$"
    if [[ $line =~ $formcheck ]]; then
      sizecheck="[0-9]+[0-9] issues\/"
      if [[ $line =~ $sizecheck ]]; then
        # eliminate directories and empty files - size 0
        path="[0-9]+ (issues\/.*)$"
        if [[ $line =~ $path ]]; then
          pathname="${BASH_REMATCH[1]}"
          pathname=`echo "$pathname" | tr '"' '""'`
          parts="(issues)\/([^\/]*)\/([0-9]+)\/([^\/]*)\/([^\/]*)\/(.*)\.(.*)$"
          if [[ $pathname =~ $parts ]]; then
            publication="${BASH_REMATCH[2]}"
            year="${BASH_REMATCH[3]}"
            volis="${BASH_REMATCH[4]}"
            part="${BASH_REMATCH[5]}"
            title="${BASH_REMATCH[6]}"
            title=`echo "$title" | tr '_' ' ' | tr '"' '""'`
            extension="${BASH_REMATCH[7]}"
            extension=`echo "$extension" | tr '[:upper:]' '[:lower:]'`
            url="https://s3.amazonaws.com/seapapers.library.cornell.edu/$pathname"
            issuekey="$publication|$year|$volis"
            partkey="$issuekey|$part"
            echo "\"$issuekey\",\"$partkey\",$publication,$year,$volis,$part,$extension,\"$title\",\"$url\""
          fi
        fi
      fi
    else
      >&2 echo "REJECTED: $line"
    fi
  done
