; NOTE: In autohotkey, the following special characters (usually) represent modifier keys:
; # is the WIN key. (it can mean other things though, as you can see above.)
; ^ is CTRL
; ! is ALT
; + is SHIFT
; list of other keys: http://www.autohotkey.com/docs/Hotkeys.htm

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; This script allows you to keep any key pressed down when 
; pressing F8 then the key or mouse click you want to press

#SingleInstance

#if GetKeyState("F8", "P")

    ; * is wildcard, so that it will work with any modifier keys held down
    ;      in case you are holding shift or control it wont care

    ; $ stops the up event from being sent, so that the down can live on
    
    *$LButton::Send {LButton down}
    *$RButton::Send {RButton down}
    *$MButton::Send {MButton down}

    *$a::Send {a down}
    *$b::Send {b down}
    *$c::Send {c down}
    *$d::Send {d down}
    *$e::Send {e down}
    *$f::Send {f down}
    *$g::Send {g down}
    *$h::Send {h down}
    *$i::Send {i down}
    *$j::Send {j down}
    *$k::Send {k down}
    *$l::Send {l down}
    *$m::Send {m down}
    *$n::Send {n down}
    *$o::Send {o down}
    *$p::Send {p down}
    *$q::Send {q down}
    *$r::Send {r down}
    *$s::Send {s down}
    *$t::Send {t down}
    *$u::Send {u down}
    *$v::Send {v down}
    *$w::Send {w down}
    *$x::Send {x down}
    *$y::Send {y down}
    *$z::Send {z down}
    *$0::Send {0 down}
    *$1::Send {1 down}
    *$2::Send {2 down}
    *$3::Send {3 down}
    *$4::Send {4 down}
    *$5::Send {5 down}
    *$6::Send {6 down}
    *$7::Send {7 down}
    *$8::Send {8 down}
    *$9::Send {9 down}
    *$Numpad0::Send {Numpad0 down}
    *$Numpad1::Send {Numpad1 down}
    *$Numpad2::Send {Numpad2 down}
    *$Numpad3::Send {Numpad3 down}
    *$Numpad4::Send {Numpad4 down}
    *$Numpad5::Send {Numpad5 down}
    *$Numpad6::Send {Numpad6 down}
    *$Numpad7::Send {Numpad7 down}
    *$Numpad8::Send {Numpad8 down}
    *$Numpad9::Send {Numpad9 down}
    *$NumLock::Send {NumLock down}
    *$NumpadDiv::Send {NumpadDiv down}
    *$NumpadMult::Send {NumpadMult down}
    *$NumpadAdd::Send {NumpadAdd down}
    *$NumpadSub::Send {NumpadSub down}
    *$NumpadEnter::Send {NumpadEnter down}
    *$Space::Send {Space down}
    *$CapsLock::Send {CapsLock down}
    *$Tab::Send {Tab down}
    *$Enter::Send {Enter down}
    *$Escape::Send {Escape down}
    *$Backspace::Send {Backspace down}
    *$Delete::Send {Delete down}
    *$ScrollLock::Send {ScrollLock down}
    *$Insert::Send {Insert down}
    *$Home::Send {Home down}
    *$End::Send {End down}
    *$PgUp::Send {PgUp down}
    *$PgDn::Send {PgDn down}
    *$Up::Send {Up down}
    *$Down::Send {Down down}
    *$Left::Send {Left down}
    *$Right::Send {Right down}
    *$Control::Send {Control down}
    *$Alt::Send {Alt down}
    *$Shift::Send {Shift down}

#If

