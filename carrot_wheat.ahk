#Persistent
toggle := 0
repetitions := 0
currentAction := ""
return

F7::
    if (!toggle) {
        toggle := 1
        repetitions := 5  ; Set the number of repetitions
        currentAction := "PressD"
        SetTimer, PressD, -1  ; Run immediately
    } else {
        toggle := 0
        SetTimer, PressD, Off
        SetTimer, PressA, Off
        SetTimer, ReleaseKey, Off
        Send, {d up}
        Send, {a up}
    }
return

PressD:
    if (toggle and repetitions > 0) {
        Send, {d down}
        currentAction := "PressA"
        SetTimer, ReleaseKey, -120000  ; Release after 2 minutes
    }
return

PressA:
    if (toggle and repetitions > 0) {
        Send, {a down}
        currentAction := "PressD"
        SetTimer, ReleaseKey, -120000  ; Release after 2 minutes
    }
return

ReleaseKey:
    Send, {d up}
    Send, {a up}
    repetitions--
    if (toggle and repetitions > 0) {
        Sleep, 500  ; Wait for 0.5 seconds
        SetTimer, %currentAction%, -1
    } else {
        toggle := 0  ; Reset toggle after sequence
    }
return
