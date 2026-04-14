
section .rdata align=16

uiTextTitle        db 'SEPARATE UI PASS', 0
uiTextActions      db 'RIGHT PANEL', 0
uiTextTune         db 'TUNE []', 0
uiTextModeHead     db 'MODE >', 0
uiTextHelpHead     db 'UI HELP ? !', 0
uiTextLift         db 'LIFT +', 0
uiTextPause        db 'PAUSE', 0
uiTextPlay         db 'PLAY', 0
uiTextReset        db 'RESET !', 0
uiTextFov          db 'FOV', 0
uiTextLight        db 'LIGHT', 0
uiTextShader       db 'MODE', 0
uiTextModeSky      db 'SKY', 0
uiTextModeForest   db 'FOREST', 0
uiTextModeSunset   db 'SUNSET', 0
uiTextLook         db '[RMB] LOOK', 0
uiTextMove         db '[WASD/QE]', 0
uiTextClick        db '[LMB] UI', 0
uiTextExit         db 'ESC=EXIT', 0
uiTextSymbols      db '[]()<> +- / ? !', 0

uiFontSpace7 db 0, 0, 0, 0, 0, 0, 0
uiFontDash7 db 0, 0, 0, 31, 0, 0, 0
uiFontUnderscore7 db 0, 0, 0, 0, 0, 0, 31
uiFontPeriod7 db 0, 0, 0, 0, 0, 4, 4
uiFontComma7 db 0, 0, 0, 0, 0, 4, 8
uiFontColon7 db 0, 4, 4, 0, 4, 4, 0
uiFontSemi7 db 0, 4, 4, 0, 4, 4, 8
uiFontBang7 db 4, 4, 4, 4, 4, 0, 4
uiFontQuestion7 db 14, 17, 1, 2, 4, 0, 4
uiFontSlash7 db 1, 2, 4, 8, 16, 0, 0
uiFontBackslash7 db 16, 8, 4, 2, 1, 0, 0
uiFontPlus7 db 0, 4, 4, 31, 4, 4, 0
uiFontEquals7 db 0, 31, 0, 31, 0, 0, 0
uiFontLParen7 db 2, 4, 8, 8, 8, 4, 2
uiFontRParen7 db 8, 4, 2, 2, 2, 4, 8
uiFontLBracket7 db 14, 8, 8, 8, 8, 8, 14
uiFontRBracket7 db 14, 2, 2, 2, 2, 2, 14
uiFontLess7 db 2, 4, 8, 16, 8, 4, 2
uiFontGreater7 db 8, 4, 2, 1, 2, 4, 8
uiFontQuote7 db 4, 4, 0, 0, 0, 0, 0
uiFontDQuote7 db 10, 10, 0, 0, 0, 0, 0
uiFontStar7 db 0, 10, 4, 31, 4, 10, 0
uiFontHash7 db 10, 10, 31, 10, 31, 10, 10
uiFontPercent7 db 24, 25, 2, 4, 8, 19, 3
uiFontAmp7 db 12, 18, 20, 8, 21, 18, 13
uiFontPipe7 db 4, 4, 4, 4, 4, 4, 4
uiFontCaret7 db 4, 10, 17, 0, 0, 0, 0
uiFontTilde7 db 0, 0, 13, 18, 0, 0, 0

uiFontDigits7:
    db 14, 17, 19, 21, 25, 17, 14
    db 4, 12, 4, 4, 4, 4, 14
    db 14, 17, 1, 2, 4, 8, 31
    db 30, 1, 1, 6, 1, 1, 30
    db 2, 6, 10, 18, 31, 2, 2
    db 31, 16, 16, 30, 1, 1, 30
    db 14, 16, 16, 30, 17, 17, 14
    db 31, 1, 2, 4, 8, 8, 8
    db 14, 17, 17, 14, 17, 17, 14
    db 14, 17, 17, 15, 1, 1, 14

uiFontAZ7:
    db 14, 17, 17, 31, 17, 17, 17
    db 30, 17, 17, 30, 17, 17, 30
    db 14, 17, 16, 16, 16, 17, 14
    db 30, 17, 17, 17, 17, 17, 30
    db 31, 16, 16, 30, 16, 16, 31
    db 31, 16, 16, 30, 16, 16, 16
    db 14, 17, 16, 23, 17, 17, 14
    db 17, 17, 17, 31, 17, 17, 17
    db 14, 4, 4, 4, 4, 4, 14
    db 1, 1, 1, 1, 17, 17, 14
    db 17, 18, 20, 24, 20, 18, 17
    db 16, 16, 16, 16, 16, 16, 31
    db 17, 27, 21, 21, 17, 17, 17
    db 17, 25, 21, 19, 17, 17, 17
    db 14, 17, 17, 17, 17, 17, 14
    db 30, 17, 17, 30, 16, 16, 16
    db 14, 17, 17, 17, 21, 18, 13
    db 30, 17, 17, 30, 20, 18, 17
    db 15, 16, 16, 14, 1, 1, 30
    db 31, 4, 4, 4, 4, 4, 4
    db 17, 17, 17, 17, 17, 17, 14
    db 17, 17, 17, 17, 17, 10, 4
    db 17, 17, 17, 21, 21, 21, 10
    db 17, 17, 10, 4, 10, 17, 17
    db 17, 17, 10, 4, 4, 4, 4
    db 31, 1, 2, 4, 8, 16, 31

