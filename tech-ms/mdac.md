# MDAC

https://docs.microsoft.com/en-us/previous-versions/ms810823(v=msdn.10)

## The MDAC 2.5 Stack and Windows File Protection
01/17/2013

## Summary
This document provides in-depth information on the *Microsoft Data Access Components (MDAC)* 2.5 redistribution stack, as well as the effect of Windows File Protection (WFP) on its files on a computer running Windows 2000 or ME. 

This doc also provides a breakdown of the *MDAC 2.5 redistribution stack* into its individual components and then addresses each technology.

Even though a breakdown of the MDAC stack is provided, an all or nothing policy with regards to MDAC 2.5 redistribution is strongly recommended.

Contents
- Introduction
- Windows File Protection and MDAC 2.5
- The MDAC 2.5 Stack and Its Components
- ADO
- ODBC
- OLE DB
- SQL Server
- Oracle
- Microsoft Jet
- RDS
- Visual FoxPro


## Location (of files) abbreviations

```
Legend | Meaning | Example

\HELP | <Drive>:\<Windir>\help | C:\Windows\help
\SYS | <Drive>:\<Windir>\<Systemdir> | C:\Windows\System32

\OLEDB | <Drive>:\<programfiles>\<commonfiles>\System\ole db
C:\Program Files\Common Files\system\ole db

\ADO | <Drive>:\<programfiles>\<commonfiles>\System\Ado
C:\Program Files\Common Files\System\ado

\RDS | <Drive>:\<programfiles>\<commonfiles>\System\Msadc
C:\Program Files\Common Files\System\msadc

\HELP
some of the components provide their own HTML Help files in this folder.
```




## Introduction
The MDAC 2.5 stack can be broadly split into components:
* ADO (ActiveX Data Objects)
* OLE DB
* ODBC (Open Database Connectivity)
* Remote Data Services (RDS)
* Microsoft Jet
* Microsoft Visual FoxPro

These components are highly dependent on one another. For example, ADO components are nonfunctional without the ODBC core, OLE DB core, and the back-end db's OLE DB provider or ODBC driver.

## ADO
**ADO (ActiveX Data Objects)** is the flagship API for Universal Data Access (UDA). ADO 2.5 provides new objects, the `Record` object and the `Stream` object, that can retrieve data from URLs through the Microsoft OLE DB Provider for Internet Publishing (MSDAIPP). Additionally, traditional ADO objects such as the `Connection` and `Recordset` objects, as well as the new ones, can bind directly to a URL and retrieve data. ADO 2.5 also provides support for semi-structured data (also referred to as ragged or nonrectangular data).

In MDAC 2.5, ADO includes the *ADOX* and *ADO MD* subcomponents. Apart from the ADO object model, the ADO core components include the resource and rowset helper libraries, as well as the ADO 2.0 and 2.1 type libraries.

**ADO MD**, the high-level object model for exposing multidimensional data, is contained in one DLL (msadomd.dll), as is ADOX (msadox.dll). The *ActiveX Data Objects* 2.1 Type Library is a new addition MDAC 2.5.


**The MDAC 2.5 ADO Stack**:

Cmpnt | File Name    |WFP| x86 Version | Description
------|--------------|---|-------------|-----------------------
ADO   | adojavas.inc | 0 | -           | ADO JavaScript include file
ADO   | adovbs.inc   | 0 | -           | ADO VBScript include file
ADO   | msader15.dll | 1 | 2.50.4403.3 | ADO resources
ADO   | msado15.dll  | 1 | 2.50.4403.3 | ADO
ADO   | msado20.tlb  | 1 | 2.50.4403.3 | ADO 2.0 Type Library
ADO   | msado21.tlb  | 1 | 2.50.4403.3 | ADO 2.1 Type Library
ADO   | msador15.dll | 1 | 2.50.4403.3 | ADO
ADO   | msadrh15.dll | 1 | 2.50.4403.3 | ADO rowset helper
ADOMD | msadomd.dll  | 1 | 2.50.4403.3 | ADO (Multidimensional)
ADOX  | msadox.dll   | 1 | 2.50.4403.3 | ADO DDL Extensions and Security (ADOX)

Location: `\ADO`


## ODBC
ODBC is still a widely accepted API for db access

It is based on the *Call-Level Interface (CLI)* specifications from X/Open and ISO/IEC for db APIs and uses SQL as its db access language.

