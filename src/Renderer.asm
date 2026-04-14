section .text align=16

EnsureD3DCompiler:
    sub rsp, 40

    mov rax, [g_pD3DCompile]
    test rax, rax
    jnz .ok

    lea rcx, [compilerDll47Name]
    call LoadLibraryA
    test rax, rax
    jnz .got_dll

    lea rcx, [compilerDll43Name]
    call LoadLibraryA
    test rax, rax
    jz .fail

.got_dll:
    mov [g_hCompilerDll], rax
    mov rcx, rax
    lea rdx, [compilerProcName]
    call GetProcAddress
    test rax, rax
    jz .free_and_fail

    mov [g_pD3DCompile], rax

.ok:
    mov eax, 1
    add rsp, 40
    ret

.free_and_fail:
    mov rcx, [g_hCompilerDll]
    test rcx, rcx
    jz .fail
    call FreeLibrary
    mov qword [g_hCompilerDll], 0

.fail:
    xor eax, eax
    add rsp, 40
    ret

PrepareTmpBlobBytecode:
    sub rsp, 40

    mov rax, [g_tmpBlob]
    mov [g_shaderBlob], rax
    test rax, rax
    jz .fail

    mov rcx, rax
    mov rax, [rax]
    call qword [rax + ID3DBlob_GetBufferPointer]
    mov [g_shaderBytecodePtr], rax

    mov rcx, [g_shaderBlob]
    mov rax, [rcx]
    call qword [rax + ID3DBlob_GetBufferSize]
    mov [g_shaderBytecodeSize], rax

    mov eax, 1
    add rsp, 40
    ret

.fail:
    xor eax, eax
    add rsp, 40
    ret

Renderer_Init:
    sub rsp, 68h

    lea rcx, [logRendererInit]
    call Log_Info

    lea rcx, [stageCompilerLoad]
    call Log_SetStage
    call EnsureD3DCompiler
    test eax, eax
    jnz .compiler_ok

    lea rcx, [logCompilerFail]
    call Log_Error

    xor ecx, ecx
    lea rdx, [msgCompilerFail]
    lea r8,  [msgCaption]
    mov r9d, MB_ICONERROR
    call MessageBoxA
    jmp .fail

.compiler_ok:
    lea rcx, [logCompilerOk]
    call Log_Info

    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.BufferDesc + DXGI_MODE_DESC.Width], WINDOW_WIDTH
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.BufferDesc + DXGI_MODE_DESC.Height], WINDOW_HEIGHT
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.BufferDesc + DXGI_MODE_DESC.RefreshRate + DXGI_RATIONAL.Numerator], 60
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.BufferDesc + DXGI_MODE_DESC.RefreshRate + DXGI_RATIONAL.Denominator], 1
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.BufferDesc + DXGI_MODE_DESC.Format], DXGI_FORMAT_R8G8B8A8_UNORM
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.SampleDesc + DXGI_SAMPLE_DESC.Count], 1
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.SampleDesc + DXGI_SAMPLE_DESC.Quality], 0
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.BufferUsage], DXGI_USAGE_RENDER_TARGET_OUTPUT
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.BufferCount], 1
    mov rax, [g_hWnd]
    mov [g_swapDesc + DXGI_SWAP_CHAIN_DESC.OutputWindow], rax
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.Windowed], TRUE
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.SwapEffect], DXGI_SWAP_EFFECT_DISCARD
    mov dword [g_swapDesc + DXGI_SWAP_CHAIN_DESC.Flags], 0

    lea rcx, [stageDeviceCreateHardware]
    call Log_SetStage
    lea rcx, [logD3DHardwareTry]
    call Log_Info

    xor ecx, ecx
    mov edx, D3D_DRIVER_TYPE_HARDWARE
    xor r8d, r8d
    xor r9d, r9d
    lea rax, [featureLevels]
    mov qword [rsp + 20h], rax
    mov qword [rsp + 28h], 3
    mov dword [rsp + 30h], D3D11_SDK_VERSION
    lea rax, [g_swapDesc]
    mov qword [rsp + 38h], rax
    lea rax, [g_swapChain]
    mov qword [rsp + 40h], rax
    lea rax, [g_device]
    mov qword [rsp + 48h], rax
    lea rax, [g_featureLevel]
    mov qword [rsp + 50h], rax
    lea rax, [g_context]
    mov qword [rsp + 58h], rax
    call D3D11CreateDeviceAndSwapChain
    test eax, eax
    jns .device_ok

    mov edx, eax
    lea rcx, [logD3DHardwareFailHr]
    call Log_WarnHex32
    lea rcx, [logD3DHardwareFail]
    call Log_Warn

    mov qword [g_swapChain], 0
    mov qword [g_device], 0
    mov qword [g_context], 0

    lea rcx, [stageDeviceCreateWarp]
    call Log_SetStage

    xor ecx, ecx
    mov edx, D3D_DRIVER_TYPE_WARP
    xor r8d, r8d
    xor r9d, r9d
    lea rax, [featureLevels]
    mov qword [rsp + 20h], rax
    mov qword [rsp + 28h], 3
    mov dword [rsp + 30h], D3D11_SDK_VERSION
    lea rax, [g_swapDesc]
    mov qword [rsp + 38h], rax
    lea rax, [g_swapChain]
    mov qword [rsp + 40h], rax
    lea rax, [g_device]
    mov qword [rsp + 48h], rax
    lea rax, [g_featureLevel]
    mov qword [rsp + 50h], rax
    lea rax, [g_context]
    mov qword [rsp + 58h], rax
    call D3D11CreateDeviceAndSwapChain
    test eax, eax
    jns .warp_ok

    mov edx, eax
    lea rcx, [logD3DWarpFailHr]
    call Log_ErrorHex32
    jmp .fail

