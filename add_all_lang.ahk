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
    Send, {End}
    Sleep, 100
    CoordMode, Pixel, Window
    ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, .\img\addlang.png
    CenterImgSrchCoords(".\img\addlang.png", FoundX, FoundY)
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY% Left, 1
    Sleep, 100
    If (ErrorLevel = 0)
    {
        Loop
        {
            CoordMode, Pixel, Window
            ImageSearch, FoundX, FoundY, 0, 0, 2560, 1440, .\img\nub.png
            Sleep, 100
        }
        Until ErrorLevel = 0
        If (ErrorLevel = 0)
        {
            Send, {Enter}
            Sleep, 100
        }
    }
    Else
    {
        Send, {End}
        Sleep, 100
    }
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
