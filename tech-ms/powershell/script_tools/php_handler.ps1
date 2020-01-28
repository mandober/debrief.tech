$me = "ApachePHPHandler"
write-host "[${me}] Checking for Apache and PHP"

#
# check apache
# discard stdout/stderr
$apache = scoop which httpd

# apache not installed
if ($lastexitcode -ne 0) {
    "✘ Apache not installed, run 'scoop install apache'"
    return
}

#
# check php
#
$php = scoop which php

# php not installed
if ($lastexitcode -ne 0) {
    "✘ PHP not installed, run 'scoop install php"
    return
}



$conf = "$(split-path $apache)/../conf/httpd.conf"

write-host 'enabling PHP handler...'

$phpmodule = "$(split-path $php -resolve)\php7apache2_4.dll"

if (test-path $phpmodule) {
	$lines = Get-Content $conf
	$phpmodule = $phpmodule -replace '\\', '/'
	"
    # php setup
	LoadModule php7_module '$phpmodule'
	AddHandler application/x-httpd-php .php
	PHPIniDir `"$(split-path $phpmodule)`"
	" | out-file $conf -append -encoding utf8
} else {
    write-host "error: couldn't find $phpmodule"
    return
}

write-host "done"