section .text align=16

UI_Init:
    mov dword [g_uiMouseOver], 0
    mov dword [g_uiHotWidget], 0
    mov dword [g_menuVisible], 1
    mov dword [g_uiActiveWidget], 0
    mov dword [g_uiDropdownOpen], 0
    mov dword [g_menuVisible], 1
    ret

UI_GetGlyph5x7:
    cmp al, 'a'
    jb .check_upper
    cmp al, 'z'
    ja .check_upper
    sub al, 32

.check_upper:
    cmp al, 'A'
    jb .check_digit
    cmp al, 'Z'
    ja .check_digit
    movzx eax, al
    sub eax, 'A'
    mov edx, 7
    imul eax, edx
    lea rax, [uiFontAZ7 + rax]
    ret

.check_digit:
    cmp al, '0'
    jb .check_special
    cmp al, '9'
    ja .check_special
    movzx eax, al
    sub eax, '0'
    mov edx, 7
    imul eax, edx
    lea rax, [uiFontDigits7 + rax]
    ret

.check_special:
    cmp al, ' '
    je .space
    cmp al, '-'
    je .dash
    cmp al, '_'
    je .underscore
    cmp al, '.'
    je .period
    cmp al, ','
    je .comma
    cmp al, ':'
    je .colon
    cmp al, ';'
    je .semi
    cmp al, '!'
    je .bang
    cmp al, '?'
    je .question
    cmp al, '/'
    je .slash
    cmp al, '\'
    je .backslash
    cmp al, '+'
    je .plus
    cmp al, '='
    je .equals
    cmp al, '('
    je .lparen
    cmp al, ')'
    je .rparen
    cmp al, '['
    je .lbracket
    cmp al, ']'
    je .rbracket
    cmp al, '<'
    je .less
    cmp al, '>'
    je .greater
    cmp al, 39
    je .quote
    cmp al, '"'
    je .dquote
    cmp al, '*'
    je .star
    cmp al, '#'
    je .hash
    cmp al, '%'
    je .percent
    cmp al, '&'
    je .amp
    cmp al, '|'
    je .pipe
    cmp al, '^'
    je .caret
    cmp al, '~'
    je .tilde
    lea rax, [uiFontQuestion7]
    ret
.space:      lea rax, [uiFontSpace7]      ; noqa
             ret
.dash:       lea rax, [uiFontDash7]
             ret
.underscore: lea rax, [uiFontUnderscore7]
             ret
.period:     lea rax, [uiFontPeriod7]
             ret
.comma:      lea rax, [uiFontComma7]
             ret
.colon:      lea rax, [uiFontColon7]
             ret
.semi:       lea rax, [uiFontSemi7]
             ret
.bang:       lea rax, [uiFontBang7]
             ret
.question:   lea rax, [uiFontQuestion7]
             ret
.slash:      lea rax, [uiFontSlash7]
             ret
.backslash:  lea rax, [uiFontBackslash7]
             ret
.plus:       lea rax, [uiFontPlus7]
             ret
.equals:     lea rax, [uiFontEquals7]
             ret
.lparen:     lea rax, [uiFontLParen7]
             ret
.rparen:     lea rax, [uiFontRParen7]
             ret
.lbracket:   lea rax, [uiFontLBracket7]
             ret
.rbracket:   lea rax, [uiFontRBracket7]
             ret
.less:       lea rax, [uiFontLess7]
             ret
.greater:    lea rax, [uiFontGreater7]
             ret
.quote:      lea rax, [uiFontQuote7]
             ret
.dquote:     lea rax, [uiFontDQuote7]
             ret
.star:       lea rax, [uiFontStar7]
             ret
.hash:       lea rax, [uiFontHash7]
             ret
.percent:    lea rax, [uiFontPercent7]
             ret
.amp:        lea rax, [uiFontAmp7]
             ret
.pipe:       lea rax, [uiFontPipe7]
             ret
.caret:      lea rax, [uiFontCaret7]
             ret
.tilde:      lea rax, [uiFontTilde7]
             ret

UI_DrawText5x7Core:
    ; rcx = zstr, edx = x, r8d = y, r9d = color
    sub rsp, 104
    mov [rsp + 0], rcx
    mov dword [rsp + 8], edx
    mov dword [rsp + 12], r8d
    mov dword [rsp + 16], r9d

