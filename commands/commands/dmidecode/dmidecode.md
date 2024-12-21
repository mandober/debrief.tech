# dmidecode

- Linux utility
- https://www.nongnu.org/dmidecode/

Dmidecode reports information about your system's hardware as described in your system BIOS according to the SMBIOS/DMI standard (see a sample output). This information typically includes system manufacturer, model name, serial number, BIOS version, asset tag as well as a lot of other details of varying level of interest and reliability depending on the manufacturer. This will often include usage status for the CPU sockets, expansion slots (e.g. AGP, PCI, ISA) and memory module slots, and the list of I/O ports (e.g. serial, parallel, USB).

DMI data can be used to enable or disable specific portions of kernel code depending on the specific hardware. Thus, one use of dmidecode is for kernel developers to detect system "signatures" and add them to the kernel source code when needed.

Beware that DMI data have proven to be too unreliable to be blindly trusted.
>Dmidecode does not scan the hardware, it only reports what the BIOS found.

Dmidecode was first written by Alan Cox, then was further developed and is currently maintained again by Jean Delvare, after a 5-year interim by Anton Arapov. It is released under the General Public License (GPL). For more details, you should have a look at the AUTHORS and LICENSE files that come with the source code.

Three additional tools come with dmidecode:
- `biosdecode` prints all BIOS related information it can find
- `ownership` retrieves the "ownership tag" that can be set on Compaq computers
- `vpddecode` prints the "vital product data" information that can be found in almost all IBM computers

## Sample outputs

### vpddecode

```
# vpddecode 2.9
BIOS Build ID: INET35WW 
Box Serial Number: 5238NXU
Motherboard Serial Number: J1Y3581338D
Machine Type/Model: 26454A0
```

### biosdecode

```
# biosdecode 2.7
PCI Interrupt Routing 1.0 present.
	Router ID: 00:04.0
	Exclusive IRQs: None
	Compatible Router: 1106:0686
	Slot Entry 1: ID 00:0c, slot number 1
	Slot Entry 2: ID 00:0b, slot number 2
	Slot Entry 3: ID 00:0a, slot number 3
	Slot Entry 4: ID 00:09, slot number 4
	Slot Entry 5: ID 00:0d, slot number 5
	Slot Entry 6: ID 00:04, on-board
	Slot Entry 7: ID 00:01, on-board
	Slot Entry 8: ID 00:11, on-board
	Slot Entry 9: ID 00:12, on-board
SMBIOS 2.3 present.
	Structure Table Length: 1383 bytes
	Structure Table Address: 0x000F2940
	Number Of Structures: 49
	Maximum Structure Size: 93 bytes
ACPI 1.0 present.
	OEM Identifier: ASUS  
	RSD Table 32-bit Address: 0x1FFEC000
BIOS32 Service Directory present.
	Revision: 0
	Calling Interface Address: 0x000F0F80
PNP BIOS 1.0 present.
	Event Notification: Not Supported
	Real Mode 16-bit Code Address: F000:C540
	Real Mode 16-bit Data Address: F000:0000
	16-bit Protected Mode Code Address: 0x000FC520
	16-bit Protected Mode Data Address: 0x000F0000
	OEM Device Identifier: PNP0C00
```

### dmidecode