It provides the client a unified means, with the same source code, of accessing relational data from different db management systems.

In addition to the thunking DLLs, the ODBC components include
- the all-important *ODBC Driver Manager*, 
- the Windows 2000 Component Services
- (or MTS, if you are using Microsoft Windows NT) connection pooling manager
- the driver manager trace DLL, and
- the ODBC cursor library.
- the ODBC resources file,
- the installer DLL, and 
- the Driver Configuration program files.

The *ODBC Administrator* still forms an integral part of the ODBC core, and another file of note is the *ODBC HTML Help* file located in `\WIN` folder.

https://msdn.microsoft.com/library/dn170412(v=vs.85).aspx


The MDAC 2.5 ODBC Stack:
https://docs.microsoft.com/en-us/previous-versions/ms810823(v=msdn.10)


## OLE DB

https://docs.microsoft.com/en-us/previous-versions/windows/desktop/ms709836(v=vs.85)

OLE DB offers a set of COM interfaces that you can use to access both relational and nonrelational data. OLE DB 2.5 introduced a new set of interfaces designed to incorporate the semi-structured data model. This effectively added support for hierarchical data stores, nonrectangular result sets, and for binding directly to objects through URLs. Some examples of hierarchical stores are file stores and message stores, and examples of nonrectangular data include simple or complex documents, e-mails, and so forth. Support for this kind of access is provided through the OLE DB row and stream objects, direct binding, and scoped operation capability.

Except for the new interfaces, the objects that form the OLE DB core are generally the same. A prominent new addition, however, is the root binder object, which provides a mechanism to directly bind to URLs and retrieve nonrectangular data. Other new features include OLE DB 2.5 runtime routines and OLE DB JavaScript and VBScript include files.

The MDAC 2.5 OLE DB Stack:
https://docs.microsoft.com/en-us/previous-versions/ms810823(v=msdn.10)


## SQL Server
The list of SQL Server subcomponents has no changes from the MDAC 2.1 version. These subcomponents are associated with the SQL Server ODBC Driver and OLE DB Provider for SQL Server. Again, the breakdown here is based on products rather than dependencies. Therefore, the network libraries are listed under SQL Server OLE DB even though the SQL Server ODBC Driver is dependent on them. Other important subcomponents include the code page translators, the client-configuration utility, SQL enterprise components, and the SQL Server Catalog update.

The MDAC 2.5 SQL Server ODBC and OLE DB Stack:
https://docs.microsoft.com/en-us/previous-versions/ms810823(v=msdn.10)



## Oracle
In MDAC 2.5, the Oracle components, including the Oracle Call Interface (OCI) DLL and the code page translator, are unchanged for the Oracle ODBC Driver and the OLE DB Provider for Oracle.

The MDAC 2.5 Oracle ODBC and OLE DB Stack
https://docs.microsoft.com/en-us/previous-versions/ms810823(v=msdn.10)


## Microsoft Jet
Microsoft Jet has 28 subcomponents in the MDAC 2.5 stack. Generally, the list is unchanged except for the HTML Help file. The Jet components include the Jet Engine with its numerous ISAMs, the Reconciler library, the Replication library, the Sort library, Expression Service binaries, the Jet ODBC Driver, the OLE DB Provider for Microsoft Jet, and the Microsoft Jet and Replication (JRO) objects.

The MDAC 2.5 Microsoft Jet Stack
https://docs.microsoft.com/en-us/previous-versions/ms810823(v=msdn.10)

## RDS
In MDAC 2.5, the list of RDS subcomponents is unchanged from MDAC 2.1. The stack includes the following components and associated resources: the RDSServer.DataFactory object and its handler, the RDS.DataControl object, the RDS ISAPI library, the Data Shaping Service for OLE DB, the OLE DB Persistence Provider, the OLE DB Remoting Provider, and the OLE DB Cursor Service for OLE DB.

The MDAC 2.5 RDS Stack:
https://docs.microsoft.com/en-us/previous-versions/ms810823(v=msdn.10)


## Visual FoxPro
The Visual FoxPro components include the Visual FoxPro ODBC driver and its corresponding help file.

The MDAC 2.5 Visual FoxPro Stack:
https://docs.microsoft.com/en-us/previous-versions/ms810823(v=msdn.10)
