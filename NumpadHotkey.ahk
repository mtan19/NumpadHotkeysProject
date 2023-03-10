WASDMove = 10
MayaMove = 30
MayaRotate = 30
MayaZoom = 30

shifting(T, F){
    If GetKeyState("Shift","p")
	  Send %T%
	else
	 Send %F%
	Return
}

shiftalting(s, a, n){
    If GetKeyState("Shift","p")
	     Send %s%
	else If GetKeyState("Alt","p")
	    Send %a%
	else
	    Send %n%

	Return
}

hoverimg(dir){
    folder = %A_ScriptDir%\AHKscriptPhotos
    SetWorkingDir %folder%
    Gui +LastFound +AlwaysOnTop +ToolWindow -Theme -Border -Caption
    Gui, Color, D0D0D0
    Gui, Add, Picture, , %dir%
    Gui, Show, xCenter y575 w950 h445
    Gui, Margin, 0,0
    KeyWait Alt
    KeyWait Ctrl
    gosub GuiEscape
    return
    GuiEscape: 
    Gui, Cancel
    Gui, Hide
    Gui, Destroy
    return
}


-----------------------------------------------
;wasd_cursor_control_NumpadIns(0)
NumpadIns::return
NumpadIns & w::
    SetKeyDelay -1  
    MouseMove, 0, -%WASDMove%, 1, R
    return
NumpadIns & s::
    SetKeyDelay -1  
    MouseMove, 0, %WASDMove%, 1, R
    return
NumpadIns & a::
    SetKeyDelay -1  
    MouseMove, -%WASDMove%, 0, 1, R
    return
NumpadIns & d::
    SetKeyDelay -1  
    MouseMove, %WASDMove%, 0, 1, R
    return
NumpadIns & c::
    if(WASDMove > 10){
        WASDMove := WASDMove-10
        Gui +LastFound +AlwaysOnTop +ToolWindow -Theme -Border -Caption
        Gui, Add, Text,,WASDMove=%WASDMove%
        Gui, Show, x1790 y1050
        Sleep 300
        Gui, Cancel
        Gui, Hide
        Gui, Destroy
    }
    return
NumpadIns & v::
    if(WASDMove < 200){
        WASDMove := WASDMove+10
        Gui +LastFound +AlwaysOnTop +ToolWindow -Theme -Border -Caption
        Gui, Add, Text,,WASDMove=%WASDMove%
        Gui, Show, x1790 y1050
        Sleep 300
        Gui, Cancel
        Gui, Hide
        Gui, Destroy
    }
    return
NumpadIns & Left::
	SetKeyDelay -1   
	Send {Blind}{LButton DownR}  
	return
NumpadIns & Left up::
	SetKeyDelay -1  
	Send {Blind}{LButton up}
    return
NumpadIns & Right::
	SetKeyDelay -1   
	Send {Blind}{RButton DownR}  
	return
NumpadIns & Right up::
	SetKeyDelay -1  
	Send {Blind}{RButton up}
    return
NumpadIns & Up::
	SetKeyDelay -1   
	Send {Blind}{MButton DownR}  
	return
NumpadIns & Up up::
	SetKeyDelay -1  
	Send {Blind}{MButton up}
    return


;-----------------------------------------------
;Maya_camera_control_NumpadDel(.)
NumpadDel::return
;Camera Translations
    NumpadDel & s::
        SetKeyDelay 1 
        Send {Blind}{Alt DownR}
        Send {Blind}{MButton DownR}  
        MouseMove, 0, -%MayaMove%, 0, R
        Send {Blind}{MButton up}
        Send {Blind}{Alt up}
        MouseMove, 0, %MayaMove%, 0, R
        return
    NumpadDel & w::
        SetKeyDelay 1
        Send {Blind}{Alt DownR}  
        Send {Blind}{MButton DownR}
        MouseMove, 0, %MayaMove%, 0, R
        Send {Blind}{MButton up}
        Send {Blind}{Alt up}
        MouseMove, 0, -%MayaMove%, 0, R
        return
    NumpadDel & d::
        SetKeyDelay 1
        Send {Blind}{Alt DownR}  
        Send {Blind}{MButton DownR}
        MouseMove, -%MayaMove%, 0, 0, R
        Send {Blind}{MButton up}
        Send {Blind}{Alt up}
        MouseMove, %MayaMove%, 0, 0, R
        return
    NumpadDel & a::
        SetKeyDelay 1
        Send {Blind}{Alt DownR}  
        Send {Blind}{MButton DownR}
        MouseMove, %MayaMove%, 0, 0, R
        Send {Blind}{MButton up}
        Send {Blind}{Alt up}
        MouseMove, -%MayaMove%, 0, 0, R
        return
