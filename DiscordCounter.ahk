#SingleInstance, Force

Gui, +AlwaysOnTop

Gui, Add, Text, x22 y19 w430 h20 , Discord Counter
Gui, Add, Button, x22 y49 w200 h50 gStartCounting, Start Counting
Gui, Add, Button, x252 y49 w200 h50 gStopCounting, Stop Counting
Gui, Add, Progress, x20 y107 w434 h24 cb5b5b5 Range0-%numberIterations%, 100000
Gui, Add, Progress, x22 y109 w430 h20 c006bb8 vProgress Range0-%numberIterations%, 0
Gui, Add, Text, x22 y139 w110 h20 , Number of Iterations
Gui, Add, Text, x182 y139 w110 h20 , Starting Number
Gui, Add, Text, x342 y139 w110 h20 , Delay (seconds)
Gui, Add, Edit, x22 y169 w110 r1 Number vnumberIterations gSubmit_All, 100
Gui, Add, Edit, x182 y169 w110 r1 Number vstartingNumber gSubmit_All, %startingNumber%
Gui, Add, Edit, x342 y169 w110 r1 Number vdelay gSubmit_All, 2
; Generated using SmartGUI Creator 4.0
Gui, Show, x50 y50 h210 w479, Discord Counter
Return

GuiClose:
ExitApp
Return 



StartCounting:
    Sleep 2000
    var := 0

    Loop %numberIterations%
    {
        if (var = 1)
            break
        show := A_Index + startingNumber
        ToolTip % %show%   ; show counter
        count := A_Index + startingNumber - 1
        Send %count%
        Send {Enter}     ; pressing Enter key
        GuiControl,, Progress, +1
        Sleep (delay * 1000)   ; wait
    }
    SoundBeep    ; Make some noise
    Return

StopCounting:
    var := 1
    GuiControl,, Progress, 0

Submit_All:
    Gui, Submit, NoHide


