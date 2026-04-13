
section .rdata align=16

windowClassName db 'Dx11NasmWindow', 0
windowTitle     db 'DX11 NASM Render Test', 0

compilerDll47Name db 'd3dcompiler_47.dll', 0
compilerDll43Name db 'd3dcompiler_43.dll', 0
compilerProcName  db 'D3DCompile', 0

entryVS db 'VSMain', 0
entryPS db 'PSMain', 0
targetVS db 'vs_5_0', 0
targetPS db 'ps_5_0', 0

semanticPOSITION db 'POSITION', 0
semanticCOLOR    db 'COLOR', 0
semanticTEXCOORD db 'TEXCOORD', 0

msgShaderVSFail db 'Vertex shader compile failed.', 0
msgShaderPSFail db 'Pixel shader compile failed.', 0
msgInitFail     db 'DX11 initialization failed.', 0
msgWindowFail   db 'Window initialization failed.', 0
msgCaption      db 'dx11_nasm_ui_cube', 0
msgShaderGeneric db 'Embedded shader compilation failed.', 0
msgCompilerFail  db 'Could not load D3D shader compiler DLL (d3dcompiler_47.dll / d3dcompiler_43.dll).', 0
msgPresentFail   db 'DX11 frame render failed. Check dx11_nasm_ui_cube.log in the EXE folder.', 0

logFileName db 'dx11_nasm_ui_cube.log', 0
logLineCRLFZ db 13, 10, 0

logPrefixInfo db '[INFO] ', 0
logPrefixWarn db '[WARN] ', 0
logPrefixError db '[ERROR] ', 0
logPrefixCritical db '[CRITICAL] ', 0

logAppStart db '[app] start', 0
logWindowCreated db '[app] window created', 0
logWindowShown db '[app] window shown', 0
logRendererInit db '[renderer] init begin', 0
logCompilerOk db '[renderer] shader compiler loaded', 0
logCompilerFail db '[renderer] shader compiler load failed', 0
logD3DHardwareTry db '[renderer] trying hardware device', 0
logD3DHardwareFail db '[renderer] hardware device failed, trying WARP', 0
logD3DWarpOk db '[renderer] WARP device created', 0
logD3DDeviceOk db '[renderer] device + swapchain created', 0
logBackBufferOk db '[renderer] backbuffer + RTV ready', 0
logWorldOk db '[renderer] world resources ready', 0
logUiOk db '[renderer] ui resources ready', 0
logFramePresentFail db '[renderer] Present failed', 0
logFrameRenderFail db '[app] frame render failed; shutting down main loop', 0
logInitFail db '[renderer] initialization failed', 0
logExit db '[app] exit', 0
logRenderNullDx11 db 'render path skipped because a required DX11 pointer was null', 0
logUiDrawSkipped db 'UI draw skipped because a required UI resource pointer was null', 0

logD3DHardwareFailHr db 'D3D11CreateDeviceAndSwapChain(HARDWARE) HRESULT = ', 0
logD3DWarpFailHr db 'D3D11CreateDeviceAndSwapChain(WARP) HRESULT = ', 0
logBackBufferFailHr db 'IDXGISwapChain::GetBuffer HRESULT = ', 0
logRTVFailHr db 'ID3D11Device::CreateRenderTargetView HRESULT = ', 0
logWorldVSCompileFailHr db 'D3DCompile(world VS) HRESULT = ', 0
logWorldVSCreateFailHr db 'ID3D11Device::CreateVertexShader(world) HRESULT = ', 0
logWorldLayoutFailHr db 'ID3D11Device::CreateInputLayout(world) HRESULT = ', 0
logWorldPSCompileFailHr db 'D3DCompile(world PS) HRESULT = ', 0
logWorldPSCreateFailHr db 'ID3D11Device::CreatePixelShader(world) HRESULT = ', 0
logWorldVBFailHr db 'ID3D11Device::CreateBuffer(world VB) HRESULT = ', 0
logWorldCBFailHr db 'ID3D11Device::CreateBuffer(world CB) HRESULT = ', 0
logUiVSCompileFailHr db 'D3DCompile(ui VS) HRESULT = ', 0
logUiVSCreateFailHr db 'ID3D11Device::CreateVertexShader(ui) HRESULT = ', 0
logUiLayoutFailHr db 'ID3D11Device::CreateInputLayout(ui) HRESULT = ', 0
logUiPSCompileFailHr db 'D3DCompile(ui PS) HRESULT = ', 0
logUiPSCreateFailHr db 'ID3D11Device::CreatePixelShader(ui) HRESULT = ', 0
logUiVBFailHr db 'ID3D11Device::CreateBuffer(ui VB) HRESULT = ', 0
logUiBlendFailHr db 'ID3D11Device::CreateBlendState(ui) HRESULT = ', 0
logPresentFailHr db 'IDXGISwapChain::Present HRESULT = ', 0