;Camera Zoom
    NumpadDel & c::
        SetKeyDelay 1 
        Send {Blind}{Alt DownR}
        Send {Blind}{RButton DownR}  
        MouseMove, 0, -%MayaZoom%, 0, R
        Send {Blind}{RButton up}
        Send {Blind}{Alt up}
        MouseMove, 0, %MayaZoom%, 0, R
        return
    NumpadDel & v::
        SetKeyDelay 1
        Send {Blind}{Alt DownR}  
        Send {Blind}{RButton DownR}
        MouseMove, 0, %MayaZoom%, 0, R
        Send {Blind}{RButton up}
        Send {Blind}{Alt up}
        MouseMove, 0, -%MayaZoom%, 0, R
        return
;Camera Rotations
    NumpadDel & f::
        SetKeyDelay 1 
        Send {Blind}{Alt DownR}
        Send {Blind}{LButton DownR}  
        MouseMove, 0, -%MayaRotate%, 0, R
        Send {Blind}{LButton up}
        Send {Blind}{Alt up}
        MouseMove, 0, %MayaRotate%, 0, R
        return
    NumpadDel & r::
        SetKeyDelay 1  
        Send {Blind}{Alt DownR}
        Send {Blind}{LButton DownR}
        MouseMove, 0, %MayaRotate%, 0, R
        Send {Blind}{LButton up}
        Send {Blind}{Alt up}
        MouseMove, 0, -%MayaRotate%, 0, R
        return
    NumpadDel & e::
        SetKeyDelay 1  
        Send {Blind}{Alt DownR}
        Send {Blind}{LButton DownR}
        MouseMove, -%MayaRotate%, 0, 0, R
        Send {Blind}{LButton up}
        Send {Blind}{Alt up}
        MouseMove, %MayaRotate%, 0, 0, R
        return
    NumpadDel & q::
        SetKeyDelay 1  
        Send {Blind}{Alt DownR}
        Send {Blind}{LButton DownR}
        MouseMove, %MayaRotate%, 0, 0, R
        Send {Blind}{LButton up}
        Send {Blind}{Alt up}
        MouseMove, -%MayaRotate%, 0, 0, R
        return
;Step adjust
    NumpadDel & Down::
    if(MayaMove > 10){
        MayaMove := MayaMove-10
        Gui +LastFound +AlwaysOnTop +ToolWindow -Theme -Border -Caption
        Gui, Add, Text,,MayaMove=%MayaMove%
        Gui, Show, x1790 y1050
        Sleep 200
        Gui, Cancel
        Gui, Hide
        Gui, Destroy
    }
    return
    NumpadDel & Up::
        if(MayaMove < 100){
            MayaMove := MayaMove+10
            Gui +LastFound +AlwaysOnTop +ToolWindow -Theme -Border -Caption
            Gui, Add, Text,,MayaMove=%MayaMove%
            Gui, Show, x1790 y1050
            Sleep 200
            Gui, Cancel
            Gui, Hide
            Gui, Destroy
        }
        return
    NumpadDel & Left::
        if(MayaRotate > 10){
            MayaRotate := MayaRotate-10
            Gui +LastFound +AlwaysOnTop +ToolWindow -Theme -Border -Caption
            Gui, Add, Text,,MayaRotate=%MayaRotate%
            Gui, Show, x1790 y1050
            Sleep 200
            Gui, Cancel
            Gui, Hide
            Gui, Destroy
        }
        return
    NumpadDel & Right::
        if(MayaRotate < 100){
            MayaRotate := MayaRotate+10
            Gui +LastFound +AlwaysOnTop +ToolWindow -Theme -Border -Caption
            Gui, Add, Text,,MayaRotate=%MayaRotate%
            Gui, Show, x1790 y1050
            Sleep 200
            Gui, Cancel
            Gui, Hide
            Gui, Destroy
        }
        return
    NumpadDel & =::
        if(MayaZoom < 100){
            MayaZoom := MayaZoom+10
            Gui +LastFound +AlwaysOnTop +ToolWindow -Theme -Border -Caption
            Gui, Add, Text,,Zoom_Step=%MayaZoom%
            Gui, Show, x1790 y1050
            Sleep 200
            Gui, Cancel
            Gui, Hide
            Gui, Destroy
        }
        return
    NumpadDel & -::
        if(MayaZoom > 10){
            MayaZoom := MayaZoom-10
            Gui +LastFound +AlwaysOnTop +ToolWindow -Theme -Border -Caption
            Gui, Add, Text,,Zoom_Step=%MayaZoom%
            Gui, Show, x1790 y1050
            Sleep 200
            Gui, Cancel
            Gui, Hide
            Gui, Destroy
        }
        return


