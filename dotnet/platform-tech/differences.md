# Differences


## Comparison with .NET Framework
The major differences between .NET Core and the .NET Framework:
- App-models
- API
- Subsystems
- Supported platforms
- License

*App-models*: .NET Core does not support all the .NET Framework's app-models, in particular, it doesn't support *ASP.NET Web Forms* and *MVC*. It was announced that .NET Core 3 will support WPF and Windows Forms.

*APIs*: .NET Core contains a large subset of .NET Framework's Base Class Library, with a different factoring (assembly names are different; members exposed on types differ in key cases). These differences require changes to port source to .NET Core in some cases (see microsoft/dotnet-apiport). .NET Core implements the .NET Standard API specification.


*Subsystems*: .NET Core implements a subset of the subsystems in the .NET Framework, with the goal of a simpler implementation and programming model. For example, Code Access Security (CAS) is not supported, while reflection is supported.

*Platforms*: The .NET Framework supports Windows and Windows Server while .NET Core also supports macOS and Linux.

*Open Source*: .NET Core is open source, while a read-only subset of the .NET Framework is open source.
While .NET Core is unique and has significant differences to the .NET Framework and other .NET implementations, it is straightforward to share code between these implementations, using either source or binary sharing techniques.


## .NET Core and .NET Framework
There are 2 supported impl for building server-side apps with .NET:
1. .NET Framework
2. .NET Core

Both share many of the same components and you can share code across the two, however, there are fundamental differences between the two and your choice depends on what you want to accomplish.

Use .NET Core
- You have *cross-platform* needs.
- You are targeting *microservices*.
- You are using *Docker* containers.
- You need *high-performance* and *scalable* systems.
- You need side-by-side .NET versions per application.

Use .NET Framework
- Your app uses .NET technologies that aren't available for .NET Core
- Your app uses a platform that doesn't support .NET Core
- Your app uses 3rd-party .NET libraries or NuGet packages unavailable for Core
- If the app uses .NET Framework, it is recommended to extend it, rather then migrate it.


Target frameworks
https://docs.microsoft.com/en-us/dotnet/standard/frameworks


## .NET Core and .NET Standard Class Library
Difference between `.NET Core` and `.NET Standard Class Library` project types

https://stackoverflow.com/questions/42939454/what-is-the-difference-between-net-core-and-net-standard-class-library-project

Use a .NET Standard library when you want to increase the number of apps that will be compatible with your library, and you are okay with a decrease in the .NET API surface area your library can access.

Use a .NET Core library when you want to increase the .NET API surface area your library can access, and you are okay with allowing only .NET Core apps to be compatible with your library.

For example, a library that targets .NET Standard 1.3 will be compatible with apps that target .NET Framework 4.6, .NET Core 1.0, Universal Windows Platform 10.0, and any other platform that supports .NET Standard 1.3. The library will not have access to some parts of the .NET API, though. For instance, the  Microsoft.NETCore.CoreCLR package is compatible with .NET Core but not with .NET Standard.
