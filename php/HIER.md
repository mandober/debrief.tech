# PHP

PHP > PHP Manual >

* PHP Installation and Configuration
  - Installation
    - Windows
    - Unix
    - macOS
    - Cloud computing platforms
  - FastCGI Process Manager (FPM)
  - Runtime Configuration
  - PECL extensions
* PHP Function Reference
  * Database Extensions
    * Abstraction Layers
      - PDO
      - ODBC
      - DBA
      - dbx
    * Vendor Specific Database Extensions
      - Mssql (Microsoft SQL Server)
        - Introduction
        - Installing and configuring
        - Predefined Constants
        * Mssql Functions
          - `mssql_bind` Adds a parameter to a stored procedure or a remote stored procedure
          - `mssql_close` Close MS SQL Server connection
          - `mssql_connect` Open MS SQL server connection
          - `mssql_data_seek` Moves internal row pointer
          - `mssql_execute` Executes a stored procedure on a MS SQL server database
          - `mssql_fetch_array` Fetch a result row as an associative array, a numeric array,        -  or both
          - `mssql_fetch_assoc` Returns an associative array of the current row in the        - result
          - `mssql_fetch_batch` Returns the next batch of records
          - `mssql_fetch_field` Get field information
          - `mssql_fetch_object` Fetch row as object
          - `mssql_fetch_row` Get row as enumerated array
          - `mssql_field_length` Get the length of a field
          - `mssql_field_name` Get the name of a field
          - `mssql_field_seek` Seeks to the specified field offset
          - `mssql_field_type` Gets the type of a field
          - `mssql_free_result` Free result memory
          - `mssql_free_statement` Free statement memory
          - `mssql_get_last_message` Returns the last message from the server
          - `mssql_guid_string` Converts a 16 byte binary GUID to a string
          - `mssql_init Initializes` a stored procedure or a remote stored procedure
          - `mssql_min_error_severity` Sets the minimum error severity
          - `mssql_min_message_severity` Sets the minimum message severity
          - `mssql_next_result` Move the internal result pointer to the next result
          - `mssql_num_fields` Gets the number of fields in result
          - `mssql_num_rows` Gets the number of rows in result
          - `mssql_pconnect` Open persistent MS SQL connection
          - `mssql_query` Send MS SQL query
          - `mssql_result` Get result data
          - `mssql_rows_affected` Returns the number of records affected by the query
          - `mssql_select_db` Select MS SQL database
      - MySQL (MySQL Drivers and Plugins)
      - MongoDB
      - PostgreSQL
      - SQLite3
      * SQLSRV (Microsoft SQL Server Driver for PHP)
        * Introduction
          - Installation
          - Configuration
          - Requirements
          - Installation
          - Runtime Configuration
          - Resource Types
        - Predefined Constants
        * SQLSRV Functions
          - sqlsrv_begin_transaction — Begins a database transaction
          - sqlsrv_cancel — Cancels a statement
          - sqlsrv_client_info — Returns information about the client and specified connection
          - sqlsrv_close — Closes an open connection and releases resourses associated with the connection
          - sqlsrv_commit — Commits a transaction that was begun with sqlsrv_begin_transaction
          - sqlsrv_configure — Changes the driver error handling and logging configurations
          - sqlsrv_connect — Opens a connection to a Microsoft SQL Server database
          - sqlsrv_errors — Returns error and warning information about the last SQLSRV operation performed
          - sqlsrv_execute — Executes a statement prepared with sqlsrv_prepare
          - sqlsrv_fetch_array — Returns a row as an array
          - sqlsrv_fetch_object — Retrieves the next row of data in a result set as an object
          - sqlsrv_fetch — Makes the next row in a result set available for reading
          - sqlsrv_field_metadata — Retrieves metadata for the fields of a statement prepared by sqlsrv_prepare or sqlsrv_query
          - sqlsrv_free_stmt — Frees all resources for the specified statement
          - sqlsrv_get_config — Returns the value of the specified configuration setting
          - sqlsrv_get_field — Gets field data from the currently selected row
          - sqlsrv_has_rows — Indicates whether the specified statement has rows
          - sqlsrv_next_result — Makes the next result of the specified statement active
          - sqlsrv_num_fields — Retrieves the number of fields (columns) on a statement
          - sqlsrv_num_rows — Retrieves the number of rows in a result set
          - sqlsrv_prepare — Prepares a query for execution
          - sqlsrv_query — Prepares and executes a query
          - sqlsrv_rollback — Rolls back a transaction that was begun with sqlsrv_begin_transaction
          - sqlsrv_rows_affected — Returns the number of rows modified by the last INSERT, UPDATE, or DELETE query executed
          - sqlsrv_send_stream_data — Sends data from parameter streams to the server
          - sqlsrv_server_info — Returns information about the server
      - SQLite
      - Firebird/InterBase
      - DB++
      - CUBRID
      - dBase
      - filePro
      - FrontBase
      - IBM DB2 (IBM DB2, Cloudscape and Apache Derby)
      - Informix
      - Ingres (Ingres DBMS, EDBC, and Enterprise Access Gateways)
      - MaxDB
      - mSQL
      - OCI8 (Oracle OCI8)
      - Paradox (Paradox File Access)
      - Sybase
      - tokyo_tyrant
