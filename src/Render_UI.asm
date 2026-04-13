section .text align=16

UI_PushQuadPx:
    ; custom args: ecx=x, edx=y, r8d=w, r9d=h, eax=color
    sub rsp, 88

    cmp dword [g_uiVertexCount], UI_MAX_VERTICES - 6
    jg .full

    mov [rsp + 64], eax

    ; x1
    cvtsi2ss xmm0, ecx
    mulss xmm0, [kUIXScale]
    subss xmm0, [kOne]
    movss [rsp + 0], xmm0

    ; y1
    cvtsi2ss xmm1, edx
    mulss xmm1, [kUIYScale]
    movss xmm4, [kOne]
    subss xmm4, xmm1
    movss [rsp + 4], xmm4

    ; x2
    lea eax, [rcx + r8]
    cvtsi2ss xmm2, eax
    mulss xmm2, [kUIXScale]
    subss xmm2, [kOne]
    movss [rsp + 8], xmm2

    ; y2
    lea eax, [rdx + r9]
    cvtsi2ss xmm3, eax
    mulss xmm3, [kUIYScale]
    movss xmm5, [kOne]
    subss xmm5, xmm3
    movss [rsp + 12], xmm5

    mov r11, [g_uiWritePtr]
    mov eax, [rsp + 64]

    ; v0 = x1,y1
    movss xmm0, [rsp + 0]
    movss [r11 + 0], xmm0
    movss xmm1, [rsp + 4]
    movss [r11 + 4], xmm1
    mov dword [r11 + 8], eax

    ; v1 = x1,y2
    movss xmm0, [rsp + 0]
    movss [r11 + 12], xmm0
    movss xmm1, [rsp + 12]
    movss [r11 + 16], xmm1
    mov dword [r11 + 20], eax

    ; v2 = x2,y2
    movss xmm0, [rsp + 8]
    movss [r11 + 24], xmm0
    movss xmm1, [rsp + 12]
    movss [r11 + 28], xmm1
    mov dword [r11 + 32], eax

    ; v3 = x1,y1
    movss xmm0, [rsp + 0]
    movss [r11 + 36], xmm0
    movss xmm1, [rsp + 4]
    movss [r11 + 40], xmm1
    mov dword [r11 + 44], eax

    ; v4 = x2,y2
    movss xmm0, [rsp + 8]
    movss [r11 + 48], xmm0
    movss xmm1, [rsp + 12]
    movss [r11 + 52], xmm1
    mov dword [r11 + 56], eax

    ; v5 = x2,y1
    movss xmm0, [rsp + 8]
    movss [r11 + 60], xmm0
    movss xmm1, [rsp + 4]
    movss [r11 + 64], xmm1
    mov dword [r11 + 68], eax

    add r11, 72
    mov [g_uiWritePtr], r11
    add dword [g_uiVertexCount], 6

.full:
    add rsp, 88
    ret