.warp_ok:
    lea rcx, [logD3DWarpOk]
    call Log_Warn

.device_ok:
    lea rcx, [logD3DDeviceOk]
    call Log_Info

    lea rcx, [stageBackBuffer]
    call Log_SetStage

    ; Back buffer -> RTV
    mov rcx, [g_swapChain]
    mov edx, 0
    lea r8,  [IID_ID3D11Texture2D]
    lea r9,  [g_backBuffer]
    mov rax, [rcx]
    call qword [rax + IDXGISwapChain_GetBuffer]
    test eax, eax
    js .backbuffer_fail

    mov rcx, [g_device]
    mov rdx, [g_backBuffer]
    xor r8d, r8d
    lea r9, [g_rtv]
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateRenderTargetView]
    test eax, eax
    js .rtv_fail

    lea rcx, [g_backBuffer]
    call ReleasePtr

    ; depth texture + DSV
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.Width], WINDOW_WIDTH
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.Height], WINDOW_HEIGHT
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.MipLevels], 1
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.ArraySize], 1
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.Format], DXGI_FORMAT_D24_UNORM_S8_UINT
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.SampleDesc + DXGI_SAMPLE_DESC.Count], 1
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.SampleDesc + DXGI_SAMPLE_DESC.Quality], 0
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.Usage], D3D11_USAGE_DEFAULT
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.BindFlags], D3D11_BIND_DEPTH_STENCIL
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.CPUAccessFlags], 0
    mov dword [g_tex2DDesc + D3D11_TEXTURE2D_DESC.MiscFlags], 0

    mov rcx, [g_device]
    lea rdx, [g_tex2DDesc]
    xor r8d, r8d
    lea r9, [g_depthTex]
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateTexture2D]
    test eax, eax
    js .depth_optional_disable

    mov rcx, [g_device]
    mov rdx, [g_depthTex]
    xor r8d, r8d
    lea r9, [g_dsv]
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateDepthStencilView]
    test eax, eax
    js .depth_view_optional_disable

    ; raster state: solid + cull none
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.FillMode], D3D11_FILL_SOLID
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.CullMode], D3D11_CULL_NONE
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.FrontCounterClockwise], FALSE
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.DepthBias], 0
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.DepthBiasClamp], 0
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.SlopeScaledDepthBias], 0
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.DepthClipEnable], TRUE
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.ScissorEnable], FALSE
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.MultisampleEnable], FALSE
    mov dword [g_rsDesc + D3D11_RASTERIZER_DESC.AntialiasedLineEnable], FALSE

    mov rcx, [g_device]
    lea rdx, [g_rsDesc]
    lea r8, [g_worldRS]
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateRasterizerState]
    test eax, eax
    js .raster_optional_disable

    lea rcx, [logBackBufferOk]
    call Log_Info
    jmp .after_raster_optional