* PHP Language Reference
  - Basic syntax
  - Types
  - Variables
  - Constants
  - Expressions
  - Operators
  - Control Structures
  - Functions
  - Classes and Objects
  - Namespaces
  - Errors
  - Exceptions
  - Generators
  - References Explained
  - Predefined Variables
  - Predefined Exceptions
  - Predefined Interfaces and Classes
  - Context options and parameters
  - Supported Protocols and Wrappers
* PHP Security
  - Introduction
  - General considerations
  - Installed as CGI binary
  - Installed as an Apache module
  - Session Security
  - Filesystem Security
  - Database Security
  - Error Reporting
  - Using Register Globals
  - User Submitted Data
  - Magic Quotes
  - Hiding PHP
  - Keeping Current
* PHP Features
  - HTTP authentication with PHP
  - Cookies
  - Sessions
  - Dealing with XForms
  - Handling file uploads
  - Using remote files
  - Connection handling
  - Persistent Database Connections
  - Safe Mode
  - Command line usage
  - Garbage Collection
  - DTrace Dynamic Tracing
* PHP Function Reference
  - Affecting PHP's Behaviour
  - Audio Formats Manipulation
  - Authentication Services
  - Command Line Specific Extensions
  - Compression and Archive Extensions
  - Credit Card Processing
  - Cryptography Extensions
  - Database Extensions
  - Date and Time Related Extensions
  - File System Related Extensions
  - Human Language and Character Encoding Support
  - Image Processing and Generation
  - Mail Related Extensions
  - Mathematical Extensions
  - Non-Text MIME Output
  - Process Control Extensions
  - Other Basic Extensions
  - Other Services
  - Search Engine Extensions
  - Server Specific Extensions
  - Session Extensions
  - Text Processing
  - Variable and Type Related Extensions
  - Web Services
  - Windows Only Extensions
  - XML Manipulation
  - GUI Extensions
* PHP at the Core: A Hacker's Guide
  - Memory management
  - Working with Variables
  - Writing Functions
  - Writing Classes
  - Working with Resources
  - Working with INI settings
  - Working with streams
  - The "counter" Extension - a Continuing Example
  - The PHP 5 build system
  - Extension structure
  - PDO Driver How-To
  - Zend Engine 2 API reference
  - Zend Engine 2 Opcodes
  - Zend Engine 1
* PHP FAQ
  - PHP Installation
  - Build Problems
  - Using PHP
  - Safe Password Hashing
  - PHP and HTML
  - PHP and COM
  - Miscellaneous


* PHP Variants
  * Bitness
    - x86
    - x64
  * Thread Safety
    - TS (Thread Safe)
    - NTS (Non-Thread Safe)
  * Implementation
    - FastCGI
    - SAPI (System API)
* PHP Components
  * Servers
    - Apache HTTP Server
      - use *Thread Safe PHP* build
    - IIS
      - if using `FastCGI` use *Non-Thread Safe PHP* build
    - NGenX
  * OS
    * Linux
      * Modules
        - `.so`
    * Windows
      * Microsoft Visual C++ RunTime, `MSVC`
        * `VC11`
          - built with: Visual Studio 2012, `VS 2012`
          - requires: `Visual C++ Redistributable for VS2012 x64` (or x86)
        * `VC14`
          - built with: Visual Studio 2015, `VS 2015`
          - requires: `Visual C++ Redistributable for VS2015 x64` (or x86)
        * `VC15`
          - built with: Visual Studio 2017, `VS 2017`
          - requires: `Visual C++ Redistributable for VS2017 x64` (or x86)
      * Modules
        - `.dll`
* Resources
  - Accelerators
  - Composer
  - Libraries
  - PEAR
* Implementations
  - HHVM
  - HPHPc
  - Parrot
  - Phalanger
  - Quercus
  - Zend Engine
* PHP frameworks
    CakePHP CodeIgniter Drupal eZ Publish Fat-Free FuelPHP Horde Joomla!
    Laravel Li3 (formerly Lithium) Midgard MODx Nette Framework Phalcon 
    Pop PHP PHP-Fusion PRADO Qcodo Silex SilverStripe Symfony TYPO3 
    WordPress Xaraya XOOPS Yii Zend Framework Zeta Components
* Testing
  Behat PHPUnit PHP Unit Testing Framework Lime (Symfony)
* ORM
  Doctrine
  Propel
* Widget toolkit
  PHP-GTK
  PHP-Qt
  wxPHP