logCrashUnhandled db 'unhandled exception', 0
logCrashExceptionCode db 'exception code = ', 0
logCrashExceptionAddress db 'exception address = ', 0
logCrashStagePrefix db 'stage = ', 0

stageAppBoot db 'app.boot', 0
stageWindowInit db 'app.window.init', 0
stageRendererInit db 'renderer.init', 0
stageCompilerLoad db 'renderer.compiler.load', 0
stageDeviceCreateHardware db 'renderer.device.create.hardware', 0
stageDeviceCreateWarp db 'renderer.device.create.warp', 0
stageBackBuffer db 'renderer.backbuffer', 0
stageWorldVSCompile db 'renderer.world.vs.compile', 0
stageWorldVSCreate db 'renderer.world.vs.create', 0
stageWorldLayout db 'renderer.world.inputlayout', 0
stageWorldPSCompile db 'renderer.world.ps.compile', 0
stageWorldPSCreate db 'renderer.world.ps.create', 0
stageWorldVB db 'renderer.world.vb', 0
stageWorldCB db 'renderer.world.cb', 0
stageUIInit db 'renderer.ui.init', 0
stageUIVSCompile db 'renderer.ui.vs.compile', 0
stageUIVSCreate db 'renderer.ui.vs.create', 0
stageUILayout db 'renderer.ui.inputlayout', 0
stageUIPSCompile db 'renderer.ui.ps.compile', 0
stageUIPSCreate db 'renderer.ui.ps.create', 0
stageUIVB db 'renderer.ui.vb', 0
stageUIBlend db 'renderer.ui.blend', 0
stageMainLoop db 'app.main.loop', 0
stageMainLoopPump db 'app.main.loop.pump', 0
stageMainLoopDelta db 'app.main.loop.delta', 0
stageMainLoopUI db 'app.main.loop.ui', 0
stageMainLoopPhysics db 'app.main.loop.physics', 0
stageMainLoopRenderCall db 'app.main.loop.render.call', 0
stageMainLoopEndInput db 'app.main.loop.endinput', 0
stageFrameBegin db 'renderer.frame.begin', 0
stageFrameWorldCB db 'renderer.frame.world.cb', 0
stageFrameWorldUpload db 'renderer.frame.world.upload', 0
stageFrameWorldBind db 'renderer.frame.world.bind', 0
stageFrameWorld db 'renderer.frame.world', 0
stageFrameUIBuild db 'renderer.frame.ui.build', 0
stageFrameUIUpload db 'renderer.frame.ui.upload', 0
stageFrameUIDraw db 'renderer.frame.ui.draw', 0
stageFrameUI db 'renderer.frame.ui', 0
stagePresent db 'renderer.frame.present', 0

hexDigits db '0123456789ABCDEF', 0

IID_ID3D11Texture2D:
    dd 06F15AAF2h
    dw 0D208h
    dw 04E89h
    db 09Ah, 0B4h, 048h, 095h, 035h, 0D3h, 04Fh, 09Ch

featureLevels:
    dd 0000B000h
    dd 0000A100h
    dd 0000A000h

clearColor:
    dd 0.055
    dd 0.070
    dd 0.095
    dd 1.000

blendFactor:
    dd 0.0
    dd 0.0
    dd 0.0
    dd 0.0