.char_loop:
    mov rax, [rsp + 0]
    movzx eax, byte [rax]
    test eax, eax
    jz .done
    call UI_GetGlyph5x7
    mov [rsp + 24], rax
    mov dword [rsp + 32], 0

.row_loop:
    mov eax, [rsp + 32]
    cmp eax, 7
    jge .next_char

    mov rdx, [rsp + 24]
    movzx eax, byte [rdx + rax]
    mov dword [rsp + 36], eax
    mov dword [rsp + 40], 0

.col_loop:
    mov eax, [rsp + 40]
    cmp eax, 5
    jge .next_row

    mov edx, [rsp + 36]
    mov ecx, 4
    sub ecx, eax
    shr edx, cl
    and edx, 1
    jz .skip_pixel

    mov ecx, [rsp + 40]
    imul ecx, ecx, 3
    add ecx, [rsp + 8]
    mov edx, [rsp + 32]
    imul edx, edx, 3
    add edx, [rsp + 12]
    mov r8d, 3
    mov r9d, 3
    mov eax, [rsp + 16]
    call UI_PushQuadPx

.skip_pixel:
    inc dword [rsp + 40]
    jmp .col_loop

.next_row:
    inc dword [rsp + 32]
    jmp .row_loop

.next_char:
    add dword [rsp + 8], 18
    mov rax, [rsp + 0]
    inc rax
    mov [rsp + 0], rax
    jmp .char_loop

.done:
    add rsp, 104
    ret

UI_DrawText3x5:
    ; compatibility wrapper: now uses a larger 5x7 font with shadow
    sub rsp, 56
    mov [rsp + 0], rcx
    mov dword [rsp + 8], edx
    mov dword [rsp + 12], r8d
    mov dword [rsp + 16], r9d

    mov rcx, [rsp + 0]
    mov edx, [rsp + 8]
    add edx, 2
    mov r8d, [rsp + 12]
    add r8d, 2
    mov r9d, 0C0181A22h
    call UI_DrawText5x7Core

    mov rcx, [rsp + 0]
    mov edx, [rsp + 8]
    mov r8d, [rsp + 12]
    mov r9d, [rsp + 16]
    call UI_DrawText5x7Core

    add rsp, 56
    ret

UI_PointInRectPx:
    ; ecx=mx, edx=my, r8d=x, r9d=y, r10d=w, r11d=h
    cmp ecx, r8d
    jl .no
    cmp edx, r9d
    jl .no

    mov eax, r8d
    add eax, r10d
    cmp ecx, eax
    jge .no

    mov eax, r9d
    add eax, r11d
    cmp edx, eax
    jge .no

    mov eax, 1
    ret
.no:
    xor eax, eax
    ret

UI_SetSlider01FromMouseX:
    ; rcx = ptr float, edx = sliderX, r8d = sliderW
    sub rsp, 40
    mov eax, [g_mouseX]
    sub eax, edx
    sub eax, 8
    cmp eax, 0
    jge .hi
    xor eax, eax
.hi:
    mov r9d, r8d
    sub r9d, 16
    cmp eax, r9d
    jle .store
    mov eax, r9d
.store:
    cvtsi2ss xmm0, eax
    cvtsi2ss xmm1, r9d
    divss xmm0, xmm1
    movss [rcx], xmm0
    call Camera_ApplyTuning
    add rsp, 40
    ret

UI_Update:
    sub rsp, 40

    ; keep the panel visible in this branch so it cannot disappear from a stale TAB state
    mov dword [g_menuVisible], 1
.after_toggle:

    mov dword [g_uiMouseOver], 0
    mov dword [g_uiHotWidget], 0

    cmp dword [g_menuVisible], 0
    jne .panel_check
    add rsp, 40
    ret

.panel_check:
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_PANEL_X
    mov r9d, UI_PANEL_Y
    mov r10d, UI_PANEL_W
    mov r11d, UI_PANEL_H
    call UI_PointInRectPx
    test eax, eax
    jz .check_release
    mov dword [g_uiMouseOver], 1

.check_release:
    cmp dword [g_mouseLReleased], 0
    je .drag_logic
    mov dword [g_uiActiveWidget], 0

.drag_logic:
    cmp dword [g_uiActiveWidget], 4
    jne .check_drag_light
    cmp dword [g_mouseLDown], 0
    je .clear_active
    lea rcx, [g_uiSliderFov01]
    mov edx, UI_SLIDER_X
    mov r8d, UI_SLIDER_W
    call UI_SetSlider01FromMouseX
    mov dword [g_uiHotWidget], 4
    jmp .button_checks

