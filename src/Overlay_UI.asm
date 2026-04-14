
%define TRANSPARENT_BKMODE 1
%define DEFAULT_GUI_FONT_ID 17
%define SRCCOPY 00CC0020h

%define OVL_COL_PANEL_BG      002B231Bh
%define OVL_COL_PANEL_INNER   0036291Fh
%define OVL_COL_PANEL_SHADOW  00110D0Ah
%define OVL_COL_TITLE_BG      004A3456h
%define OVL_COL_BORDER        006AD6FFh
%define OVL_COL_TEXT          00EDE8E0h
%define OVL_COL_SUBTEXT       00BFD4E6h
%define OVL_COL_ACCENT        0098E6FFh
%define OVL_COL_WARN          0060B8FFh
%define OVL_COL_GOOD          0070D874h
%define OVL_COL_DANGER        005A4CFAh
%define OVL_COL_BUTTON        00403A34h
%define OVL_COL_BUTTON_HOT    00536A88h
%define OVL_COL_SLIDER_TRACK  00374454h
%define OVL_COL_SLIDER_FILL   009BD2FFh
%define OVL_COL_SLIDER_FILL2  0070C6FFh
%define OVL_COL_KNOB          00F2F2F2h
%define OVL_COL_MODE0         0074E7FFh
%define OVL_COL_MODE1         0070D874h
%define OVL_COL_MODE2         00D876FFh
%define OVL_COL_SECTION       002E3B4Bh
%define OVL_COL_FOOTER        00202A38h
%define OVL_COL_TEXT_SHADOW   00000000h

%define OVL_DST_X             UI_PANEL_X
%define OVL_DST_Y             UI_PANEL_Y
%define OVL_BUF_W             UI_PANEL_W
%define OVL_BUF_H             (UI_PANEL_H + 120)

section .rdata align=16
ovlTitle         db 'RIGHT PANEL [UI]', 0
ovlSubtitle      db 'overlay restored + dx11 ui fallback', 0
ovlSectionA      db 'ACTIONS + PHYSICS', 0
ovlSectionB      db 'CAMERA + LIGHT', 0
ovlSectionC      db 'SHADER MODE', 0
ovlFooterTitle   db 'SHORTCUTS', 0
ovlStatusTitle   db 'STATUS', 0
ovlStatusRun     db 'RUN', 0
ovlStatusPause   db 'PAUSED', 0
ovlStatusHeld    db 'HELD', 0
ovlStatusFree    db 'FREE', 0
ovlHelp1         db '[LMB] click   [RMB] look', 0
ovlHelp2         db '[W/S]=look dir   [A/D]=strafe', 0
ovlHelp3         db '[Q/E]=rise   terrain + sun bloom upgrade', 0
ovlFovText       db 'FOV', 0
ovlLightText     db 'LIGHT', 0
ovlModeText      db 'MODE', 0
ovlModeSky       db 'SKY', 0
ovlModeForest    db 'FOREST', 0
ovlModeSunset    db 'SUNSET', 0
ovlArrowText     db '>', 0

section .text align=16

OverlayUI_FillRectPx:
    ; rcx = hdc, edx = x, r8d = y, r9d = w, r10d = h, r11d = COLORREF
    sub rsp, 68h
    mov [rsp + 60h], rcx
    mov dword [rsp + 40h + RECT.left], edx
    mov dword [rsp + 40h + RECT.top], r8d
    mov eax, edx
    add eax, r9d
    mov dword [rsp + 40h + RECT.right], eax
    mov eax, r8d
    add eax, r10d
    mov dword [rsp + 40h + RECT.bottom], eax
    mov ecx, r11d
    call CreateSolidBrush
    test rax, rax
    jz .done
    mov [rsp + 58h], rax
    mov rcx, [rsp + 60h]
    lea rdx, [rsp + 40h]
    mov r8, [rsp + 58h]
    call FillRect
    mov rcx, [rsp + 58h]
    call DeleteObject
.done:
    add rsp, 68h
    ret