;--------------------------------------------------
;Greek_key_NumpadEnd (1)
NumpadEnd::return
NumpadEnd & Ctrl::hoverimg("Keyboard1_Greek.png")
NumpadEnd & a::Send ??
NumpadEnd & b::Send ??
NumpadEnd & g::shifting("??", "??")
NumpadEnd & d::shifting("??", "??")
NumpadEnd & e::Send ??
NumpadEnd & z::Send ??
NumpadEnd & h::Send ??
NumpadEnd & t::shifting("??", "??")
NumpadEnd & l::shifting("??", "??")
NumpadEnd & m::Send ??
NumpadEnd & x::shifting("??", "??")
NumpadEnd & p::shifting("??", "??")
NumpadEnd & s::shifting("??", "??")
NumpadEnd & y::shifting("??", "??")
NumpadEnd & c::Send ??
NumpadEnd & i::shifting("??", "??")
NumpadEnd & o::shifting("??", "??")
NumpadEnd & u::Send ????


;-------------------------------------------------
;Logic_key_NumpadDown (2)
NumpadDown::return
NumpadDown & Ctrl::hoverimg("Keyboard2_Logic.png")
NumpadDown & n::Shifting("???","??") 
NumpadDown & a::Send ???
NumpadDown & o::shifting("???", "???")
NumpadDown & ,::shiftalting("???","???","???")
NumpadDown & .::shiftalting("???","???","???")
NumpadDown & t::shifting("???", "???")
NumpadDown & [::shiftalting("???","???????????????","???")
NumpadDown & =::Send ???
NumpadDown & -::Send ???
NumpadDown & ]::Send ???
NumpadDown & q::shifting("???","???")
NumpadDown & s::shifting("???","???")
NumpadDown & p::Send ????
NumpadDown & e::shifting("???","???")
NumpadDown & u::Send ???
NumpadDown & i::Send ???
NumpadDown & v::Send ????
NumpadDown & 0::Send ??



;-------------------------------------------------
;Math_key_NumpadPgDn (3)
NumpadPgDn::return
NumpadPgDn & Ctrl::hoverimg("Keyboard3_Math.png")
NumpadPgDn & r::Send ???
NumpadPgDn & q::Send ???
NumpadPgDn & z::Send ???
NumpadPgDn & n::Send ???
NumpadPgDn & c::Send ???
NumpadPgDn & <::Send ???
NumpadPgDn & >::Send ???
NumpadPgDn & =::shifting("???","???")
NumpadPgDn & p::Send ???
NumpadPgDn & -::Send ??
NumpadPgDn & i::Send ???
NumpadPgDn & m::shiftalting("???", "???", "??")
NumpadPgDn & d::Send ??
NumpadPgDn & s::Send ???
NumpadPgDn & [::shifting("???","???")
NumpadPgDn & ]::shifting("???","???")
NumpadPgDn & a::Send ???

;---------------------------------------------------
;Symbols_Key_NumpadLeft (4)
NumpadLeft::return
NumpadLeft & Ctrl::hoverimg("Keyboard4_Symbols.png")
NumpadLeft & d::Send ??
NumpadLeft & c::Send ???
NumpadLeft & f::Send ???
NumpadLeft & o::shifting("??","???")
NumpadLeft & t::Send ???
NumpadLeft & .::shifting(" ???","???") ;combining ontop right arrow character, middle dot
NumpadLeft & >::shifting(" ???","???") ;combining ontop right arrow character, middle dot
NumpadLeft & -::Send ??     ;combining ontop bar character
NumpadLeft & 6::Send ??     ;combining circumflex Accent (hat) character
NumpadLeft & Space:: send \%A_Space%        ;Backslash space, "\ "
NumpadLeft & ':: send \"