.after_depth_optional:
    lea rcx, [logBackBufferOk]
    call Log_Info

.after_raster_optional:
    lea rcx, [stageWorldVSCompile]
    call Log_SetStage

    ; World VS (embedded HLSL)
    lea rcx, [shaderWorldSource]
    mov rdx, shaderWorldSourceLen
    lea r8,  [shaderWorldName]
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
    js .world_vs_fail

    call PrepareTmpBlobBytecode
    test eax, eax
    jz .fail

    lea rcx, [stageWorldVSCreate]
    call Log_SetStage

    mov rcx, [g_device]
    mov rdx, [g_shaderBytecodePtr]
    mov r8,  [g_shaderBytecodeSize]
    xor r9d, r9d
    lea rax, [g_worldVS]
    mov qword [rsp + 20h], rax
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateVertexShader]
    test eax, eax
    js .world_vs_create_fail

    lea rcx, [stageWorldLayout]
    call Log_SetStage

    mov rcx, [g_device]
    lea rdx, [worldInputLayout]
    mov r8d, 3
    mov r9,  [g_shaderBytecodePtr]
    mov rax, [g_shaderBytecodeSize]
    mov qword [rsp + 20h], rax
    lea rax, [g_worldLayout]
    mov qword [rsp + 28h], rax
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateInputLayout]
    test eax, eax
    js .world_layout_fail

    lea rcx, [g_tmpBlob]
    call ReleasePtr

    lea rcx, [stageWorldPSCompile]
    call Log_SetStage

    ; World PS (embedded HLSL)
    lea rcx, [shaderWorldSource]
    mov rdx, shaderWorldSourceLen
    lea r8,  [shaderWorldName]
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
    js .world_ps_fail

    call PrepareTmpBlobBytecode
    test eax, eax
    jz .fail

    lea rcx, [stageWorldPSCreate]
    call Log_SetStage

    mov rcx, [g_device]
    mov rdx, [g_shaderBytecodePtr]
    mov r8,  [g_shaderBytecodeSize]
    xor r9d, r9d
    lea rax, [g_worldPS]
    mov qword [rsp + 20h], rax
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreatePixelShader]
    test eax, eax
    js .world_ps_create_fail

    lea rcx, [g_tmpBlob]
    call ReleasePtr

    lea rcx, [stageWorldVB]
    call Log_SetStage

    ; World vertex buffer
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.ByteWidth], WORLD_VERTEX_COUNT * 20
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.Usage], D3D11_USAGE_DEFAULT
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.BindFlags], D3D11_BIND_VERTEX_BUFFER
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.CPUAccessFlags], 0
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.MiscFlags], 0
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.StructureByteStride], 0

    lea rax, [worldVertices]
    mov qword [g_subData + D3D11_SUBRESOURCE_DATA.pSysMem], rax
    mov dword [g_subData + D3D11_SUBRESOURCE_DATA.SysMemPitch], 0
    mov dword [g_subData + D3D11_SUBRESOURCE_DATA.SysMemSlicePitch], 0

    mov rcx, [g_device]
    lea rdx, [g_bufDesc]
    lea r8,  [g_subData]
    lea r9,  [g_worldVB]
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateBuffer]
    test eax, eax
    js .world_vb_fail

    lea rcx, [stageWorldCB]
    call Log_SetStage

    ; World constant buffer
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.ByteWidth], 64
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.Usage], D3D11_USAGE_DEFAULT
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.BindFlags], D3D11_BIND_CONSTANT_BUFFER
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.CPUAccessFlags], 0
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.MiscFlags], 0
    mov dword [g_bufDesc + D3D11_BUFFER_DESC.StructureByteStride], 0

    mov dword [g_worldCBData + 0], 0
    mov dword [g_worldCBData + 4], 0
    mov dword [g_worldCBData + 8], 0
    mov dword [g_worldCBData + 12], 0

    lea rax, [g_worldCBData]
    mov qword [g_subData + D3D11_SUBRESOURCE_DATA.pSysMem], rax
    mov dword [g_subData + D3D11_SUBRESOURCE_DATA.SysMemPitch], 0
    mov dword [g_subData + D3D11_SUBRESOURCE_DATA.SysMemSlicePitch], 0

    mov rcx, [g_device]
    lea rdx, [g_bufDesc]
    lea r8,  [g_subData]
    lea r9,  [g_worldCB]
    mov rax, [rcx]
    call qword [rax + ID3D11Device_CreateBuffer]
    test eax, eax
    js .world_cb_fail

    lea rcx, [logWorldOk]
    call Log_Info

    lea rcx, [stageUIInit]
    call Log_SetStage
    call RenderUI_InitResources
    test eax, eax
    jnz .ui_ready

    ; UI path is optional in this branch: if DX11 UI init fails,
    ; keep the world renderer alive and fall back to the old overlay path.
    lea rcx, [logUiDrawSkipped]
    call Log_Warn
    jmp .ui_continue

