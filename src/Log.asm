extern IsDebuggerPresent

%define DBG_PRINTEXCEPTION_C      40010006h
%define DBG_CONTROL_C             40010005h
%define DBG_CONTROL_BREAK         40010008h
%define DBG_RIPEXCEPTION          40010007h
%define STATUS_BREAKPOINT         80000003h
%define STATUS_SINGLE_STEP        80000004h
%define MS_VC_THREAD_NAME         406D1388h

section .text align=16

Log_StrLen:
    xor eax, eax
.len_loop:
    cmp byte [rcx + rax], 0
    je .done
    inc eax
    jmp .len_loop
.done:
    ret

Log_WriteRawZ:
    sub rsp, 40
    mov [rsp + 20h], rcx

    test rcx, rcx
    jz .done

    ; Do NOT call OutputDebugStringA here. On Windows, OutputDebugStringA can raise
    ; DBG_PRINTEXCEPTION_C (0x40010006) when no debugger is attached. Because this
    ; project installs a vectored exception handler for crash logging, that benign
    ; debug-print exception can get surfaced before Windows swallows it, which makes
    ; the app look like it crashed immediately. File logging is enough here.

    mov rcx, [rsp + 20h]
    call Log_StrLen
    test eax, eax
    jz .done

    mov r10, [g_logFile]
    test r10, r10
    jz .done
    cmp r10, -1
    je .done

    mov rcx, r10
    mov rdx, [rsp + 20h]
    mov r8d, eax
    lea r9, [g_logBytesWritten]
    mov qword [rsp + 20h], 0
    call WriteFile

.done:
    add rsp, 40
    ret

Log_WriteLevelMessage:
    ; rcx=level prefix, rdx=message
    ; Needs shadow space + locals up to [rsp+30h], so reserve 56 bytes (0x38).
    sub rsp, 56
    mov [rsp + 20h], rcx
    mov [rsp + 28h], rdx

    mov rcx, [rsp + 20h]
    call Log_WriteRawZ

    mov rcx, [rsp + 28h]
    call Log_WriteRawZ

    lea rcx, [logLineCRLFZ]
    call Log_WriteRawZ

    add rsp, 56
    ret

Log_WriteLevelTwoStrings:
    ; rcx=level prefix, rdx=s1, r8=s2
    ; Needs locals up to [rsp+30h]. 40 decimal (0x28) was too small and smashed the return address.
    sub rsp, 56
    mov [rsp + 20h], rcx
    mov [rsp + 28h], rdx
    mov [rsp + 30h], r8

    mov rcx, [rsp + 20h]
    call Log_WriteRawZ

    mov rcx, [rsp + 28h]
    call Log_WriteRawZ

    mov rcx, [rsp + 30h]
    call Log_WriteRawZ

    lea rcx, [logLineCRLFZ]
    call Log_WriteRawZ

    add rsp, 56
    ret

Log_Hex32ToBuffer:
    ; edx=value -> rcx=&g_hex32Buffer
    mov byte [g_hex32Buffer + 0], '0'
    mov byte [g_hex32Buffer + 1], 'x'
    mov eax, edx
    lea r8, [g_hex32Buffer + 2]
    mov ecx, 8
.loop32:
    mov edx, eax
    shr edx, 28
    and edx, 0Fh
    mov dl, [hexDigits + rdx]
    mov [r8], dl
    inc r8
    shl eax, 4
    dec ecx
    jnz .loop32
    mov byte [g_hex32Buffer + 10], 0
    lea rcx, [g_hex32Buffer]
    ret

Log_Hex64ToBuffer:
    ; rdx=value -> rcx=&g_hex64Buffer
    mov byte [g_hex64Buffer + 0], '0'
    mov byte [g_hex64Buffer + 1], 'x'
    mov rax, rdx
    lea r8, [g_hex64Buffer + 2]
    mov ecx, 16
.loop64:
    mov r9, rax
    shr r9, 60
    and r9d, 0Fh
    mov r9b, [hexDigits + r9]
    mov [r8], r9b
    inc r8
    shl rax, 4
    dec ecx
    jnz .loop64
    mov byte [g_hex64Buffer + 18], 0
    lea rcx, [g_hex64Buffer]
    ret

Log_WriteLevelHex32:
    ; rcx=level prefix, rdx=message, r8d=value
    ; Needs locals up to [rsp+30h]. Reserve 56 bytes (0x38).
    sub rsp, 56
    mov [rsp + 20h], rcx
    mov [rsp + 28h], rdx
    mov dword [rsp + 30h], r8d

    mov rcx, [rsp + 20h]
    call Log_WriteRawZ

    mov rcx, [rsp + 28h]
    call Log_WriteRawZ

    mov edx, [rsp + 30h]
    call Log_Hex32ToBuffer
    call Log_WriteRawZ

    lea rcx, [logLineCRLFZ]
    call Log_WriteRawZ

    add rsp, 56
    ret

Log_WriteLevelHex64:
    ; rcx=level prefix, rdx=message, r8=value
    ; Needs locals up to [rsp+30h]. Reserve 56 bytes (0x38).
    sub rsp, 56
    mov [rsp + 20h], rcx
    mov [rsp + 28h], rdx
    mov [rsp + 30h], r8

    mov rcx, [rsp + 20h]
    call Log_WriteRawZ

    mov rcx, [rsp + 28h]
    call Log_WriteRawZ

    mov rdx, [rsp + 30h]
    call Log_Hex64ToBuffer
    call Log_WriteRawZ

    lea rcx, [logLineCRLFZ]
    call Log_WriteRawZ

    add rsp, 56
    ret

