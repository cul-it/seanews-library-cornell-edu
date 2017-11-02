#!/bin/bash

papers=(
#analisa
#asahan
#berita
#bima
#fajar
#gaung
#intip
#intip.bat
#kborneo
#kdpos
#kmk
#kpp
#krb
#kt
#lekspres
#lombok
#lpost
#lrl
#lrt
#mtimur
nrr
palopo
pare
pjcl
pjpl
pnplhp
pnplkr
psmas
pspbpl
ptrl
rb
rlampung
rsampit
siantar
skom
slp
sma
smandiri
smer
smetro
smp
smt
snp
sposko
spp
srp
srs
ssk
stor
sumbawa
surya
tabagsel
tapanuli
#test.bat
waspada
)

# without cd / output looks like this:
# upload: ../../../../Volumes/Elements/intip/nrr/01_2007/odw/2007-01-11/thumbnails/2007-01-11-0011_tb.jpg to s3://seapapers.library.cornell.edu/archive/intip/nrr/01_2007/odw/2007-01-11/thumbnails/2007-01-11-0011_tb.jpg
cd /

for PAPER in "${papers[@]}"
do
  echo "Use <ctrl> z to stop this script..."
  echo "Paper: $PAPER"
  aws s3 sync "/Volumes/Elements/intip/$PAPER/" "s3://seapapers.library.cornell.edu/archive/intip/$PAPER/"
  echo "Paper Done: $PAPER"
done
