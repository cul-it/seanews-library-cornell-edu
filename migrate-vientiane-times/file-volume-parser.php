<?php

function output($path, $year, $volume, $first = false) {

    $mode = $first ? "w" : "a";
    $fp = fopen( "file-volume-parser-output.txt", $mode);
    fwrite( $fp, "$path\t$year\t$volume\n");
    fclose( $fp);
}

function reject($path, $reason, $header, $first = false) {
    $mode = $first ? "w" : "a";
    $fp = fopen( "file-volume-parser-rejects.txt", $mode);
    fwrite( $fp, "$path\t$reason\t$header\n");
    fclose( $fp);
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

function get_volume($path, $header) {
    $re = "/established 1994, volume ([0-9]+)/";
    if (preg_match($re, $header, $matches)) {
        return $matches[1];
     }
     reject($path, 'missing volume', $header);
     echo "no volume:\n$header\n";
     return '';    
}

try {
    //$last_file = "/Users/jgr25/Documents/seapapers-archive/vientiane-times/2016/271cd2016s.pdf";
    date_default_timezone_set('America/New_York');
    $it = new RecursiveDirectoryIterator("/Users/jgr25/Documents/seapapers-archive/vientiane-times");
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
        if ($year < 2007) {
            continue;
        }
        $filename_parts = explode('.', $filename);
        $ext = array_pop($filename_parts);
        if (strtolower($ext) == 'pdf') {
            $header = get_header("Established 1994,", $file);
            //echo "$header\n";
            $volume = get_volume($file, $header);
            if (empty($volume)) {
                echo "$file\n";
            }
            else {
                echo "$year Volume: $volume\n";                
            }
         }
    }
} catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
}
