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