OverlayUI_TextOutZ:
    ; rcx = hdc, edx = x, r8d = y, r9 = zstr, r10d = COLORREF
    sub rsp, 48h
    mov [rsp + 40h], rcx
    mov dword [rsp + 38h], edx
    mov dword [rsp + 3Ch], r8d
    mov [rsp + 30h], r9
    mov dword [rsp + 28h], r10d

    mov rcx, r9
    call Log_StrLen
    mov dword [rsp + 20h], eax

    mov rcx, [rsp + 40h]
    mov edx, [rsp + 28h]
    call SetTextColor

    mov rcx, [rsp + 40h]
    mov edx, [rsp + 38h]
    mov r8d, [rsp + 3Ch]
    mov r9, [rsp + 30h]
    call TextOutA

    add rsp, 48h
    ret

OverlayUI_TextShadowZ:
    ; rcx = hdc, edx = x, r8d = y, r9 = zstr, r10d = COLORREF
    sub rsp, 48h
    mov [rsp + 40h], rcx
    mov dword [rsp + 38h], edx
    mov dword [rsp + 3Ch], r8d
    mov [rsp + 30h], r9
    mov dword [rsp + 28h], r10d

    mov rcx, [rsp + 40h]
    mov edx, [rsp + 38h]
    add edx, 1
    mov r8d, [rsp + 3Ch]
    add r8d, 1
    mov r9, [rsp + 30h]
    mov r10d, OVL_COL_TEXT_SHADOW
    call OverlayUI_TextOutZ

    mov rcx, [rsp + 40h]
    mov edx, [rsp + 38h]
    mov r8d, [rsp + 3Ch]
    mov r9, [rsp + 30h]
    mov r10d, [rsp + 28h]
    call OverlayUI_TextOutZ

    add rsp, 48h
    ret


OverlayUI_UpdateMouseFromPanelLParam:
    ; r9d = panel-local lParam
    mov eax, r9d
    movsx eax, ax
    add eax, UI_PANEL_X
    mov edx, r9d
    shr edx, 16
    movsx edx, dx
    add edx, UI_PANEL_Y

    cmp dword [g_mouseInitialized], 0
    jne .delta
    mov dword [g_mouseInitialized], 1
    mov dword [g_mouseDX], 0
    mov dword [g_mouseDY], 0
    jmp .store
.delta:
    mov ecx, eax
    sub ecx, [g_mouseX]
    add [g_mouseDX], ecx

    mov ecx, edx
    sub ecx, [g_mouseY]
    add [g_mouseDY], ecx
.store:
    mov [g_mouseX], eax
    mov [g_mouseY], edx
    ret

OverlayUI_WndProc:
    sub rsp, 40h

    cmp edx, WM_ERASEBKGND
    je .erase
    cmp edx, WM_PAINT
    je .paint
    cmp edx, WM_MOUSEMOVE
    je .mouse_move
    cmp edx, WM_LBUTTONDOWN
    je .mouse_down
    cmp edx, WM_LBUTTONUP
    je .mouse_up
    cmp edx, WM_RBUTTONDOWN
    je .right_down
    cmp edx, WM_RBUTTONUP
    je .right_up

.default_proc:
    call DefWindowProcA
    add rsp, 40h
    ret

.erase:
    mov eax, 1
    add rsp, 40h
    ret

.paint:
    xor edx, edx
    call ValidateRect
    xor eax, eax
    add rsp, 40h
    ret

.mouse_move:
    call OverlayUI_UpdateMouseFromPanelLParam
    xor eax, eax
    add rsp, 40h
    ret

.mouse_down:
    call OverlayUI_UpdateMouseFromPanelLParam
    cmp dword [g_mouseLDown], 0
    jne .mouse_down_done
    mov dword [g_mouseLPressed], 1
.mouse_down_done:
    mov dword [g_mouseLDown], 1
    xor eax, eax
    add rsp, 40h
    ret

