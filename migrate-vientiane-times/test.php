<?php

$header = "vientiane--------------------------weekly ti esvolume 1 number 19 vientiane, au gust 5-11, 1994 700 kip on the boliven plateaus. starting development with the relocation of people from rti ne areas to eighl areas in mou on nam theun iii paksong district , champassa k investment project for southern laos province, the provision of techni� cal assistance to !he lao hydropower project signed government in ijnproving and a memorandum of under- document. survey work will take";
$month_chars = '/([jfmasond][abcdefghijlmnoprstuvy ]+) [0-9]/';

if (preg_match_all($month_chars, $header, $matches)) {
    print_r($matches);
}
    