Dim wsh, fso
Set wsh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' Попередження
answer = MsgBox("This is very dangerous VBScript file." & vbCrLf & "Run?", 48 + 4, "Destix.vbs - Warning")
If answer = 7 Then WScript.Quit

' Вибір рівня
level = InputBox("Choose Level 1-4:" & vbCrLf & _
"1. Soft" & vbCrLf & _
"2. Basic" & vbCrLf & _
"3. Insane" & vbCrLf & _
"4. Desticsive", "Destix Level")

If level = "" Then WScript.Quit

Randomize

' Налаштування
If level = "1" Then
    delay = 1000: duration = 25
ElseIf level = "2" Then
    delay = 800: duration = 45
ElseIf level = "3" Then
    delay = 700: duration = 50
ElseIf level = "4" Then
    delay = 500: duration = 30
Else
    MsgBox "Invalid level!", 16, "Error"
    WScript.Quit
End If

MsgBox "Destix Level " & level & " Activated", 64, "Destix"

startTime = Timer
lastCmdTime = 0
lastDiscoTime = 0
lastFileTime = 0
lastInputTime = 0

Do
    elapsed = Timer - startTime

    ' Помилки
    rText = Int(Rnd * 5)
    If rText = 0 Then msg = "Error: 0x0000000A"
    If rText = 1 Then msg = "DIR ERROR: C:\Windoms"
    If rText = 2 Then msg = "YOU RUN A MALWARE XD"
    If rText = 3 Then msg = "&#!%"
    If rText = 4 Then msg = "(^)&"

    rIcon = Int(Rnd * 2)
    If rIcon = 0 Then icon = 16 Else icon = 48

    ' ===== DESTICSIVE =====
    If level = "4" Then

        ' Payload 1 (0–10 сек)
        If elapsed < 10 Then

            ' запуск disco2.py (3 рази з інтервалом)
            If Timer - lastDiscoTime > 3 Then
                wsh.Run "py disco2.py"
                lastDiscoTime = Timer
            End If

            ' 1-2 помилки
            count = 1 + Int(Rnd * 2)
            For i = 1 To count
                wsh.Run "mshta ""javascript:var sh=new ActiveXObject('WScript.Shell'); sh.Popup('" & msg & "',1,'Error'," & icon & ");close();"""
            Next
        End If

        ' Payload 2 (10–30 сек)
        If elapsed >= 10 And elapsed < 30 Then

            ' InputBox кожні 5 сек
            If Timer - lastInputTime > 5 Then
                Do
                    code = InputBox("Enter code 1234:", "Security Check")
                    If code = "1234" Then Exit Do
                Loop
                lastInputTime = Timer
            End If

            ' відкриття програм кожну 1 сек
            If Timer - lastCmdTime > 1 Then
                r = Int(Rnd * 3)
                If r = 0 Then wsh.Run "cmd"
                If r = 1 Then wsh.Run "explorer"
                If r = 2 Then wsh.Run "calc"
                lastCmdTime = Timer
            End If

        End If

    End If

    WScript.Sleep delay

    If elapsed > duration Then Exit Do
Loop

' Фінал
If level = "4" Then
    MsgBox "Your PC Desticed!!!", 16, "Destix"
Else
    MsgBox "Destix finished.", 64, "Destix"
End If