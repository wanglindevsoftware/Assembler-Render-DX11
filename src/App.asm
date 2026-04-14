section .text align=16

global WinMainCRTStartup

WinMainCRTStartup:
    sub rsp, 40

    call Log_Init
    call Crash_Install

    lea rcx, [stageAppBoot]
    call Log_SetStage
    lea rcx, [logAppStart]
    call Log_Info

    lea rcx, [stageWindowInit]
    call Log_SetStage
    call App_InitWindow
    test eax, eax
    jz .window_fail

    lea rcx, [logWindowCreated]
    call Log_Info

    lea rcx, [stageRendererInit]
    call Log_SetStage
    call Renderer_Init
    test eax, eax
    jz .d3d_fail

    call App_ShowWindow
    lea rcx, [logWindowShown]
    call Log_Info

    call Physics_Init
    call Camera_Init
    call UI_Init

    mov dword [g_running], 1
    call GetTickCount64
    mov [g_lastTick], rax

.main_loop:
    lea rcx, [stageMainLoop]
    call Log_SetStage

    lea rcx, [stageMainLoopPump]
    call Log_SetStage
    call App_PumpMessages
    cmp dword [g_running], 0
    je .done

    lea rcx, [stageMainLoopDelta]
    call Log_SetStage
    call App_UpdateDeltaTime

    lea rcx, [stageMainLoopUI]
    call Log_SetStage
    call UI_Update

    lea rcx, [stageMainLoopCamera]
    call Log_SetStage
    call Camera_Update

    lea rcx, [stageMainLoopPhysics]
    call Log_SetStage
    call Physics_Update

    lea rcx, [stageMainLoopRenderCall]
    call Log_SetStage
    call Renderer_RenderFrame
    test eax, eax
    jnz .frame_ok

    lea rcx, [logFrameRenderFail]
    call Log_Error

    xor ecx, ecx
    lea rdx, [msgPresentFail]
    lea r8,  [msgCaption]
    mov r9d, MB_ICONERROR
    call MessageBoxA
    mov dword [g_running], 0

.frame_ok:
    lea rcx, [stageMainLoopEndInput]
    call Log_SetStage
    call App_EndInputFrame
    jmp .main_loop

.done:
    lea rcx, [logExit]
    call Log_Info
    call Renderer_Shutdown
    call Crash_Remove
    call Log_Close
    xor ecx, ecx
    call ExitProcess

.window_fail:
    lea rcx, [logInitFail]
    call Log_Error
    xor ecx, ecx
    lea rdx, [msgWindowFail]
    lea r8,  [msgCaption]
    mov r9d, MB_ICONERROR
    call MessageBoxA
    call Renderer_Shutdown
    call Crash_Remove
    call Log_Close
    mov ecx, 1
    call ExitProcess

.d3d_fail:
    lea rcx, [logInitFail]
    call Log_Error
    xor ecx, ecx
    lea rdx, [msgInitFail]
    lea r8,  [msgCaption]
    mov r9d, MB_ICONERROR
    call MessageBoxA
    call Renderer_Shutdown
    call Crash_Remove
    call Log_Close
    mov ecx, 2
    call ExitProcess

App_UpdateMouseFromLParam:
    ; r9d = lParam
    mov eax, r9d
    movsx eax, ax
    mov edx, r9d
    shr edx, 16
    movsx edx, dx

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

WndProc:
    sub rsp, 40

    cmp edx, WM_CLOSE
    je .close_now

    cmp edx, WM_DESTROY
    je .destroy_now

    cmp edx, WM_ERASEBKGND
    je .erase_bkgnd

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

    cmp edx, WM_KEYDOWN
    je .key_down

    cmp edx, WM_KEYUP
    je .key_up

.default_proc:
    call DefWindowProcA
    add rsp, 40
    ret

.erase_bkgnd:
    mov eax, 1
    add rsp, 40
    ret

.mouse_move:
    call App_UpdateMouseFromLParam
    xor eax, eax
    add rsp, 40
    ret

.mouse_down:
    call App_UpdateMouseFromLParam
    cmp dword [g_mouseLDown], 0
    jne .mouse_down_done
    mov dword [g_mouseLPressed], 1
.mouse_down_done:
    mov dword [g_mouseLDown], 1
    xor eax, eax
    add rsp, 40
    ret

.mouse_up:
    call App_UpdateMouseFromLParam
    cmp dword [g_mouseLDown], 0
    je .mouse_up_done
    mov dword [g_mouseLReleased], 1
.mouse_up_done:
    mov dword [g_mouseLDown], 0
    xor eax, eax
    add rsp, 40
    ret

.right_down:
    call App_UpdateMouseFromLParam
    cmp dword [g_mouseRDown], 0
    jne .right_down_done
    mov dword [g_mouseRPressed], 1
