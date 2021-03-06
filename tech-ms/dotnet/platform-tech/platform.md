# NET

- [.NET Guide](https://docs.microsoft.com/en-us/dotnet/standard)
- NET is a general purpose development platform.
- multi langs, async and concurrent programming models and native interop
- NET MS langs: C#, F# and VB (Visual Basic)
- supports wide range of platforms (Win, Linux, macOS, phones)


.NET implementations implement the **Common Language Infrastructure** (CLI), which among other things specifies a language-independent runtime and language interoperability. This means that you choose any NET language to build apps and services on NET.

.NET runtime manages resources (memory). GC operates on a lazy approach to memory management, preferring app throughput to the immediate collection of memory. However, some NET objects might reference **unmanaged resources**. For example, a `FileStream` object is a managed object, but it references a file handle, which is unmanaged. When you're done using the `FileStream`, you need to release the file handle - call the object's `Dispose()` method, which is responsible for releasing any unmanaged resources (objects that reference unmanaged resources implement the `IDisposable` interface).

**Native interoperability**: Every OS includes an API that provides system services. NET provides several ways to call those APIs. The main way to do native interoperability is via "platform invoke" or *P/Invoke* for short, which is supported across Linux and Windows platforms. A Windows-only way of doing native interoperability is known as *COM interop* which is used to work with COM components in managed code. It's built on top of the P/Invoke infrastructure, but it works in subtly different ways. Most of *Mono* (and thus *Xamarin*) interoperability support for Java and Objective-C are built similarly, that is, they use the same principles.


TargetFramework:
- netstandard1.6
- net461
- netcoreapp2.0

```xml
<PropertyGroup>
  <TargetFramework>net461</TargetFramework>
  <TargetFramework>netstandard1.6</TargetFramework>
  <TargetFramework>netcoreapp2.0</TargetFramework>
  <StartupObject>Examples.Program</StartupObject>
</PropertyGroup>
```



## .NET versions

- .NET Core: latest, 2.2-preview, 2.1 (stable/LTS)
- .NET Framework, latest: 4.7.2
- Visual Studio, latest: 15.8.4
- Mono

https//www.microsoft.com/net/download/archives


## .NET Core versions
- Cross-platform version for building websites, services, and console apps.
- Parts: SDK: building apps, Runtime: only for running apps

### Releases
* .NET Core 2.2 (Preview)
  * `2.2.0-preview3`
    - .NET Core SDK 2.2.100-preview3-009430
    - .NET Core Runtime 2.2.0-preview3-27014-02
    - ASP.NET Core 2.2.0-preview3-35497
    - Release notes:
      - Released 2018-10-17
      - C# 7.3 support
      - F# 4.5 support
      - ASP.NET Core IIS Module 12.2.18248.0
  * `v2.2.0-preview2`
    - SDK 2.2.100-preview2
    - Runtime 2.2.0-preview2
    - Release notes
      - Released 2018-09-12
      - C# 7.3 support
      - F# 4.5 support
      - Included in Visual Studio 15.8.4
      - ASP.NET Core IIS Module 12.2.18248.0
  * `v2.2.0-preview1`
    - SDK 2.2.100-preview1
    - Runtime 2.2.0-preview1
    - Release notes
      - Released 2018-08-22
      - C# 7.3 support
      - ASP.NET Core IIS Module 12.2.18248.0
* `.NET Core 2.1` (Current/LTS)
  - SDK v2.1.403
  - Runtime v2.1.5
* Release notes:
  - https://github.com/dotnet/core/tree/master/release-notes
  - https://github.com/dotnet/core/blob/master/release-notes/2.1




## Available API Set

| .NET Standard   | 1.0  | 1.1  | 1.2   | 1.3  | 1.4   | 1.5        | 1.6        | 2.0        |
|-----------------|------|------|-------|------|-------|------------|------------|------------|
| .NET Core       | 1.0  | 1.0  | 1.0   | 1.0  | 1.0   | 1.0        | 1.0        | 2.0        |
| .NET Framework  | 4.5  | 4.5  | 4.5.1 | 4.6  | 4.6.1 | 4.6.1      | 4.6.1      | 4.6.1      |
| Mono            | 4.6  | 4.6  | 4.6   | 4.6  | 4.6   | 4.6        | 4.6        | 5.4        |
| Xamarin.iOS     | 10.0 | 10.0 | 10.0  | 10.0 | 10.0  | 10.0       | 10.0       | 10.14      |
| Xamarin.Android | 7.0  | 7.0  | 7.0   | 7.0  | 7.0   | 7.0        | 7.0        | 8.0        |
| UWP             | 10.0 | 10.0 | 10.0  | 10.0 | 10.0  | 10.0.16299 | 10.0.16299 | 10.0.16299 |
| Windows         | 8.0  | 8.0  | 8.1   | -    | -     | -          | -          | -          |
| Windows Phone   | 8.1  | 8.1  | 8.1   | -    | -     | -          | -          | -          |
