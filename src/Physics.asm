
section .text align=16

Physics_Init:
    sub rsp, 40
    call Physics_Reset
    add rsp, 40
    ret

Physics_Reset:
    movss xmm0, [kCubeResetY]
    movss [g_cubePosY], xmm0
    mov dword [g_cubeVelY], 0
    mov dword [g_cubeAngle], 0
    mov dword [g_cubeEnergy], 0
    mov dword [g_cubeHeld], 0
    mov dword [g_physicsPaused], 0

    movss xmm0, [g_cubePosY]
    subss xmm0, [kCubeMinY]
    mulss xmm0, [kHeightScale]
    maxss xmm0, [kZero]
    minss xmm0, [kOne]
    movss [g_cubeHeight01], xmm0
    ret

Physics_LiftCube:
    cmp dword [g_cubeHeld], 0
    je .impulse_only

    movss xmm0, [g_cubePosY]
    addss xmm0, [kLiftEnergy]
    minss xmm0, [kCubeMaxY]
    movss [g_cubePosY], xmm0
    mov dword [g_cubeVelY], 0
    movss xmm0, [kHeldEnergy]
    movss [g_cubeEnergy], xmm0
    ret

.impulse_only:
    movss xmm0, [g_cubeVelY]
    addss xmm0, [kLiftImpulse]
    movss [g_cubeVelY], xmm0

    movss xmm0, [g_cubeEnergy]
    addss xmm0, [kLiftEnergy]
    minss xmm0, [kOne]
    movss [g_cubeEnergy], xmm0
    ret

Physics_Update:
    sub rsp, 40

    cmp dword [g_pPressed], 0
    je .check_reset
    xor dword [g_physicsPaused], 1

.check_reset:
    cmp dword [g_rPressed], 0
    je .check_space
    call Physics_Reset

.check_space:
    cmp dword [g_spacePressed], 0
    je .check_hold_start
    call Physics_LiftCube

.check_hold_start:
    cmp dword [g_mouseLPressed], 0
    je .check_hold_end
    cmp dword [g_uiMouseOver], 0
    jne .check_hold_end
    mov dword [g_cubeHeld], 1
    mov dword [g_cubeVelY], 0

.check_hold_end:
    cmp dword [g_mouseLReleased], 0
    je .held_branch
    mov dword [g_cubeHeld], 0

.held_branch:
    cmp dword [g_cubeHeld], 0
    je .simulate_branch

    cmp dword [g_mouseLDown], 0
    jne .follow_mouse
    mov dword [g_cubeHeld], 0
    jmp .simulate_branch

.follow_mouse:
    cvtsi2ss xmm0, dword [g_mouseY]
    mulss xmm0, [kMouseToWorldY]
    movss xmm1, [kHoldBaseY]
    subss xmm1, xmm0
    maxss xmm1, [kCubeMinY]
    minss xmm1, [kCubeMaxY]
    movss [g_cubePosY], xmm1
    mov dword [g_cubeVelY], 0
    movss xmm0, [kHeldEnergy]
    movss [g_cubeEnergy], xmm0
    jmp .energy_decay

.simulate_branch:
    cmp dword [g_physicsPaused], 0
    jne .energy_decay

    movss xmm0, [g_cubeVelY]
    movss xmm1, [g_dtSeconds]
    mulss xmm1, [kGravity]
    addss xmm0, xmm1
    movss [g_cubeVelY], xmm0

    movss xmm1, [g_dtSeconds]
    mulss xmm1, xmm0
    addss xmm1, [g_cubePosY]
    movss [g_cubePosY], xmm1

    comiss xmm1, [kCubeMinY]
    jae .energy_decay

    movss xmm4, [kCubeMinY]
    movss [g_cubePosY], xmm4

    movss xmm2, [g_cubeVelY]
    movups xmm3, [absMask]
    andps xmm2, xmm3
    comiss xmm2, [kBounceThreshold]
    jbe .stop_motion

    movss xmm3, [g_cubeVelY]
    mulss xmm3, [kNegBounce]
    movss [g_cubeVelY], xmm3
    movss xmm3, [kImpactEnergy]
    movss [g_cubeEnergy], xmm3
    jmp .energy_decay

.stop_motion:
    mov dword [g_cubeVelY], 0

.energy_decay:
    movss xmm0, [g_cubeEnergy]
    movss xmm1, [g_dtSeconds]
    mulss xmm1, [kEnergyDecay]
    subss xmm0, xmm1
    maxss xmm0, [kZero]
    cmp dword [g_cubeHeld], 0
    je .store_energy
    maxss xmm0, [kHeldEnergy]

.store_energy:
    movss [g_cubeEnergy], xmm0

    movss xmm2, [g_cubeVelY]
    movups xmm3, [absMask]
    andps xmm2, xmm3
    mulss xmm2, [kAngleVelScale]
    addss xmm2, [kAngleBaseSpeed]
    movss xmm1, [g_dtSeconds]
    mulss xmm2, xmm1
    addss xmm2, [g_cubeAngle]
    movss [g_cubeAngle], xmm2

    movss xmm0, [g_cubePosY]
    subss xmm0, [kCubeMinY]
    mulss xmm0, [kHeightScale]
    maxss xmm0, [kZero]
    minss xmm0, [kOne]
    movss [g_cubeHeight01], xmm0

    add rsp, 40
    ret
