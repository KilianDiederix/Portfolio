#Persistent
toggle := 0
repetitions := 0
currentAction := ""
return

F10::
    if (!toggle) {
        toggle := 1
        repetitions := 24  ; 24 repetitions for 'w', 'd', and 's' (6 full cycles)
        currentAction := "PressW"
        SetTimer, PressW, -1  ; Run immediately
    } else {
        toggle := 0
        SetTimer, PressW, Off
        SetTimer, PressD, Off
        SetTimer, ReleaseKey, Off
        SetTimer, PressS, Off
        Send, {w up}
        Send, {d up}
        Send, {s up}
    }
return

PressW:
    if (toggle and repetitions > 0) {
        Send, {w down}
        SetTimer, ReleaseKey, -71000  ; Release after 71 seconds
    }
return

PressD:
    if (toggle and repetitions > 0) {
        Send, {d down}
        SetTimer, ReleaseKey, -450  ; Release after 0.45 seconds
    }
return

PressS:
    if (toggle and repetitions > 0) {
        Send, {s down}
        SetTimer, ReleaseKey, -71000  ; Release after 71 seconds
    }
return

ReleaseKey:
    if (currentAction = "PressW") {
        Send, {w up}
        currentAction := "PressD"
        SetTimer, PressD, -1  ; Transition to pressing D
    } else if (currentAction = "PressD") {
        Send, {d up}
        if (repetitions mod 2 = 0) {  ; Check if it's time for W or S
            currentAction := "PressW"
            SetTimer, PressW, -1  ; Transition to pressing W
        } else {
            currentAction := "PressS"
            SetTimer, PressS, -1  ; Transition to pressing S
        }
    } else if (currentAction = "PressS") {
        Send, {s up}
        currentAction := "PressD"
        SetTimer, PressD, -1  ; Transition to pressing D
    }
    repetitions--
    if (repetitions = 0) {
        toggle := 0  ; Stop the script if repetitions have ended
        SetTimer, PressW, Off
        SetTimer, PressD, Off
        SetTimer, PressS, Off
    }
return
