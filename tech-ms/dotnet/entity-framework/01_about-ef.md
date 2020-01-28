# Entity Framework

**Entity Framework** (EF) is an object-relational mapper (O/RM) for .NET, realized as Entity Framework 6 (classic version) and Entity Framework Core.

- EF Core is a .NET Standard 2.0 library
- EF Core requires .NET Standard 2.0 support
- EF is built on top of ADO.NET, the low-level data access library
- the latest stable version for `.NET Framework 4.7` is EF 6

- EF Core is a completely new implementation of the ADO.NET EF
- EF Core versions:
  - version 1.0 was released on June 27, 2016, along with:
    - .NET Core version 1.0 
    - ASP.NET Core version 1.0
  - version 2.0 was released on August 14, 2017.
  - version 2.1 is in progress.


The name comes from a database concept called the entity-relationship model, where an entity is the abstract concept of a data object, which is related to other entities.

EF maps the C# objects to the entities in a RDB. This is called *object-relational mapping* and it maps classes, objects and properties to the tables, rows and columns.


**Entity Framework 6** (EF6) is a tried and tested data access technology. It was first released in 2008, as part of `.NET Framework 3.5 SP1` and `Visual Studio 2008 SP1`. Starting with the `4.1` release it has shipped as the `EntityFramework` NuGet package. EF6 runs on the `.NET Framework 4.x`,` which means it runs only on Windows.

**Entity Framework Core** (EF Core) is a complete rewrite of EF6 that was first released in 2016. It ships as Nuget packages, the main one being `Microsoft.EntityFrameworkCore`. EF Core is a cross-platform product that can run on `.NET Core` or `.NET Framework`. EF Core was designed to provide a developer experience similar to EF6. Most of the top-level APIs remain the same, so EF Core will feel familiar to developers who have used EF6.

**Code First** with Visual Studio 2017 is an approach to manipulate db where objects are created in C# and stored in a db, then queried via LINQ (without having to use another language such as SQL).

**Microsoft SQL Server Express** is the free, lightweight, version of Microsoft SQL Server that supports the same SQL syntax, T-SQL. Its *LocalDB* option enables Visual Studio 2017 to create and open a database directly, without needing to connect to a separate server.
https://www.microsoft.com/en-us/sql-server/sql-server-editions-express


---

EF Core 2.1 reference
https://docs.microsoft.com/en-us/dotnet/api/?view=efcore-2.1

SQL Server Express
https://www.microsoft.com/en-us/sql-server/sql-server-editions-express

Entity Framework get started
https://www.microsoft.com/en-us/sql-server/developer-get-started/csharp/win/step/2.html
