; please-never-ever-sleep-it-literally-fucks-my-everything_MOUSE_EDITION.ahk
;
; Please Never Ever Sleep It Literally Fucks My Everything MOUSE EDITION
; (so it doesn't ruin my Terminals like almost all of the Caffeine apps for Windows do...)
; place inside of shell:startup and enjoy your life with your shitty motherboard, kitty cat
; yes i know this is almost literally xkcd 196 but it was either this or have a PC that randomly turned off, dont ask.

#SingleInstance, force 
#Persistent
Menu, Tray, Tip, Please Never Ever Sleep It Literally Fucks My Everything
Loop {
MouseMove, 1,1,, R  
MouseMove, -1,-1,, R 
Sleep 59000 
}

; loops every 59 seconds.
; EOF

