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
NumpadEnd & a::Send α
NumpadEnd & b::Send β
NumpadEnd & g::shifting("Γ", "γ")
NumpadEnd & d::shifting("Δ", "δ")
NumpadEnd & e::Send ε
NumpadEnd & z::Send ζ
NumpadEnd & h::Send η
NumpadEnd & t::shifting("Θ", "θ")
NumpadEnd & l::shifting("Λ", "λ")
NumpadEnd & m::Send μ
NumpadEnd & x::shifting("Ξ", "ξ")
NumpadEnd & p::shifting("Π", "π")
NumpadEnd & s::shifting("Σ", "σ")
NumpadEnd & y::shifting("Φ", "φ")
NumpadEnd & c::Send χ
NumpadEnd & i::shifting("Ψ", "ψ")
NumpadEnd & o::shifting("Ω", "ω")
NumpadEnd & u::Send 𝜏


;-------------------------------------------------
;Logic_key_NumpadDown (2)
NumpadDown::return
NumpadDown & Ctrl::hoverimg("Keyboard2_Logic.png")
NumpadDown & n::Shifting("ᶜ","¬") 
NumpadDown & a::Send ∧
NumpadDown & o::shifting("⊕", "∨")
NumpadDown & ,::shiftalting("↔","⇐","←")
NumpadDown & .::shiftalting("⇔","⇒","→")
NumpadDown & t::shifting("⟘", "⟙")
NumpadDown & [::shiftalting("⊭","⊨ₜₐᵤₜ","⊨")
NumpadDown & =::Send ≡
NumpadDown & -::Send ≔
NumpadDown & ]::Send ⊢
NumpadDown & q::shifting("∃","∀")
NumpadDown & s::shifting("⊂","⊆")
NumpadDown & p::Send 𝒫
NumpadDown & e::shifting("∉","∈")
NumpadDown & u::Send ⋃
NumpadDown & i::Send ⋂
NumpadDown & v::Send 𝒱
NumpadDown & 0::Send ø



;-------------------------------------------------
;Math_key_NumpadPgDn (3)
NumpadPgDn::return
NumpadPgDn & Ctrl::hoverimg("Keyboard3_Math.png")
NumpadPgDn & r::Send ℝ
NumpadPgDn & q::Send ℚ
NumpadPgDn & z::Send ℤ
NumpadPgDn & n::Send ℕ
NumpadPgDn & c::Send ℂ
NumpadPgDn & <::Send ≤
NumpadPgDn & >::Send ≥
NumpadPgDn & =::shifting("≈","≠")
NumpadPgDn & p::Send ∝
NumpadPgDn & -::Send ±
NumpadPgDn & i::Send ∞
NumpadPgDn & m::shiftalting("✕", "⋅", "×")
NumpadPgDn & d::Send ÷
NumpadPgDn & s::Send √
NumpadPgDn & [::shifting("⌊","⌈")
NumpadPgDn & ]::shifting("⌋","⌉")
NumpadPgDn & a::Send ∫

;---------------------------------------------------
;Symbols_Key_NumpadLeft (4)
NumpadLeft::return
NumpadLeft & Ctrl::hoverimg("Keyboard4_Symbols.png")
NumpadLeft & d::Send °
NumpadLeft & c::Send ℃
NumpadLeft & f::Send ℉
NumpadLeft & o::shifting("ø","○")
NumpadLeft & t::Send ∴
NumpadLeft & .::shifting(" ⃗","･") ;combining ontop right arrow character, middle dot
NumpadLeft & >::shifting(" ⃗","･") ;combining ontop right arrow character, middle dot
NumpadLeft & -::Send ̅     ;combining ontop bar character
NumpadLeft & 6::Send ̂     ;combining circumflex Accent (hat) character
NumpadLeft & Space:: send \%A_Space%        ;Backslash space, "\ "
NumpadLeft & ':: send \"


