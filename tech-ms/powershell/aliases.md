# Aliases

- use alias instead of the command name in any PowerShell commands
- list built-in aliases: `Get-Alias`
- create an alias: `New-Alias -Name gas -Value Get-AuthenticodeSignature`

## ALIAS CMDLETS

cmdlets to work with aliases:
- `Get-Alias`     Gets all aliases in the current session
- `New-Alias`     Creates a new alias
- `Set-Alias`     Creates or changes an alias
- `Export-Alias`  Exports one or more aliases to a file
- `Import-Alias`  Imports an alias file into PowerShell


CREATING AN ALIAS

To create a new alias, use the New-Alias cmdlet. For example, to create the
"gh" alias for Get-Help, type:

    New-Alias -Name gh -Value Get-Help

You can use the alias in commands, just as you would use the full cmdlet
name, and you can use the alias with parameters.

For example, to get detailed Help for the Get-WmiObject cmdlet, type:

    Get-Help Get-WmiObject -Detailed

Or, type:

    gh Get-WmiObject -Detailed


SAVING ALIASES

The aliases that you create are saved only in the current session. To use
the aliases in a different session, add the alias to your PowerShell
profile. Or, use the Export-Alias cmdlet to save the aliases to a file.

For more information, type:

    Get-Help about_Profiles


GETTING ALIASES

To get all the aliases in the current session, including the built-in
aliases, the aliases in your PowerShell profiles, and the aliases that you
have created in the current session, type:

    Get-Alias

To get particular aliases, use the Name parameter of the Get-Alias cmdlet.
For example, to get aliases that begin with "p", type:

    Get-Alias -Name p*

To get the aliases for a particular item, use the Definition parameter. For
example, to get the aliases for the Get-ChildItem cmdlet type:

    Get-Alias -Definition Get-ChildItem

GET-ALIAS OUTPUT

Get-Alias returns only one type of object, an AliasInfo object
(System.Management.Automation.AliasInfo). The name of aliases that don't
include a hyphen, such as "cd" are displayed in the following format:

    PS C:\> Get-Alias ac

    CommandType     Name                    Version    Source
    -----------     ----                    -------    ------
    Alias           ac -> Add-Content

This makes it very quick and easy to get the information that you need.

The arrow-based alias name format is not used for aliases that include a
hyphen. These are likely to be preferred substitute names for cmdlets and
functions, instead of typical abbreviations or nicknames, and the author
might not want them to be as evident.


ALTERNATE NAMES FOR COMMANDS WITH PARAMETERS

You can assign an alias to a cmdlet, script, function, or executable file.
You cannot assign an alias to a command and its parameters. For example,
you can assign an alias to the Get-Eventlog cmdlet, but you cannot assign
an alias to the Get-Eventlog -LogName System command.

You can create a function that includes the command. To create a function,
type the word "function" followed by a name for the function. Type the
command, and enclose it in braces ({}).

For example, the following command creates the syslog function. This
function represents the Get-Eventlog -LogName System command:

    function Get-SystemEventlog {Get-Eventlog -LogName System}
    Set-Alias -Name syslog -Value Get-SystemEventlog

You can now type "syslog" instead of the command. And, you can create
aliases for the new function.

For more information about functions, type:

    Get-Help about_Functions


ALIAS OBJECTS

PowerShell aliases are represented by objects that are instances of the
System.Management.Automation.AliasInfo class. For more information about
this type of object, see AliasInfo Class in the Microsoft Developer Network
(MSDN) library.

To view the properties and methods of the alias objects, get the aliases.
Then, pipe them to the Get-Member cmdlet. For example:

    Get-Alias | Get-Member

To view the values of the properties of a specific alias, such as the dir
alias, get the alias. Then, pipe it to the Format-List cmdlet. For example,
the following command gets the "dir" alias. Next, the command pipes the
alias to the Format-List cmdlet. Then, the command uses the Property
parameter of Format-List with a wildcard character (*) to display all the
properties of the dir alias. The following command performs these tasks:

    Get-Alias -Name dir | Format-List -Property *


PowerShell ALIAS PROVIDER

PowerShell includes the Alias provider. The Alias provider lets you view
the aliases in PowerShell as though they were on a file system drive.

The Alias provider exposes the Alias: drive. To go into the Alias: drive,
type:

    Set-Location Alias:

To view the contents of the drive, type:

    Get-ChildItem

To view the contents of the drive from another PowerShell drive, begin the
path with the drive name. Include the colon (:). For example:

    Get-ChildItem -Path Alias:

To get information about a particular alias, type the drive name and the
alias name. Or, type a name pattern. For example, to get all the aliases
that begin with "p", type:

    Get-ChildItem -Path Alias:p*

For more information about the PowerShell Alias provider, type:

    Get-Help Alias


SEE ALSO

-   New-Alias
-   Get-Alias
-   Set-Alias
-   Export-Alias
-   Import-Alias
-   Get-PSProvider
-   Get-PSDrive
-   about_functions
-   about_profiles
-   about_providers