```
# dmidecode 2.8
SMBIOS 2.3 present.
49 structures occupying 1383 bytes.
Table at 0x000F2940.

Handle 0x0000, DMI type 0, 20 bytes
BIOS Information
  Vendor: Award Software, Inc.
  Version: ASUS A7V133-C ACPI BIOS Revision 1009
  Release Date: 04/23/2002
  Address: 0xF0000
  Runtime Size: 64 kB
  ROM Size: 256 kB
  Characteristics:
    PCI is supported
    PNP is supported
    APM is supported
    BIOS is upgradeable
    BIOS shadowing is allowed
    ESCD support is available
    Boot from CD is supported
    Selectable boot is supported
    BIOS ROM is socketed
    EDD is supported
    5.25"/360 KB floppy services are supported (int 13h)
    5.25"/1.2 MB floppy services are supported (int 13h)
    3.5"/720 KB floppy services are supported (int 13h)
    3.5"/2.88 MB floppy services are supported (int 13h)
    Print screen service is supported (int 5h)
    8042 keyboard services are supported (int 9h)
    Serial services are supported (int 14h)
    Printer services are supported (int 17h)
    CGA/mono video services are supported (int 10h)
    ACPI is supported
    USB legacy is supported
    AGP is supported

Handle 0x0001, DMI type 1, 25 bytes
System Information
  Manufacturer: System Manufacturer
  Product Name: System Name
  Version: System Version
  Serial Number: SYS-1234567890
  UUID: Not Settable
  Wake-up Type: Power Switch

Handle 0x0002, DMI type 2, 8 bytes
Base Board Information
  Manufacturer: ASUSTeK Computer INC.
  Product Name: A7V133-C
  Version: REV 1.xx
  Serial Number: xxxxxxxxxxx

Handle 0x0003, DMI type 3, 17 bytes
Chassis Information
  Manufacturer: Chassis Manufacture
  Type: Tower
  Lock: Not Present
  Version: Chassis Version
  Serial Number: Chassis Serial Number
  Asset Tag: Asset-1234567890
  Boot-up State: Safe
  Power Supply State: Safe
  Thermal State: Safe
  Security Status: Unknown
  OEM Information: 0x00000000

Handle 0x0004, DMI type 4, 32 bytes
Processor Information
  Socket Designation: SOCKET A
  Type: Central Processor
  Family: Other
  Manufacturer: AuthenticAMD
  ID: 42 06 00 00 FF F9 83 01
  Signature: Family 6, Model 4, Stepping 2
  Flags:
    FPU (Floating-point unit on-chip)
    VME (Virtual mode extension)
    DE (Debugging extension)
    PSE (Page size extension)
    TSC (Time stamp counter)
    MSR (Model specific registers)
    PAE (Physical address extension)
    MCE (Machine check exception)
    CX8 (CMPXCHG8 instruction supported)
    SEP (Fast system call)
    MTRR (Memory type range registers)
    PGE (Page global enable)
    MCA (Machine check architecture)
    CMOV (Conditional move instruction supported)
    PAT (Page attribute table)
    PSE-36 (36-bit page size extension)
    MMX (MMX technology supported)
    FXSR (Fast floating-point save and restore)
  Version: AMD Athlon(TM) Processor
  Voltage: 1.7 V
  External Clock: 133 MHz
  Max Speed: 1800 MHz
  Current Speed: 1200 MHz
  Status: Populated, Enabled
  Upgrade: Other
  L1 Cache Handle: 0x0009
  L2 Cache Handle: 0x000A
  L3 Cache Handle: Not Provided

Handle 0x0005, DMI type 5, 22 bytes
Memory Controller Information
  Error Detecting Method: 64-bit ECC
  Error Correcting Capabilities:
    None
  Supported Interleave: One-way Interleave
  Current Interleave: One-way Interleave
  Maximum Memory Module Size: 1024 MB
  Maximum Total Memory Size: 3072 MB
  Supported Speeds:
    Other
  Supported Memory Types:
    Other
    DIMM
    SDRAM
  Memory Module Voltage: 3.3 V
  Associated Memory Slots: 3
    0x0006
    0x0007
    0x0008
  Enabled Error Correcting Capabilities:
    Unknown

Handle 0x0006, DMI type 6, 12 bytes
Memory Module Information
  Socket Designation: DIMM 1
  Bank Connections: 0 1
  Current Speed: Unknown
  Type: Other DIMM SDRAM
  Installed Size: 256 MB (Double-bank Connection)
  Enabled Size: 256 MB (Double-bank Connection)
  Error Status: OK

Handle 0x0007, DMI type 6, 12 bytes
Memory Module Information
  Socket Designation: DIMM 2
  Bank Connections: 2 3
  Current Speed: Unknown
  Type: Other DIMM SDRAM
  Installed Size: 256 MB (Double-bank Connection)
  Enabled Size: 256 MB (Double-bank Connection)
  Error Status: OK

Handle 0x0008, DMI type 6, 12 bytes
Memory Module Information
  Socket Designation: DIMM 3
  Bank Connections: 4 5
  Current Speed: Unknown
  Type: Other DIMM SDRAM
  Installed Size: Not Installed
  Enabled Size: Not Installed
  Error Status: OK

Handle 0x0009, DMI type 7, 19 bytes
Cache Information
  Socket Designation: L1 Cache
  Configuration: Enabled, Not Socketed, Level 1
  Operational Mode: Write Back
  Location: Internal
  Installed Size: 128 KB
  Maximum Size: 128 KB
  Supported SRAM Types:
    Synchronous
  Installed SRAM Type: Synchronous
  Speed: Unknown
  Error Correction Type: Unknown
  System Type: Data
  Associativity: 4-way Set-associative

Handle 0x000A, DMI type 7, 19 bytes
Cache Information
  Socket Designation: L2 Cache
  Configuration: Enabled, Not Socketed, Level 2
  Operational Mode: Write Back
  Location: Internal
  Installed Size: 256 KB
  Maximum Size: 8192 KB
  Supported SRAM Types:
    Pipeline Burst
    Synchronous
  Installed SRAM Type: Pipeline Burst Synchronous
  Speed: Unknown
  Error Correction Type: Unknown
  System Type: Data
  Associativity: 4-way Set-associative

Handle 0x000B, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: PRIMARY IDE/HDD
  Internal Connector Type: On Board IDE
  External Reference Designator: Not Specified
  External Connector Type: None
  Port Type: None

Handle 0x000C, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: SECONDARY IDE/HDD
  Internal Connector Type: On Board IDE
  External Reference Designator: Not Specified
  External Connector Type: None
  Port Type: None

Handle 0x000D, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: FLOPPY
  Internal Connector Type: On Board Floppy
  External Reference Designator: Not Specified
  External Connector Type: None
  Port Type: None

Handle 0x000E, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: USB1
  External Connector Type: Access Bus (USB)
  Port Type: USB

Handle 0x000F, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: USB2
  External Connector Type: Access Bus (USB)
  Port Type: USB

Handle 0x0010, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: USB3
  External Connector Type: Access Bus (USB)
  Port Type: USB

Handle 0x0011, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: USB4
  External Connector Type: Access Bus (USB)
  Port Type: USB

Handle 0x0012, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: PS/2 Keybaord
  External Connector Type: PS/2
  Port Type: Keyboard Port

Handle 0x0013, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: PS/2 Mouse
  External Connector Type: PS/2
  Port Type: Mouse Port

Handle 0x0014, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: Parallel Port
  External Connector Type: DB-25 female
  Port Type: Parallel Port ECP/EPP

Handle 0x0015, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: Serial Port 1
  External Connector Type: DB-9 male
  Port Type: Serial Port 16550 Compatible

Handle 0x0016, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: Serial Port 2
  External Connector Type: DB-9 male
  Port Type: Serial Port 16550 Compatible

Handle 0x0017, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: Joystick Port
  External Connector Type: DB-15 female
  Port Type: Joystick Port

Handle 0x0018, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: MIDI Port
  External Connector Type: DB-15 female
  Port Type: MIDI Port

Handle 0x0019, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: Line In Jack
  External Connector Type: Mini Jack (headphones)
  Port Type: Audio Port

Handle 0x001A, DMI type 8, 9 bytes
Port Connector Information
  Internal Reference Designator: Not Specified
  Internal Connector Type: None
  External Reference Designator: Video Port
  External Connector Type: Mini Jack (headphones)
  Port Type: Video Port

Handle 0x001B, DMI type 9, 13 bytes
System Slot Information
  Designation: PCI 1
  Type: 32-bit PCI
  Current Usage: Available
  Length: Short
  ID: 0
  Characteristics:
    5.0 V is provided
    3.3 V is provided
    PME signal is supported

Handle 0x001C, DMI type 9, 13 bytes
System Slot Information
  Designation: PCI 2
  Type: 32-bit PCI
  Current Usage: In Use
  Length: Short
  ID: 0
  Characteristics:
    5.0 V is provided
    3.3 V is provided
    PME signal is supported

Handle 0x001D, DMI type 9, 13 bytes
System Slot Information
  Designation: PCI 3
  Type: 32-bit PCI
  Current Usage: In Use
  Length: Short
  ID: 0
  Characteristics:
    5.0 V is provided
    3.3 V is provided
    PME signal is supported

Handle 0x001E, DMI type 9, 13 bytes
System Slot Information
  Designation: PCI 4
  Type: 32-bit PCI
  Current Usage: Available
  Length: Short
  ID: 0
  Characteristics:
    5.0 V is provided
    3.3 V is provided
    PME signal is supported

Handle 0x001F, DMI type 9, 13 bytes
System Slot Information
  Designation: PCI 5
  Type: 32-bit PCI
  Current Usage: In Use
  Length: Short
  ID: 0
  Characteristics:
    5.0 V is provided
    3.3 V is provided
    PME signal is supported

Handle 0x0020, DMI type 9, 13 bytes
System Slot Information
  Designation: AGP
  Type: 32-bit AGP 4x
  Current Usage: In Use
  Length: Long
  ID: 0
  Characteristics:
    5.0 V is provided
    3.3 V is provided

Handle 0x0021, DMI type 9, 13 bytes
System Slot Information
  Designation: AMR
  Type: 32-bit I/O Riser Card
  Current Usage: In Use
  Length: Long
  Characteristics:
    5.0 V is provided
    3.3 V is provided

Handle 0x0022, DMI type 10, 6 bytes
On Board Device Information
  Type: Other
  Status: Disabled
  Description: Promise PDC20265

Handle 0x0023, DMI type 11, 5 bytes
OEM Strings
  String 1: 0
  String 2: 0

Handle 0x0024, DMI type 13, 22 bytes
BIOS Language Information
  Installable Languages: 1
    en|US|iso8859-1
  Currently Installed Language: en|US|iso8859-1

Handle 0x0025, DMI type 14, 14 bytes
Group Associations
  Name: Cpu Module
  Items: 3
    0x0004 (Processor)
    0x0009 (Cache)
    0x000A (Cache)

Handle 0x0026, DMI type 14, 29 bytes
Group Associations
  Name: Memory Module Set
  Items: 8
    0x0027 (Physical Memory Array)
    0x0028 (Memory Device)
    0x002C (Memory Device Mapped Address)
    0x0029 (Memory Device)
    0x002D (Memory Device Mapped Address)
    0x002A (Memory Device)
    0x002E (Memory Device Mapped Address)
    0x002B (Memory Array Mapped Address)

Handle 0x0027, DMI type 16, 15 bytes
Physical Memory Array
  Location: System Board Or Motherboard
  Use: System Memory
  Error Correction Type: None
  Maximum Capacity: 1536 MB
  Error Information Handle: Not Provided
  Number Of Devices: 3

Handle 0x0028, DMI type 17, 23 bytes
Memory Device
  Array Handle: 0x0027
  Error Information Handle: No Error
  Total Width: 72 bits
  Data Width: 64 bits
  Size: 256 MB
  Form Factor: DIMM
  Set: 1
  Locator: DIMM 1
  Bank Locator: Not Specified
  Type: DRAM
  Type Detail: Synchronous
  Speed: Unknown

Handle 0x0029, DMI type 17, 23 bytes
Memory Device
  Array Handle: 0x0027
  Error Information Handle: No Error
  Total Width: 72 bits
  Data Width: 64 bits
  Size: 256 MB
  Form Factor: DIMM
  Set: 2
  Locator: DIMM 2
  Bank Locator: Not Specified
  Type: DRAM
  Type Detail: Synchronous
  Speed: Unknown

Handle 0x002A, DMI type 17, 23 bytes
Memory Device
  Array Handle: 0x0027
  Error Information Handle: No Error
  Total Width: Unknown
  Data Width: Unknown
  Size: No Module Installed
  Form Factor: DIMM
  Set: 3
  Locator: DIMM 3
  Bank Locator: Not Specified
  Type: DRAM
  Type Detail: Synchronous
  Speed: Unknown

Handle 0x002B, DMI type 19, 15 bytes
Memory Array Mapped Address
  Starting Address: 0x00000000000
  Ending Address: 0x080000003FF
  Range Size: 536870913 kB
  Physical Array Handle: 0x0027
  Partition Width: 0

Handle 0x002C, DMI type 20, 19 bytes
Memory Device Mapped Address
  Starting Address: 0x00000000000
  Ending Address: 0x0000FFFFFFF
  Range Size: 256 MB
  Physical Device Handle: 0x0028
  Memory Array Mapped Address Handle: 0x002B
  Partition Row Position: 1

Handle 0x002D, DMI type 20, 19 bytes
Memory Device Mapped Address
  Starting Address: 0x00010000000
  Ending Address: 0x0001FFFFFFF
  Range Size: 256 MB
  Physical Device Handle: 0x0029
  Memory Array Mapped Address Handle: 0x002B
  Partition Row Position: 2

Handle 0x002E, DMI type 126, 19 bytes
Inactive

Handle 0x002F, DMI type 32, 11 bytes
System Boot Information
  Status: No errors detected

Handle 0x0030, DMI type 127, 4 bytes
End Of Table
```

## Refs

SMBIOS specification
http://www.dmtf.org/standards/smbios

DMI specification
http://www.dmtf.org/standards/dmi

Intel CPUID specification
https://www.intel.com/content/www/us/en/support/articles/000006831/processors/processor-utilities-and-programs.html