.right_down_done:
    mov dword [g_mouseRDown], 1
    mov rcx, [g_hWnd]
    call SetCapture
    xor eax, eax
    add rsp, 40
    ret

.right_up:
    call App_UpdateMouseFromLParam
    cmp dword [g_mouseRDown], 0
    je .right_up_done
    mov dword [g_mouseRReleased], 1
.right_up_done:
    mov dword [g_mouseRDown], 0
    call ReleaseCapture
    xor eax, eax
    add rsp, 40
    ret

.key_down:
    cmp r8d, VK_ESCAPE
    je .close_now

    cmp r8d, VK_SPACE
    jne .check_p_down
    cmp dword [g_spaceDown], 0
    jne .handled
    mov dword [g_spaceDown], 1
    mov dword [g_spacePressed], 1
    jmp .handled

.check_p_down:
    cmp r8d, VK_P
    jne .check_r_down
    cmp dword [g_pDown], 0
    jne .handled
    mov dword [g_pDown], 1
    mov dword [g_pPressed], 1
    jmp .handled

.check_r_down:
    cmp r8d, VK_R
    jne .check_tab_down
    cmp dword [g_rDown], 0
    jne .handled
    mov dword [g_rDown], 1
    mov dword [g_rPressed], 1
    jmp .handled

.check_tab_down:
    cmp r8d, VK_TAB
    jne .check_move_down
    cmp dword [g_tabDown], 0
    jne .handled
    mov dword [g_tabDown], 1
    mov dword [g_tabPressed], 1
    jmp .handled

.check_move_down:
    cmp r8d, VK_W
    jne .check_a_down
    mov dword [g_wDown], 1
    jmp .handled
.check_a_down:
    cmp r8d, VK_A
    jne .check_s_down
    mov dword [g_aDown], 1
    jmp .handled
.check_s_down:
    cmp r8d, VK_S
    jne .check_d_down
    mov dword [g_sDown], 1
    jmp .handled
.check_d_down:
    cmp r8d, VK_D
    jne .check_q_down
    mov dword [g_dDown], 1
    jmp .handled
.check_q_down:
    cmp r8d, VK_Q
    jne .check_e_down
    mov dword [g_qDown], 1
    jmp .handled
.check_e_down:
    cmp r8d, VK_E
    jne .default_proc
    mov dword [g_eDown], 1
    jmp .handled

.key_up:
    cmp r8d, VK_SPACE
    jne .check_p_up
    mov dword [g_spaceDown], 0
    xor eax, eax
    add rsp, 40
    ret

.check_p_up:
    cmp r8d, VK_P
    jne .check_r_up
    mov dword [g_pDown], 0
    xor eax, eax
    add rsp, 40
    ret

.check_r_up:
    cmp r8d, VK_R
    jne .check_tab_up
    mov dword [g_rDown], 0
    xor eax, eax
    add rsp, 40
    ret

.check_tab_up:
    cmp r8d, VK_TAB
    jne .check_w_up
    mov dword [g_tabDown], 0
    xor eax, eax
    add rsp, 40
    ret

.check_w_up:
    cmp r8d, VK_W
    jne .check_a_up
    mov dword [g_wDown], 0
    xor eax, eax
    add rsp, 40
    ret
.check_a_up:
    cmp r8d, VK_A
    jne .check_s_up
    mov dword [g_aDown], 0
    xor eax, eax
    add rsp, 40
    ret
.check_s_up:
    cmp r8d, VK_S
    jne .check_d_up
    mov dword [g_sDown], 0
    xor eax, eax
    add rsp, 40
    ret
.check_d_up:
    cmp r8d, VK_D
    jne .check_q_up
    mov dword [g_dDown], 0
    xor eax, eax
    add rsp, 40
    ret
.check_q_up:
    cmp r8d, VK_Q
    jne .check_e_up
    mov dword [g_qDown], 0
    xor eax, eax
    add rsp, 40
    ret
.check_e_up:
    cmp r8d, VK_E
    jne .default_proc
    mov dword [g_eDown], 0
    xor eax, eax
    add rsp, 40
    ret

.handled:
    xor eax, eax
    add rsp, 40
    ret

.close_now:
    mov rcx, [g_hWnd]
    call DestroyWindow
    xor eax, eax
    add rsp, 40
    ret

.destroy_now:
    mov dword [g_running], 0
    xor ecx, ecx
    call PostQuitMessage
    xor eax, eax
    add rsp, 40
    ret

