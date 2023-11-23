#Persistent
toggle := 0
repetitions := 0
currentAction := ""
return

F6::
    if (!toggle) {
        toggle := 1
        repetitions := 9  ; Set the number of repetitions
        currentAction := "PressS"
        SetTimer, PressS, -1  ; Run immediately
    } else {
        toggle := 0
        SetTimer, PressS, Off
        SetTimer, PressA, Off
        SetTimer, ReleaseKey, Off
        Send, {s up}
        Send, {a up}
    }
return

PressS:
    if (toggle and repetitions > 0) {
        Send, {s down}
        currentAction := "PressA"
        SetTimer, ReleaseKey, -48300  ; Release after 2 minutes
    }
return

PressA:
    if (toggle and repetitions > 0) {
        Send, {a down}
        currentAction := "PressS"
        SetTimer, ReleaseKey, -48300  ; Release after 2 minutes
    }
return

ReleaseKey:
    Send, {s up}
    Send, {a up}
    repetitions--
    if (toggle and repetitions > 0) {
        Sleep, 100  ; Wait for 0.1 seconds
        SetTimer, %currentAction%, -1
    } else {
        toggle := 0  ; Reset toggle after sequence
    }
return