.check_drag_light:
    cmp dword [g_uiActiveWidget], 5
    jne .button_checks
    cmp dword [g_mouseLDown], 0
    je .clear_active
    lea rcx, [g_uiSliderLight01]
    mov edx, UI_SLIDER_X
    mov r8d, UI_SLIDER_W
    call UI_SetSlider01FromMouseX
    mov dword [g_uiHotWidget], 5
    jmp .button_checks

.clear_active:
    mov dword [g_uiActiveWidget], 0

.button_checks:
    ; Lift button
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_BUTTON_X
    mov r9d, UI_BUTTON1_Y
    mov r10d, UI_BUTTON_W
    mov r11d, UI_BUTTON_H
    call UI_PointInRectPx
    test eax, eax
    jz .button2
    mov dword [g_uiHotWidget], 1
    cmp dword [g_mouseLPressed], 0
    je .button2
    call Physics_LiftCube

.button2:
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_BUTTON_X
    mov r9d, UI_BUTTON2_Y
    mov r10d, UI_BUTTON_W
    mov r11d, UI_BUTTON_H
    call UI_PointInRectPx
    test eax, eax
    jz .button3
    mov dword [g_uiHotWidget], 2
    cmp dword [g_mouseLPressed], 0
    je .button3
    xor dword [g_physicsPaused], 1

.button3:
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_BUTTON_X
    mov r9d, UI_BUTTON3_Y
    mov r10d, UI_BUTTON_W
    mov r11d, UI_BUTTON_H
    call UI_PointInRectPx
    test eax, eax
    jz .slider1
    mov dword [g_uiHotWidget], 3
    cmp dword [g_mouseLPressed], 0
    je .slider1
    call Physics_Reset
    call Camera_Reset

.slider1:
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_SLIDER_X
    mov r9d, UI_SLIDER1_Y
    mov r10d, UI_SLIDER_W
    mov r11d, UI_SLIDER_H
    call UI_PointInRectPx
    test eax, eax
    jz .slider2
    mov dword [g_uiHotWidget], 4
    cmp dword [g_mouseLPressed], 0
    je .slider2
    mov dword [g_uiActiveWidget], 4
    lea rcx, [g_uiSliderFov01]
    mov edx, UI_SLIDER_X
    mov r8d, UI_SLIDER_W
    call UI_SetSlider01FromMouseX

.slider2:
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_SLIDER_X
    mov r9d, UI_SLIDER2_Y
    mov r10d, UI_SLIDER_W
    mov r11d, UI_SLIDER_H
    call UI_PointInRectPx
    test eax, eax
    jz .dropdown_head
    mov dword [g_uiHotWidget], 5
    cmp dword [g_mouseLPressed], 0
    je .dropdown_head
    mov dword [g_uiActiveWidget], 5
    lea rcx, [g_uiSliderLight01]
    mov edx, UI_SLIDER_X
    mov r8d, UI_SLIDER_W
    call UI_SetSlider01FromMouseX

.dropdown_head:
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_DROPDOWN_X
    mov r9d, UI_DROPDOWN_Y
    mov r10d, UI_DROPDOWN_W
    mov r11d, UI_DROPDOWN_H
    call UI_PointInRectPx
    test eax, eax
    jz .dropdown_opts
    mov dword [g_uiHotWidget], 6
    cmp dword [g_mouseLPressed], 0
    je .dropdown_opts
    xor dword [g_uiDropdownOpen], 1

.dropdown_opts:
    cmp dword [g_uiDropdownOpen], 0
    je .done

    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_DROPDOWN_X
    mov r9d, UI_DROPDOWN_OPT1_Y
    mov r10d, UI_DROPDOWN_W
    mov r11d, UI_DROPDOWN_OPT_H
    call UI_PointInRectPx
    test eax, eax
    jz .opt2
    mov dword [g_uiHotWidget], 7
    cmp dword [g_mouseLPressed], 0
    je .done
    mov dword [g_uiDropdownIndex], 0
    mov dword [g_uiDropdownOpen], 0
    call Camera_ApplyTuning
    jmp .done

.opt2:
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_DROPDOWN_X
    mov r9d, UI_DROPDOWN_OPT2_Y
    mov r10d, UI_DROPDOWN_W
    mov r11d, UI_DROPDOWN_OPT_H
    call UI_PointInRectPx
    test eax, eax
    jz .opt3
    mov dword [g_uiHotWidget], 8
    cmp dword [g_mouseLPressed], 0
    je .done
    mov dword [g_uiDropdownIndex], 1
    mov dword [g_uiDropdownOpen], 0
    call Camera_ApplyTuning
    jmp .done

.opt3:
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_DROPDOWN_X
    mov r9d, UI_DROPDOWN_OPT3_Y
    mov r10d, UI_DROPDOWN_W
    mov r11d, UI_DROPDOWN_OPT_H
    call UI_PointInRectPx
    test eax, eax
    jz .done
    mov dword [g_uiHotWidget], 9
    cmp dword [g_mouseLPressed], 0
    je .done
    mov dword [g_uiDropdownIndex], 2
    mov dword [g_uiDropdownOpen], 0
    call Camera_ApplyTuning