.mouse_up:
    call OverlayUI_UpdateMouseFromPanelLParam
    cmp dword [g_mouseLDown], 0
    je .mouse_up_done
    mov dword [g_mouseLReleased], 1
.mouse_up_done:
    mov dword [g_mouseLDown], 0
    xor eax, eax
    add rsp, 40h
    ret

.right_down:
    call OverlayUI_UpdateMouseFromPanelLParam
    cmp dword [g_mouseRDown], 0
    jne .right_down_done
    mov dword [g_mouseRPressed], 1
.right_down_done:
    mov dword [g_mouseRDown], 1
    mov rcx, [g_ovlWnd]
    test rcx, rcx
    jz .rd_done
    call SetCapture
.rd_done:
    xor eax, eax
    add rsp, 40h
    ret

.right_up:
    call OverlayUI_UpdateMouseFromPanelLParam
    cmp dword [g_mouseRDown], 0
    je .right_up_done
    mov dword [g_mouseRReleased], 1
.right_up_done:
    mov dword [g_mouseRDown], 0
    call ReleaseCapture
    xor eax, eax
    add rsp, 40h
    ret


OverlayUI_EnsureSurface:
    ; rcx = window HDC
    sub rsp, 40h
    cmp qword [g_ovlMemDC], 0
    jne .ok

    mov [rsp + 20h], rcx
    mov rcx, [rsp + 20h]
    call CreateCompatibleDC
    test rax, rax
    jz .fail
    mov [g_ovlMemDC], rax

    mov rcx, [rsp + 20h]
    mov edx, OVL_BUF_W
    mov r8d, OVL_BUF_H
    call CreateCompatibleBitmap
    test rax, rax
    jz .bitmap_fail
    mov [g_ovlBitmap], rax

    mov rcx, [g_ovlMemDC]
    mov rdx, [g_ovlBitmap]
    call SelectObject
    mov [g_ovlOldBitmap], rax

.ok:
    mov eax, 1
    add rsp, 40h
    ret

.bitmap_fail:
    mov rcx, [g_ovlMemDC]
    test rcx, rcx
    jz .fail
    call DeleteDC
    mov qword [g_ovlMemDC], 0
.fail:
    mov qword [g_ovlBitmap], 0
    mov qword [g_ovlOldBitmap], 0
    xor eax, eax
    add rsp, 40h
    ret

OverlayUI_Shutdown:
    sub rsp, 40h
    mov rcx, [g_ovlMemDC]
    test rcx, rcx
    jz .skip_bmp
    mov rdx, [g_ovlOldBitmap]
    test rdx, rdx
    jz .skip_bmp
    call SelectObject
.skip_bmp:
    mov rcx, [g_ovlBitmap]
    test rcx, rcx
    jz .skip_delbmp
    call DeleteObject
.skip_delbmp:
    mov rcx, [g_ovlMemDC]
    test rcx, rcx
    jz .done
    call DeleteDC
.done:
    mov qword [g_ovlOldBitmap], 0
    mov qword [g_ovlBitmap], 0
    mov qword [g_ovlMemDC], 0
    add rsp, 40h
    ret

OverlayUI_Draw:
    sub rsp, 0B8h
    xor eax, eax
    mov [rsp + 90h], rax      ; old font
    mov [rsp + 0A8h], rax     ; hdcMem
    mov [rsp + 0B0h], rax     ; hdcWin

    cmp dword [g_menuVisible], 0
    je .done
    mov rcx, [g_ovlWnd]
    test rcx, rcx
    jnz .have_target
    mov rcx, [g_hWnd]
    test rcx, rcx
    jz .done
.have_target:
    call GetDC
    test rax, rax
    jz .done
    mov [rsp + 0B0h], rax

    mov rcx, rax
    call OverlayUI_EnsureSurface
    test eax, eax
    jz .cleanup

    mov rax, [g_ovlMemDC]
    mov [rsp + 0A8h], rax

    mov ecx, DEFAULT_GUI_FONT_ID
    call GetStockObject
    test rax, rax
    jz .font_done
    mov rcx, [rsp + 0A8h]
    mov rdx, rax
    call SelectObject
    mov [rsp + 90h], rax
