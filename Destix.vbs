' Created by NiTRoDJ
' Please read readme.md
' Enjoy :D

' begin
Dim start

start = msgbox("That is very dangerous malware ever. Run?", 48+4, "You have a very dangerous file")

If start = vbYes Then
Else
  Wscript.Quit
End If

' choice
Dim level

level = inputbox("Choose Level", "Destix.vbs")

If level = "1" Then
  ' Level 1
  ' Payload 1
  msgbox("-|-||---|-||---|", 16, "Destix.vbs")
  msgbox("Call 000.exe", 16, "Destix.vbs")
  msgbox("Call 001.bat", 16, "Destix.vbs")
  ' Payload 2
  Dim bridge

  set bridge = CreateObject("WScript.Shell")

  bridge.run "cmd"
  WScript.Sleep 120
  bridge.run "explorer"
  WScript.Sleep 200
  bridge.run "chrome"
  WScript.Sleep 100
  msgbox("Error: 0x000001A", 16, "VBScript Call")
  WScript.Sleep 70
  bridge.run "cmd"
  bridge.sendkeys "a"
  WScript.Sleep 120
  bridge.sendleys "a"
  WScript.Sleep 100
  bridge.sendkeys "b"
ElseIf level = "2" Then
  ' Level 2
ElseIf level = "3" Then
  ' Level 3
ElseIf level = "4" Then
  ' level 4
Else
  ' Quit
  Wscript.Quit
End If
