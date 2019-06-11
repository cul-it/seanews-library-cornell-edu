<?php

function find_month($path, $header) {
    $months = '/january|february|march|april|may|june|july|august|september|october|november|december/';
    $month_chars = '/([jfmasond][abcdefghijlmnoprstuvy ]+) ?[0-9]/';
    if (preg_match($months, $header, $matches)) {
        return $matches[0];
    }
    if (preg_match_all($month_chars, $header, $matches)) {
        foreach ($matches[1] as $match) {
            $month = str_replace(' ', '', $match);
            if (preg_match($months, $month, $matches)) {
                return $month;
            }
        }
    }
    reject($path, 'missing month', $header);
    echo "missing month:\n$header\n";
    return '';
}

function find_date($path, $header, $year) {
    $re = "/([0-9]+) ?, ?$year/";
    if (preg_match($re, $header, $matches)) {
        return $matches[1];
     }
     reject($path, 'missing date', $header);
     echo "no date:\n$header\n";
     return '';
}

function header_titles() {
    $fp = fopen( "file-parser-output.txt", 'w');
    fwrite( $fp, "path\tmonth\tday\tyear\tdate\n");
    fclose( $fp);
}

function output($path, $month, $day, $year, $first = false) {
    if (empty($month) || empty($day) || empty($year)) {
        $parsed = '';
    }
    elseif (($timestamp = strtotime("$day $month $year")) === false) {
        $parsed = '';
    }
    else {
        $parsed = strftime("%m/%d/%Y", $timestamp);
    }
    $mode = $first ? "w" : "a";
    $fp = fopen( "file-parser-output.txt", $mode);
    fwrite( $fp, "$path\t$month\t$day\t$year\t$parsed\n");
    fclose( $fp);
}

function reject($path, $reason, $header, $first = false) {
    $mode = $first ? "w" : "a";
    $fp = fopen( "file-parser-rejects.txt", $mode);
    fwrite( $fp, "$path\t$reason\t$header\n");
    fclose( $fp);
}

function year_startsearch($year) {
    
    switch ($year) {
        case '1994':
        case '1995':
        case '1996':
        case '1997':
        case '1998':
        case '1999':
            $startsearch = "V";
            break;

        case '2000':
        case '2002':
        case '2003':
            $startsearch = "established";
            break;

        case '2004':
            $startsearch = "established";
            break;

        case '2005':
            $startsearch = "issue";
            break;

        case '2006':
        case '2008':
        case '2010':
        case '2011':
        case '2012':
        case '2013':
        case '2014':
        case '2015':
        case '2016':
        case '2017':
        case '2018':
            $startsearch = "newspaper";
            break;
        
        case '2009':
            $startsearch = "vientianetimes";
            break;
   
        case '2001':
        case '2007':
            throw new Exception("Special case year: $year", 1);
            break;            
        
        default:
            throw new Exception("Unknown year: $year", 1);           
            break;
    }
    return $startsearch;
}

function get_header($startsearch, $path) {
    $cmd = "pdfgrep -i -m 1 -B 5 -A 30 '$startsearch' $path";
    $output = array();
    exec( $cmd, $output, $error);
    if ($error != 0) {
        return '';
        //throw new Exception("Error Processing get_header $error, $path\n$cmd", 1);       
    }
    $lines = '';
    foreach ($output as $line) {
        $lines .= strtolower(preg_replace('!\s+!', ' ', $line));
    }
    return $lines;
}

try {
    //$last_file = "/Users/jgr25/Documents/seapapers-archive/vientiane-times/2016/271cd2016s.pdf";
    date_default_timezone_set('America/New_York');
    $months = 'january|february|march|april|may|june|july|august|september|october|november|december';    
    $month_names = explode('|', $months);
    header_titles();
    //output('path', 'month', 'day', 'year', true); // initialize the output file
    reject('path', 'reason', 'header', true); // initialize the reject file
    $it = new RecursiveDirectoryIterator("/Users/jgr25/Documents/back-burner/seapapers-archive/vientiane-times-new");
    $display = Array ( 'pdf' );
    foreach(new RecursiveIteratorIterator($it) as $file)
    {
        $dirs = explode('/', $file);
        $filename = array_pop($dirs);
        $year = array_pop($dirs);
        if (!is_numeric($year)) {
            echo "Non - numeric year! $year\n";
            continue;
        }
        // if ($year != 2001) {
        //     continue;
        // }
        $filename_parts = explode('.', $filename);
        $ext = array_pop($filename_parts);
        if (strtolower($ext) == 'pdf') {
            $month = $date = '';
            if ($year == 2007) {
                // date is in filename this year
                list($times,$yr,$mon,$day) = explode('_', $filename_parts[0]);
                if ($yr != $year) {
                    throw new Exception("problem with parts: $filename_parts", 1);
                }
                $month = $month_names[($mon - 1)];
                output($file, $month, $day, $year);
            }
            elseif ($year == 2001) {
                # problem with 01-52
                list($yr,$issue) = explode('-', $filename_parts[0]);
                if (($issue+0) < 53) {
                    $startsearch = 'issue';
                }
                else {
                    $startsearch = '4000 kip';
                }
                $header = get_header($startsearch, $file);
                $month = find_month($file, $header);
                $date = find_date($file, $header, $year);
                output($file, $month, $date, $year);
            }
            else {
                $startsearch = year_startsearch($year);
                $header = get_header($startsearch, $file);
                $month = find_month($file, $header);
                $date = find_date($file, $header, $year);
                output($file, $month, $date, $year);
            }
            echo "$year: $filename $month $date\n";
        }
    }
} catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
}