.ui_ready:
    lea rcx, [logUiOk]
    call Log_Info

.ui_continue:
    mov eax, 1
    add rsp, 68h
    ret

.depth_optional_disable:
    mov edx, eax
    lea rcx, [logDepthTexFailHr]
    call Log_WarnHex32
    mov qword [g_depthTex], 0
    mov qword [g_dsv], 0
    lea rcx, [logDepthOptionalWarn]
    call Log_Warn
    jmp .after_depth_optional

.depth_view_optional_disable:
    mov edx, eax
    lea rcx, [logDepthViewFailHr]
    call Log_WarnHex32
    lea rcx, [g_depthTex]
    call ReleasePtr
    mov qword [g_dsv], 0
    lea rcx, [logDepthOptionalWarn]
    call Log_Warn
    jmp .after_depth_optional

.raster_optional_disable:
    mov edx, eax
    lea rcx, [logRasterFailHr]
    call Log_WarnHex32
    mov qword [g_worldRS], 0
    lea rcx, [logRasterOptionalWarn]
    call Log_Warn
    jmp .after_raster_optional

.backbuffer_fail:
    mov edx, eax
    lea rcx, [logBackBufferFailHr]
    call Log_ErrorHex32
    jmp .fail

.rtv_fail:
    mov edx, eax
    lea rcx, [logRTVFailHr]
    call Log_ErrorHex32
    jmp .fail

.world_vs_fail:
    mov edx, eax
    lea rcx, [logWorldVSCompileFailHr]
    call Log_ErrorHex32
    lea rcx, [msgShaderVSFail]
    call ShowCompileError
    jmp .fail

.world_vs_create_fail:
    mov edx, eax
    lea rcx, [logWorldVSCreateFailHr]
    call Log_ErrorHex32
    jmp .fail

.world_layout_fail:
    mov edx, eax
    lea rcx, [logWorldLayoutFailHr]
    call Log_ErrorHex32
    jmp .fail

.world_ps_fail:
    mov edx, eax
    lea rcx, [logWorldPSCompileFailHr]
    call Log_ErrorHex32
    lea rcx, [msgShaderPSFail]
    call ShowCompileError
    jmp .fail

.world_ps_create_fail:
    mov edx, eax
    lea rcx, [logWorldPSCreateFailHr]
    call Log_ErrorHex32
    jmp .fail

.world_vb_fail:
    mov edx, eax
    lea rcx, [logWorldVBFailHr]
    call Log_ErrorHex32
    jmp .fail

.world_cb_fail:
    mov edx, eax
    lea rcx, [logWorldCBFailHr]
    call Log_ErrorHex32

.fail:
    lea rcx, [g_tmpBlob]
    call ReleasePtr
    lea rcx, [logInitFail]
    call Log_Error
    xor eax, eax
    add rsp, 68h
    ret

Renderer_UpdateWorldCB:
    movss xmm0, [g_cubeAngle]
    movss [g_worldCBData + 0], xmm0

    movss xmm0, [g_cubePosY]
    movss [g_worldCBData + 4], xmm0

    cmp dword [g_cubeHeld], 0
    je .not_held
    mov dword [g_worldCBData + 8], 03F800000h
    jmp .energy

.not_held:
    mov dword [g_worldCBData + 8], 0

