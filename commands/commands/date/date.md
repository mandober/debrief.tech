# date


## Examples

current date using cute format
date +"%Y %Y"


current date using default locale format
date +"%c"

current date in UTC and ISO 8601 format
date -u +"%Y-%m-%dT%H:%M:%SZ"

current date as Unix timestamp (seconds since the Unix epoch)
date +%s

specific date (represented as a Unix timestamp) using default format
date -d @1473305798

Convert specific date to the Unix timestamp format
date -d "{{2018-09-01 00:00}}" +%s --utc

current date using RFC-3339 format (YYYY-MM-DD hh:mm:ss TZ)
date --rfc-3339=s

convert seconds since the epoch (1970-01-01 UTC) to a date
date --date='@2147483647'

Show the time on the west coast of the US (use tzselect(1) to find TZ)
TZ='America/Los_Angeles' date

Show the local time for 9AM next Friday on the west coast of the US
date --date='TZ="America/Los_Angeles" 09:00 next Fri'

date
Sun Sep  8 16:53:32 CEST 2024

date -u
Sun Sep  8 14:53:10 UTC 2024

date +"%B"
September

LANG=sr date +"%B"
September

## Standard formats

- ISO 8601 format
    2006-08-14T02:34:56-06:00
  FMT=date for date only (the default)
  {hours, minutes, seconds, ns}
  for date and time to the indicated precision
  example:

## Help

### Usage

date [OPTION]… [+FORMAT]
date [-u| --utc| --universal] [MMDDhhmm[[CC]YY][.ss]]

Display the current time in the given FORMAT, or set the system date.

Mandatory arguments to long options are mandatory for short options too.

-d, --date=STRING
  Display time described by STRING (instead of "now")

--debug 
  Annotate the parsed date, and warn about questionable usage to stderr

-f, --file=DATEFILE
  Like `--date`; once for each line of DATEFILE

-I[FMT], --iso-8601[=FMT]
Output date/time in *ISO 8601 format*. 
FMT='date' for date only (the default), 
'hours', 'minutes', 'seconds', or 'ns' 
for date and time to the indicated precision.
Example: 2006-08-14T02:34:56-06:00

-R, --rfc-email
output date and time in *RFC 5322 format*. 
Example: Mon, 14 Aug 2006 02:34:56 -0600 

--rfc-3339=FMT
output date/time in *RFC 3339 format*. 
FMT='date', 'seconds', or 'ns'
for date and time to the indicated precision.
Example: 2006-08-14 02:34:56-06:00

-r, --reference=FILE
display the last modification time of FILE

-s, --set=STRING
set time described by STRING

-u, --utc, --universal
print or set Coordinated Universal Time (UTC)

--help                 display help
--version              display version


## Output format

Format controls the output. Interpreted sequences:

- %%   literal %

### day
- %u   day of week (1..7); 1 is Monday
- %w   day of week (0..6); 0 is Sunday
- %e   day of month, space padded; same as `%_d`
- %d   day of month (e.g. 01)
- %j   day of year (001..366)

### week
- %a   locale's abbreviated weekday name (e.g. Sun)
- %A   locale's full weekday name (e.g. Sunday)

### month
- %m   month (01..12)
- %B   locale's full month name (e.g. January)
- %b   locale's abbreviated month name (e.g. Jan)
- %h   same as %b

### year
- %g   last two digits of year of ISO week number (see %G)
- %G   year of ISO week number (see %V); normally useful only with %V

- %C   century; like %Y, except omit last two digits (e.g. 20)

- %c   locale's date and time (e.g. Thu Mar  3 23:05:25 2005)
- %D   date; same as %m/%d/%y
- %F   full date; like %+4Y-%m-%d


- %H   hour (00..23)
- %I   hour (01..12)
- %k   hour, space padded ( 0..23); same as %_H
- %l   hour, space padded ( 1..12); same as %_I
- %M   minute (00..59)
- %n   a newline
- %N   nanoseconds (000000000..999999999)
- %p   locale's equivalent of either AM or PM; blank if not known
- %P   like %p, but lower case
- %q   quarter of year (1..4)
- %r   locale's 12-hour clock time (e.g. 11:11:04 PM)
- %R   24-hour hour and minute; same as %H:%M
- %s   seconds since 1970-01-01 00:00:00 UTC
- %S   second (00..60)
- %t   a tab
- %T   time; same as %H:%M:%S
- %U   week number of year, with Sunday as first day of week (00..53)
- %V   ISO week number, with Monday as first day of week (01..53)
- %W   week number of year, with Monday as first day of week (00..53)
- %x   locale's date representation (e.g. 12/31/99)
- %X   locale's time representation (e.g. 23:13:48)
- %y   last two digits of year (00..99)
- %Y   year
- %z   +hhmm numeric time zone (e.g. -0400)
- %:z  +hh:mm numeric time zone (e.g. -04:00)
- %::z  +hh:mm:ss numeric time zone (e.g. -04:00:00)
- %:::z  numeric time zone with : to necessary precision (e.g. -04, +05:30)
- %Z   alphabetic time zone abbreviation (e.g. EDT)

## Optional options

By default, numeric fields are padded with zeroes.

The following optional flags may follow `%`
- `_`  pad with spaces
- `0`  pad with zeros
- `+`  pad with zeros, and put '+' before future years with >4 digits
- `^`  use upper case if possible
- `#`  use opposite case if possible
- `-`  do not pad the field


After flags comes an *optional field width*, as a decimal number.

Then comes an *optional modifier*, which is either:
- `E` to use the locale's alternate representations if available
- `O` to use the locale's alternate numeric symbols if available


### Links

GNU coreutils online help
https://www.gnu.org/software/coreutils

Full documentation:
https://www.gnu.org/software/coreutils/date

or locally:
info '(coreutils) date invocation'