RenderUI_InitResources:
    sub rsp, 68h

    lea rcx, [stageUIVSCompile]
    call Log_SetStage

    ; GUI vertex shader (embedded HLSL)
    lea rcx, [shaderUiSource]
    mov rdx, shaderUiSourceLen
    lea r8,  [shaderUiName]
    xor r9d, r9d
    mov qword [rsp + 20h], 0
    lea rax, [entryVS]
    mov qword [rsp + 28h], rax
    lea rax, [targetVS]
    mov qword [rsp + 30h], rax
    mov dword [rsp + 38h], D3DCOMPILE_ENABLE_STRICTNESS
    mov dword [rsp + 40h], 0
    lea rax, [g_tmpBlob]
    mov qword [rsp + 48h], rax
    lea rax, [g_errBlob]
    mov qword [rsp + 50h], rax
    call qword [g_pD3DCompile]
    test eax, eax
    js .ui_vs_fail

    call PrepareTmpBlobBytecode
    test eax, eax
    jz .fail

    lea rcx, [stageUIVSCreate]
    call Log_SetStage

    mov rcx, [g_device]
    mov rdx, [g_shaderBytecodePtr]
    mov r8,  [g_shaderBytecodeSize]
    xor r9d, r9d
    lea rax, [g_uiVS]
    mov qword [rsp + 20h], rax
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateVertexShader]
    test eax, eax
    js .ui_vs_create_fail

    lea rcx, [stageUILayout]
    call Log_SetStage

    mov rcx, [g_device]
    lea rdx, [uiInputLayout]
    mov r8d, 2
    mov r9,  [g_shaderBytecodePtr]
    mov rax, [g_shaderBytecodeSize]
    mov qword [rsp + 20h], rax
    lea rax, [g_uiLayout]
    mov qword [rsp + 28h], rax
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateInputLayout]
    test eax, eax
    js .ui_layout_fail

    lea rcx, [g_tmpBlob]
    call ReleasePtr

    lea rcx, [stageUIPSCompile]
    call Log_SetStage

    ; GUI pixel shader (embedded HLSL)
    lea rcx, [shaderUiSource]
    mov rdx, shaderUiSourceLen
    lea r8,  [shaderUiName]
    xor r9d, r9d
    mov qword [rsp + 20h], 0
    lea rax, [entryPS]
    mov qword [rsp + 28h], rax
    lea rax, [targetPS]
    mov qword [rsp + 30h], rax
    mov dword [rsp + 38h], D3DCOMPILE_ENABLE_STRICTNESS
    mov dword [rsp + 40h], 0
    lea rax, [g_tmpBlob]
    mov qword [rsp + 48h], rax
    lea rax, [g_errBlob]
    mov qword [rsp + 50h], rax
    call qword [g_pD3DCompile]
    test eax, eax
    js .ui_ps_fail

    call PrepareTmpBlobBytecode
    test eax, eax
    jz .fail

    lea rcx, [stageUIPSCreate]
    call Log_SetStage

    mov rcx, [g_device]
    mov rdx, [g_shaderBytecodePtr]
    mov r8,  [g_shaderBytecodeSize]
    xor r9d, r9d
    lea rax, [g_uiPS]
    mov qword [rsp + 20h], rax
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreatePixelShader]
    test eax, eax
    js .ui_ps_create_fail

    lea rcx, [g_tmpBlob]
    call ReleasePtr

    lea rcx, [stageUIVB]
    call Log_SetStage

    ; UI vertex buffer
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.ByteWidth], UI_MAX_VERTICES * 12
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.Usage], D3D11_USAGE_DEFAULT
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.BindFlags], D3D11_BIND_VERTEX_BUFFER
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.CPUAccessFlags], 0
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.MiscFlags], 0
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.StructureByteStride], 0

    mov rcx, [g_device]
    lea rdx, [g_bufDesc]
    xor r8d, r8d
    lea r9,  [g_uiVB]
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateBuffer]
    test eax, eax
    js .ui_vb_fail

    lea rcx, [stageUIBlend]
    call Log_SetStage

    ; Alpha blend state
    mov dword [g_blendDesc + D3D11_BLEND_DESC.AlphaToCoverageEnable], FALSE
    mov dword [g_blendDesc + D3D11_BLEND_DESC.IndependentBlendEnable], FALSE

    mov dword [g_blendDesc + D3D11_BLEND_DESC.RenderTarget0 + D3D11_RENDER_TARGET_BLEND_DESC.BlendEnable], TRUE
    mov dword [g_blendDesc + D3D11_BLEND_DESC.RenderTarget0 + D3D11_RENDER_TARGET_BLEND_DESC.SrcBlend], D3D11_BLEND_SRC_ALPHA
    mov dword [g_blendDesc + D3D11_BLEND_DESC.RenderTarget0 + D3D11_RENDER_TARGET_BLEND_DESC.DestBlend], D3D11_BLEND_INV_SRC_ALPHA
    mov dword [g_blendDesc + D3D11_BLEND_DESC.RenderTarget0 + D3D11_RENDER_TARGET_BLEND_DESC.BlendOp], D3D11_BLEND_OP_ADD
    mov dword [g_blendDesc + D3D11_BLEND_DESC.RenderTarget0 + D3D11_RENDER_TARGET_BLEND_DESC.SrcBlendAlpha], D3D11_BLEND_ONE
    mov dword [g_blendDesc + D3D11_BLEND_DESC.RenderTarget0 + D3D11_RENDER_TARGET_BLEND_DESC.DestBlendAlpha], D3D11_BLEND_INV_SRC_ALPHA
    mov dword [g_blendDesc + D3D11_BLEND_DESC.RenderTarget0 + D3D11_RENDER_TARGET_BLEND_DESC.BlendOpAlpha], D3D11_BLEND_OP_ADD
    mov byte  [g_blendDesc + D3D11_BLEND_DESC.RenderTarget0 + D3D11_RENDER_TARGET_BLEND_DESC.RenderTargetWriteMask], D3D11_COLOR_WRITE_ENABLE_ALL

    mov rcx, [g_device]
    lea rdx, [g_blendDesc]
    lea r8,  [g_uiBlend]
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateBlendState]
    test eax, eax
    js .ui_blend_fail

    mov eax, 1
    add rsp, 68h
    ret

