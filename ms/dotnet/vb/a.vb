Imports System

Module ModuleIntro

Sub Main()
  ' write to stdout
  Console.WriteLine("Compiling with old vbc (Visual Basic 2012): vbc a.vb")
  
  Dim strMsg As String
  strMsg = "Visual Basic .NET program "
  strMsg = strMsg & "compiled with older vbc i.e. "
  strMsg = strMsg & "Visual Basic 2012 compiler"
  
  MsgBox(strMsg)
  
  ' prevents cmd from closing until a key is pressed:
  Console.ReadKey()
End Sub

End Module

' COMPILE:
'     vbc a.vb

' OUTPUT:
'   Microsoft (R) Visual Basic Compiler version 14.7.3056 for Visual Basic 2012
'   Copyright (c) Microsoft Corporation.  All rights reserved.
'   This compiler is provided as part of the .NET Framework, but only supports
'   language versions up to Visual Basic 2012, which is no longer current. For
'   compilers that support newer versions of VB see:
'   http://go.microsoft.com/fwlink/?LinkID=533241