;---------------------------------------------------
;Subscript_Key_NumpadClear (5)
;??????????????????????????????????????????????????????????????????????????????
NumpadClear::return 
NumpadClear & Ctrl::hoverimg("Keyboard5_Subscript.png")
NumpadClear & 1::Send ???
NumpadClear & 2::Send ???
NumpadClear & 3::Send ???
NumpadClear & 4::Send ???
NumpadClear & 5::Send ???
NumpadClear & 6::Send ???
NumpadClear & 7::Send ???
NumpadClear & 8::Send ???
NumpadClear & 9::shifting("???","???")
NumpadClear & 0::shifting("???","???")
NumpadClear & a::Send ???
NumpadClear & e::Send ???
NumpadClear & n::Send ???
NumpadClear & m::Send ???
NumpadClear & i::Send ???
NumpadClear & j::Send ???
NumpadClear & k::Send ???
NumpadClear & t::Send ???
NumpadClear & u::Send ???
NumpadClear & x::Send ???
NumpadClear & y::Send ???
NumpadClear & p::Send ???
NumpadClear & o::Send ???
NumpadClear & =::shifting("???", "???")
NumpadClear & -::Send ???


;---------------------------------------------------
;Superscript_Key_NumpadRight (6)
;????????????????????????????????????????????????????????????????????????
NumpadRight::return
NumpadRight & Ctrl::hoverimg("Keyboard6_Superscript.png")
NumpadRight & 1::Send ??
NumpadRight & 2::Send ??
NumpadRight & 3::Send ??
NumpadRight & 4::Send ???
NumpadRight & 5::Send ???
NumpadRight & 6::Send ???
NumpadRight & 7::Send ???
NumpadRight & 8::Send ???
NumpadRight & 9::shifting("???","???")
NumpadRight & 0::shifting("???","???")
NumpadRight & a::Send ???
NumpadRight & e::Send ???
NumpadRight & n::Send ???
NumpadRight & m::Send ???
NumpadRight & i::Send ???
NumpadRight & j::Send ??
NumpadRight & k::Send ???
NumpadRight & t::Send ???
NumpadRight & u::Send ???
NumpadRight & x::Send ??
NumpadRight & y::Send ??
NumpadRight & p::Send ???
NumpadRight & o::Send ???
NumpadRight & =::shifting("???", "???")
NumpadRight & -::Send ???


;-----------------------------------------
;circleEnclosed_Key_NumpadHome (7)
;????????????????????????????????????????????????????????????????????????????????????????????????????????????
NumpadHome::return
NumpadHome & Ctrl::hoverimg("Keyboard7_CircleEnclosed.png")
NumpadHome & 1::Send ??? 
NumpadHome & 2::Send ???
NumpadHome & 3::Send ???
NumpadHome & 4::Send ???
NumpadHome & 5::Send ???
NumpadHome & 6::Send ???
NumpadHome & 7::Send ???
NumpadHome & 8::Send ???
NumpadHome & 9::Send ???
NumpadHome & 0::Send ???
NumpadHome & a:: Send ???
NumpadHome & b:: Send ???
NumpadHome & c:: Send ???
NumpadHome & d:: Send ???
NumpadHome & e:: Send ???
NumpadHome & f:: Send ???
NumpadHome & g:: Send ???
NumpadHome & h:: Send ???
NumpadHome & i:: Send ???
NumpadHome & j:: Send ???
NumpadHome & k:: Send ???
NumpadHome & l:: Send ???
NumpadHome & m:: Send ???
NumpadHome & n:: Send ???
NumpadHome & o::Send ???
NumpadHome & p::Send ???
NumpadHome & q::Send ???
NumpadHome & r:: Send ???
NumpadHome & s:: Send ???
NumpadHome & t:: Send ???
NumpadHome & u:: Send ???
NumpadHome & v:: Send ???
NumpadHome & w:: Send ???
NumpadHome & x:: Send ???
NumpadHome & y:: Send ???
NumpadHome & z:: Send ???

;-----------------------------------------
;NIS_Key_NumpadUp (8)
NumpadUp::return

;-----------------------------------------
;NIS_Key_NumpadPgUp (9)

NumpadPgUp::return
NumpadPgUp & Ctrl::hoverimg("img.jpg")