;---------------------------------------------------
;Subscript_Key_NumpadClear (5)
;₀₁₂₃₄₅₆₇₈₉ₐₑₙₘᵢⱼₖₜᵤₓᵧ₊₋₌₍₎
NumpadClear::return 
NumpadClear & Ctrl::hoverimg("Keyboard5_Subscript.png")
NumpadClear & 1::Send ₁
NumpadClear & 2::Send ₂
NumpadClear & 3::Send ₃
NumpadClear & 4::Send ₄
NumpadClear & 5::Send ₅
NumpadClear & 6::Send ₆
NumpadClear & 7::Send ₇
NumpadClear & 8::Send ₈
NumpadClear & 9::shifting("₍","₉")
NumpadClear & 0::shifting("₎","₀")
NumpadClear & a::Send ₐ
NumpadClear & e::Send ₑ
NumpadClear & n::Send ₙ
NumpadClear & m::Send ₘ
NumpadClear & i::Send ᵢ
NumpadClear & j::Send ⱼ
NumpadClear & k::Send ₖ
NumpadClear & t::Send ₜ
NumpadClear & u::Send ᵤ
NumpadClear & x::Send ₓ
NumpadClear & y::Send ᵧ
NumpadClear & p::Send ₎
NumpadClear & o::Send ₍
NumpadClear & =::shifting("₊", "₌")
NumpadClear & -::Send ₋


;---------------------------------------------------
;Superscript_Key_NumpadRight (6)
;⁰¹²³⁴⁵⁶⁷⁸⁹ᵃᵉⁿᵐⁱʲᵏᵗᵘˣʸ⁺⁻⁼⁽⁾
NumpadRight::return
NumpadRight & Ctrl::hoverimg("Keyboard6_Superscript.png")
NumpadRight & 1::Send ¹
NumpadRight & 2::Send ²
NumpadRight & 3::Send ³
NumpadRight & 4::Send ⁴
NumpadRight & 5::Send ⁵
NumpadRight & 6::Send ⁶
NumpadRight & 7::Send ⁷
NumpadRight & 8::Send ⁸
NumpadRight & 9::shifting("⁽","⁹")
NumpadRight & 0::shifting("⁾","⁰")
NumpadRight & a::Send ᵃ
NumpadRight & e::Send ᵉ
NumpadRight & n::Send ⁿ
NumpadRight & m::Send ᵐ
NumpadRight & i::Send ⁱ
NumpadRight & j::Send ʲ
NumpadRight & k::Send ᵏ
NumpadRight & t::Send ᵗ
NumpadRight & u::Send ᵘ
NumpadRight & x::Send ˣ
NumpadRight & y::Send ʸ
NumpadRight & p::Send ⁾
NumpadRight & o::Send ⁽
NumpadRight & =::shifting("⁺", "⁼")
NumpadRight & -::Send ⁻


;-----------------------------------------
;circleEnclosed_Key_NumpadHome (7)
;①②③④⑤⑥⑦⑧⑨⑩ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ
NumpadHome::return
NumpadHome & Ctrl::hoverimg("Keyboard7_CircleEnclosed.png")
NumpadHome & 1::Send ① 
NumpadHome & 2::Send ②
NumpadHome & 3::Send ③
NumpadHome & 4::Send ④
NumpadHome & 5::Send ⑤
NumpadHome & 6::Send ⑥
NumpadHome & 7::Send ⑦
NumpadHome & 8::Send ⑧
NumpadHome & 9::Send ⑨
NumpadHome & 0::Send ⑩
NumpadHome & a:: Send Ⓐ
NumpadHome & b:: Send Ⓑ
NumpadHome & c:: Send Ⓒ
NumpadHome & d:: Send Ⓓ
NumpadHome & e:: Send Ⓔ
NumpadHome & f:: Send Ⓕ
NumpadHome & g:: Send Ⓖ
NumpadHome & h:: Send Ⓗ
NumpadHome & i:: Send Ⓘ
NumpadHome & j:: Send Ⓙ
NumpadHome & k:: Send Ⓚ
NumpadHome & l:: Send Ⓛ
NumpadHome & m:: Send Ⓜ
NumpadHome & n:: Send Ⓝ
NumpadHome & o::Send Ⓞ
NumpadHome & p::Send Ⓟ
NumpadHome & q::Send Ⓠ
NumpadHome & r:: Send Ⓡ
NumpadHome & s:: Send Ⓢ
NumpadHome & t:: Send Ⓣ
NumpadHome & u:: Send Ⓤ
NumpadHome & v:: Send Ⓥ
NumpadHome & w:: Send Ⓦ
NumpadHome & x:: Send Ⓧ
NumpadHome & y:: Send Ⓨ
NumpadHome & z:: Send Ⓩ

;-----------------------------------------
;NIS_Key_NumpadUp (8)
NumpadUp::return

;-----------------------------------------
;NIS_Key_NumpadPgUp (9)

NumpadPgUp::return
NumpadPgUp & Ctrl::hoverimg("img.jpg")