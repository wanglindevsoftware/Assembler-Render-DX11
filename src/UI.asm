
section .text align=16

UI_Init:
    mov dword [g_uiMouseOver], 0
    mov dword [g_uiHotWidget], 0
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

UI_Update:
    sub rsp, 40

    mov dword [g_uiMouseOver], 0
    mov dword [g_uiHotWidget], 0

    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_PANEL_X
    mov r9d, UI_PANEL_Y
    mov r10d, UI_PANEL_W
    mov r11d, UI_PANEL_H
    call UI_PointInRectPx
    test eax, eax
    jz .button_checks
    mov dword [g_uiMouseOver], 1

.button_checks:
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
    je .done
    call Physics_LiftCube
    jmp .done

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
    je .done
    xor dword [g_physicsPaused], 1
    jmp .done

.button3:
    mov ecx, [g_mouseX]
    mov edx, [g_mouseY]
    mov r8d, UI_BUTTON_X
    mov r9d, UI_BUTTON3_Y
    mov r10d, UI_BUTTON_W
    mov r11d, UI_BUTTON_H
    call UI_PointInRectPx
    test eax, eax
    jz .done
    mov dword [g_uiHotWidget], 3
    cmp dword [g_mouseLPressed], 0
    je .done
    call Physics_Reset

.done:
    add rsp, 40
    ret

UI_BuildGeometry:
    sub rsp, 40

    lea rax, [g_uiVertices]
    mov [g_uiWritePtr], rax
    mov dword [g_uiVertexCount], 0

    ; Panel background
    mov ecx, UI_PANEL_X
    mov edx, UI_PANEL_Y
    mov r8d, UI_PANEL_W
    mov r9d, UI_PANEL_H
    mov eax, 0CC18212Bh
    call UI_PushQuadPx

    ; Title bar
    mov ecx, UI_PANEL_X
    mov edx, UI_PANEL_Y
    mov r8d, UI_PANEL_W
    mov r9d, 30
    mov eax, 0FF2B3A50h
    call UI_PushQuadPx

    ; Decorative lights
    mov ecx, UI_PANEL_X + 14
    mov edx, UI_PANEL_Y + 9
    mov r8d, 12
    mov r9d, 12
    mov eax, 0FF48C0FFh
    call UI_PushQuadPx

    mov ecx, UI_PANEL_X + 32
    mov edx, UI_PANEL_Y + 9
    mov r8d, 12
    mov r9d, 12
    mov eax, 0FFFFA048h
    call UI_PushQuadPx

    mov ecx, UI_PANEL_X + 50
    mov edx, UI_PANEL_Y + 9
    mov r8d, 12
    mov r9d, 12
    mov eax, 0FF80FF66h
    call UI_PushQuadPx

    ; Lift button
    mov ecx, UI_BUTTON_X
    mov edx, UI_BUTTON1_Y
    mov r8d, UI_BUTTON_W
    mov r9d, UI_BUTTON_H
    mov eax, 0CC243040h
    cmp dword [g_uiHotWidget], 1
    jne .lift_draw
    mov eax, 0EE366090h
.lift_draw:
    call UI_PushQuadPx

    ; Lift icon
    mov ecx, UI_BUTTON_X + 24
    mov edx, UI_BUTTON1_Y + 18
    mov r8d, 18
    mov r9d, 6
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx

    mov ecx, UI_BUTTON_X + 30
    mov edx, UI_BUTTON1_Y + 10
    mov r8d, 6
    mov r9d, 18
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx

    mov ecx, UI_BUTTON_X + 26
    mov edx, UI_BUTTON1_Y + 8
    mov r8d, 14
    mov r9d, 6
    mov eax, 0FFB8F0FFh
    call UI_PushQuadPx

    ; Pause button
    mov ecx, UI_BUTTON_X
    mov edx, UI_BUTTON2_Y
    mov r8d, UI_BUTTON_W
    mov r9d, UI_BUTTON_H
    mov eax, 0CC243040h
    cmp dword [g_uiHotWidget], 2
    jne .pause_state
    mov eax, 0EE705040h
.pause_state:
    cmp dword [g_physicsPaused], 0
    je .pause_draw
    mov eax, 0EE804040h
.pause_draw:
    call UI_PushQuadPx

    ; Pause icon / play stripe
    cmp dword [g_physicsPaused], 0
    jne .draw_paused_chip

    mov ecx, UI_BUTTON_X + 28
    mov edx, UI_BUTTON2_Y + 10
    mov r8d, 6
    mov r9d, 18
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx

    mov ecx, UI_BUTTON_X + 40
    mov edx, UI_BUTTON2_Y + 10
    mov r8d, 6
    mov r9d, 18
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx
    jmp .reset_button

.draw_paused_chip:
    mov ecx, UI_BUTTON_X + 26
    mov edx, UI_BUTTON2_Y + 10
    mov r8d, 20
    mov r9d, 18
    mov eax, 0FFFFD070h
    call UI_PushQuadPx

.reset_button:
    mov ecx, UI_BUTTON_X
    mov edx, UI_BUTTON3_Y
    mov r8d, UI_BUTTON_W
    mov r9d, UI_BUTTON_H
    mov eax, 0CC243040h
    cmp dword [g_uiHotWidget], 3
    jne .reset_draw
    mov eax, 0EE604060h
.reset_draw:
    call UI_PushQuadPx

    ; Reset icon
    mov ecx, UI_BUTTON_X + 24
    mov edx, UI_BUTTON3_Y + 10
    mov r8d, 22
    mov r9d, 6
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx

    mov ecx, UI_BUTTON_X + 24
    mov edx, UI_BUTTON3_Y + 10
    mov r8d, 6
    mov r9d, 18
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx

    mov ecx, UI_BUTTON_X + 40
    mov edx, UI_BUTTON3_Y + 10
    mov r8d, 6
    mov r9d, 18
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx

    mov ecx, UI_BUTTON_X + 24
    mov edx, UI_BUTTON3_Y + 22
    mov r8d, 22
    mov r9d, 6
    mov eax, 0FFF8F8F8h
    call UI_PushQuadPx

    ; Meter background
    mov ecx, UI_BAR_X
    mov edx, UI_BAR_Y
    mov r8d, UI_BAR_W
    mov r9d, UI_BAR_H
    mov eax, 0AA101418h
    call UI_PushQuadPx

    ; Meter fill
    movss xmm0, [g_cubeHeight01]
    mov eax, UI_BAR_W - 8
    cvtsi2ss xmm1, eax
    mulss xmm1, xmm0
    cvttss2si r8d, xmm1
    cmp r8d, 2
    jl .skip_bar_fill

    mov ecx, UI_BAR_X + 4
    mov edx, UI_BAR_Y + 4
    mov r9d, UI_BAR_H - 8
    mov eax, 0FF74D870h
    cmp dword [g_cubeHeld], 0
    je .bar_color_ok
    mov eax, 0FFFFC060h
.bar_color_ok:
    call UI_PushQuadPx

.skip_bar_fill:
    ; State chip: held / idle
    mov ecx, UI_BAR_X + UI_BAR_W - 28
    mov edx, UI_PANEL_Y + 8
    mov r8d, 16
    mov r9d, 16
    mov eax, 0FF586068h
    cmp dword [g_cubeHeld], 0
    je .held_chip_draw
    mov eax, 0FFFFC060h
.held_chip_draw:
    call UI_PushQuadPx

    mov eax, [g_uiVertexCount]
    add rsp, 40
    ret
