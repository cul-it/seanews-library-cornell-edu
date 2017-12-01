#!/bin/bash

# loop over all files
FOLDER="/Users/jgr25/Documents/seapapers-archive/vientiane-times/*/*.pdf"

for f in $FOLDER
do 
    pdfgrep ' +700 KIP' $f || pdfgrep 'V[O0][A-Z0-9 ]+[0-9]+ +' $f || echo $f
done