.done:
    add rsp, 40
    ret

UI_BuildGeometry:
    sub rsp, 56

    lea rax, [g_uiVertices]
    mov [g_uiWritePtr], rax
    mov dword [g_uiVertexCount], 0

    ; Dedicated UI-only pass: no sky/background quads here.
    ; This keeps the right panel isolated from world/backdrop rendering.
    mov dword [g_menuVisible], 1

.draw_panel:
    ; UI pass debug anchor
    mov ecx, UI_PANEL_X - 10
    mov edx, UI_PANEL_Y - 10
    mov r8d, UI_PANEL_W + 20
    mov r9d, UI_PANEL_H + 20
    mov eax, 08019D3FFh
    call UI_PushQuadPx

    ; Panel shadow
    mov ecx, UI_PANEL_X + 10
    mov edx, UI_PANEL_Y + 12
    mov r8d, UI_PANEL_W + 6
    mov r9d, UI_PANEL_H + 6
    mov eax, 0AA000000h
    call UI_PushQuadPx

    ; Panel background
    mov ecx, UI_PANEL_X
    mov edx, UI_PANEL_Y
    mov r8d, UI_PANEL_W
    mov r9d, UI_PANEL_H
    mov eax, 0FF1D2638h
    call UI_PushQuadPx

    ; panel border top
    mov ecx, UI_PANEL_X - 2
    mov edx, UI_PANEL_Y - 2
    mov r8d, UI_PANEL_W + 4
    mov r9d, 2
    mov eax, 0FFFFD46Ah
    call UI_PushQuadPx
    ; panel border bottom
    mov ecx, UI_PANEL_X - 2
    mov edx, UI_PANEL_Y + UI_PANEL_H
    mov r8d, UI_PANEL_W + 4
    mov r9d, 2
    mov eax, 0FFFFD46Ah
    call UI_PushQuadPx
    ; panel border left
    mov ecx, UI_PANEL_X - 2
    mov edx, UI_PANEL_Y - 2
    mov r8d, 2
    mov r9d, UI_PANEL_H + 4
    mov eax, 0FFFFF0A0h
    call UI_PushQuadPx
    ; panel border right
    mov ecx, UI_PANEL_X + UI_PANEL_W
    mov edx, UI_PANEL_Y - 2
    mov r8d, 2
    mov r9d, UI_PANEL_H + 4
    mov eax, 0FFFFF0A0h
    call UI_PushQuadPx

    ; inner panel fill for guaranteed visibility
    mov ecx, UI_PANEL_X + 8
    mov edx, UI_PANEL_Y + 34
    mov r8d, UI_PANEL_W - 16
    mov r9d, UI_PANEL_H - 42
    mov eax, 0EE101A28h
    call UI_PushQuadPx

    ; Title bar
    mov ecx, UI_PANEL_X
    mov edx, UI_PANEL_Y
    mov r8d, UI_PANEL_W
    mov r9d, UI_TITLE_H
    mov eax, 0FFF05A64h
    call UI_PushQuadPx

    ; Title mode chip
    mov ecx, UI_PANEL_X + UI_PANEL_W - 28
    mov edx, UI_PANEL_Y + 7
    mov r8d, 14
    mov r9d, 14
    mov eax, 0FF74E7FFh
    cmp dword [g_uiDropdownIndex], 0
    je .title_chip
    mov eax, 0FFFFB860h
    cmp dword [g_uiDropdownIndex], 1
    je .title_chip
    mov eax, 0FFFF76D8h
.title_chip:
    call UI_PushQuadPx

    ; RMB camera chip
    mov ecx, UI_PANEL_X + UI_PANEL_W - 50
    mov edx, UI_PANEL_Y + 7
    mov r8d, 14
    mov r9d, 14
    mov eax, 0FF48525Ah
    cmp dword [g_mouseRDown], 0
    je .rmb_chip_draw
    mov eax, 0FF74D870h
.rmb_chip_draw:
    call UI_PushQuadPx

    ; Title text
    lea rcx, [uiTextTitle]
    mov edx, UI_PANEL_X + 18
    mov r8d, UI_PANEL_Y + 7
    mov r9d, 0FFFFFFFFh
    call UI_DrawText3x5

    lea rcx, [uiTextActions]
    mov edx, UI_PANEL_X + 18
    mov r8d, UI_PANEL_Y + 42
    mov r9d, 0FFFFE6A8h
    call UI_DrawText3x5

    ; Button 1
    mov ecx, UI_BUTTON_X
    mov edx, UI_BUTTON1_Y
    mov r8d, UI_BUTTON_W
    mov r9d, UI_BUTTON_H
    mov eax, 0E05E4C3Ch
    cmp dword [g_uiHotWidget], 1
    jne .btn1_draw
    mov eax, 0EE2E5884h
