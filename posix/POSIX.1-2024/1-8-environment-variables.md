# 1.8 Environment Variables
https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap08.html

## 8.1 Environment Variable Definition

Environment variables defined in this chapter affect the operation of multiple utilities, functions, and applications.

There are other environment variables that are of interest only to specific utilities. Environment variables that apply to a single utility only are defined as part of the utility description. See the ENVIRONMENT VARIABLES section of the utility descriptions in the Shell and Utilities volume of POSIX.1-2024 for information on environment variable usage.

The value of an environment variable is an arbitrary sequence of bytes, except for the null byte.

For a C-language program, an array of strings called the environment shall be made available when a process begins. The array is pointed to by the external variable `environ`, which is defined as `extern char **environ;`.

These strings have the form `name=value`. 
*names* shall not contain any bytes that have the encoded value of the character `=`. For values to be portable across systems conforming to POSIX.1-2024, the *value* shall be composed of bytes that have the encoded value of characters from the portable character set (except NUL and as indicated below).

There is no meaning associated with the order of strings in the environment. If more than one string in an environment of a process has the same name, the consequences are undefined.

Environment variable names used by the utilities in the Shell and Utilities volume of POSIX.1-2024 consist solely of uppercase letters, digits, and the <underscore> from the characters defined in Portable Character Set and do not begin with a digit. Other characters, and byte sequences that do not form valid characters, may be permitted by an implementation; applications shall tolerate the presence of such names. Uppercase and lowercase letters shall retain their unique identities and shall not be folded together. The name space of environment variable names containing lowercase letters is reserved for applications. Applications can define any environment variables with names from this name space without modifying the behavior of the standard utilities.

Note: Other applications may have difficulty dealing with environment variable names that start with a digit. For this reason, use of such names is not recommended anywhere.

The values that the environment variables may be assigned are not restricted except that they are considered to end with a null byte and the total space used to store the environment and the arguments to the process is limited to `{ARG_MAX}` bytes.

Other name=value pairs may be placed in the environment by, for example, calling any of the `setenv()`, `unsetenv()`, or `putenv()` functions, assigning a new value to the `environ` variable, or by using `envp` arguments when creating a process; see `exec` in the System Interfaces volume of POSIX.1-2024.

If the application modifies the pointers to which `environ` points, the behavior of all interfaces described in the System Interfaces volume of POSIX.1-2024 is *undefined*.

### Common Environment Variables (77)

It is unwise to conflict with certain variables that are frequently exported by widely used command interpreters and applications:

```
ARFLAGS        IFS             MAILPATH             PS1
CC             LANG            MAILRC               PS2
CDPATH         LC_ALL          MAKEFLAGS            PS3
CFLAGS         LC_COLLATE      MAKESHELL            PS4
CHARSET        LC_CTYPE        MANPATH              PWD
COLUMNS        LC_MESSAGES     MBOX                 RANDOM
DATEMSK        LC_MONETARY     MORE                 SECONDS
DEAD           LC_NUMERIC      MSGVERB              SHELL
EDITOR         LC_TIME         NLSPATH              TERM
ENV            LDFLAGS         NPROC                TERMCAP
EXINIT         LEX             OLDPWD               TERMINFO
FC             LFLAGS          OPTARG               TMPDIR
FCEDIT         LINENO          OPTERR               TZ
FFLAGS         LINES           OPTIND               USER
GET            LISTER          PAGER                VISUAL
GFLAGS         LOGNAME         PATH                 YACC
HISTFILE       LPDEST          PPID                 YFLAGS
HISTORY        MAIL            PRINTER
HISTSIZE       MAILCHECK       PROCLANG
HOME           MAILER          PROJECTDIR
```


Additionally, a *subset of the above variables are manipulated by shell builtins outside of shell assignments*.

If an attempt is made to mark any of the following variables as *readonly*, then either the `readonly` utility shall reject the attempt, or `readonly` shall succeed but the shell can still modify the variables outside of assignment context, or `readonly` shall succeed but use of a shell builtin that would otherwise modify such a variable shall fail.
- LINENO
- OLDPWD
- OPTARG
- OPTIND
- PWD