.font_done:

    mov rcx, [rsp + 0A8h]
    mov edx, TRANSPARENT_BKMODE
    call SetBkMode

    ; stable buffered overlay: fully repaint the panel texture offscreen, then single blit.
    mov rcx, [rsp + 0A8h]
    xor edx, edx
    xor r8d, r8d
    mov r9d, OVL_BUF_W
    mov r10d, OVL_BUF_H
    mov r11d, OVL_COL_PANEL_SHADOW
    call OverlayUI_FillRectPx

    ; hard pinned panel in the user's red square area (local coords inside the offscreen bitmap)
    mov rcx, [rsp + 0A8h]
    mov edx, 6
    mov r8d, 8
    mov r9d, UI_PANEL_W
    mov r10d, UI_PANEL_H + 120
    mov r11d, OVL_COL_PANEL_SHADOW
    call OverlayUI_FillRectPx

    mov rcx, [rsp + 0A8h]
    mov edx, 0
    mov r8d, 0
    mov r9d, UI_PANEL_W
    mov r10d, UI_PANEL_H + 120
    mov r11d, OVL_COL_PANEL_BG
    call OverlayUI_FillRectPx

    mov rcx, [rsp + 0A8h]
    mov edx, 4
    mov r8d, 4
    mov r9d, UI_PANEL_W - 8
    mov r10d, UI_PANEL_H + 112
    mov r11d, OVL_COL_PANEL_INNER
    call OverlayUI_FillRectPx

    ; border
    mov rcx, [rsp + 0A8h]
    mov edx, 0
    mov r8d, 0
    mov r9d, UI_PANEL_W
    mov r10d, 2
    mov r11d, OVL_COL_BORDER
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, 0
    mov r8d, OVL_BUF_H - 2
    mov r9d, UI_PANEL_W
    mov r10d, 2
    mov r11d, OVL_COL_BORDER
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, 0
    mov r8d, 0
    mov r9d, 2
    mov r10d, OVL_BUF_H
    mov r11d, OVL_COL_BORDER
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, UI_PANEL_W - 2
    mov r8d, 0
    mov r9d, 2
    mov r10d, OVL_BUF_H
    mov r11d, OVL_COL_BORDER
    call OverlayUI_FillRectPx

    ; title bar
    mov rcx, [rsp + 0A8h]
    mov edx, 0
    mov r8d, 0
    mov r9d, UI_PANEL_W
    mov r10d, 34
    mov r11d, OVL_COL_TITLE_BG
    call OverlayUI_FillRectPx

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 14) - OVL_DST_X
    mov r8d, 8
    lea r9, [ovlTitle]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 14) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + 48) - OVL_DST_Y
    lea r9, [ovlSubtitle]
    mov r10d, OVL_COL_SUBTEXT
    call OverlayUI_TextShadowZ

    ; section bars
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 12) - OVL_DST_X
    mov r8d, (UI_BUTTON1_Y - 30) - OVL_DST_Y
    mov r9d, UI_PANEL_W - 24
    mov r10d, 16
    mov r11d, OVL_COL_SECTION
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 18) - OVL_DST_X
    mov r8d, (UI_BUTTON1_Y - 28) - OVL_DST_Y
    lea r9, [ovlSectionA]
    mov r10d, OVL_COL_SUBTEXT
    call OverlayUI_TextShadowZ

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 12) - OVL_DST_X
    mov r8d, (UI_SLIDER1_Y - 30) - OVL_DST_Y
    mov r9d, UI_PANEL_W - 24
    mov r10d, 16
    mov r11d, OVL_COL_SECTION
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 18) - OVL_DST_X
    mov r8d, (UI_SLIDER1_Y - 28) - OVL_DST_Y
    lea r9, [ovlSectionB]
    mov r10d, OVL_COL_SUBTEXT
    call OverlayUI_TextShadowZ

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 12) - OVL_DST_X
    mov r8d, (UI_DROPDOWN_Y - 30) - OVL_DST_Y
    mov r9d, UI_PANEL_W - 24
    mov r10d, 16
    mov r11d, OVL_COL_SECTION
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 18) - OVL_DST_X
    mov r8d, (UI_DROPDOWN_Y - 28) - OVL_DST_Y
    lea r9, [ovlSectionC]
    mov r10d, OVL_COL_SUBTEXT
    call OverlayUI_TextShadowZ

    ; mode chip
    mov eax, OVL_COL_MODE0
    cmp dword [g_uiDropdownIndex], 0
    je .mode_chip_color_ok
    mov eax, OVL_COL_MODE1
    cmp dword [g_uiDropdownIndex], 1
    je .mode_chip_color_ok
    mov eax, OVL_COL_MODE2