Log_Init:
    sub rsp, 56

    lea rcx, [logFileName]
    mov edx, GENERIC_WRITE
    mov r8d, FILE_SHARE_READ
    xor r9d, r9d
    mov qword [rsp + 20h], CREATE_ALWAYS
    mov qword [rsp + 28h], FILE_ATTRIBUTE_NORMAL
    mov qword [rsp + 30h], 0
    call CreateFileA

    cmp rax, -1
    je .fail

    mov [g_logFile], rax
    add rsp, 56
    ret

.fail:
    xor eax, eax
    mov [g_logFile], rax
    add rsp, 56
    ret

Log_Close:
    sub rsp, 40
    mov rcx, [g_logFile]
    test rcx, rcx
    jz .done
    cmp rcx, -1
    je .done
    call CloseHandle
    xor eax, eax
    mov [g_logFile], rax
.done:
    add rsp, 40
    ret

Log_SetStage:
    mov [g_logStage], rcx
    ret

Log_Line:
    jmp Log_Info

Log_Info:
    mov rdx, rcx
    lea rcx, [logPrefixInfo]
    jmp Log_WriteLevelMessage

Log_Warn:
    mov rdx, rcx
    lea rcx, [logPrefixWarn]
    jmp Log_WriteLevelMessage

Log_Error:
    mov rdx, rcx
    lea rcx, [logPrefixError]
    jmp Log_WriteLevelMessage

Log_Critical:
    mov rdx, rcx
    lea rcx, [logPrefixCritical]
    jmp Log_WriteLevelMessage

Log_Warn2:
    ; rcx=s1, rdx=s2
    mov r8, rdx
    mov rdx, rcx
    lea rcx, [logPrefixWarn]
    jmp Log_WriteLevelTwoStrings

Log_Error2:
    ; rcx=s1, rdx=s2
    mov r8, rdx
    mov rdx, rcx
    lea rcx, [logPrefixError]
    jmp Log_WriteLevelTwoStrings

Log_Critical2:
    ; rcx=s1, rdx=s2
    mov r8, rdx
    mov rdx, rcx
    lea rcx, [logPrefixCritical]
    jmp Log_WriteLevelTwoStrings

Log_WarnHex32:
    ; rcx=message, edx=value
    mov r8d, edx
    mov rdx, rcx
    lea rcx, [logPrefixWarn]
    jmp Log_WriteLevelHex32

Log_ErrorHex32:
    ; rcx=message, edx=value
    mov r8d, edx
    mov rdx, rcx
    lea rcx, [logPrefixError]
    jmp Log_WriteLevelHex32

Log_CriticalHex32:
    ; rcx=message, edx=value
    mov r8d, edx
    mov rdx, rcx
    lea rcx, [logPrefixCritical]
    jmp Log_WriteLevelHex32

Log_CriticalHex64:
    ; rcx=message, rdx=value64
    mov r8, rdx
    mov rdx, rcx
    lea rcx, [logPrefixCritical]
    jmp Log_WriteLevelHex64

Crash_Install:
    sub rsp, 40
    mov ecx, 1
    lea rdx, [Crash_VectoredHandler]
    call AddVectoredExceptionHandler
    mov [g_vehHandle], rax
    add rsp, 40
    ret

Crash_Remove:
    sub rsp, 40
    mov rcx, [g_vehHandle]
    test rcx, rcx
    jz .done
    call RemoveVectoredExceptionHandler
    xor eax, eax
    mov [g_vehHandle], rax
.done:
    add rsp, 40
    ret

Crash_VectoredHandler:
    ; rcx = EXCEPTION_POINTERS*
    ; Keep both EXCEPTION_POINTERS* and EXCEPTION_RECORD* on the stack.
    ; RAX is volatile across calls, so do NOT keep the record pointer only in RAX.
    sub rsp, 56
    mov [rsp + 20h], rcx        ; EXCEPTION_POINTERS*
    mov qword [rsp + 28h], 0    ; EXCEPTION_RECORD*

    ; Ignore benign debug-print exceptions. These are commonly raised by
    ; OutputDebugStringA/W and should not be treated as crashes.
    mov rax, [rsp + 20h]
    test rax, rax
    jz .maybe_log
    mov rax, [rax]
    mov [rsp + 28h], rax
    test rax, rax
    jz .maybe_log
    mov edx, [rax + 0]
    cmp edx, 040010006h         ; DBG_PRINTEXCEPTION_C
    je .continue_execution
    cmp edx, 04001000Ah         ; DBG_PRINTEXCEPTION_WIDE_C
    je .continue_execution

.maybe_log:
    cmp dword [g_crashLogged], 0
    jne .search
    mov dword [g_crashLogged], 1

    lea rcx, [logCrashUnhandled]
    call Log_Critical

    mov rax, [rsp + 28h]
    test rax, rax
    jz .stage_only

    mov edx, [rax + 0]
    lea rcx, [logCrashExceptionCode]
    call Log_CriticalHex32

    mov rax, [rsp + 28h]
    mov rdx, [rax + 16]
    lea rcx, [logCrashExceptionAddress]
    call Log_CriticalHex64

.stage_only:
    mov rdx, [g_logStage]
    test rdx, rdx
    jz .search
    lea rcx, [logCrashStagePrefix]
    call Log_Critical2

.search:
    mov eax, EXCEPTION_CONTINUE_SEARCH
    add rsp, 56
    ret

.continue_execution:
    mov eax, -1                 ; EXCEPTION_CONTINUE_EXECUTION
    add rsp, 56
    ret
