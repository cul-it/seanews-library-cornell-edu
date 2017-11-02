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
mtimur
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

cd /
for PAPER in "${papers[@]}"
do
  echo "Paper: $PAPER"
  aws s3 sync "/Volumes/Elements/intip/$PAPER/" "s3://seapapers.library.cornell.edu/archive/intip/$PAPER/"
  echo "Paper Done: $PAPER"
done
