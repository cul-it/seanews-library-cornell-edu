<?php

$hits = array();
$months = '/january|february|march|april|may|june|july|august|september|october|november|december/';
$month_chars = '/([jfmasond][abcdefghijlmnoprstuvy ]+)/';
$month_chars_ocr = '/([jfmasond][abcdefghijlmnoprstuvy 1]+)/';
$handle = fopen("matches.tab", "r");
if ($handle) {
    while (($line = fgets($handle)) !== false) {
        // process the line read.
        $fields = explode("\t", $line);
        $year = array_shift($fields);
        $path = array_shift($fields);
        $rawdate = implode(" ", $fields);   // in case of extra tabs
        $rawdate = strtolower($rawdate);
        $rawdate = preg_replace('!\s+!', ' ', $rawdate); // multiple whitespace to blank

        // find the month
        if (preg_match($months, $rawdate, $matches)) {
            $hits["$path"]['month'] = $matches[0];
        }
        else {
            if (preg_match($month_chars, $rawdate, $matches)) {
                $month = str_replace(' ', '', $matches[1]);
                if (preg_match($months, $month, $matches)) {
                    $hits["$path"]['month'] = $matches[0];
                }
                else {
                    echo "$rawdate\n";
                    //die("unknown here\n");
                }
            }
        }

        // $re = '/([a-z]*)([0-9 -]*)? ?([0-9]+) ?, ?([0-9]{4})/i';
        // if (preg_match($re, $rawdate, $matches) == 1) {
        //     $date = $matches[1] . ' ' . $matches[3] . ', ' . $matches[4];
        //     echo $date . PHP_EOL;
        // }
        // else {
        //     die("Can not parse: $rawdate");
        // }
        
    }

    fclose($handle);
} else {
    // error opening the file.
} 