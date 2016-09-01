#!/bin/bash
# seapapers_s3_csv.sh - list contents of seapapers.library.cornell.edu/issues as a csv file
#

function to_csv
{
  while test $# -gt 0
    do
        echo "do something with $1"
        shift
    done
}

#LISTO=`aws s3 ls seapapers.library.cornell.edu/issues/ --recursive`

#to_csv $LISTO

aws s3 ls seapapers.library.cornell.edu/issues/ --recursive | while read line;
  do
    sizecheck="[0-9]+[0-9] issues\/"
    if [[ $line =~ $sizecheck ]]; then
      path="[0-9]+ (issues\/.*)$"
      if [[ $line =~ $path ]]; then
        pathname="${BASH_REMATCH[1]}"
        echo "path is $pathname"
        parts="([^\/]*)\/([^\/]*)\/([^\/]*)\/([^\/]*)\/([^\/]*)\/(.*)\.(.*)$"
        if [[ $pathname =~ $parts ]]; then
          publication="${BASH_REMATCH[2]}"
          year="${BASH_REMATCH[3]}"
          volis="${BASH_REMATCH[4]}"
          part="${BASH_REMATCH[5]}"
          title="${BASH_REMATCH[6]}"
          extension="${BASH_REMATCH[7]}"
          echo "$publication $year $volis $part $title $extension"
        fi
      fi

    fi
  done
