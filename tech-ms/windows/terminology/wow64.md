# WoW64  (Windows 32-bit on Windows 64-bit)

https://en.wikipedia.org/wiki/WoW64

WoW64 i.e. *Windows 32-bit on Windows 64-bit*, is the subsystem for managing the execution of 32-bit applications on a 64-bit Windows OS.

A 32-bit app is to be executed on a 32-bit OS, and this bit-ness of an OS determines some very important ascpects of computing; primarily, it dictates a system's *word size* and that fixes the size of pointers and the basic integer type (like an `int` in C) to 4 bytes (32 bits), which is the same as the size of the CPU's general purpose registers. On the other hand, the word-size is 8 bytes on a 64-bit OS.

WoW64 has to manage the differences between 32-bit and 64-bit computing in order to enable a legacy app, written for 32-bit Windows, to successfully run on a 64-bit Windows OS.


## Translation libraries
The WoW64 subsystem comprises a lightweight compatibility layer that has similar interfaces on all 64-bit versions of Windows. This layer creates a 32-bit environment, providing the interfaces required to run a legacy app.

WOW64 is implemented using several DLLs including:
- `Wow64.dll` is the core interface to the Windows NT kernel that translates between 32-bit and 64-bit calls, manipulates pointers and the call stack.
- `Wow64win.dll` provides the appropriate entry-points for 32-bit apps.
- `Wow64cpu.dll` switches the CPU from 32-bit to 64-bit mode (only on x86_64).


## Windows Registry
The WoW64 subsystem is also involved in managing the interaction of 32-bit apps with the Windows' registry, which maintains a set of different keys for 64-bit and 32-bit apps.

On a Windows x64, a 64-bit app is normally consulting the registry at `HKEY_LOCAL_MACHINE\Software`, but a 32-bit app is redirected to the `HKEY_LOCAL_MACHINE\Software\Wow6432Node` brach of registry.

Some keys are mapped from 64-bit to their 32-bit equivalents, while others have their contents mirrored, depending on the edition of Windows.

## Files

* 64-bit apps -> *system32*
* 32-bit apps -> *syswow64*

A 64-bit Windows OS, traditionally uses, suddenly inappropriately named,  `%SystemRoot%\system32` directory for its 64-bit libraries (DLL) and executables (EXE) files.

The number had to stay the same due to compatibility, as many legacy apps rely on that exact naming. To further complicate things, the directory with the number 64 in its name is used solely when dealing with 32-bit apps. Namely, when executing a 32-bit app, the WoW64 subsystem redirects 32-bit DLLs to `%SystemRoot%\SysWoW64`, which contains 32-bit libraries and executables.

Some directories are accessed directly (redirection exceptions):
- %SystemRoot%\system32\ `catroot`
- %SystemRoot%\system32\ `catroot2`
- %SystemRoot%\system32\ `driverstore`
- %SystemRoot%\system32\ `drivers\etc`
- %SystemRoot%\system32\ `logfiles`
- %SystemRoot%\system32\ `spool`
- %SystemRoot%\system32\ `driverstore`

(the last one is only for Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP)

A 32-bit app is generally unaware it is running on a x64 OS. It can access `%SystemRoot%\System32` through the pseudo directory `%SystemRoot%\sysnative`.

There are two Program Files directories each visible to both 32-bit and 64-bit applications. The directory that stores the 32 bit files is called Program Files (x86) to differentiate between the two, while the 64 bit maintains the traditional Program Files name without any additional qualifier.






