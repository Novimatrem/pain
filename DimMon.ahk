; AntiBurnIn.ahk
;
; AntiBurnIn

; now with dual monitor fix

#SingleInstance, force 
#Persistent

Menu, Tray, Tip, AntiBurnIn
MsgBox Ensure you place a blank black image inside of Libraries\Pictures.    Press Esc, then move the mouse, to quit.

WinMinimizeAll


Gui, Color, black

Gui +AlwaysOnTop 

Gui -Caption

Gui, Show, x0 y0 w9999 h9999
MouseMove, 99999,99999,, R  
Loop {
MouseMove, 99999,99999,, R  
Run, %windir%\system32\PhotoScreensaver.scr /s
Sleep 0 
}

Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script

; EOF

