#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; script will stay running after the auto-execute section (top part of the script) completes
#SingleInstance Force ; Replaces the old instance of this script automatically
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
#NoTrayIcon
; #InstallKeybdHook
; shell:startup -> drop shortcut

#Include %A_ScriptDir%\Natural_keyboard_4000_support.ahk

return ; nothing to do in the main part of the script

;  line navigation for visual studio
checkIfLineNavigation(ScrollDir, MsNatural4000){
    if WinActive("ahk_exe Code.exe") or WinActive("ahk_exe devenv.exe"){
        if (ScrollDir = 1){
            arrow = Up
        }
        else{
            arrow = Down
        }

        if MsNatural4000.keyModifiers.Shift and MsNatural4000.keyModifiers.Ctrl{
            Send, {ShiftDown}{CtrlDown}{%arrow%}
        }
        else if MsNatural4000.keyModifiers.Shift{
            Send, {ShiftDown}{%arrow%}
        }
        else if MsNatural4000.keyModifiers.Ctrl{
            Send, {CtrlDown}{%arrow%}
        }
        else {
            Send, {%arrow%}
        }
        return 1
    }
    return 0
}

; === Use the zoom button to scroll ===
DoScroll:
    if (checkIfLineNavigation(ScrollDir, MsNatural4000)){
        return
    }
    if (ScrollDir = 1){
        SendInput, {WheelUp}
    }
    else{
        SendInput, {WheelDown}
    }
    return

MsNatural4000_ZoomDown:
    ScrollDir := 2
    GoSub, DoScroll
    SetTimer, DoScroll, 120
    return

MsNatural4000_ZoomUp:
    ScrollDir := 1
    GoSub, DoScroll
    SetTimer, DoScroll, 120
    return

MsNatural4000_KeyUp:
    ScrollDir := 0
    SetTimer, DoScroll, Off
    return
; ======

; === Example of using modifiers while pressing a button ===
MsNatural4000_MyFavorites:
    Send, ^c
    Sleep 50
    Run, http://www.duckduckgo.com/?q=%clipboard%
    return
; ======

; === Map extra numpad's keys to their ordinary functionality ===
; numpad "="
MsNatural4000_NumpadEqual:
    Send {=}
    return

; numpad "("
MsNatural4000_NumpadLeftBracket:
    Send {(}
    return

; numpad ")"
MsNatural4000_NumpadRightBracket:
    Send {)}
    return
; ======

; === Use favorites buttons ===
MsNatural4000_Favorites1:
    MsgBox Favorites 1
    return

MsNatural4000_Favorites2:
    MsgBox Favorites 2
    return

MsNatural4000_Favorites3:
    MsgBox Favorites 3
    return

MsNatural4000_Favorites4:
    MsgBox Favorites 4
    return

MsNatural4000_Favorites5:
    MsgBox Favorites 5
    return
; ======
