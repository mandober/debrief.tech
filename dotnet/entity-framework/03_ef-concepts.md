# Entity Framework Concepts

EF supports:
* **Reverse engineering** (or *database first*) of existing databases: an object model is created from an existing database schema 
* **Forward engineering** of databases: a database schema is generated from an object model

Forward engineering can be used at development time (schema migrations) or at runtime. A *schema migration* is the creation of the database with an initial schema or a later extension/modification of the schema.

*ADO.NET Entity Framework*, the predecessor of EFCore, supported 4 process models:
* Reverse engineering with EDMX files (*Database First*)
* Reverse engineering with *Code First*
* Forward engineering with EDMX files (*Model First*)
* Forward engineering with *Code First*

Entity classes (aka domain object classes, business object classes, data classes or persistent classes) are representations of tables and views. They contain properties or fields that are mapped to columns of the tables/views. Entity classes can be plain old CLR objects (POCO classes); in other words, they need no base class and no interface. However, you cannot access the database with only these objects.

NOTE: Although the use of fields is possible, you should work only with properties because a lot of other libraries and frameworks require properties.


A **context class** is a class always derived from the `DbContext` base class. It has properties of type `DbSet<EntityClass>` for each of the entity classes. The context class or `DbSet` properties take the commands of the self-created program code in the form of LINQ commands, SQL commands, stored procedure and *table-valued function* (TVF) calls, or special API calls for append, modify, and delete.

The context class sends the commands to the DBMS-specific provider, which sends the commands to the database via `DbCommand` objects and receives result sets in a `DataReader` from the database. The context class transforms the contents of the `DataReader` object into instances of the entity class. This process is called **materialization**.