Implementations may provide an implementation-defined set of additional variables which are manipulated by implementation-specific builtins not defined in this standard.

The *readonly* utility shall not reject marking these additional variables as `readonly`, but when marked `readonly`, those extension utilities shall either continue to modify the variables, or shall fail because the variable is `readonly`. None of the variables defined by this standard shall be in this implementation-defined set.


If the variables in the following two sections are present in the environment during the execution of an application or utility, they shall be given the meaning described below.

Some are placed into the environment by the implementation at the time the user logs in; all can be added or changed by the user or any ancestor of the current process. The implementation adds or changes environment variables named in POSIX.1-2024 only as specified in POSIX.1-2024.

If they are defined in the application's environment, the utilities in the Shell and Utilities volume of POSIX.1-2024 and the functions in the System Interfaces volume of POSIX.1-2024 assume they have the specified meaning.

Conforming applications shall not set these environment variables to have meanings other than as described.

Implementations may ignore some environment variables at the point of use for security reasons, for example in programs whose real and effective user IDs or real and effective group IDs were not equal at program startup. 

The behavior shall be as if the implementation obtains the values for these environment variables using secure_getenv() instead of getenv() (see getenv ); they shall not be removed from the environment of affected processes and shall be inherited as required by this standard.

## 8.2 Internationalization Variables

This section describes environment variables that are relevant to the operation of internationalized interfaces described in POSIX.1-2024.

Users may use the following environment variables to announce specific localization requirements to applications. 

Applications can retrieve this information using the `setlocale()` function to initialize the correct behavior of the internationalized interfaces. 

The descriptions of the internationalization environment variables describe the resulting behavior only when the application locale is initialized in this way.

The use of the internationalization variables by utilities described in the Shell and Utilities volume of POSIX.1-2024 is described in the ENVIRONMENT VARIABLES section for those utilities in addition to the global effects described in this section.

Internationalization Variables (12)
- LANG
- LANGUAGE *new*
- LC_ALL
- LC_COLLATE
- LC_CTYPE
- LC_MESSAGES
- LC_MONETARY
- LC_NUMERIC
- LC_TIME
- NLSPATH
- TEXTDOMAIN *new*
- TEXTDOMAINDIR *new*


LC_COLLATE , LC_CTYPE , LC_MESSAGES , LC_MONETARY , LC_NUMERIC , and LC_TIME are defined to accept an additional field @modifier, which allows the user to select a specific instance of localization data within a single category (for example, for selecting the dictionary as opposed to the character ordering of data). 


https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap08.html


## 8.3 Other Environment Variables

Other Environment Variables
- COLUMNS
- DATEMSK
- HOME
- LINES
- LOGNAME
- MSGVERB
- PATH
- PWD
- SHELL
- TMPDIR
- TERM
- TZ



### COLUMNS

This variable shall represent a decimal integer >0 used to indicate the user's preferred width in column positions for the terminal screen or window.

If this variable is unset or null, the number of columns shall be set according to the terminal window size.

If the terminal window size cannot be obtained, the implementation determines the number of columns, appropriate for the terminal or window, in an unspecified manner.

When COLUMNS is set, the number of columns in the terminal window size and any terminal-width information implied by TERM are overridden.

Users and conforming applications should not set COLUMNS unless they wish to override the system selection and produce output unrelated to the terminal characteristics.

Users should not need to set this variable in the environment unless there is a specific reason to override the implementation's default behavior, such as to display data in an area arbitrarily smaller than the terminal or window.

### DATEMSK

Indicates the pathname of the template file used by `getdate()`.

### HOME

The system shall initialize this variable at the time of login to be a pathname of the user's home directory. See <pwd.h> .

### LINES

This variable shall represent a decimal integer >0 used to indicate the user's preferred number of lines on a page or the vertical screen or window size in lines. 

A line in this case is a vertical measure large enough to hold the tallest character in the character set being displayed.

If this variable is unset or null, the number of lines shall be set either to the number of rows in the terminal window size (see XSH tcgetwinsize ) or to a smaller number if appropriate for the terminal or window (for example, if the terminal baud rate is low); 

