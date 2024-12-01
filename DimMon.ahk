; AntiBurnIn.ahk
;
; AntiBurnIn

; now with dual monitor fix
; and imac fix
; Ensure you place a blank black image inside of Libraries\Pictures. EXCLUSIVELY, NOTHING ELSE IN THERE.
; Press Esc, then move the mouse, to quit.

#SingleInstance, force 
#Persistent

;~The script needs to be run at an elevated level- this takes care of that
	if (! A_IsAdmin){ ;http://ahkscript.org/docs/Variables.htm#IsAdmin
		Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
		ExitApp
	}

Menu, Tray, Tip, AntiBurnIn

WinMinimizeAll
BlockInput, MouseMove

dllcall("ShowCursor","uint",0)
proc = DisplayFusion.exe
RunWait, TASKKILL /F /IM %proc% /T,, Hide

proc = DisplayFusionHookApp32.exe
RunWait, TASKKILL /F /IM %proc% /T,, Hide

proc = DisplayFusionHookApp64.exe
RunWait, TASKKILL /F /IM %proc% /T,, Hide

proc = DisplayFusionService.exe
RunWait, TASKKILL /F /IM %proc% /T,, Hide

proc = elevenclock.exe
RunWait, TASKKILL /F /IM %proc% /T,, Hide

Process, Close, DisplayFusion.exe
Process, Close, DisplayFusionService.exe
Process, Close, DisplayFusionHookApp32.exe
Process, Close, DisplayFusionHookApp64.exe

proc = MagicBorderless.exe
RunWait, TASKKILL /F /IM %proc% /T,, Hide

Process, Close, MagicBorderless.exe

Process, Close, elevenclock.exe

SendMessage,0x112,0xF170,2,,Program Manager

Gui, Color, black

Gui +AlwaysOnTop 

Gui -Caption
Gui, Show, x0 y0 w9999 h9999
MouseMove, 99999,99999,, R  
Loop {
MouseMove, 99999,99999,, R  
Run, %windir%\system32\PhotoScreensaver.scr /s
SendMessage,0x112,0xF170,2,,Program Manager
Sleep 0 
loop
    MouseMove % Mod(A_Index, 2) ? 1 : -1, 0, 0, R
AdjustScreenBrightness(step) {
    static service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
    monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
    monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")
    for i in monitors {
        curr := i.CurrentBrightness
        break
    }
    toSet := curr + step
    if (toSet < 10)
        toSet := 10
    if (toSet > 100)
        toSet := 100
    for i in monMethods {
        i.WmiSetBrightness(1, toSet)
        break
    }
    BrightnessOSD()
}

AdjustScreenBrightness(-999999999)
Return

BrightnessOSD() {
    static PostMessagePtr := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "user32.dll", "Ptr"), "AStr", A_IsUnicode ? "PostMessageW" : "PostMessageA", "Ptr")
        , WM_SHELLHOOK := DllCall("RegisterWindowMessage", "Str", "SHELLHOOK", "UInt")
    static FindWindow := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "user32.dll", "Ptr"), "AStr", A_IsUnicode ? "FindWindowW" : "FindWindowA", "Ptr")
    HWND := DllCall(FindWindow, "Str", "NativeHWNDHost", "Str", "", "Ptr")
    IF !(HWND) {
        try IF ((shellProvider := ComObjCreate("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{00000000-0000-0000-C000-000000000046}"))) {
            try IF ((flyoutDisp := ComObjQuery(shellProvider, "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}", "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}"))) {
                DllCall(NumGet(NumGet(flyoutDisp + 0) + 3 * A_PtrSize), "Ptr", flyoutDisp, "Int", 0, "UInt", 0)
                    , ObjRelease(flyoutDisp)
            }
            ObjRelease(shellProvider)
        }
        HWND := DllCall(FindWindow, "Str", "NativeHWNDHost", "Str", "", "Ptr")
    }
    DllCall(PostMessagePtr, "Ptr", HWND, "UInt", WM_SHELLHOOK, "Ptr", 0x37, "Ptr", 0)
}

}

Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script

; EOF