.btn1_draw:
    call UI_PushQuadPx
    mov ecx, UI_BUTTON_X + 24
    mov edx, UI_BUTTON1_Y + 18
    mov r8d, 18
    mov r9d, 6
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx
    mov ecx, UI_BUTTON_X + 30
    mov edx, UI_BUTTON1_Y + 8
    mov r8d, 6
    mov r9d, 18
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx
    mov ecx, UI_BUTTON_X + 26
    mov edx, UI_BUTTON1_Y + 6
    mov r8d, 14
    mov r9d, 6
    mov eax, 0FF8EEFFFh
    call UI_PushQuadPx

    lea rcx, [uiTextActions]
    mov edx, UI_BUTTON_X
    mov r8d, UI_BUTTON1_Y - 26
    mov r9d, 0FFDBEADAh
    call UI_DrawText3x5

    lea rcx, [uiTextLift]
    mov edx, UI_BUTTON_X + 64
    mov r8d, UI_BUTTON1_Y + 7
    mov r9d, 0FFF7F3E0h
    call UI_DrawText3x5

    ; Button 2
    mov ecx, UI_BUTTON_X
    mov edx, UI_BUTTON2_Y
    mov r8d, UI_BUTTON_W
    mov r9d, UI_BUTTON_H
    mov eax, 0E05E4C3Ch
    cmp dword [g_uiHotWidget], 2
    jne .btn2_state
    mov eax, 0EE5C4A34h
.btn2_state:
    cmp dword [g_physicsPaused], 0
    je .btn2_draw
    mov eax, 0EE7E5038h
.btn2_draw:
    call UI_PushQuadPx
    cmp dword [g_physicsPaused], 0
    jne .btn2_play
    mov ecx, UI_BUTTON_X + 28
    mov edx, UI_BUTTON2_Y + 8
    mov r8d, 6
    mov r9d, 18
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx
    mov ecx, UI_BUTTON_X + 40
    mov edx, UI_BUTTON2_Y + 8
    mov r8d, 6
    mov r9d, 18
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx
    jmp .button3_draw
.btn2_play:
    mov ecx, UI_BUTTON_X + 27
    mov edx, UI_BUTTON2_Y + 8
    mov r8d, 18
    mov r9d, 18
    mov eax, 0FFFFD070h
    call UI_PushQuadPx

.button3_draw:
    cmp dword [g_physicsPaused], 0
    jne .btn2_label_play
    lea rcx, [uiTextPause]
    jmp .btn2_label_draw
.btn2_label_play:
    lea rcx, [uiTextPlay]
.btn2_label_draw:
    mov edx, UI_BUTTON_X + 64
    mov r8d, UI_BUTTON2_Y + 7
    mov r9d, 0FFF7F3E0h
    call UI_DrawText3x5

    mov ecx, UI_BUTTON_X
    mov edx, UI_BUTTON3_Y
    mov r8d, UI_BUTTON_W
    mov r9d, UI_BUTTON_H
    mov eax, 0E05E4C3Ch
    cmp dword [g_uiHotWidget], 3
    jne .btn3_draw
    mov eax, 0EE564060h
.btn3_draw:
    call UI_PushQuadPx
    mov ecx, UI_BUTTON_X + 24
    mov edx, UI_BUTTON3_Y + 10
    mov r8d, 22
    mov r9d, 14
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx
    mov ecx, UI_BUTTON_X + 28
    mov edx, UI_BUTTON3_Y + 14
    mov r8d, 6
    mov r9d, 6
    mov eax, 0FF2A323Ah
    call UI_PushQuadPx
    mov ecx, UI_BUTTON_X + 36
    mov edx, UI_BUTTON3_Y + 8
    mov r8d, 6
    mov r9d, 18
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx

    lea rcx, [uiTextReset]
    mov edx, UI_BUTTON_X + 64
    mov r8d, UI_BUTTON3_Y + 7
    mov r9d, 0FFF7F3E0h
    call UI_DrawText3x5

    lea rcx, [uiTextTune]
    mov edx, UI_SLIDER_X
    mov r8d, UI_SLIDER1_Y - 56
    mov r9d, 0FFD7E9FFh
    call UI_DrawText3x5

    lea rcx, [uiTextFov]
    mov edx, UI_SLIDER_X
    mov r8d, UI_SLIDER1_Y - 24
    mov r9d, 0FFF3E5BEh
    call UI_DrawText3x5

    ; Slider 1 track
    mov ecx, UI_SLIDER_X
    mov edx, UI_SLIDER1_Y
    mov r8d, UI_SLIDER_W
    mov r9d, UI_SLIDER_H
    mov eax, 0B84C4338h
    cmp dword [g_uiHotWidget], 4
    jne .s1_track
    mov eax, 0D86E6458h
