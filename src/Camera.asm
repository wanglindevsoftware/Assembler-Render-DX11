section .text align=16

Camera_ApplyTuning:
    movss xmm0, [kCamFovMax]
    subss xmm0, [kCamFovMin]
    mulss xmm0, [g_uiSliderFov01]
    addss xmm0, [kCamFovMin]
    movss [g_camFov], xmm0

    movss xmm0, [kLightMax]
    subss xmm0, [kLightMin]
    mulss xmm0, [g_uiSliderLight01]
    addss xmm0, [kLightMin]
    movss [g_lightStrength], xmm0

    mov eax, [g_uiDropdownIndex]
    mov [g_shaderModeIndex], eax
    ret

Camera_Reset:
    movss xmm0, [kCamResetX]
    movss [g_camPosX], xmm0
    movss xmm0, [kCamResetY]
    movss [g_camPosY], xmm0
    movss xmm0, [kCamResetZ]
    movss [g_camPosZ], xmm0
    movss xmm0, [kCamResetYaw]
    movss [g_camYaw], xmm0
    movss xmm0, [kCamResetPitch]
    movss [g_camPitch], xmm0

    movss xmm0, [kCamFovDefault01]
    movss [g_uiSliderFov01], xmm0
    movss xmm0, [kLightDefault01]
    movss [g_uiSliderLight01], xmm0
    mov dword [g_uiDropdownIndex], 0
    mov dword [g_uiDropdownOpen], 0
    mov dword [g_uiActiveWidget], 0
    mov dword [g_menuVisible], 1

    call Camera_ApplyTuning
    ret

Camera_Init:
    call Camera_Reset
    ret

Camera_Update:
    sub rsp, 64

    cmp dword [g_mouseRDown], 0
    je .movement
    cmp dword [g_uiMouseOver], 0
    jne .movement

    cvtsi2ss xmm0, dword [g_mouseDX]
    mulss xmm0, [kMouseLookSpeed]
    addss xmm0, [g_camYaw]
    movss [g_camYaw], xmm0

    cvtsi2ss xmm0, dword [g_mouseDY]
    mulss xmm0, [kMouseLookSpeed]
    movss xmm1, [g_camPitch]
    subss xmm1, xmm0
    maxss xmm1, [kPitchMin]
    minss xmm1, [kPitchMax]
    movss [g_camPitch], xmm1

.movement:
    fld dword [g_camYaw]
    fsincos
    fstp dword [rsp + 0]     ; cos(yaw)
    fstp dword [rsp + 4]     ; sin(yaw)

    fld dword [g_camPitch]
    fsincos
    fstp dword [rsp + 8]     ; cos(pitch)
    fstp dword [rsp + 12]    ; sin(pitch)

    movss xmm4, [kCameraMoveSpeed]
    mulss xmm4, [g_dtSeconds]

    cmp dword [g_wDown], 0
    je .check_s

    ; forward = (-sin(yaw)*cos(pitch), -sin(pitch), cos(yaw)*cos(pitch))
    movss xmm0, [g_camPosX]
    movss xmm1, [rsp + 4]
    mulss xmm1, [rsp + 8]
    mulss xmm1, xmm4
    subss xmm0, xmm1
    movss [g_camPosX], xmm0

    movss xmm0, [g_camPosY]
    movss xmm1, [rsp + 12]
    mulss xmm1, xmm4
    subss xmm0, xmm1
    movss [g_camPosY], xmm0

    movss xmm0, [g_camPosZ]
    movss xmm1, [rsp + 0]
    mulss xmm1, [rsp + 8]
    mulss xmm1, xmm4
    addss xmm0, xmm1
    movss [g_camPosZ], xmm0

.check_s:
    cmp dword [g_sDown], 0
    je .check_a

    movss xmm0, [g_camPosX]
    movss xmm1, [rsp + 4]
    mulss xmm1, [rsp + 8]
    mulss xmm1, xmm4
    addss xmm0, xmm1
    movss [g_camPosX], xmm0

    movss xmm0, [g_camPosY]
    movss xmm1, [rsp + 12]
    mulss xmm1, xmm4
    addss xmm0, xmm1
    movss [g_camPosY], xmm0

    movss xmm0, [g_camPosZ]
    movss xmm1, [rsp + 0]
    mulss xmm1, [rsp + 8]
    mulss xmm1, xmm4
    subss xmm0, xmm1
    movss [g_camPosZ], xmm0

.check_a:
    cmp dword [g_aDown], 0
    je .check_d

    movss xmm0, [g_camPosX]
    movss xmm1, [rsp + 0]
    mulss xmm1, xmm4
    subss xmm0, xmm1
    movss [g_camPosX], xmm0

    movss xmm0, [g_camPosZ]
    movss xmm1, [rsp + 4]
    mulss xmm1, xmm4
    subss xmm0, xmm1
    movss [g_camPosZ], xmm0

.check_d:
    cmp dword [g_dDown], 0
    je .check_qe

    movss xmm0, [g_camPosX]
    movss xmm1, [rsp + 0]
    mulss xmm1, xmm4
    addss xmm0, xmm1
    movss [g_camPosX], xmm0

    movss xmm0, [g_camPosZ]
    movss xmm1, [rsp + 4]
    mulss xmm1, xmm4
    addss xmm0, xmm1
    movss [g_camPosZ], xmm0

.check_qe:
    movss xmm5, [kCameraLiftSpeed]
    mulss xmm5, [g_dtSeconds]

    cmp dword [g_qDown], 0
    je .check_e
    movss xmm0, [g_camPosY]
    subss xmm0, xmm5
    movss [g_camPosY], xmm0

.check_e:
    cmp dword [g_eDown], 0
    je .done
    movss xmm0, [g_camPosY]
    addss xmm0, xmm5
    movss [g_camPosY], xmm0

.done:
    add rsp, 64
    ret