viewportData:
    dd 0.0
    dd 0.0
    dd 1280.0
    dd 720.0
    dd 0.0
    dd 1.0

worldVBStrides:
    dd 20
worldVBOffsets:
    dd 0

uiVBStrides:
    dd 12
uiVBOffsets:
    dd 0

kZero        dd 0.0
kOne         dd 1.0
kMsToSeconds dd 0.001
kDefaultDT   dd 0.0166667

kGravity        dd -5.8
kLiftImpulse    dd 3.8
kLiftEnergy     dd 0.45
kNegBounce      dd -0.28
kBounceThreshold dd 0.75
kImpactEnergy   dd 0.75
kHeldEnergy     dd 0.55
kEnergyDecay    dd 1.65

kAngleBaseSpeed dd 1.15
kAngleVelScale  dd 0.35

kHoldBaseY      dd 1.20
kMouseToWorldY  dd 0.00305
kCubeMinY       dd -0.80
kCubeMaxY       dd 1.30
kCubeResetY     dd 0.62
kHeightScale    dd 0.47619048

kUIXScale dd 0.0015625
kUIYScale dd 0.0027777778

align 16
absMask:
    dd 07FFFFFFFh, 07FFFFFFFh, 07FFFFFFFh, 07FFFFFFFh

worldVertices:
    ; ground frame / guides (weight = 0.0)
    dd -1.35, -0.82, -0.70, 0FF38424Dh, 0.0
    dd  1.35, -0.82, -0.70, 0FF38424Dh, 0.0

    dd  1.35, -0.82, -0.70, 0FF38424Dh, 0.0
    dd  1.35, -0.82,  0.70, 0FF38424Dh, 0.0

    dd  1.35, -0.82,  0.70, 0FF38424Dh, 0.0
    dd -1.35, -0.82,  0.70, 0FF38424Dh, 0.0

    dd -1.35, -0.82,  0.70, 0FF38424Dh, 0.0
    dd -1.35, -0.82, -0.70, 0FF38424Dh, 0.0

    dd -1.10, -0.82,  0.00, 0FF2A323Ah, 0.0
    dd  1.10, -0.82,  0.00, 0FF2A323Ah, 0.0

    dd  0.00, -0.82, -0.55, 0FF2A323Ah, 0.0
    dd  0.00, -0.82,  0.55, 0FF2A323Ah, 0.0

    ; cube wireframe (weight = 1.0)
    ; front face
    dd -0.35,  0.35, -0.35, 0FF74E7FFh, 1.0
    dd  0.35,  0.35, -0.35, 0FF74E7FFh, 1.0

    dd  0.35,  0.35, -0.35, 0FF74E7FFh, 1.0
    dd  0.35, -0.35, -0.35, 0FF9CE8FFh, 1.0

    dd  0.35, -0.35, -0.35, 0FF9CE8FFh, 1.0
    dd -0.35, -0.35, -0.35, 0FF9CE8FFh, 1.0

    dd -0.35, -0.35, -0.35, 0FF9CE8FFh, 1.0
    dd -0.35,  0.35, -0.35, 0FF74E7FFh, 1.0

    ; back face
    dd -0.35,  0.35,  0.35, 0FFFFB860h, 1.0
    dd  0.35,  0.35,  0.35, 0FFFFB860h, 1.0

    dd  0.35,  0.35,  0.35, 0FFFFB860h, 1.0
    dd  0.35, -0.35,  0.35, 0FFFF89C0h, 1.0

    dd  0.35, -0.35,  0.35, 0FFFF89C0h, 1.0
    dd -0.35, -0.35,  0.35, 0FFFF89C0h, 1.0

    dd -0.35, -0.35,  0.35, 0FFFF89C0h, 1.0
    dd -0.35,  0.35,  0.35, 0FFFFB860h, 1.0

    ; connectors
    dd -0.35,  0.35, -0.35, 0FFFFFFFFh, 1.0
    dd -0.35,  0.35,  0.35, 0FFFFFFFFh, 1.0

    dd  0.35,  0.35, -0.35, 0FFFFFFFFh, 1.0
    dd  0.35,  0.35,  0.35, 0FFFFFFFFh, 1.0

    dd  0.35, -0.35, -0.35, 0FFFFFFFFh, 1.0
    dd  0.35, -0.35,  0.35, 0FFFFFFFFh, 1.0

    dd -0.35, -0.35, -0.35, 0FFFFFFFFh, 1.0
    dd -0.35, -0.35,  0.35, 0FFFFFFFFh, 1.0