.energy:
    movss xmm0, [g_cubeEnergy]
    movss [g_worldCBData + 12], xmm0

    movss xmm0, [g_camPosX]
    movss [g_worldCBData + 16], xmm0
    movss xmm0, [g_camPosY]
    movss [g_worldCBData + 20], xmm0
    movss xmm0, [g_camPosZ]
    movss [g_worldCBData + 24], xmm0
    movss xmm0, [g_camYaw]
    movss [g_worldCBData + 28], xmm0

    movss xmm0, [g_camPitch]
    movss [g_worldCBData + 32], xmm0
    movss xmm0, [g_camFov]
    movss [g_worldCBData + 36], xmm0
    movss xmm0, [kAspectRatio]
    movss [g_worldCBData + 40], xmm0
    movss xmm0, [g_lightStrength]
    movss [g_worldCBData + 44], xmm0

    cvtsi2ss xmm0, dword [g_shaderModeIndex]
    movss [g_worldCBData + 48], xmm0
    movss xmm0, [g_cubeHeight01]
    movss [g_worldCBData + 52], xmm0
    mov dword [g_worldCBData + 56], 0
    mov dword [g_worldCBData + 60], 0
    ret

Renderer_RenderFrame:
    sub rsp, 68h

    lea rcx, [stageFrameBegin]
    call Log_SetStage

    cmp qword [g_context], 0
    je .null_fail
    cmp qword [g_swapChain], 0
    je .null_fail
    cmp qword [g_rtv], 0
    je .null_fail
    cmp qword [g_worldLayout], 0
    je .null_fail
    cmp qword [g_worldVB], 0
    je .null_fail
    cmp qword [g_worldVS], 0
    je .null_fail
    cmp qword [g_worldPS], 0
    je .null_fail
    cmp qword [g_worldCB], 0
    je .null_fail

    lea rcx, [stageFrameWorldCB]
    call Log_SetStage
    call Renderer_UpdateWorldCB

    lea rcx, [stageFrameWorldUpload]
    call Log_SetStage
    mov rcx, [g_context]
    mov rdx, [g_worldCB]
    xor r8d, r8d
    xor r9d, r9d
    lea rax, [g_worldCBData]
    mov qword [rsp + 20h], rax
    mov qword [rsp + 28h], 0
    mov qword [rsp + 30h], 0
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_UpdateSubresource]

    mov rcx, [g_context]
    mov edx, 1
    lea r8, [g_rtv]
    mov r9, [g_dsv]
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_OMSetRenderTargets]

    cmp qword [g_dsv], 0
    je .skip_depth_clear
    mov rcx, [g_context]
    mov rdx, [g_dsv]
    mov r8d, D3D11_CLEAR_DEPTH
    movss xmm3, [kOne]
    mov dword [rsp + 20h], 0
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_ClearDepthStencilView]
.skip_depth_clear:

    mov rcx, [g_context]
    mov edx, 1
    lea r8, [viewportData]
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_RSSetViewports]

    cmp qword [g_worldRS], 0
    je .skip_rs_state
    mov rcx, [g_context]
    mov rdx, [g_worldRS]
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_RSSetState]
.skip_rs_state:

    mov rcx, [g_context]
    mov rdx, [g_rtv]
    lea r8, [clearColor]
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_ClearRenderTargetView]

    lea rcx, [stageFrameWorldBind]
    call Log_SetStage
    mov rcx, [g_context]
    xor edx, edx
    lea r8, [blendFactor]
    mov r9d, -1
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_OMSetBlendState]

    lea rcx, [stageFrameWorld]
    call Log_SetStage

    ; World solid pass
    mov rcx, [g_context]
    mov rdx, [g_worldLayout]
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_IASetInputLayout]

    mov rcx, [g_context]
    mov edx, D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_IASetPrimitiveTopology]

    mov rcx, [g_context]
    xor edx, edx
    mov r8d, 1
    lea r9, [g_worldVB]
    lea rax, [worldVBStrides]
    mov qword [rsp + 20h], rax
    lea rax, [worldVBOffsets]
    mov qword [rsp + 28h], rax
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_IASetVertexBuffers]

    mov rcx, [g_context]
    mov rdx, [g_worldVS]
    xor r8d, r8d
    xor r9d, r9d
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_VSSetShader]

    mov rcx, [g_context]
    mov edx, 0
    mov r8d, 1
    lea r9, [g_worldCB]
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_VSSetConstantBuffers]

    mov rcx, [g_context]
    mov rdx, [g_worldPS]
    xor r8d, r8d
    xor r9d, r9d
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_PSSetShader]

    mov rcx, [g_context]
    mov edx, WORLD_VERTEX_COUNT
    xor r8d, r8d
    mov rax, [rcx]
    call qword [rax + ID3D11DeviceContext_Draw]

    ; Try the DX11 UI pass, but always keep the restored overlay visible
    ; until the DX11 path is visually verified.
    cmp qword [g_uiVB], 0
    je .skip_dx11_ui
    cmp qword [g_uiLayout], 0
    je .skip_dx11_ui
    cmp qword [g_uiVS], 0
    je .skip_dx11_ui
    cmp qword [g_uiPS], 0
    je .skip_dx11_ui
    cmp qword [g_uiBlend], 0
    je .skip_dx11_ui

    call RenderUI_UpdateAndDraw