.mode_chip_color_ok:
    mov dword [rsp + 70h], eax
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + UI_PANEL_W - 28) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + 10) - OVL_DST_Y
    mov r9d, 12
    mov r10d, 12
    mov r11d, [rsp + 70h]
    call OverlayUI_FillRectPx

    ; RMB chip
    mov eax, OVL_COL_WARN
    cmp dword [g_mouseRDown], 0
    je .rmb_chip_color_ok
    mov eax, OVL_COL_GOOD
.rmb_chip_color_ok:
    mov dword [rsp + 74h], eax
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + UI_PANEL_W - 48) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + 10) - OVL_DST_Y
    mov r9d, 12
    mov r10d, 12
    mov r11d, [rsp + 74h]
    call OverlayUI_FillRectPx

    ; buttons
    mov eax, OVL_COL_BUTTON
    cmp dword [g_uiHotWidget], 1
    jne .b1_ok
    mov eax, OVL_COL_BUTTON_HOT
.b1_ok:
    mov dword [rsp + 78h], eax
    mov rcx, [rsp + 0A8h]
    mov edx, UI_BUTTON_X - OVL_DST_X
    mov r8d, UI_BUTTON1_Y - OVL_DST_Y
    mov r9d, UI_BUTTON_W
    mov r10d, UI_BUTTON_H
    mov r11d, [rsp + 78h]
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_BUTTON_X + 18) - OVL_DST_X
    mov r8d, (UI_BUTTON1_Y + 9) - OVL_DST_Y
    lea r9, [uiTextLift]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    mov eax, OVL_COL_BUTTON
    cmp dword [g_uiHotWidget], 2
    jne .b2_hot_done
    mov eax, OVL_COL_BUTTON_HOT
.b2_hot_done:
    cmp dword [g_physicsPaused], 0
    je .b2_ok
    mov eax, OVL_COL_GOOD
.b2_ok:
    mov dword [rsp + 7Ch], eax
    mov rcx, [rsp + 0A8h]
    mov edx, UI_BUTTON_X - OVL_DST_X
    mov r8d, UI_BUTTON2_Y - OVL_DST_Y
    mov r9d, UI_BUTTON_W
    mov r10d, UI_BUTTON_H
    mov r11d, [rsp + 7Ch]
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_BUTTON_X + 18) - OVL_DST_X
    mov r8d, (UI_BUTTON2_Y + 9) - OVL_DST_Y
    cmp dword [g_physicsPaused], 0
    jne .b2_play_text
    lea r9, [uiTextPause]
    jmp .b2_draw_text
.b2_play_text:
    lea r9, [uiTextPlay]
.b2_draw_text:
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    mov eax, OVL_COL_BUTTON
    cmp dword [g_uiHotWidget], 3
    jne .b3_ok
    mov eax, OVL_COL_DANGER
