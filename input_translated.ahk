; This script was created using Pulover's Macro Creator
; www.macrocreator.com

#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Window
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1


F9::
Macro1:
Loop
{
    WinActivate, ahk_class Notepad
    Sleep, 50
    Send, {Home}
    Sleep, 50
    Send, {Shift Down}{Control Down}{Right}{Control Up}{Shift Up}
    Sleep, 50
    Send, {Control Down}{c}{Control Up}
    Sleep, 50
    lang := Clipboard
    Send, {Right 2}
    Sleep, 50
    Send, {Shift Down}{End}{Shift Up}
    Sleep, 50
    Send, {Control Down}{c}{Control Up}
    Sleep, 50
    translated := Clipboard
    Send, {Home}
    Sleep, 50
    Send, {Down}
    Sleep, 50
    WinActivate, ahk_class Chrome_WidgetWin_1
    Sleep, 50
    Send, {Control Down}{f}{Control Up}
    Sleep, 50
    Send, %lang%
    Sleep, 50
    Send, {Enter}
    Sleep, 50
    Loop
    {
        CoordMode, Pixel, Window
        PixelSearch, FoundX, FoundY, 0, 0, 2560, 1440, 0x78CC66, 10, Fast RGB
        If ErrorLevel = 0
        	Click, %FoundX%, %FoundY% Left, 1
        Sleep, 50
    }
    Until ErrorLevel = 0
    Click, Rel 630, 5 Left, 1  ; CLICK THE ADD TITLE WINDOW, NEED TO FINETUNE
    Sleep, 10
    Loop
    {
        CoordMode, Pixel, Window
        ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, .\img\titlereq.png
        CenterImgSrchCoords(".\img\titlereq.png", FoundX, FoundY)
        If ErrorLevel = 0
        	Click, %FoundX%, %FoundY% Left, 1
        Sleep, 50
    }
    Until ErrorLevel = 0
    Send, %translated%
    Sleep, 50
    Loop
    {
        CoordMode, Pixel, Window
        ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, .\img\publishbutton.png
        CenterImgSrchCoords(".\img\publishbutton.png", FoundX, FoundY)
        If ErrorLevel = 0
        	Click, %FoundX%, %FoundY% Left, 1
        Sleep, 50
    }
    Until ErrorLevel = 0
    Loop
    {
        CoordMode, Pixel, Window
        ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, .\img\studio.png
        CenterImgSrchCoords(".\img\studio.png", FoundX, FoundY)
        Sleep, 50
    }
    Until ErrorLevel = 0
}
Return


F8::ExitApp

F10::Pause

CenterImgSrchCoords(File, ByRef CoordX, ByRef CoordY)
{
	static LoadedPic
	LastEL := ErrorLevel

	Gui, Pict:Add, Pic, vLoadedPic, % RegExReplace(File, "^(\*\w+\s)+")
	GuiControlGet, LoadedPic, Pict:Pos
	Gui, Pict:Destroy
	CoordX += LoadedPicW // 2
	CoordY += LoadedPicH // 2
	ErrorLevel := LastEL
}