.s1_track:
    call UI_PushQuadPx
    movss xmm0, [g_uiSliderFov01]
    mov eax, UI_SLIDER_W - 16
    cvtsi2ss xmm1, eax
    mulss xmm1, xmm0
    cvttss2si r8d, xmm1
    cmp r8d, 4
    jl .s1_knob
    mov ecx, UI_SLIDER_X + 8
    mov edx, UI_SLIDER1_Y + 6
    mov r9d, 6
    mov eax, 0FF74E7FFh
    call UI_PushQuadPx
.s1_knob:
    movss xmm0, [g_uiSliderFov01]
    mov eax, UI_SLIDER_W - 16
    cvtsi2ss xmm1, eax
    mulss xmm1, xmm0
    cvttss2si eax, xmm1
    add eax, UI_SLIDER_X + 4
    mov ecx, eax
    mov edx, UI_SLIDER1_Y + 2
    mov r8d, 12
    mov r9d, 14
    mov eax, 0FFE6F8FFh
    call UI_PushQuadPx

    lea rcx, [uiTextLight]
    mov edx, UI_SLIDER_X
    mov r8d, UI_SLIDER2_Y - 24
    mov r9d, 0FFFFD4A8h
    call UI_DrawText3x5

    ; Slider 2 track
    mov ecx, UI_SLIDER_X
    mov edx, UI_SLIDER2_Y
    mov r8d, UI_SLIDER_W
    mov r9d, UI_SLIDER_H
    mov eax, 0B84C4338h
    cmp dword [g_uiHotWidget], 5
    jne .s2_track
    mov eax, 0D8745E30h
.s2_track:
    call UI_PushQuadPx
    movss xmm0, [g_uiSliderLight01]
    mov eax, UI_SLIDER_W - 16
    cvtsi2ss xmm1, eax
    mulss xmm1, xmm0
    cvttss2si r8d, xmm1
    cmp r8d, 4
    jl .s2_knob
    mov ecx, UI_SLIDER_X + 8
    mov edx, UI_SLIDER2_Y + 6
    mov r9d, 6
    mov eax, 0FFFFB860h
    call UI_PushQuadPx
.s2_knob:
    movss xmm0, [g_uiSliderLight01]
    mov eax, UI_SLIDER_W - 16
    cvtsi2ss xmm1, eax
    mulss xmm1, xmm0
    cvttss2si eax, xmm1
    add eax, UI_SLIDER_X + 4
    mov ecx, eax
    mov edx, UI_SLIDER2_Y + 2
    mov r8d, 12
    mov r9d, 14
    mov eax, 0FFFFE0B0h
    call UI_PushQuadPx

    lea rcx, [uiTextModeHead]
    mov edx, UI_DROPDOWN_X
    mov r8d, UI_DROPDOWN_Y - 56
    mov r9d, 0FFFFD4A8h
    call UI_DrawText3x5

    lea rcx, [uiTextShader]
    mov edx, UI_DROPDOWN_X
    mov r8d, UI_DROPDOWN_Y - 26
    mov r9d, 0FFF0E9D6h
    call UI_DrawText3x5

    ; Dropdown header
    mov ecx, UI_DROPDOWN_X
    mov edx, UI_DROPDOWN_Y
    mov r8d, UI_DROPDOWN_W
    mov r9d, UI_DROPDOWN_H
    mov eax, 0E05E4C3Ch
    cmp dword [g_uiHotWidget], 6
    jne .drop_draw
    mov eax, 0F07C6650h
.drop_draw:
    call UI_PushQuadPx

    ; Selected mode chip in dropdown header
    mov ecx, UI_DROPDOWN_X + 16
    mov edx, UI_DROPDOWN_Y + 6
    mov r8d, 18
    mov r9d, 18
    mov eax, 0FF74E7FFh
    cmp dword [g_uiDropdownIndex], 0
    je .drop_chip
    mov eax, 0FFFFB860h
    cmp dword [g_uiDropdownIndex], 1
    je .drop_chip
    mov eax, 0FFFF76D8h
.drop_chip:
    call UI_PushQuadPx

    cmp dword [g_uiDropdownIndex], 0
    jne .drop_text_2
    lea rcx, [uiTextModeSky]
    jmp .drop_text_draw
.drop_text_2:
    cmp dword [g_uiDropdownIndex], 1
    jne .drop_text_3
    lea rcx, [uiTextModeForest]
    jmp .drop_text_draw
.drop_text_3:
    lea rcx, [uiTextModeSunset]