.b3_ok:
    mov dword [rsp + 68h], eax
    mov rcx, [rsp + 0A8h]
    mov edx, UI_BUTTON_X - OVL_DST_X
    mov r8d, UI_BUTTON3_Y - OVL_DST_Y
    mov r9d, UI_BUTTON_W
    mov r10d, UI_BUTTON_H
    mov r11d, [rsp + 68h]
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_BUTTON_X + 18) - OVL_DST_X
    mov r8d, (UI_BUTTON3_Y + 9) - OVL_DST_Y
    lea r9, [uiTextReset]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    ; slider labels
    mov rcx, [rsp + 0A8h]
    mov edx, UI_SLIDER_X - OVL_DST_X
    mov r8d, (UI_SLIDER1_Y - 22) - OVL_DST_Y
    lea r9, [ovlFovText]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    mov rcx, [rsp + 0A8h]
    mov edx, UI_SLIDER_X - OVL_DST_X
    mov r8d, (UI_SLIDER2_Y - 22) - OVL_DST_Y
    lea r9, [ovlLightText]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    ; slider 1
    mov rcx, [rsp + 0A8h]
    mov edx, UI_SLIDER_X - OVL_DST_X
    mov r8d, UI_SLIDER1_Y - OVL_DST_Y
    mov r9d, UI_SLIDER_W
    mov r10d, UI_SLIDER_H
    mov r11d, OVL_COL_SLIDER_TRACK
    call OverlayUI_FillRectPx
    movss xmm0, [g_uiSliderFov01]
    mov eax, UI_SLIDER_W - 16
    cvtsi2ss xmm1, eax
    mulss xmm1, xmm0
    cvttss2si eax, xmm1
    mov dword [rsp + 6Ch], eax
    cmp eax, 2
    jl .s1_knob
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_SLIDER_X + 4) - OVL_DST_X
    mov r8d, (UI_SLIDER1_Y + 5) - OVL_DST_Y
    mov r9d, [rsp + 6Ch]
    mov r10d, 8
    mov r11d, OVL_COL_SLIDER_FILL
    call OverlayUI_FillRectPx
.s1_knob:
    mov ecx, [rsp + 6Ch]
    add ecx, (UI_SLIDER_X + 4) - OVL_DST_X
    mov [rsp + 64h], ecx
    mov rcx, [rsp + 0A8h]
    mov edx, [rsp + 64h]
    mov r8d, (UI_SLIDER1_Y + 2) - OVL_DST_Y
    mov r9d, 12
    mov r10d, 14
    mov r11d, OVL_COL_KNOB
    call OverlayUI_FillRectPx

    ; slider 2
    mov rcx, [rsp + 0A8h]
    mov edx, UI_SLIDER_X - OVL_DST_X
    mov r8d, UI_SLIDER2_Y - OVL_DST_Y
    mov r9d, UI_SLIDER_W
    mov r10d, UI_SLIDER_H
    mov r11d, OVL_COL_SLIDER_TRACK
    call OverlayUI_FillRectPx
    movss xmm0, [g_uiSliderLight01]
    mov eax, UI_SLIDER_W - 16
    cvtsi2ss xmm1, eax
    mulss xmm1, xmm0
    cvttss2si eax, xmm1
    mov dword [rsp + 5Ch], eax
    cmp eax, 2
    jl .s2_knob
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_SLIDER_X + 4) - OVL_DST_X
    mov r8d, (UI_SLIDER2_Y + 5) - OVL_DST_Y
    mov r9d, [rsp + 5Ch]
    mov r10d, 8
    mov r11d, OVL_COL_SLIDER_FILL2
    call OverlayUI_FillRectPx
.s2_knob:
    mov ecx, [rsp + 5Ch]
    add ecx, (UI_SLIDER_X + 4) - OVL_DST_X
    mov [rsp + 54h], ecx
    mov rcx, [rsp + 0A8h]
    mov edx, [rsp + 54h]
    mov r8d, (UI_SLIDER2_Y + 2) - OVL_DST_Y
    mov r9d, 12
    mov r10d, 14
    mov r11d, OVL_COL_KNOB
    call OverlayUI_FillRectPx

    ; dropdown
    mov rcx, [rsp + 0A8h]
    mov edx, UI_DROPDOWN_X - OVL_DST_X
    mov r8d, (UI_DROPDOWN_Y - 22) - OVL_DST_Y
    lea r9, [ovlModeText]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    mov eax, OVL_COL_BUTTON
    cmp dword [g_uiHotWidget], 6
    jne .drop_ok
    mov eax, OVL_COL_BUTTON_HOT
