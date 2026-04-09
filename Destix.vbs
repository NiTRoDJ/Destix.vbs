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
If level = "1" Then delay = 1000: duration = 25
If level = "2" Then delay = 800: duration = 45
If level = "3" Then delay = 700: duration = 50
If level = "4" Then delay = 500: duration = 30

MsgBox "Destix Level " & level & " Activated", 64, "Destix"

startTime = Timer
lastCmdTime = 0
lastDiscoTime = 0
lastFileTime = 0
lastInputTime = 0
basicFolderCreated = False

Do
    elapsed = Timer - startTime

    ' ===== СПИСОК ПОМИЛОК =====
    rText = Int(Rnd * 5)
    If rText = 0 Then msg = "Error: 0x0000000A"
    If rText = 1 Then msg = "DIR ERROR: C:\Windoms"
    If rText = 2 Then msg = "YOU RUN A MALWARE XD"
    If rText = 3 Then msg = "&#!%"
    If rText = 4 Then msg = "(^)&"

    rIcon = Int(Rnd * 2)
    If rIcon = 0 Then icon = 16 Else icon = 48

    ' ===== SOFT =====
    If level = "1" Then
        If elapsed < 10 Then
            wsh.Run "mshta ""javascript:var sh=new ActiveXObject('WScript.Shell'); sh.Popup('" & msg & "',1,'Error'," & icon & ");close();"""
        End If
        If elapsed >= 10 And elapsed < 25 Then
            r = Int(Rnd * 2)
            If r = 0 Then wsh.Run "cmd" Else wsh.Run "calc"
            WScript.Sleep 500
            k = Int(Rnd * 2)
            If k = 0 Then wsh.SendKeys "a" Else wsh.SendKeys "b"
        End If
    End If

    ' ===== BASIC =====
    If level = "2" Then
        If elapsed < 10 Then
            count = 1 + Int(Rnd * 3)
            For i = 1 To count
                wsh.Run "mshta ""javascript:var sh=new ActiveXObject('WScript.Shell'); sh.Popup('" & msg & "',1,'Error'," & icon & ");close();"""
            Next
        End If
        If elapsed >= 10 And elapsed < 30 Then
            If Not basicFolderCreated Then
                If Not fso.FolderExists("BASIC") Then fso.CreateFolder("BASIC")
                basicFolderCreated = True
            End If
            r = Int(Rnd * 4)
            If r = 0 Then wsh.Run "explorer"
            If r = 1 Then wsh.Run "calc"
            If r = 2 Then wsh.Run "cmd"
            If r = 3 Then wsh.Run "notepad"
            WScript.Sleep 500
            chars = "abcdef0123456789"
            ch = Mid(chars, 1 + Int(Rnd * Len(chars)), 1)
            wsh.SendKeys ch
        End If
        If elapsed >= 30 And elapsed < 45 Then
            If Timer - lastCmdTime > 3 Then
                wsh.Run "cmd /k start && pause"
                lastCmdTime = Timer
            End If
        End If
    End If

    ' ===== INSANE =====
    If level = "3" Then
        ' Payload 1 (0–15 сек)
        If elapsed < 15 Then
            If Timer - lastDiscoTime > 5 Then
                wsh.Run "py disco.py"
                lastDiscoTime = Timer
            End If
            count = 2 + Int(Rnd * 3)
            For i = 1 To count
                wsh.Run "mshta ""javascript:var sh=new ActiveXObject('WScript.Shell'); sh.Popup('" & msg & "',1,'Error'," & icon & ");close();"""
            Next
        End If
        ' Payload 2 (15–35 сек)
        If elapsed >= 15 And elapsed < 35 Then
            If Timer - lastFileTime > 3 Then
                For i = 1 To 5
                    name = "file_" & Int(Rnd * 100000) & ".txt"
                    Set f = fso.CreateTextFile(name, True)
                    chars = "abcdef0123456789"
                    text = ""
                    For j = 1 To 20
                        text = text & Mid(chars, 1 + Int(Rnd * Len(chars)), 1)
                    Next
                    f.Write text
                    f.Close
                Next
                lastFileTime = Timer
            End If
        End If
        ' Payload 3 (35–50 сек)
        If elapsed >= 35 And elapsed < 50 Then
            If Timer - lastCmdTime > 2 Then
                wsh.Run "cmd /k start && pause"
                lastCmdTime = Timer
            End If
            count = 2 + Int(Rnd * 3)
            For i = 1 To count
                wsh.Run "mshta ""javascript:var sh=new ActiveXObject('WScript.Shell'); sh.Popup('" & msg & "',1,'Error'," & icon & ");close();"""
            Next
        End If
    End If

    ' ===== DESTICSIVE =====
    If level = "4" Then
        ' Payload 1 (0–10 сек)
        If elapsed < 10 Then
            If Timer - lastDiscoTime > 3 Then
                For i = 1 To 3
                    wsh.Run "py disco2.py"
                Next
                lastDiscoTime = Timer
            End If
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