.drop_text_draw:
    mov edx, UI_DROPDOWN_X + 46
    mov r8d, UI_DROPDOWN_Y + 5
    mov r9d, 0FFF8F1D8h
    call UI_DrawText3x5

    ; Arrow glyph
    mov ecx, UI_DROPDOWN_X + UI_DROPDOWN_W - 26
    mov edx, UI_DROPDOWN_Y + 12
    mov r8d, 10
    mov r9d, 6
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx

    cmp dword [g_uiDropdownOpen], 0
    je .done

    ; Option 1
    mov ecx, UI_DROPDOWN_X
    mov edx, UI_DROPDOWN_OPT1_Y
    mov r8d, UI_DROPDOWN_W
    mov r9d, UI_DROPDOWN_OPT_H
    mov eax, 0E04E433Ah
    cmp dword [g_uiHotWidget], 7
    jne .opt1_draw
    mov eax, 0EE25384Ah
.opt1_draw:
    call UI_PushQuadPx
    mov ecx, UI_DROPDOWN_X + 14
    mov edx, UI_DROPDOWN_OPT1_Y + 4
    mov r8d, 18
    mov r9d, 18
    mov eax, 0FF74E7FFh
    call UI_PushQuadPx
    lea rcx, [uiTextModeSky]
    mov edx, UI_DROPDOWN_X + 42
    mov r8d, UI_DROPDOWN_OPT1_Y + 4
    mov r9d, 0FFF8F1D8h
    call UI_DrawText3x5

    ; Option 2
    mov ecx, UI_DROPDOWN_X
    mov edx, UI_DROPDOWN_OPT2_Y
    mov r8d, UI_DROPDOWN_W
    mov r9d, UI_DROPDOWN_OPT_H
    mov eax, 0E04E433Ah
    cmp dword [g_uiHotWidget], 8
    jne .opt2_draw
    mov eax, 0EE4C3620h
.opt2_draw:
    call UI_PushQuadPx
    mov ecx, UI_DROPDOWN_X + 14
    mov edx, UI_DROPDOWN_OPT2_Y + 4
    mov r8d, 18
    mov r9d, 18
    mov eax, 0FFFFB860h
    call UI_PushQuadPx
    lea rcx, [uiTextModeForest]
    mov edx, UI_DROPDOWN_X + 42
    mov r8d, UI_DROPDOWN_OPT2_Y + 4
    mov r9d, 0FFF8F1D8h
    call UI_DrawText3x5

    ; Option 3
    mov ecx, UI_DROPDOWN_X
    mov edx, UI_DROPDOWN_OPT3_Y
    mov r8d, UI_DROPDOWN_W
    mov r9d, UI_DROPDOWN_OPT_H
    mov eax, 0E04E433Ah
    cmp dword [g_uiHotWidget], 9
    jne .opt3_draw
    mov eax, 0EE4C2454h
.opt3_draw:
    call UI_PushQuadPx
    mov ecx, UI_DROPDOWN_X + 14
    mov edx, UI_DROPDOWN_OPT3_Y + 4
    mov r8d, 18
    mov r9d, 18
    mov eax, 0FFFF76D8h
    call UI_PushQuadPx
    lea rcx, [uiTextModeSunset]
    mov edx, UI_DROPDOWN_X + 42
    mov r8d, UI_DROPDOWN_OPT3_Y + 4
    mov r9d, 0FFF8F1D8h
    call UI_DrawText3x5

.done:
    lea rcx, [uiTextHelpHead]
    mov edx, UI_PANEL_X + 20
    mov r8d, UI_PANEL_Y + UI_PANEL_H - 160
    mov r9d, 0FFFFE0B8h
    call UI_DrawText3x5

    lea rcx, [uiTextLook]
    mov edx, UI_PANEL_X + 20
    mov r8d, UI_PANEL_Y + UI_PANEL_H - 130
    mov r9d, 0FFC6D3E8h
    call UI_DrawText3x5

    lea rcx, [uiTextMove]
    mov edx, UI_PANEL_X + 20
    mov r8d, UI_PANEL_Y + UI_PANEL_H - 104
    mov r9d, 0FFB7D9C0h
    call UI_DrawText3x5

    lea rcx, [uiTextClick]
    mov edx, UI_PANEL_X + 20
    mov r8d, UI_PANEL_Y + UI_PANEL_H - 78
    mov r9d, 0FFF0E3C8h
    call UI_DrawText3x5

    lea rcx, [uiTextExit]
    mov edx, UI_PANEL_X + 20
    mov r8d, UI_PANEL_Y + UI_PANEL_H - 52
    mov r9d, 0FF9FA9BAh
    call UI_DrawText3x5

    lea rcx, [uiTextSymbols]
    mov edx, UI_PANEL_X + 20
    mov r8d, UI_PANEL_Y + UI_PANEL_H - 26
    mov r9d, 0FFCFD7E6h
    call UI_DrawText3x5

    mov eax, [g_uiVertexCount]
    add rsp, 56
    ret