App_InitWindow:
    sub rsp, 68h

    xor ecx, ecx
    call GetModuleHandleA
    mov [g_hInstance], rax

    mov dword [g_wc + WNDCLASSEXA.cbSize], WNDCLASSEXA_size
    mov dword [g_wc + WNDCLASSEXA.style], CS_HREDRAW | CS_VREDRAW
    lea rax, [WndProc]
    mov [g_wc + WNDCLASSEXA.lpfnWndProc], rax
    mov dword [g_wc + WNDCLASSEXA.cbClsExtra], 0
    mov dword [g_wc + WNDCLASSEXA.cbWndExtra], 0
    mov rax, [g_hInstance]
    mov [g_wc + WNDCLASSEXA.hInstance], rax
    mov qword [g_wc + WNDCLASSEXA.hIcon], 0

    xor ecx, ecx
    mov edx, IDC_ARROW
    call LoadCursorA
    mov [g_wc + WNDCLASSEXA.hCursor], rax

    mov qword [g_wc + WNDCLASSEXA.hbrBackground], 0
    mov qword [g_wc + WNDCLASSEXA.lpszMenuName], 0
    lea rax, [windowClassName]
    mov [g_wc + WNDCLASSEXA.lpszClassName], rax
    mov qword [g_wc + WNDCLASSEXA.hIconSm], 0

    lea rcx, [g_wc]
    call RegisterClassExA
    test eax, eax
    jz .fail

    mov dword [g_rect + RECT.left], 0
    mov dword [g_rect + RECT.top], 0
    mov dword [g_rect + RECT.right], WINDOW_WIDTH
    mov dword [g_rect + RECT.bottom], WINDOW_HEIGHT

    lea rcx, [g_rect]
    mov edx, WS_FIXEDWINDOW
    xor r8d, r8d
    xor r9d, r9d
    call AdjustWindowRectEx

    xor ecx, ecx
    lea rdx, [windowClassName]
    lea r8,  [windowTitle]
    mov r9d, WS_FIXEDWINDOW

    mov qword [rsp + 20h], CW_USEDEFAULT
    mov qword [rsp + 28h], CW_USEDEFAULT

    mov eax, [g_rect + RECT.right]
    sub eax, [g_rect + RECT.left]
    mov qword [rsp + 30h], rax

    mov eax, [g_rect + RECT.bottom]
    sub eax, [g_rect + RECT.top]
    mov qword [rsp + 38h], rax

    mov qword [rsp + 40h], 0
    mov qword [rsp + 48h], 0
    mov rax, [g_hInstance]
    mov qword [rsp + 50h], rax
    mov qword [rsp + 58h], 0

    call CreateWindowExA
    mov [g_hWnd], rax
    test rax, rax
    jz .fail

    ; DX11 UI-pass branch: no child GDI panel window here.
    ; Input stays on the main HWND; if DX11 UI init fails, the old GDI overlay
    ; can still fall back directly onto the main window.
    mov qword [g_ovlWnd], 0

    mov eax, 1
    add rsp, 68h
    ret

.fail:
    xor eax, eax
    add rsp, 68h
    ret

App_PumpMessages:
    sub rsp, 68h

.loop:
    lea rcx, [g_msg]
    xor edx, edx
    xor r8d, r8d
    xor r9d, r9d
    mov dword [rsp + 20h], PM_REMOVE
    call PeekMessageA
    test eax, eax
    jz .done

    cmp dword [g_msg + MSG.message], WM_QUIT
    jne .dispatch

    mov dword [g_running], 0
    jmp .done

.dispatch:
    lea rcx, [g_msg]
    call TranslateMessage

    lea rcx, [g_msg]
    call DispatchMessageA
    jmp .loop

.done:
    add rsp, 68h
    ret

App_UpdateDeltaTime:
    sub rsp, 40

    call GetTickCount64
    mov rdx, rax
    mov rax, [g_lastTick]
    test rax, rax
    jz .first

    mov rcx, rdx
    sub rcx, rax
    cmp ecx, 1
    jge .have_delta
    mov ecx, 1

.have_delta:
    cmp ecx, 33
    jle .convert
    mov ecx, 33

.convert:
    cvtsi2ss xmm0, ecx
    mulss xmm0, [kMsToSeconds]
    movss [g_dtSeconds], xmm0
    mov [g_lastTick], rdx
    add rsp, 40
    ret

.first:
    mov [g_lastTick], rdx
    movss xmm0, [kDefaultDT]
    movss [g_dtSeconds], xmm0
    add rsp, 40
    ret

App_EndInputFrame:
    mov dword [g_mouseDX], 0
    mov dword [g_mouseDY], 0
    mov dword [g_mouseLPressed], 0
    mov dword [g_mouseLReleased], 0
    mov dword [g_mouseRPressed], 0
    mov dword [g_mouseRReleased], 0
    mov dword [g_spacePressed], 0
    mov dword [g_pPressed], 0
    mov dword [g_rPressed], 0
    mov dword [g_tabPressed], 0
    ret

App_ShowWindow:
    sub rsp, 40
    mov rcx, [g_hWnd]
    mov edx, SW_SHOWDEFAULT
    call ShowWindow

    mov rcx, [g_hWnd]
    call UpdateWindow
    add rsp, 40
    ret