if the terminal window size cannot be obtained, the implementation determines the number of lines, appropriate for the terminal or window, in an unspecified manner. 

When LINES is set, the number of rows in the terminal window size and any terminal-height information implied by TERM are overridden. Users and conforming applications should not set LINES unless they wish to override the system selection and produce output unrelated to the terminal characteristics.

Users should not need to set this variable in the environment unless there is a specific reason to override the implementation's default behavior, such as to display data in an area arbitrarily smaller than the terminal or window.

### LOGNAME

The system shall initialize this variable at the time of login to be the user's login name. See <pwd.h> . For a value of LOGNAME to be portable across implementations of POSIX.1-2024, the value should be composed of characters from the portable filename character set.

### MSGVERB
Describes which message components shall be used in writing messages by `fmtmsg()`.

### PATH

This variable shall represent the sequence of path prefixes that certain functions and utilities apply in searching for an executable file.

The prefixes shall be separated by a <colon> (':').

If the pathname being sought contains no <slash> ('/') characters, and hence is a filename, the list shall be searched from beginning to end, applying the filename to each prefix and attempting to resolve the resulting pathname, until an executable file with appropriate execution permissions is found.

When a non-zero-length prefix is applied to this filename, a <slash> shall be inserted between the prefix and the filename if the prefix did not end in <slash>.

A zero-length prefix is a legacy feature that indicates the current working directory. It appears as two adjacent <colon> characters ("::"), as an initial <colon> preceding the rest of the list, or as a trailing <colon> following the rest of the list. A strictly conforming application shall use an actual pathname (such as `.`) to represent the current working directory in PATH.

If the pathname being sought contains any <slash> characters, the search through the path prefixes shall not be performed and the pathname shall be resolved as described in 4.16 Pathname Resolution.

If PATH is unset or is set to null, or if a path prefix in PATH contains a <percent-sign> character ('%'), the path search is implementation-defined.

Since <colon> is a separator in this context, directory names that might be used in PATH should not include a <colon> character.

Since <percent-sign> may have an implementation-defined meaning when searching for built-in utilities, directory names in PATH to be used to search for non-built-in utilities should not contain a <percent-sign> character.

### PWD

This variable shall represent an absolute pathname of the current working directory. It shall not contain any components that are dot or dot-dot. The value is set by the `cd` utility, and by the `sh` utility during initialization.

### SHELL

This variable shall represent a pathname of the user's preferred command language interpreter. If this interpreter does not conform to the Shell Command Language in XCU 2. Shell Command Language , utilities may behave differently from those described in POSIX.1-2024.

### TMPDIR

This variable shall represent a pathname of a directory made available for programs that need a place to create temporary files.

### TERM

This variable shall represent the terminal type for which output is to be prepared. This information is used by utilities and application programs wishing to exploit special capabilities specific to a terminal. The format and allowable values of this environment variable are unspecified.

### TZ

This variable shall represent timezone information.

The contents of the environment variable named TZ shall be used by the
- ctime()
- localtime()
- localtime_r()
- strftime()
- mktime()

functions, and by various utilities, to override the default timezone.

The application shall ensure that the value of TZ is in one of the 3 formats (spaces inserted for clarity):

    :characters

or

    std offset dst offset, rule

or

    A format specifying a geographical timezone or a special timezone.

If TZ is of the first format (that is, if the first character is a <colon>), the characters following the <colon> are handled in an implementation-defined manner.

The expanded form of the second format (without the inserted spaces) is as follows:

    stdoffset[dst[offset][,start[/time],end[/time]]]

Where:

    std and dst

Indicate no less than three, nor more than {TZNAME_MAX}, bytes that are the designation for the standard (std) or the Daylight Saving (dst) timezone. Only std is required; if dst is missing, then Daylight Saving Time does not apply in this locale.

Note: The usage of the terms "Standard Time" and "Daylight Saving Time" is not necessarily related to any legislated timezone.

Each of these fields may occur in either of two formats quoted or unquoted:

In the quoted form, the first character shall be the <less-than-sign> ('<') character and the last character shall be the <greater-than-sign> ('>') character. 

