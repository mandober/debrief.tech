# Microsoft SQL Server Express

**Microsoft SQL Server Express** is a version of Microsoft's SQL Server relational database management system that is free to download, distribute and use. It comprises a database specifically targeted for embedded and smaller-scale applications. The product traces its roots to the Microsoft Database Engine (MSDE) product, which was shipped with SQL Server 2000. The "Express" branding has been used since the release of SQL Server 2005.

SQL Server Express provides many of the features of the paid, full versions of Microsoft SQL Server database management system.[3] However it has technical restrictions that make it unsuitable for some large-scale deployments. Differences in the Express product include:

Maximum database size of 10 GB per database in SQL Server 2016, SQL Server 2014, SQL Server 2012, and 2008 R2 Express[4] (4 GB for SQL Server 2008 Express and earlier; compared to 2 GB in the former MSDE). The limit applies per database (log files excluded); but in some scenarios users can access more data through the use of multiple interconnected databases.
No SQL Server Agent service[5][6]
Artificial hardware usage limits:
Single physical CPU, but multiple cores allowable[7]
1 GB of RAM (runs on a system with higher RAM amount, but uses only at most 1 GB per instance of SQL Server Database Engine. "Recommended: Express Editions: 1 GB All other editions: At least 4 GB and should be increased as database size increases to ensure optimal performance."[8]).[9] Express with Advanced Services has a limit of 4 GB per instance of Reporting Services (not available on other Express variants). Analysis Services is not available for any Express variant.
Unlike the predecessor product, MSDE, the Express product does not include a concurrent workload-governor to "limit performance if the database engine receives more work than is typical of a small number of users."[10]

SQL Server Express includes several GUI tools for database management. These include:

SQL Server Management Studio - since 2012 SP1;[11] before that, only a stripped-down version called SQL Server Management Studio Express is provided
SQL Server Configuration Manager
SQL Server Surface Area Configuration tool
SQL Server Business Intelligence Development Studio
The predecessor product MSDE generally lacked basic GUI management tools,[12]

Features available in SQL Server "Standard" and better editions but absent from SQL Server Express include:

Analysis Services
Integration Services
Notification Services
