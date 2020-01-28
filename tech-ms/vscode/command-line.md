# Command line use

`code --help`

code 1.41.1

## Usage: code [options][paths...]

## Options

-d --diff <file1> <file2>         Compare files
-a --add <folder>                 Add folders to the last active window
-g --goto <file:line[:character]> Open file at the path on specified position
-n --new-window                   Force to open a new window
-r --reuse-window                 Force open a file in an already opened window
-w --wait                         Wait for files to be closed before returning
   --locale <locale>              The locale to use (e.g. en-US)
   --folder-uri <uri>             Opens a window with given folder URI
   --file-uri <uri>               Opens a window with given file URI
   --telemetry                    Shows all telemetry events VS code collects
-v --version                      Print version
-h --help                         Print usage


## Extensions Management

--category                        Filters installed ext by provided category, 
                                  when using --list-extension.
                                  
--enable-proposed-api <ext-id>    Enables proposed API features for extensions. 
                                  Can receive extension IDs to enable individually.
                                  
## Troubleshooting

--verbose                          Print verbose output (implies --wait).
--log <level>                      critical, error, warn, info (default), debug, trace, off
--status                           Print process usage and diagnostics info.
--prof-startup                     Run CPU profiler during startup
--disable-extensions               Disable all installed extensions.
--disable-extension <extension-id> Disable an extension.
--inspect-extensions <port>        Allow debugging and profiling of extensions. 
                                   Check the developer tools for the connection URI.
--inspect-brk-extensions <port>    Allow debugging and profiling of extensions 
                                   with the extension host being paused after start. 
                                   Check the developer tools for the connection URI.
--disable-gpu                      Disable GPU hardware acceleration.
--max-memory                       Max memory size for a window (in Mbytes).

