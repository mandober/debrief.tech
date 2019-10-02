# Microsoft Sync Framework

Microsoft Sync Framework is a data synchronization platform used to synchronize data across multiple data stores.

Sync Framework includes a transport-agnostic architecture, into which data store-specific synchronization providers, modelled on the ADO.NET data provider API, can be plugged in.

Sync Framework can be used for offline access to data, by working against a cached set of data and submitting the changes to a master database in a batch, as well as to synchronize changes to a data source across all consumers (publish/subscribe sync) and peer-to-peer synchronization of multiple data sources.

Sync Framework features built-in capabilities for conflict detection – whether data to be changed has already been updated – and can flag them for manual inspection or use defined policies to try to resolve the conflict.
Sync Services includes an embedded SQL Server Compact database to store metadata about the synchronization relationships as well as about each sync attempt.

Sync Framework API is surfaced both in managed code, for use with .NET Framework applications, as well as unmanaged code, for use with COM applications.