worldInputLayout:
    dq semanticPOSITION
    dd 0
    dd DXGI_FORMAT_R32G32B32_FLOAT
    dd 0
    dd 0
    dd D3D11_INPUT_PER_VERTEX_DATA
    dd 0

    dq semanticCOLOR
    dd 0
    dd DXGI_FORMAT_R8G8B8A8_UNORM
    dd 0
    dd 12
    dd D3D11_INPUT_PER_VERTEX_DATA
    dd 0

    dq semanticTEXCOORD
    dd 0
    dd DXGI_FORMAT_R32_FLOAT
    dd 0
    dd 16
    dd D3D11_INPUT_PER_VERTEX_DATA
    dd 0

uiInputLayout:
    dq semanticPOSITION
    dd 0
    dd DXGI_FORMAT_R32G32_FLOAT
    dd 0
    dd 0
    dd D3D11_INPUT_PER_VERTEX_DATA
    dd 0

    dq semanticCOLOR
    dd 0
    dd DXGI_FORMAT_R8G8B8A8_UNORM
    dd 0
    dd 8
    dd D3D11_INPUT_PER_VERTEX_DATA
    dd 0

section .bss align=16

g_hInstance     resq 1
g_hWnd          resq 1
g_running       resd 1
g_featureLevel  resd 1

g_device        resq 1
g_context       resq 1
g_swapChain     resq 1
g_rtv           resq 1

g_worldVS       resq 1
g_worldPS       resq 1
g_worldLayout   resq 1
g_worldVB       resq 1
g_worldCB       resq 1

g_uiVS          resq 1
g_uiPS          resq 1
g_uiLayout      resq 1
g_uiVB          resq 1
g_uiBlend       resq 1

g_tmpBlob       resq 1
g_hCompilerDll  resq 1
g_pD3DCompile   resq 1
g_errBlob       resq 1
g_backBuffer    resq 1
g_logFile       resq 1
g_logBytesWritten resd 1
g_logStage      resq 1
g_vehHandle     resq 1
g_crashLogged   resd 1

g_shaderBlob        resq 1
g_shaderBytecodePtr resq 1
g_shaderBytecodeSize resq 1

g_hex32Buffer   resb 11
g_hex64Buffer   resb 19

g_worldCBData   resd 4

g_lastTick      resq 1
g_dtSeconds     resd 1

g_mouseX            resd 1
g_mouseY            resd 1
g_mouseLDown        resd 1
g_mouseLPressed     resd 1
g_mouseLReleased    resd 1

g_spaceDown         resd 1
g_spacePressed      resd 1
g_pDown             resd 1
g_pPressed          resd 1
g_rDown             resd 1
g_rPressed          resd 1

g_cubePosY      resd 1
g_cubeVelY      resd 1
g_cubeAngle     resd 1
g_cubeEnergy    resd 1
g_cubeHeight01  resd 1
g_cubeHeld      resd 1
g_physicsPaused resd 1

g_uiMouseOver   resd 1
g_uiHotWidget   resd 1
g_uiVertexCount resd 1
g_uiWritePtr    resq 1
g_uiVertices    resb UI_MAX_VERTICES * 12

g_wc            resb WNDCLASSEXA_size
g_rect          resb RECT_size
g_msg           resb MSG_size
g_swapDesc      resb DXGI_SWAP_CHAIN_DESC_size
g_bufDesc       resb D3D11_BUFFER_DESC_size
g_subData       resb D3D11_SUBRESOURCE_DATA_size
g_blendDesc     resb D3D11_BLEND_DESC_size