.ui_vs_fail:
    mov edx, eax
    lea rcx, [logUiVSCompileFailHr]
    call Log_ErrorHex32
    lea rcx, [msgShaderVSFail]
    call ShowCompileError
    jmp .fail

.ui_vs_create_fail:
    mov edx, eax
    lea rcx, [logUiVSCreateFailHr]
    call Log_ErrorHex32
    jmp .fail

.ui_layout_fail:
    mov edx, eax
    lea rcx, [logUiLayoutFailHr]
    call Log_ErrorHex32
    jmp .fail

.ui_ps_fail:
    mov edx, eax
    lea rcx, [logUiPSCompileFailHr]
    call Log_ErrorHex32
    lea rcx, [msgShaderPSFail]
    call ShowCompileError
    jmp .fail

.ui_ps_create_fail:
    mov edx, eax
    lea rcx, [logUiPSCreateFailHr]
    call Log_ErrorHex32
    jmp .fail

.ui_vb_fail:
    mov edx, eax
    lea rcx, [logUiVBFailHr]
    call Log_ErrorHex32
    jmp .fail

.ui_blend_fail:
    mov edx, eax
    lea rcx, [logUiBlendFailHr]
    call Log_ErrorHex32

.fail:
    lea rcx, [g_tmpBlob]
    call ReleasePtr
    xor eax, eax
    add rsp, 68h
    ret

RenderUI_UpdateAndDraw:
    sub rsp, 68h

    lea rcx, [stageFrameUIBuild]
    call Log_SetStage

    call UI_BuildGeometry

    cmp qword [g_context], 0
    je .null_fail
    cmp qword [g_uiVB], 0
    je .null_fail
    cmp qword [g_uiLayout], 0
    je .null_fail
    cmp qword [g_uiVS], 0
    je .null_fail
    cmp qword [g_uiPS], 0
    je .null_fail
    cmp qword [g_uiBlend], 0
    je .null_fail

    lea rcx, [stageFrameUIUpload]
    call Log_SetStage
    mov rcx, [g_context]
    mov rdx, [g_uiVB]
    xor r8d, r8d
    xor r9d, r9d
    lea rax, [g_uiVertices]
    mov qword [rsp + 20h], rax
    mov qword [rsp + 28h], 0
    mov qword [rsp + 30h], 0
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_UpdateSubresource]

    lea rcx, [stageFrameUIDraw]
    call Log_SetStage
    mov rcx, [g_context]
    mov rdx, [g_uiLayout]
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_IASetInputLayout]

    mov rcx, [g_context]
    mov edx, D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_IASetPrimitiveTopology]

    mov rcx, [g_context]
    xor edx, edx
    mov r8d, 1
    lea r9, [g_uiVB]
    lea rax, [uiVBStrides]
    mov qword [rsp + 20h], rax
    lea rax, [uiVBOffsets]
    mov qword [rsp + 28h], rax
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_IASetVertexBuffers]

    mov rcx, [g_context]
    mov rdx, [g_uiVS]
    xor r8d, r8d
    xor r9d, r9d
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_VSSetShader]

    mov rcx, [g_context]
    mov rdx, [g_uiPS]
    xor r8d, r8d
    xor r9d, r9d
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_PSSetShader]

    mov rcx, [g_context]
    mov rdx, [g_uiBlend]
    lea r8, [blendFactor]
    mov r9d, -1
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_OMSetBlendState]

    mov rcx, [g_context]
    mov edx, [g_uiVertexCount]
    xor r8d, r8d
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_Draw]

    mov eax, 1
    add rsp, 68h
    ret

.null_fail:
    lea rcx, [logUiDrawSkipped]
    call Log_Error
    xor eax, eax
    add rsp, 68h
    ret