.skip_dx11_ui:
    lea rcx, [stagePresent]
    call Log_SetStage

    mov rcx, [g_swapChain]
    mov edx, 1
    xor r8d, r8d
    mov rax, [rcx]
    call qword [rax + IDXGISwapChain_Present]
    test eax, eax
    js .present_fail

    call OverlayUI_Draw

    mov eax, 1
    add rsp, 68h
    ret

.null_fail:
    lea rcx, [logRenderNullDx11]
    call Log_Error
    xor eax, eax
    add rsp, 68h
    ret

.present_fail:
    mov edx, eax
    lea rcx, [logPresentFailHr]
    call Log_ErrorHex32
    lea rcx, [logFramePresentFail]
    call Log_Error
    xor eax, eax
    add rsp, 68h
    ret

ShowCompileError:
    sub rsp, 40
    mov [rsp + 20h], rcx

    mov rax, [g_errBlob]
    test rax, rax
    jz .generic

    mov rcx, rax
    mov rax, [rax]
    call qword [rax + ID3DBlob_GetBufferPointer]
    mov rdx, rax

    xor ecx, ecx
    mov r8,  [rsp + 20h]
    mov r9d, MB_ICONERROR
    call MessageBoxA

    lea rcx, [g_errBlob]
    call ReleasePtr
    jmp .done

.generic:
    xor ecx, ecx
    lea rdx, [msgShaderGeneric]
    mov r8,  [rsp + 20h]
    mov r9d, MB_ICONERROR
    call MessageBoxA

.done:
    add rsp, 40
    ret

ReleasePtr:
    sub rsp, 40
    mov rax, [rcx]
    test rax, rax
    jz .done

    mov qword [rcx], 0
    mov rcx, rax
    mov rax, [rax]
    call qword [rax + IUnknown_Release]

.done:
    add rsp, 40
    ret

Renderer_Shutdown:
    sub rsp, 40

    call OverlayUI_Shutdown

    lea rcx, [g_tmpBlob]
    call ReleasePtr
    lea rcx, [g_errBlob]
    call ReleasePtr

    lea rcx, [g_uiBlend]
    call ReleasePtr
    lea rcx, [g_uiVB]
    call ReleasePtr
    lea rcx, [g_uiLayout]
    call ReleasePtr
    lea rcx, [g_uiPS]
    call ReleasePtr
    lea rcx, [g_uiVS]
    call ReleasePtr

    lea rcx, [g_worldCB]
    call ReleasePtr
    lea rcx, [g_worldVB]
    call ReleasePtr
    lea rcx, [g_worldLayout]
    call ReleasePtr
    lea rcx, [g_worldPS]
    call ReleasePtr
    lea rcx, [g_worldVS]
    call ReleasePtr

    lea rcx, [g_worldRS]
    call ReleasePtr
    lea rcx, [g_dsv]
    call ReleasePtr
    lea rcx, [g_depthTex]
    call ReleasePtr
    lea rcx, [g_rtv]
    call ReleasePtr
    lea rcx, [g_backBuffer]
    call ReleasePtr
    lea rcx, [g_swapChain]
    call ReleasePtr
    lea rcx, [g_context]
    call ReleasePtr
    lea rcx, [g_device]
    call ReleasePtr

    mov rcx, [g_hCompilerDll]
    test rcx, rcx
    jz .no_compiler
    call FreeLibrary
    mov qword [g_hCompilerDll], 0
    mov qword [g_pD3DCompile], 0

.no_compiler:
    add rsp, 40
    ret
