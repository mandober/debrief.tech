# Uno Platform

https://github.com/nventive/Uno

The Uno Platform is an UWP bridge to allow UWP based code to run on iOS, Android and WebAssembly.

It provides the full definitions of the UWP Windows 10 October 2018 Update (17763), and the implementation of growing number parts of the UWP API, such as Windows.UI.Xaml, to enable applications to run on these platforms.

Use the UWP tooling from Windows in *Visual Studio*, such as *XAML Edit and Continue* and *C# Edit and Continue*, build your application as much as possible on Windows, then validate that your application runs on iOS, Android and WebAssembly.

## Uno Features
* Supported platforms:
  - Windows (via the standard UWP Toolkit)
  - iOS and Android (via Xamarin)
  - WebAssembly through the Mono Wasm SDK
* Dev loop
  - Develop on Windows first using Visual Studio
  - XAML Edit and Continue for live XAML edition on each key stroke
  C# Edit and Continue
  Validate on other platforms as late as possible
* Cross Platform Controls
  Control Templating
  Data Templating
  Styling
  Rich Animations
* UWP Code Support
  Windows Community Toolkit
  MVVM Light Toolkit
  Microsoft XAML Behaviors
  Prism
  MVVMCross (soon)
  ReactiveUI
  WindowsStateTriggers
  Xamarin.Forms for UWP
  Rx.NET
  ColorCode-Universal
  Any UWP project
* Responsive Design
  Visual State Manager
  State Triggers
  Adaptive Triggers
* Platform Specific
  Native controls and properties via conditional XAML
  Any of the existing Xamarin iOS/Android libraries available