All characters between these quoting characters shall be alphanumeric characters from the portable character set in the current locale, the <plus-sign> ('+') character, or the <hyphen-minus> ('-') character.

The std and dst fields in this case shall not include the quoting characters and the quoting characters do not contribute to the three byte minimum length and {TZNAME_MAX} maximum length.

In the unquoted form, all characters in these fields shall be alphabetic characters from the portable character set in the current locale.

The interpretation of std and, if present, dst is unspecified if the field is less than three bytes or more than {TZNAME_MAX} bytes, or if it contains characters other than those specified.

    offset

Indicates the value added to the local time to arrive at Coordinated Universal Time. The offset has the form:

    hh[:mm[:ss]]

The minutes (mm) and seconds (ss) are optional. The hour (hh) shall be required and may be a single digit. The offset following std shall be required. If no offset follows dst, Daylight Saving Time is assumed to be one hour ahead of standard time. One or more digits may be used; the value is always interpreted as a decimal number. The hour shall be between zero and 24, and the minutes (and seconds)-if present-between zero and 59. The result of using values outside of this range is unspecified. If preceded by a '-', the timezone shall be east of the Prime Meridian; otherwise, it shall be west (which may be indicated by an optional preceding '+').

    rule

Indicates when to change from standard time to Daylight Saving Time, and when to change back. The rule has the form:

    date[/time],date[/time]

where the first date describes when the change from standard time to Daylight Saving Time occurs and the second date describes when it ends; if the second date is specified as earlier in the year than the first, then the year begins and ends in Daylight Saving Time. Each time field describes when, in current local time, the change to the other time is made.

The format of date is one of the following:

    Jn

The Julian day n (1 <= n <= 365). Leap days shall not be counted. That is, in all years-including leap years-February 28 is day 59 and March 1 is day 60. It is impossible to refer explicitly to the occasional February 29.

    n

The zero-based Julian day (0 <= n <= 365). Leap days shall be counted, and it is possible to refer to February 29.

    Mm.n.d

The d'th day (0 <= d <= 6) of week n of month m of the year (1 <= n <= 5, 1 <= m <= 12, where week 5 means "the last d day in month m" which may occur in either the fourth or the fifth week). Week 1 is the first week in which the d'th day occurs. Day zero is Sunday.

The time has the same format as offset except that the hour can range from zero to 167. If preceded by a '-', the time shall count backwards before midnight. For example, "47:30" stands for 23:30 the next day, and "-3:30" stands for 20:30 the previous day. The default, if time is not given, shall be 02:00:00.

Daylight Saving Time is in effect all year if it starts January 1 at 00:00 and ends December 31 at 24:00 plus the difference between Daylight Saving Time and standard time, leaving no room for standard time in the calendar. For example, TZ='EST5EDT,0/0,J365/25' represents a time zone that observes Daylight Saving Time all year, being 4 hours west of UTC with abbreviation "EDT".

If the dst field is specified and the rule field is not, it is implementation-defined when the changes to and from Daylight Saving Time occur.

If TZ is of the third format (that is, if the first character is not a <colon> and the value does not match the syntax for the second format), the value indicates either a geographical timezone or a special timezone from an implementation-defined timezone database. Typically these take the form

    Area/Location

as in the IANA timezone database. Examples of geographical timezones that may be supported include Africa/Cairo, America/New_York, America/Indiana/Indianapolis, Asia/Tokyo, and Europe/London. 

The data for each geographical timezone shall include: 
The offset from Coordinated Universal Time of the timezone's standard time.

If Daylight Saving Time (DST) is, or has historically been, observed: a method to discover the dates and times of transitions to and from DST and the offset from Coordinated Universal Time during periods when DST was, is, or is predicted to be, in effect.

The timezone names for standard time (std) and, if observed, for DST (dst) to be used by tzset(). These shall each contain no more than {TZNAME_MAX} bytes.
If there are any historical variations, or known future variations, of the above data for a geographical timezone, these variations shall be included in the database, except that historical variations from before the Epoch need not be included.

If the database incorporates an external database such as the one maintained by IANA, the implementation shall provide an implementation-defined method to allow the database to be updated, for example the method specified by RFC 6557.
