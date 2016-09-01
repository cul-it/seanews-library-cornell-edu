#!/bin/bash
# seapapers_s3_csv.sh - list contents of seapapers.library.cornell.edu/issues as a csv file
#

echo "publication,year,volis,part,extension,title,url"

aws s3 ls seapapers.library.cornell.edu/issues/ --recursive | while read line;
  do
    sizecheck="[0-9]+[0-9] issues\/"
    if [[ $line =~ $sizecheck ]]; then
      # eliminate directories and empty files - size 0
      path="[0-9]+ (issues\/.*)$"
      if [[ $line =~ $path ]]; then
        pathname="${BASH_REMATCH[1]}"
        parts="(issues)\/([^\/]*)\/([0-9]+)\/([^\/]*)\/([^\/]*)\/(.*)\.(.*)$"
        if [[ $pathname =~ $parts ]]; then
          publication="${BASH_REMATCH[2]}"
          year="${BASH_REMATCH[3]}"
          volis="${BASH_REMATCH[4]}"
          part="${BASH_REMATCH[5]}"
          title="${BASH_REMATCH[6]}"
          extension="${BASH_REMATCH[7]}"
          url="https://s3.amazonaws.com/seapapers.library.cornell.edu/$pathname"
          echo "$publication,$year,$volis,$part,$extension,$title,$url"
        fi
      fi

    fi
  done