.drop_ok:
    mov dword [rsp + 50h], eax
    mov rcx, [rsp + 0A8h]
    mov edx, UI_DROPDOWN_X - OVL_DST_X
    mov r8d, UI_DROPDOWN_Y - OVL_DST_Y
    mov r9d, UI_DROPDOWN_W
    mov r10d, UI_DROPDOWN_H
    mov r11d, [rsp + 50h]
    call OverlayUI_FillRectPx

    mov eax, OVL_COL_MODE0
    cmp dword [g_uiDropdownIndex], 0
    je .drop_chip_ok
    mov eax, OVL_COL_MODE1
    cmp dword [g_uiDropdownIndex], 1
    je .drop_chip_ok
    mov eax, OVL_COL_MODE2
.drop_chip_ok:
    mov dword [rsp + 4Ch], eax
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_DROPDOWN_X + 12) - OVL_DST_X
    mov r8d, (UI_DROPDOWN_Y + 7) - OVL_DST_Y
    mov r9d, 16
    mov r10d, 16
    mov r11d, [rsp + 4Ch]
    call OverlayUI_FillRectPx

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_DROPDOWN_X + 40) - OVL_DST_X
    mov r8d, (UI_DROPDOWN_Y + 7) - OVL_DST_Y
    cmp dword [g_uiDropdownIndex], 0
    jne .mode1
    lea r9, [ovlModeSky]
    jmp .mode_draw
.mode1:
    cmp dword [g_uiDropdownIndex], 1
    jne .mode2
    lea r9, [ovlModeForest]
    jmp .mode_draw
.mode2:
    lea r9, [ovlModeSunset]
.mode_draw:
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_DROPDOWN_X + UI_DROPDOWN_W - 18) - OVL_DST_X
    mov r8d, (UI_DROPDOWN_Y + 7) - OVL_DST_Y
    lea r9, [ovlArrowText]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    cmp dword [g_uiDropdownOpen], 0
    je .help
    mov rcx, [rsp + 0A8h]
    mov edx, UI_DROPDOWN_X - OVL_DST_X
    mov r8d, UI_DROPDOWN_OPT1_Y - OVL_DST_Y
    mov r9d, UI_DROPDOWN_W
    mov r10d, UI_DROPDOWN_OPT_H
    mov r11d, OVL_COL_BUTTON
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, UI_DROPDOWN_X - OVL_DST_X
    mov r8d, UI_DROPDOWN_OPT2_Y - OVL_DST_Y
    mov r9d, UI_DROPDOWN_W
    mov r10d, UI_DROPDOWN_OPT_H
    mov r11d, OVL_COL_BUTTON
    call OverlayUI_FillRectPx
    mov rcx, [rsp + 0A8h]
    mov edx, UI_DROPDOWN_X - OVL_DST_X
    mov r8d, UI_DROPDOWN_OPT3_Y - OVL_DST_Y
    mov r9d, UI_DROPDOWN_W
    mov r10d, UI_DROPDOWN_OPT_H
    mov r11d, OVL_COL_BUTTON
    call OverlayUI_FillRectPx

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_DROPDOWN_X + 14) - OVL_DST_X
    mov r8d, (UI_DROPDOWN_OPT1_Y + 4) - OVL_DST_Y
    lea r9, [ovlModeSky]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_DROPDOWN_X + 14) - OVL_DST_X
    mov r8d, (UI_DROPDOWN_OPT2_Y + 4) - OVL_DST_Y
    lea r9, [ovlModeForest]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_DROPDOWN_X + 14) - OVL_DST_X
    mov r8d, (UI_DROPDOWN_OPT3_Y + 4) - OVL_DST_Y
    lea r9, [ovlModeSunset]
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

