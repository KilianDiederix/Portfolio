#Persistent
toggle := 0
repetitions := 0
currentAction := ""
return

F2::
    if (!toggle) {
        toggle := 1
        repetitions := 22  ; 11 repetitions for 'a' and 'd' each
        currentAction := "PressA"
        SetTimer, PressA, -1  ; Run immediately
    } else {
        toggle := 0
        SetTimer, PressA, Off
        SetTimer, PressD, Off
        SetTimer, ReleaseKey, Off
        SetTimer, PressW, Off
        Send, {a up}
        Send, {d up}
        Send, {w up}
    }
return

PressA:
    if (toggle and repetitions > 0) {
        Send, {a down}
        SetTimer, ReleaseKey, -23700  ; Release after 24 seconds
    }
return

PressD:
    if (toggle and repetitions > 0) {
        Send, {d down}
        SetTimer, ReleaseKey, -23700  ; Release after 24 seconds
    }
return

PressW:
    if (toggle and repetitions > 0) {
        Send, {w down}
        Sleep, 200  ; Hold 'w' for 0.2 seconds
        Send, {w up}
        Sleep, 10  ; Wait for 0.2 seconds
        if (currentAction = "PressA") {
            currentAction := "PressD"
            SetTimer, PressD, -1
        } else if (currentAction = "PressD") {
            currentAction := "PressA"
            SetTimer, PressA, -1
        }
    }
return

ReleaseKey:
    if (currentAction = "PressA") {
        Send, {a up}
    } else if (currentAction = "PressD") {
        Send, {d up}
    }
    repetitions--
    if (toggle and repetitions > 0) {
        SetTimer, PressW, -1
    } else {
        toggle := 0  ; Reset toggle after sequence
    }
return
