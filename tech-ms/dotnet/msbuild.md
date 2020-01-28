# MSBuild

https://docs.microsoft.com/en-us/visualstudio/msbuild/common-msbuild-project-properties?view=vs-2017

Project files in Visual Studio (`.csproj`, `.vbproj`, `.vcxproj`, etc) contain MSBuild XML code that runs when you build a project by using the IDE. Projects typically import one or more `.targets` files to define their build process.

MSBuild `.targets` files:
https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-dot-targets-files?view=vs-2017


MSBuild: Glossary
https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-glossary?view=vs-2017

MSBuild: Properties
https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-properties?view=vs-2017


Properties represent key/value pairs that can be used to configure builds.

Properties are declared by creating an element that has the name of the property as a child of a `PropertyGroup` element.

For example, this creates a property named `BuildDir` w value of `build`.

```xml
<PropertyGroup>
  <BuildDir>build</BuildDir>
</PropertyGroup>
```


## MSBuild .targets files

https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-dot-targets-files?view=vs-2017

The $(MSBuildToolsPath) value specifies the path of these common .targets files. If the ToolsVersion is 4.0, the files are in the following location: <WindowsInstallationPath>\Microsoft.NET\Framework\v4.0.30319\


## Common MSBuild project items
In MSBuild, an item is a named reference to one or more files. Items contain metadata such as file names, paths, and version numbers. All project types in Visual Studio have several items in common. These items are defined in the file Microsoft.Build.CommonTypes.xsd.