.help:
    ; footer block
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 10) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 4) - OVL_DST_Y
    mov r9d, UI_PANEL_W - 20
    mov r10d, 100
    mov r11d, OVL_COL_FOOTER
    call OverlayUI_FillRectPx

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 18) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 14) - OVL_DST_Y
    lea r9, [ovlFooterTitle]
    mov r10d, OVL_COL_ACCENT
    call OverlayUI_TextShadowZ

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 168) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 14) - OVL_DST_Y
    lea r9, [ovlStatusTitle]
    mov r10d, OVL_COL_ACCENT
    call OverlayUI_TextShadowZ

    mov eax, OVL_COL_GOOD
    cmp dword [g_physicsPaused], 0
    je .run_chip_col
    mov eax, OVL_COL_DANGER
.run_chip_col:
    mov dword [rsp + 48h], eax
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 170) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 36) - OVL_DST_Y
    mov r9d, 44
    mov r10d, 14
    mov r11d, [rsp + 48h]
    call OverlayUI_FillRectPx

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 180) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 37) - OVL_DST_Y
    cmp dword [g_physicsPaused], 0
    jne .paused_text
    lea r9, [ovlStatusRun]
    jmp .run_text_go
.paused_text:
    lea r9, [ovlStatusPause]
.run_text_go:
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    mov eax, OVL_COL_MODE0
    cmp dword [g_cubeHeld], 0
    jne .held_chip_col
    mov eax, OVL_COL_SECTION
.held_chip_col:
    mov dword [rsp + 44h], eax
    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 220) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 36) - OVL_DST_Y
    mov r9d, 44
    mov r10d, 14
    mov r11d, [rsp + 44h]
    call OverlayUI_FillRectPx

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 231) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 37) - OVL_DST_Y
    cmp dword [g_cubeHeld], 0
    jne .held_text
    lea r9, [ovlStatusFree]
    jmp .held_text_go
.held_text:
    lea r9, [ovlStatusHeld]
.held_text_go:
    mov r10d, OVL_COL_TEXT
    call OverlayUI_TextShadowZ

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 18) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 60) - OVL_DST_Y
    lea r9, [ovlHelp1]
    mov r10d, OVL_COL_SUBTEXT
    call OverlayUI_TextShadowZ

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 18) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 78) - OVL_DST_Y
    lea r9, [ovlHelp2]
    mov r10d, OVL_COL_SUBTEXT
    call OverlayUI_TextShadowZ

    mov rcx, [rsp + 0A8h]
    mov edx, (UI_PANEL_X + 18) - OVL_DST_X
    mov r8d, (UI_PANEL_Y + UI_PANEL_H + 96) - OVL_DST_Y
    lea r9, [ovlHelp3]
    mov r10d, OVL_COL_ACCENT
    call OverlayUI_TextShadowZ

    ; one final blit to the real window DC = much less flicker.
    mov rcx, [rsp + 0B0h]
    mov edx, OVL_DST_X
    mov r8d, OVL_DST_Y
    mov r9d, OVL_BUF_W
    mov dword [rsp + 20h], OVL_BUF_H
    mov rax, [rsp + 0A8h]
    mov [rsp + 28h], rax
    xor eax, eax
    mov dword [rsp + 30h], eax
    mov dword [rsp + 38h], eax
    mov dword [rsp + 40h], SRCCOPY
    call BitBlt

.cleanup:
    cmp qword [rsp + 90h], 0
    je .skip_restore_font
    cmp qword [rsp + 0A8h], 0
    je .skip_restore_font
    mov rcx, [rsp + 0A8h]
    mov rdx, [rsp + 90h]
    call SelectObject
.skip_restore_font:

    cmp qword [rsp + 0B0h], 0
    je .done
    mov rcx, [g_ovlWnd]
    test rcx, rcx
    jnz .rel_ok
    mov rcx, [g_hWnd]
.rel_ok:
    mov rdx, [rsp + 0B0h]
    call ReleaseDC

.done:
    add rsp, 0B8h
    ret
