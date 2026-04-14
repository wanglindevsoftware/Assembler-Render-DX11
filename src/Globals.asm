
section .rdata align=16

windowClassName db 'Dx11NasmWindow', 0
windowTitle     db 'DX11 NASM - DX11 UI Pass + Overlay Restored', 0
overlayWindowClassName db 'Dx11NasmOverlayPanel', 0

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
msgInitFail     db 'DX11 initialization failed. See dx11_nasm_ui_cube.log', 0
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
logBackBufferOk db '[renderer] backbuffer + RTV + DSV ready', 0
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
logDepthTexFailHr db 'ID3D11Device::CreateTexture2D(depth) HRESULT = ', 0
logDepthViewFailHr db 'ID3D11Device::CreateDepthStencilView HRESULT = ', 0
logRasterFailHr db 'ID3D11Device::CreateRasterizerState HRESULT = ', 0
logDepthOptionalWarn db '[renderer] depth path disabled, continuing without depth', 0
logRasterOptionalWarn db '[renderer] rasterizer state disabled, continuing with default rasterizer', 0
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
stageMainLoopCamera db 'app.main.loop.camera', 0
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
    dd 0.118
    dd 0.176
    dd 0.302
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

kGravity         dd -5.8
kLiftImpulse     dd 3.8
kLiftEnergy      dd 0.45
kNegBounce       dd -0.28
kBounceThreshold dd 0.75
kImpactEnergy    dd 0.75
kHeldEnergy      dd 0.55
kEnergyDecay     dd 1.65

kAngleBaseSpeed dd 1.15
kAngleVelScale  dd 0.35

kHoldBaseY      dd 1.20
kMouseToWorldY  dd 0.00305
kCubeMinY       dd -0.80
kCubeMaxY       dd 1.30
kCubeResetY     dd 0.62
kHeightScale    dd 0.47619048

kCameraMoveSpeed dd 2.85
kCameraLiftSpeed dd 2.20
kMouseLookSpeed  dd 0.00550
kPitchMin        dd -1.20
kPitchMax        dd 1.20
kPitchBias       dd 1.20
kPitchScale01    dd 0.41666667
kCamResetX       dd 0.00
kCamResetY       dd 0.56
kCamResetZ       dd -7.40
kCamResetYaw     dd 0.00
kCamResetPitch   dd 0.08
kCamFovMin       dd 0.78
kCamFovMax       dd 1.28
kCamFovDefault   dd 0.92
kCamFovDefault01 dd 0.40
kLightMin        dd 0.40
kLightMax        dd 1.55
kLightDefault    dd 0.95
kLightDefault01  dd 0.47826087
kAspectRatio     dd 1.7777778

kUIXScale dd 0.0015625
kUIYScale dd 0.0027777778
kUIBarWidth dd 316.0

align 16
absMask:
    dd 07FFFFFFFh, 07FFFFFFFh, 07FFFFFFFh, 07FFFFFFFh

worldVertices:

; sky shell (five faces, weight = 2.0)
; top
dd -20.0,  14.0, -20.0, 0FFF7FAFFh, 2.0
dd  20.0,  14.0, -20.0, 0FFF2F8FFh, 2.0
dd  20.0,  14.0,  20.0, 0FFF6FBFFh, 2.0

dd -20.0,  14.0, -20.0, 0FFF7FAFFh, 2.0
dd  20.0,  14.0,  20.0, 0FFF6FBFFh, 2.0
dd -20.0,  14.0,  20.0, 0FFF8FCFFh, 2.0

; front
dd -20.0,  14.0,  20.0, 0FFF7F9FFh, 2.0
dd  20.0,  14.0,  20.0, 0FFF4F8FFh, 2.0
dd  20.0,  -8.0,  20.0, 0FFD5E3FFh, 2.0

dd -20.0,  14.0,  20.0, 0FFF7F9FFh, 2.0
dd  20.0,  -8.0,  20.0, 0FFD5E3FFh, 2.0
dd -20.0,  -8.0,  20.0, 0FFD7E6FFh, 2.0

; back
dd -20.0,  14.0, -20.0, 0FFEDEFFFh, 2.0
dd  20.0,  -8.0, -20.0, 0FFD0D8F2h, 2.0
dd  20.0,  14.0, -20.0, 0FFE8EDFCh, 2.0

dd -20.0,  14.0, -20.0, 0FFEDEFFFh, 2.0
dd -20.0,  -8.0, -20.0, 0FFD4DCF6h, 2.0
dd  20.0,  -8.0, -20.0, 0FFD0D8F2h, 2.0

; left
dd -20.0,  14.0, -20.0, 0FFF1F7FFh, 2.0
dd -20.0,  14.0,  20.0, 0FFF4FAFFh, 2.0
dd -20.0,  -8.0,  20.0, 0FFD2E1FFh, 2.0

dd -20.0,  14.0, -20.0, 0FFF1F7FFh, 2.0
dd -20.0,  -8.0,  20.0, 0FFD2E1FFh, 2.0
dd -20.0,  -8.0, -20.0, 0FFCFD9F3h, 2.0

; right
dd  20.0,  14.0, -20.0, 0FFF1F6FFh, 2.0
dd  20.0,  -8.0,  20.0, 0FFD4E3FFh, 2.0
dd  20.0,  14.0,  20.0, 0FFF5FBFFh, 2.0

dd  20.0,  14.0, -20.0, 0FFF1F6FFh, 2.0
dd  20.0,  -8.0, -20.0, 0FFD0DCF8h, 2.0
dd  20.0,  -8.0,  20.0, 0FFD4E3FFh, 2.0

; terrain ground grid (triangles, weight = 0.0)
    dd -32.000, -0.7892, -32.000, 0FF3C5F46h, 0.0
    dd -28.444, -0.5237, -32.000, 0FF416B50h, 0.0
    dd -28.444, -0.6065, -28.444, 0FF426E52h, 0.0
    dd -32.000, -0.7892, -32.000, 0FF3C5F46h, 0.0
    dd -28.444, -0.6065, -28.444, 0FF426E52h, 0.0
    dd -32.000, -0.7744, -28.444, 0FF3D644Ah, 0.0
    dd -28.444, -0.5237, -32.000, 0FF416B50h, 0.0
    dd -24.889, -0.3499, -32.000, 0FF4A7662h, 0.0
    dd -24.889, -0.5301, -28.444, 0FF437054h, 0.0
    dd -28.444, -0.5237, -32.000, 0FF416B50h, 0.0
    dd -24.889, -0.5301, -28.444, 0FF437054h, 0.0
    dd -28.444, -0.6065, -28.444, 0FF426E52h, 0.0
    dd -24.889, -0.3499, -32.000, 0FF4A7662h, 0.0
    dd -21.333, -0.2946, -32.000, 0FF4E7769h, 0.0
    dd -21.333, -0.5345, -28.444, 0FF406A4Fh, 0.0
    dd -24.889, -0.3499, -32.000, 0FF4A7662h, 0.0
    dd -21.333, -0.5345, -28.444, 0FF406A4Fh, 0.0
    dd -24.889, -0.5301, -28.444, 0FF437054h, 0.0
    dd -21.333, -0.2946, -32.000, 0FF4E7769h, 0.0
    dd -17.778, -0.3455, -32.000, 0FF476E5Ah, 0.0
    dd -17.778, -0.5827, -28.444, 0FF3E644Ah, 0.0
    dd -21.333, -0.2946, -32.000, 0FF4E7769h, 0.0
    dd -17.778, -0.5827, -28.444, 0FF3E644Ah, 0.0
    dd -21.333, -0.5345, -28.444, 0FF406A4Fh, 0.0
    dd -17.778, -0.3455, -32.000, 0FF476E5Ah, 0.0
    dd -14.222, -0.4613, -32.000, 0FF3F674Ch, 0.0
    dd -14.222, -0.6319, -28.444, 0FF3F664Ch, 0.0
    dd -17.778, -0.3455, -32.000, 0FF476E5Ah, 0.0
    dd -14.222, -0.6319, -28.444, 0FF3F664Ch, 0.0
    dd -17.778, -0.5827, -28.444, 0FF3E644Ah, 0.0
    dd -14.222, -0.4613, -32.000, 0FF3F674Ch, 0.0
    dd -10.667, -0.5923, -32.000, 0FF41694Eh, 0.0
    dd -10.667, -0.6542, -28.444, 0FF426C52h, 0.0
    dd -14.222, -0.4613, -32.000, 0FF3F674Ch, 0.0
    dd -10.667, -0.6542, -28.444, 0FF426C52h, 0.0
    dd -14.222, -0.6319, -28.444, 0FF3F664Ch, 0.0
    dd -10.667, -0.5923, -32.000, 0FF41694Eh, 0.0
    dd -7.111, -0.7020, -32.000, 0FF426C51h, 0.0
    dd -7.111, -0.6494, -28.444, 0FF426D52h, 0.0
    dd -10.667, -0.5923, -32.000, 0FF41694Eh, 0.0
    dd -7.111, -0.6494, -28.444, 0FF426D52h, 0.0
    dd -10.667, -0.6542, -28.444, 0FF426C52h, 0.0
    dd -7.111, -0.7020, -32.000, 0FF426C51h, 0.0
    dd -3.556, -0.7809, -32.000, 0FF40694Eh, 0.0
    dd -3.556, -0.6439, -28.444, 0FF40674Dh, 0.0
    dd -7.111, -0.7020, -32.000, 0FF426C51h, 0.0
    dd -3.556, -0.6439, -28.444, 0FF40674Dh, 0.0
    dd -7.111, -0.6494, -28.444, 0FF426D52h, 0.0
    dd -3.556, -0.7809, -32.000, 0FF40694Eh, 0.0
    dd  0.000, -0.8464, -32.000, 0FF3D6148h, 0.0
    dd  0.000, -0.6758, -28.444, 0FF3E6248h, 0.0
    dd -3.556, -0.7809, -32.000, 0FF40694Eh, 0.0
    dd  0.000, -0.6758, -28.444, 0FF3E6248h, 0.0
    dd -3.556, -0.6439, -28.444, 0FF40674Dh, 0.0
    dd  0.000, -0.8464, -32.000, 0FF3D6148h, 0.0
    dd  3.556, -0.9289, -32.000, 0FF3B5C44h, 0.0
    dd  3.556, -0.7738, -28.444, 0FF3D6349h, 0.0
    dd  0.000, -0.8464, -32.000, 0FF3D6148h, 0.0
    dd  3.556, -0.7738, -28.444, 0FF3D6349h, 0.0
    dd  0.000, -0.6758, -28.444, 0FF3E6248h, 0.0
    dd  3.556, -0.9289, -32.000, 0FF3B5C44h, 0.0
    dd  7.111, -1.0518, -32.000, 0FF3B5E45h, 0.0
    dd  7.111, -0.9397, -28.444, 0FF3F654Bh, 0.0
    dd  3.556, -0.9289, -32.000, 0FF3B5C44h, 0.0
    dd  7.111, -0.9397, -28.444, 0FF3F654Bh, 0.0
    dd  3.556, -0.7738, -28.444, 0FF3D6349h, 0.0
    dd  7.111, -1.0518, -32.000, 0FF3B5E45h, 0.0
    dd 10.667, -1.2143, -32.000, 0FF3C6048h, 0.0
    dd 10.667, -1.1422, -28.444, 0FF3C6149h, 0.0
    dd  7.111, -1.0518, -32.000, 0FF3B5E45h, 0.0
    dd 10.667, -1.1422, -28.444, 0FF3C6149h, 0.0
    dd  7.111, -0.9397, -28.444, 0FF3F654Bh, 0.0
    dd 10.667, -1.2143, -32.000, 0FF3C6048h, 0.0
    dd 14.222, -1.3856, -32.000, 0FF3C5F47h, 0.0
    dd 14.222, -1.3258, -28.444, 0FF3A5B43h, 0.0
    dd 10.667, -1.2143, -32.000, 0FF3C6048h, 0.0
    dd 14.222, -1.3258, -28.444, 0FF3A5B43h, 0.0
    dd 10.667, -1.1422, -28.444, 0FF3C6149h, 0.0
    dd 14.222, -1.3856, -32.000, 0FF3C5F47h, 0.0
    dd 17.778, -1.5141, -32.000, 0FF395A42h, 0.0
    dd 17.778, -1.4319, -28.444, 0FF385740h, 0.0
    dd 14.222, -1.3856, -32.000, 0FF3C5F47h, 0.0
    dd 17.778, -1.4319, -28.444, 0FF385740h, 0.0
    dd 14.222, -1.3258, -28.444, 0FF3A5B43h, 0.0
    dd 17.778, -1.5141, -32.000, 0FF395A42h, 0.0
    dd 21.333, -1.5472, -32.000, 0FF385740h, 0.0
    dd 21.333, -1.4220, -28.444, 0FF395942h, 0.0
    dd 17.778, -1.5141, -32.000, 0FF395A42h, 0.0
    dd 21.333, -1.4220, -28.444, 0FF395942h, 0.0
    dd 17.778, -1.4319, -28.444, 0FF385740h, 0.0
    dd 21.333, -1.5472, -32.000, 0FF385740h, 0.0
    dd 24.889, -1.4548, -32.000, 0FF3A5A43h, 0.0
    dd 24.889, -1.2945, -28.444, 0FF3C5F47h, 0.0
    dd 21.333, -1.5472, -32.000, 0FF385740h, 0.0
    dd 24.889, -1.2945, -28.444, 0FF3C5F47h, 0.0
    dd 21.333, -1.4220, -28.444, 0FF395942h, 0.0
    dd 24.889, -1.4548, -32.000, 0FF3A5A43h, 0.0
    dd 28.444, -1.2441, -32.000, 0FF3C6048h, 0.0
    dd 28.444, -1.0865, -28.444, 0FF3E624Ah, 0.0
    dd 24.889, -1.4548, -32.000, 0FF3A5A43h, 0.0
    dd 28.444, -1.0865, -28.444, 0FF3E624Ah, 0.0
    dd 24.889, -1.2945, -28.444, 0FF3C5F47h, 0.0
    dd 28.444, -1.2441, -32.000, 0FF3C6048h, 0.0
    dd 32.000, -0.9612, -32.000, 0FF3E644Ch, 0.0
    dd 32.000, -0.8603, -28.444, 0FF3D634Ah, 0.0
    dd 28.444, -1.2441, -32.000, 0FF3C6048h, 0.0
    dd 32.000, -0.8603, -28.444, 0FF3D634Ah, 0.0
    dd 28.444, -1.0865, -28.444, 0FF3E624Ah, 0.0
    dd -32.000, -0.7744, -28.444, 0FF3D644Ah, 0.0
    dd -28.444, -0.6065, -28.444, 0FF426E52h, 0.0
    dd -28.444, -0.7839, -24.889, 0FF416A4Fh, 0.0
    dd -32.000, -0.7744, -28.444, 0FF3D644Ah, 0.0
    dd -28.444, -0.7839, -24.889, 0FF416A4Fh, 0.0
    dd -32.000, -0.8192, -24.889, 0FF40684Dh, 0.0
    dd -28.444, -0.6065, -28.444, 0FF426E52h, 0.0
    dd -24.889, -0.5301, -28.444, 0FF437054h, 0.0
    dd -24.889, -0.8041, -24.889, 0FF3E644Bh, 0.0
    dd -28.444, -0.6065, -28.444, 0FF426E52h, 0.0
    dd -24.889, -0.8041, -24.889, 0FF3E644Bh, 0.0
    dd -28.444, -0.7839, -24.889, 0FF416A4Fh, 0.0
    dd -24.889, -0.5301, -28.444, 0FF437054h, 0.0
    dd -21.333, -0.5345, -28.444, 0FF406A4Fh, 0.0
    dd -21.333, -0.8411, -24.889, 0FF3C5E46h, 0.0
    dd -24.889, -0.5301, -28.444, 0FF437054h, 0.0
    dd -21.333, -0.8411, -24.889, 0FF3C5E46h, 0.0
    dd -24.889, -0.8041, -24.889, 0FF3E644Bh, 0.0
    dd -21.333, -0.5345, -28.444, 0FF406A4Fh, 0.0
    dd -17.778, -0.5827, -28.444, 0FF3E644Ah, 0.0
    dd -17.778, -0.8530, -24.889, 0FF3D6047h, 0.0
    dd -21.333, -0.5345, -28.444, 0FF406A4Fh, 0.0
    dd -17.778, -0.8530, -24.889, 0FF3D6047h, 0.0
    dd -21.333, -0.8411, -24.889, 0FF3C5E46h, 0.0
    dd -17.778, -0.5827, -28.444, 0FF3E644Ah, 0.0
    dd -14.222, -0.6319, -28.444, 0FF3F664Ch, 0.0
    dd -14.222, -0.8160, -24.889, 0FF40674Eh, 0.0
    dd -17.778, -0.5827, -28.444, 0FF3E644Ah, 0.0
    dd -14.222, -0.8160, -24.889, 0FF40674Eh, 0.0
    dd -17.778, -0.8530, -24.889, 0FF3D6047h, 0.0
    dd -14.222, -0.6319, -28.444, 0FF3F664Ch, 0.0
    dd -10.667, -0.6542, -28.444, 0FF426C52h, 0.0
    dd -10.667, -0.7362, -24.889, 0FF426B50h, 0.0
    dd -14.222, -0.6319, -28.444, 0FF3F664Ch, 0.0
    dd -10.667, -0.7362, -24.889, 0FF426B50h, 0.0
    dd -14.222, -0.8160, -24.889, 0FF40674Eh, 0.0
    dd -10.667, -0.6542, -28.444, 0FF426C52h, 0.0
    dd -7.111, -0.6494, -28.444, 0FF426D52h, 0.0
    dd -7.111, -0.6481, -24.889, 0FF40684Eh, 0.0
    dd -10.667, -0.6542, -28.444, 0FF426C52h, 0.0
    dd -7.111, -0.6481, -24.889, 0FF40684Eh, 0.0
    dd -10.667, -0.7362, -24.889, 0FF426B50h, 0.0
    dd -7.111, -0.6494, -28.444, 0FF426D52h, 0.0
    dd -3.556, -0.6439, -28.444, 0FF40674Dh, 0.0
    dd -3.556, -0.5985, -24.889, 0FF3F644Ah, 0.0
    dd -7.111, -0.6494, -28.444, 0FF426D52h, 0.0
    dd -3.556, -0.5985, -24.889, 0FF3F644Ah, 0.0
    dd -7.111, -0.6481, -24.889, 0FF40684Eh, 0.0
    dd -3.556, -0.6439, -28.444, 0FF40674Dh, 0.0
    dd  0.000, -0.6758, -28.444, 0FF3E6248h, 0.0
    dd  0.000, -0.6248, -24.889, 0FF3F654Bh, 0.0
    dd -3.556, -0.6439, -28.444, 0FF40674Dh, 0.0
    dd  0.000, -0.6248, -24.889, 0FF3F654Bh, 0.0
    dd -3.556, -0.5985, -24.889, 0FF3F644Ah, 0.0
    dd  0.000, -0.6758, -28.444, 0FF3E6248h, 0.0
    dd  3.556, -0.7738, -28.444, 0FF3D6349h, 0.0
    dd  3.556, -0.7360, -24.889, 0FF41694Eh, 0.0
    dd  0.000, -0.6758, -28.444, 0FF3E6248h, 0.0
    dd  3.556, -0.7360, -24.889, 0FF41694Eh, 0.0
    dd  0.000, -0.6248, -24.889, 0FF3F654Bh, 0.0
    dd  3.556, -0.7738, -28.444, 0FF3D6349h, 0.0
    dd  7.111, -0.9397, -28.444, 0FF3F654Bh, 0.0
    dd  7.111, -0.9061, -24.889, 0FF40674Dh, 0.0
    dd  3.556, -0.7738, -28.444, 0FF3D6349h, 0.0
    dd  7.111, -0.9061, -24.889, 0FF40674Dh, 0.0
    dd  3.556, -0.7360, -24.889, 0FF41694Eh, 0.0
    dd  7.111, -0.9397, -28.444, 0FF3F654Bh, 0.0
    dd 10.667, -1.1422, -28.444, 0FF3C6149h, 0.0
    dd 10.667, -1.0825, -24.889, 0FF3C5E46h, 0.0
    dd  7.111, -0.9397, -28.444, 0FF3F654Bh, 0.0
    dd 10.667, -1.0825, -24.889, 0FF3C5E46h, 0.0
    dd  7.111, -0.9061, -24.889, 0FF40674Dh, 0.0
    dd 10.667, -1.1422, -28.444, 0FF3C6149h, 0.0
    dd 14.222, -1.3258, -28.444, 0FF3A5B43h, 0.0
    dd 14.222, -1.2062, -24.889, 0FF385740h, 0.0
    dd 10.667, -1.1422, -28.444, 0FF3C6149h, 0.0
    dd 14.222, -1.2062, -24.889, 0FF385740h, 0.0
    dd 10.667, -1.0825, -24.889, 0FF3C5E46h, 0.0
    dd 14.222, -1.3258, -28.444, 0FF3A5B43h, 0.0
    dd 17.778, -1.4319, -28.444, 0FF385740h, 0.0
    dd 17.778, -1.2359, -24.889, 0FF395841h, 0.0
    dd 14.222, -1.3258, -28.444, 0FF3A5B43h, 0.0
    dd 17.778, -1.2359, -24.889, 0FF395841h, 0.0
    dd 14.222, -1.2062, -24.889, 0FF385740h, 0.0
    dd 17.778, -1.4319, -28.444, 0FF385740h, 0.0
    dd 21.333, -1.4220, -28.444, 0FF395942h, 0.0
    dd 21.333, -1.1646, -24.889, 0FF3B5E46h, 0.0
    dd 17.778, -1.4319, -28.444, 0FF385740h, 0.0
    dd 21.333, -1.1646, -24.889, 0FF3B5E46h, 0.0
    dd 17.778, -1.2359, -24.889, 0FF395841h, 0.0
    dd 21.333, -1.4220, -28.444, 0FF395942h, 0.0
    dd 24.889, -1.2945, -28.444, 0FF3C5F47h, 0.0
    dd 24.889, -1.0225, -24.889, 0FF3F644Bh, 0.0
    dd 21.333, -1.4220, -28.444, 0FF395942h, 0.0
    dd 24.889, -1.0225, -24.889, 0FF3F644Bh, 0.0
    dd 21.333, -1.1646, -24.889, 0FF3B5E46h, 0.0
    dd 24.889, -1.2945, -28.444, 0FF3C5F47h, 0.0
    dd 28.444, -1.0865, -28.444, 0FF3E624Ah, 0.0
    dd 28.444, -0.8642, -24.889, 0FF3E644Bh, 0.0
    dd 24.889, -1.2945, -28.444, 0FF3C5F47h, 0.0
    dd 28.444, -0.8642, -24.889, 0FF3E644Bh, 0.0
    dd 24.889, -1.0225, -24.889, 0FF3F644Bh, 0.0
    dd 28.444, -1.0865, -28.444, 0FF3E624Ah, 0.0
    dd 32.000, -0.8603, -28.444, 0FF3D634Ah, 0.0
    dd 32.000, -0.7464, -24.889, 0FF3D6148h, 0.0
    dd 28.444, -1.0865, -28.444, 0FF3E624Ah, 0.0
    dd 32.000, -0.7464, -24.889, 0FF3D6148h, 0.0
    dd 28.444, -0.8642, -24.889, 0FF3E644Bh, 0.0
    dd -32.000, -0.8192, -24.889, 0FF40684Dh, 0.0
    dd -28.444, -0.7839, -24.889, 0FF416A4Fh, 0.0
    dd -28.444, -0.9722, -21.333, 0FF3D6249h, 0.0
    dd -32.000, -0.8192, -24.889, 0FF40684Dh, 0.0
    dd -28.444, -0.9722, -21.333, 0FF3D6249h, 0.0
    dd -32.000, -0.8838, -21.333, 0FF40684Dh, 0.0
    dd -28.444, -0.7839, -24.889, 0FF416A4Fh, 0.0
    dd -24.889, -0.8041, -24.889, 0FF3E644Bh, 0.0
    dd -24.889, -1.0598, -21.333, 0FF395A42h, 0.0
    dd -28.444, -0.7839, -24.889, 0FF416A4Fh, 0.0
    dd -24.889, -1.0598, -21.333, 0FF395A42h, 0.0
    dd -28.444, -0.9722, -21.333, 0FF3D6249h, 0.0
    dd -24.889, -0.8041, -24.889, 0FF3E644Bh, 0.0
    dd -21.333, -0.8411, -24.889, 0FF3C5E46h, 0.0
    dd -21.333, -1.0997, -21.333, 0FF395A42h, 0.0
    dd -24.889, -0.8041, -24.889, 0FF3E644Bh, 0.0
    dd -21.333, -1.0997, -21.333, 0FF395A42h, 0.0
    dd -24.889, -1.0598, -21.333, 0FF395A42h, 0.0
    dd -21.333, -0.8411, -24.889, 0FF3C5E46h, 0.0
    dd -17.778, -0.8530, -24.889, 0FF3D6047h, 0.0
    dd -17.778, -1.0655, -21.333, 0FF3C6048h, 0.0
    dd -21.333, -0.8411, -24.889, 0FF3C5E46h, 0.0
    dd -17.778, -1.0655, -21.333, 0FF3C6048h, 0.0
    dd -21.333, -1.0997, -21.333, 0FF395A42h, 0.0
    dd -17.778, -0.8530, -24.889, 0FF3D6047h, 0.0
    dd -14.222, -0.8160, -24.889, 0FF40674Eh, 0.0
    dd -14.222, -0.9637, -21.333, 0FF3F654Ch, 0.0
    dd -17.778, -0.8530, -24.889, 0FF3D6047h, 0.0
    dd -14.222, -0.9637, -21.333, 0FF3F654Ch, 0.0
    dd -17.778, -1.0655, -21.333, 0FF3C6048h, 0.0
    dd -14.222, -0.8160, -24.889, 0FF40674Eh, 0.0
    dd -10.667, -0.7362, -24.889, 0FF426B50h, 0.0
    dd -10.667, -0.8317, -21.333, 0FF3F654Bh, 0.0
    dd -14.222, -0.8160, -24.889, 0FF40674Eh, 0.0
    dd -10.667, -0.8317, -21.333, 0FF3F654Bh, 0.0
    dd -14.222, -0.9637, -21.333, 0FF3F654Ch, 0.0
    dd -10.667, -0.7362, -24.889, 0FF426B50h, 0.0
    dd -7.111, -0.6481, -24.889, 0FF40684Eh, 0.0
    dd -7.111, -0.7218, -21.333, 0FF3D6248h, 0.0
    dd -10.667, -0.7362, -24.889, 0FF426B50h, 0.0
    dd -7.111, -0.7218, -21.333, 0FF3D6248h, 0.0
    dd -10.667, -0.8317, -21.333, 0FF3F654Bh, 0.0
    dd -7.111, -0.6481, -24.889, 0FF40684Eh, 0.0
    dd -3.556, -0.5985, -24.889, 0FF3F644Ah, 0.0
    dd -3.556, -0.6783, -21.333, 0FF3E6349h, 0.0
    dd -7.111, -0.6481, -24.889, 0FF40684Eh, 0.0
    dd -3.556, -0.6783, -21.333, 0FF3E6349h, 0.0
    dd -7.111, -0.7218, -21.333, 0FF3D6248h, 0.0
    dd -3.556, -0.5985, -24.889, 0FF3F644Ah, 0.0
    dd  0.000, -0.6248, -24.889, 0FF3F654Bh, 0.0
    dd  0.000, -0.7181, -21.333, 0FF40684Dh, 0.0
    dd -3.556, -0.5985, -24.889, 0FF3F644Ah, 0.0
    dd  0.000, -0.7181, -21.333, 0FF40684Dh, 0.0
    dd -3.556, -0.6783, -21.333, 0FF3E6349h, 0.0
    dd  0.000, -0.6248, -24.889, 0FF3F654Bh, 0.0
    dd  3.556, -0.7360, -24.889, 0FF41694Eh, 0.0
    dd  3.556, -0.8228, -21.333, 0FF416A4Fh, 0.0
    dd  0.000, -0.6248, -24.889, 0FF3F654Bh, 0.0
    dd  3.556, -0.8228, -21.333, 0FF416A4Fh, 0.0
    dd  0.000, -0.7181, -21.333, 0FF40684Dh, 0.0
    dd  3.556, -0.7360, -24.889, 0FF41694Eh, 0.0
    dd  7.111, -0.9061, -24.889, 0FF40674Dh, 0.0
    dd  7.111, -0.9465, -21.333, 0FF3D634Ah, 0.0
    dd  3.556, -0.7360, -24.889, 0FF41694Eh, 0.0
    dd  7.111, -0.9465, -21.333, 0FF3D634Ah, 0.0
    dd  3.556, -0.8228, -21.333, 0FF416A4Fh, 0.0
    dd  7.111, -0.9061, -24.889, 0FF40674Dh, 0.0
    dd 10.667, -1.0825, -24.889, 0FF3C5E46h, 0.0
    dd 10.667, -1.0354, -21.333, 0FF395B44h, 0.0
    dd  7.111, -0.9061, -24.889, 0FF40674Dh, 0.0
    dd 10.667, -1.0354, -21.333, 0FF395B44h, 0.0
    dd  7.111, -0.9465, -21.333, 0FF3D634Ah, 0.0
    dd 10.667, -1.0825, -24.889, 0FF3C5E46h, 0.0
    dd 14.222, -1.2062, -24.889, 0FF385740h, 0.0
    dd 14.222, -1.0508, -21.333, 0FF395A42h, 0.0
    dd 10.667, -1.0825, -24.889, 0FF3C5E46h, 0.0
    dd 14.222, -1.0508, -21.333, 0FF395A42h, 0.0
    dd 10.667, -1.0354, -21.333, 0FF395B44h, 0.0
    dd 14.222, -1.2062, -24.889, 0FF385740h, 0.0
    dd 17.778, -1.2359, -24.889, 0FF395841h, 0.0
    dd 17.778, -0.9858, -21.333, 0FF3D6248h, 0.0
    dd 14.222, -1.2062, -24.889, 0FF385740h, 0.0
    dd 17.778, -0.9858, -21.333, 0FF3D6248h, 0.0
    dd 14.222, -1.0508, -21.333, 0FF395A42h, 0.0
    dd 17.778, -1.2359, -24.889, 0FF395841h, 0.0
    dd 21.333, -1.1646, -24.889, 0FF3B5E46h, 0.0
    dd 21.333, -0.8684, -21.333, 0FF40694Fh, 0.0
    dd 17.778, -1.2359, -24.889, 0FF395841h, 0.0
    dd 21.333, -0.8684, -21.333, 0FF40694Fh, 0.0
    dd 17.778, -0.9858, -21.333, 0FF3D6248h, 0.0
    dd 21.333, -1.1646, -24.889, 0FF3B5E46h, 0.0
    dd 24.889, -1.0225, -24.889, 0FF3F644Bh, 0.0
    dd 24.889, -0.7490, -21.333, 0FF40674Eh, 0.0
    dd 21.333, -1.1646, -24.889, 0FF3B5E46h, 0.0
    dd 24.889, -0.7490, -21.333, 0FF40674Eh, 0.0
    dd 21.333, -0.8684, -21.333, 0FF40694Fh, 0.0
    dd 24.889, -1.0225, -24.889, 0FF3F644Bh, 0.0
    dd 28.444, -0.8642, -24.889, 0FF3E644Bh, 0.0
    dd 28.444, -0.6785, -21.333, 0FF3E6349h, 0.0
    dd 24.889, -1.0225, -24.889, 0FF3F644Bh, 0.0
    dd 28.444, -0.6785, -21.333, 0FF3E6349h, 0.0
    dd 24.889, -0.7490, -21.333, 0FF40674Eh, 0.0
    dd 28.444, -0.8642, -24.889, 0FF3E644Bh, 0.0
    dd 32.000, -0.7464, -24.889, 0FF3D6148h, 0.0
    dd 32.000, -0.6866, -21.333, 0FF3D6349h, 0.0
    dd 28.444, -0.8642, -24.889, 0FF3E644Bh, 0.0
    dd 32.000, -0.6866, -21.333, 0FF3D6349h, 0.0
    dd 28.444, -0.6785, -21.333, 0FF3E6349h, 0.0
    dd -32.000, -0.8838, -21.333, 0FF40684Dh, 0.0
    dd -28.444, -0.9722, -21.333, 0FF3D6249h, 0.0
    dd -28.444, -1.0965, -17.778, 0FF3A5A42h, 0.0
    dd -32.000, -0.8838, -21.333, 0FF40684Dh, 0.0
    dd -28.444, -1.0965, -17.778, 0FF3A5A42h, 0.0
    dd -32.000, -0.9333, -17.778, 0FF3E644Ah, 0.0
    dd -28.444, -0.9722, -21.333, 0FF3D6249h, 0.0
    dd -24.889, -1.0598, -21.333, 0FF395A42h, 0.0
    dd -24.889, -1.2053, -17.778, 0FF385740h, 0.0
    dd -28.444, -0.9722, -21.333, 0FF3D6249h, 0.0
    dd -24.889, -1.2053, -17.778, 0FF385740h, 0.0
    dd -28.444, -1.0965, -17.778, 0FF3A5A42h, 0.0
    dd -24.889, -1.0598, -21.333, 0FF395A42h, 0.0
    dd -21.333, -1.0997, -21.333, 0FF395A42h, 0.0
    dd -21.333, -1.2263, -17.778, 0FF3B5C45h, 0.0
    dd -24.889, -1.0598, -21.333, 0FF395A42h, 0.0
    dd -21.333, -1.2263, -17.778, 0FF3B5C45h, 0.0
    dd -24.889, -1.2053, -17.778, 0FF385740h, 0.0
    dd -21.333, -1.0997, -21.333, 0FF395A42h, 0.0
    dd -17.778, -1.0655, -21.333, 0FF3C6048h, 0.0
    dd -17.778, -1.1609, -17.778, 0FF3D6048h, 0.0
    dd -21.333, -1.0997, -21.333, 0FF395A42h, 0.0
    dd -17.778, -1.1609, -17.778, 0FF3D6048h, 0.0
    dd -21.333, -1.2263, -17.778, 0FF3B5C45h, 0.0
    dd -17.778, -1.0655, -21.333, 0FF3C6048h, 0.0
    dd -14.222, -0.9637, -21.333, 0FF3F654Ch, 0.0
    dd -14.222, -1.0434, -17.778, 0FF3D6148h, 0.0
    dd -17.778, -1.0655, -21.333, 0FF3C6048h, 0.0
    dd -14.222, -1.0434, -17.778, 0FF3D6148h, 0.0
    dd -17.778, -1.1609, -17.778, 0FF3D6048h, 0.0
    dd -14.222, -0.9637, -21.333, 0FF3F654Ch, 0.0
    dd -10.667, -0.8317, -21.333, 0FF3F654Bh, 0.0
    dd -10.667, -0.9256, -17.778, 0FF3C5E46h, 0.0
    dd -14.222, -0.9637, -21.333, 0FF3F654Ch, 0.0
    dd -10.667, -0.9256, -17.778, 0FF3C5E46h, 0.0
    dd -14.222, -1.0434, -17.778, 0FF3D6148h, 0.0
    dd -10.667, -0.8317, -21.333, 0FF3F654Bh, 0.0
    dd -7.111, -0.7218, -21.333, 0FF3D6248h, 0.0
    dd -7.111, -0.8541, -17.778, 0FF3C5F46h, 0.0
    dd -10.667, -0.8317, -21.333, 0FF3F654Bh, 0.0
    dd -7.111, -0.8541, -17.778, 0FF3C5F46h, 0.0
    dd -10.667, -0.9256, -17.778, 0FF3C5E46h, 0.0
    dd -7.111, -0.7218, -21.333, 0FF3D6248h, 0.0
    dd -3.556, -0.6783, -21.333, 0FF3E6349h, 0.0
    dd -3.556, -0.8500, -17.778, 0FF3E644Ah, 0.0
    dd -7.111, -0.7218, -21.333, 0FF3D6248h, 0.0
    dd -3.556, -0.8500, -17.778, 0FF3E644Ah, 0.0
    dd -7.111, -0.8541, -17.778, 0FF3C5F46h, 0.0
    dd -3.556, -0.6783, -21.333, 0FF3E6349h, 0.0
    dd  0.000, -0.7181, -21.333, 0FF40684Dh, 0.0
    dd  0.000, -0.9010, -17.778, 0FF40674Dh, 0.0
    dd -3.556, -0.6783, -21.333, 0FF3E6349h, 0.0
    dd  0.000, -0.9010, -17.778, 0FF40674Dh, 0.0
    dd -3.556, -0.8500, -17.778, 0FF3E644Ah, 0.0
    dd  0.000, -0.7181, -21.333, 0FF40684Dh, 0.0
    dd  3.556, -0.8228, -21.333, 0FF416A4Fh, 0.0
    dd  3.556, -0.9678, -17.778, 0FF3E634Ah, 0.0
    dd  0.000, -0.7181, -21.333, 0FF40684Dh, 0.0
    dd  3.556, -0.9678, -17.778, 0FF3E634Ah, 0.0
    dd  0.000, -0.9010, -17.778, 0FF40674Dh, 0.0
    dd  3.556, -0.8228, -21.333, 0FF416A4Fh, 0.0
    dd  7.111, -0.9465, -21.333, 0FF3D634Ah, 0.0
    dd  7.111, -1.0033, -17.778, 0FF3B5D44h, 0.0
    dd  3.556, -0.8228, -21.333, 0FF416A4Fh, 0.0
    dd  7.111, -1.0033, -17.778, 0FF3B5D44h, 0.0
    dd  3.556, -0.9678, -17.778, 0FF3E634Ah, 0.0
    dd  7.111, -0.9465, -21.333, 0FF3D634Ah, 0.0
    dd 10.667, -1.0354, -21.333, 0FF395B44h, 0.0
    dd 10.667, -0.9747, -17.778, 0FF3A5C44h, 0.0
    dd  7.111, -0.9465, -21.333, 0FF3D634Ah, 0.0
    dd 10.667, -0.9747, -17.778, 0FF3A5C44h, 0.0
    dd  7.111, -1.0033, -17.778, 0FF3B5D44h, 0.0
    dd 10.667, -1.0354, -21.333, 0FF395B44h, 0.0
    dd 14.222, -1.0508, -21.333, 0FF395A42h, 0.0
    dd 14.222, -0.8798, -17.778, 0FF3D6249h, 0.0
    dd 10.667, -1.0354, -21.333, 0FF395B44h, 0.0
    dd 14.222, -0.8798, -17.778, 0FF3D6249h, 0.0
    dd 10.667, -0.9747, -17.778, 0FF3A5C44h, 0.0
    dd 14.222, -1.0508, -21.333, 0FF395A42h, 0.0
    dd 17.778, -0.9858, -21.333, 0FF3D6248h, 0.0
    dd 17.778, -0.7487, -17.778, 0FF426A50h, 0.0
    dd 14.222, -1.0508, -21.333, 0FF395A42h, 0.0
    dd 17.778, -0.7487, -17.778, 0FF426A50h, 0.0
    dd 14.222, -0.8798, -17.778, 0FF3D6249h, 0.0
    dd 17.778, -0.9858, -21.333, 0FF3D6248h, 0.0
    dd 21.333, -0.8684, -21.333, 0FF40694Fh, 0.0
    dd 21.333, -0.6319, -17.778, 0FF426C51h, 0.0
    dd 17.778, -0.9858, -21.333, 0FF3D6248h, 0.0
    dd 21.333, -0.6319, -17.778, 0FF426C51h, 0.0
    dd 17.778, -0.7487, -17.778, 0FF426A50h, 0.0
    dd 21.333, -0.8684, -21.333, 0FF40694Fh, 0.0
    dd 24.889, -0.7490, -21.333, 0FF40674Eh, 0.0
    dd 24.889, -0.5786, -17.778, 0FF40674Ch, 0.0
    dd 21.333, -0.8684, -21.333, 0FF40694Fh, 0.0
    dd 24.889, -0.5786, -17.778, 0FF40674Ch, 0.0
    dd 21.333, -0.6319, -17.778, 0FF426C51h, 0.0
    dd 24.889, -0.7490, -21.333, 0FF40674Eh, 0.0
    dd 28.444, -0.6785, -21.333, 0FF3E6349h, 0.0
    dd 28.444, -0.6146, -17.778, 0FF3E6449h, 0.0
    dd 24.889, -0.7490, -21.333, 0FF40674Eh, 0.0
    dd 28.444, -0.6146, -17.778, 0FF3E6449h, 0.0
    dd 24.889, -0.5786, -17.778, 0FF40674Ch, 0.0
    dd 28.444, -0.6785, -21.333, 0FF3E6349h, 0.0
    dd 32.000, -0.6866, -21.333, 0FF3D6349h, 0.0
    dd 32.000, -0.7307, -17.778, 0FF3F664Ch, 0.0
    dd 28.444, -0.6785, -21.333, 0FF3E6349h, 0.0
    dd 32.000, -0.7307, -17.778, 0FF3F664Ch, 0.0
    dd 28.444, -0.6146, -17.778, 0FF3E6449h, 0.0
    dd -32.000, -0.9333, -17.778, 0FF3E644Ah, 0.0
    dd -28.444, -1.0965, -17.778, 0FF3A5A42h, 0.0
    dd -28.444, -1.1271, -14.222, 0FF385841h, 0.0
    dd -32.000, -0.9333, -17.778, 0FF3E644Ah, 0.0
    dd -28.444, -1.1271, -14.222, 0FF385841h, 0.0
    dd -32.000, -0.9557, -14.222, 0FF3B5E46h, 0.0
    dd -28.444, -1.0965, -17.778, 0FF3A5A42h, 0.0
    dd -24.889, -1.2053, -17.778, 0FF385740h, 0.0
    dd -24.889, -1.2143, -14.222, 0FF3A5B44h, 0.0
    dd -28.444, -1.0965, -17.778, 0FF3A5A42h, 0.0
    dd -24.889, -1.2143, -14.222, 0FF3A5B44h, 0.0
    dd -28.444, -1.1271, -14.222, 0FF385841h, 0.0
    dd -24.889, -1.2053, -17.778, 0FF385740h, 0.0
    dd -21.333, -1.2263, -17.778, 0FF3B5C45h, 0.0
    dd -21.333, -1.2113, -14.222, 0FF3C6048h, 0.0
    dd -24.889, -1.2053, -17.778, 0FF385740h, 0.0
    dd -21.333, -1.2113, -14.222, 0FF3C6048h, 0.0
    dd -24.889, -1.2143, -14.222, 0FF3A5B44h, 0.0
    dd -21.333, -1.2263, -17.778, 0FF3B5C45h, 0.0
    dd -17.778, -1.1609, -17.778, 0FF3D6048h, 0.0
    dd -17.778, -1.1458, -14.222, 0FF3C6047h, 0.0
    dd -21.333, -1.2263, -17.778, 0FF3B5C45h, 0.0
    dd -17.778, -1.1458, -14.222, 0FF3C6047h, 0.0
    dd -21.333, -1.2113, -14.222, 0FF3C6048h, 0.0
    dd -17.778, -1.1609, -17.778, 0FF3D6048h, 0.0
    dd -14.222, -1.0434, -17.778, 0FF3D6148h, 0.0
    dd -14.222, -1.0646, -14.222, 0FF3A5C44h, 0.0
    dd -17.778, -1.1609, -17.778, 0FF3D6048h, 0.0
    dd -14.222, -1.0646, -14.222, 0FF3A5C44h, 0.0
    dd -17.778, -1.1458, -14.222, 0FF3C6047h, 0.0
    dd -14.222, -1.0434, -17.778, 0FF3D6148h, 0.0
    dd -10.667, -0.9256, -17.778, 0FF3C5E46h, 0.0
    dd -10.667, -1.0110, -14.222, 0FF3A5B43h, 0.0
    dd -14.222, -1.0434, -17.778, 0FF3D6148h, 0.0
    dd -10.667, -1.0110, -14.222, 0FF3A5B43h, 0.0
    dd -14.222, -1.0646, -14.222, 0FF3A5C44h, 0.0
    dd -10.667, -0.9256, -17.778, 0FF3C5E46h, 0.0
    dd -7.111, -0.8541, -17.778, 0FF3C5F46h, 0.0
    dd -7.111, -1.0058, -14.222, 0FF3C5F46h, 0.0
    dd -10.667, -0.9256, -17.778, 0FF3C5E46h, 0.0
    dd -7.111, -1.0058, -14.222, 0FF3C5F46h, 0.0
    dd -10.667, -1.0110, -14.222, 0FF3A5B43h, 0.0
    dd -7.111, -0.8541, -17.778, 0FF3C5F46h, 0.0
    dd -3.556, -0.8500, -17.778, 0FF3E644Ah, 0.0
    dd -3.556, -1.0382, -14.222, 0FF3D634Ah, 0.0
    dd -7.111, -0.8541, -17.778, 0FF3C5F46h, 0.0
    dd -3.556, -1.0382, -14.222, 0FF3D634Ah, 0.0
    dd -7.111, -1.0058, -14.222, 0FF3C5F46h, 0.0
    dd -3.556, -0.8500, -17.778, 0FF3E644Ah, 0.0
    dd  0.000, -0.9010, -17.778, 0FF40674Dh, 0.0
    dd  0.000, -1.0729, -14.222, 0FF3D6249h, 0.0
    dd -3.556, -0.8500, -17.778, 0FF3E644Ah, 0.0
    dd  0.000, -1.0729, -14.222, 0FF3D6249h, 0.0
    dd -3.556, -1.0382, -14.222, 0FF3D634Ah, 0.0
    dd  0.000, -0.9010, -17.778, 0FF40674Dh, 0.0
    dd  3.556, -0.9678, -17.778, 0FF3E634Ah, 0.0
    dd  3.556, -1.0680, -14.222, 0FF3A5D44h, 0.0
    dd  0.000, -0.9010, -17.778, 0FF40674Dh, 0.0
    dd  3.556, -1.0680, -14.222, 0FF3A5D44h, 0.0
    dd  0.000, -1.0729, -14.222, 0FF3D6249h, 0.0
    dd  3.556, -0.9678, -17.778, 0FF3E634Ah, 0.0
    dd  7.111, -1.0033, -17.778, 0FF3B5D44h, 0.0
    dd  7.111, -0.9969, -14.222, 0FF3A5B43h, 0.0
    dd  3.556, -0.9678, -17.778, 0FF3E634Ah, 0.0
    dd  7.111, -0.9969, -14.222, 0FF3A5B43h, 0.0
    dd  3.556, -1.0680, -14.222, 0FF3A5D44h, 0.0
    dd  7.111, -1.0033, -17.778, 0FF3B5D44h, 0.0
    dd 10.667, -0.9747, -17.778, 0FF3A5C44h, 0.0
    dd 10.667, -0.8630, -14.222, 0FF3D6249h, 0.0
    dd  7.111, -1.0033, -17.778, 0FF3B5D44h, 0.0
    dd 10.667, -0.8630, -14.222, 0FF3D6249h, 0.0
    dd  7.111, -0.9969, -14.222, 0FF3A5B43h, 0.0
    dd 10.667, -0.9747, -17.778, 0FF3A5C44h, 0.0
    dd 14.222, -0.8798, -17.778, 0FF3D6249h, 0.0
    dd 14.222, -0.7016, -14.222, 0FF416C51h, 0.0
    dd 10.667, -0.9747, -17.778, 0FF3A5C44h, 0.0
    dd 14.222, -0.7016, -14.222, 0FF416C51h, 0.0
    dd 10.667, -0.8630, -14.222, 0FF3D6249h, 0.0
    dd 14.222, -0.8798, -17.778, 0FF3D6249h, 0.0
    dd 17.778, -0.7487, -17.778, 0FF426A50h, 0.0
    dd 17.778, -0.5670, -14.222, 0FF436F53h, 0.0
    dd 14.222, -0.8798, -17.778, 0FF3D6249h, 0.0
    dd 17.778, -0.5670, -14.222, 0FF436F53h, 0.0
    dd 14.222, -0.7016, -14.222, 0FF416C51h, 0.0
    dd 17.778, -0.7487, -17.778, 0FF426A50h, 0.0
    dd 21.333, -0.6319, -17.778, 0FF426C51h, 0.0
    dd 21.333, -0.5098, -14.222, 0FF41694Eh, 0.0
    dd 17.778, -0.7487, -17.778, 0FF426A50h, 0.0
    dd 21.333, -0.5098, -14.222, 0FF41694Eh, 0.0
    dd 17.778, -0.5670, -14.222, 0FF436F53h, 0.0
    dd 21.333, -0.6319, -17.778, 0FF426C51h, 0.0
    dd 24.889, -0.5786, -17.778, 0FF40674Ch, 0.0
    dd 24.889, -0.5553, -14.222, 0FF3E654Ah, 0.0
    dd 21.333, -0.6319, -17.778, 0FF426C51h, 0.0
    dd 24.889, -0.5553, -14.222, 0FF3E654Ah, 0.0
    dd 21.333, -0.5098, -14.222, 0FF41694Eh, 0.0
    dd 24.889, -0.5786, -17.778, 0FF40674Ch, 0.0
    dd 28.444, -0.6146, -17.778, 0FF3E6449h, 0.0
    dd 28.444, -0.6920, -14.222, 0FF3E664Bh, 0.0
    dd 24.889, -0.5786, -17.778, 0FF40674Ch, 0.0
    dd 28.444, -0.6920, -14.222, 0FF3E664Bh, 0.0
    dd 24.889, -0.5553, -14.222, 0FF3E654Ah, 0.0
    dd 28.444, -0.6146, -17.778, 0FF3E6449h, 0.0
    dd 32.000, -0.7307, -17.778, 0FF3F664Ch, 0.0
    dd 32.000, -0.8748, -14.222, 0FF3F674Dh, 0.0
    dd 28.444, -0.6146, -17.778, 0FF3E6449h, 0.0
    dd 32.000, -0.8748, -14.222, 0FF3F674Dh, 0.0
    dd 28.444, -0.6920, -14.222, 0FF3E664Bh, 0.0
    dd -32.000, -0.9557, -14.222, 0FF3B5E46h, 0.0
    dd -28.444, -1.1271, -14.222, 0FF385841h, 0.0
    dd -28.444, -1.0858, -10.667, 0FF3A5C44h, 0.0
    dd -32.000, -0.9557, -14.222, 0FF3B5E46h, 0.0
    dd -28.444, -1.0858, -10.667, 0FF3A5C44h, 0.0
    dd -32.000, -0.9583, -10.667, 0FF3A5C44h, 0.0
    dd -28.444, -1.1271, -14.222, 0FF385841h, 0.0
    dd -24.889, -1.2143, -14.222, 0FF3A5B44h, 0.0
    dd -24.889, -1.1331, -10.667, 0FF3C6048h, 0.0
    dd -28.444, -1.1271, -14.222, 0FF385841h, 0.0
    dd -24.889, -1.1331, -10.667, 0FF3C6048h, 0.0
    dd -28.444, -1.0858, -10.667, 0FF3A5C44h, 0.0
    dd -24.889, -1.2143, -14.222, 0FF3A5B44h, 0.0
    dd -21.333, -1.2113, -14.222, 0FF3C6048h, 0.0
    dd -21.333, -1.1213, -10.667, 0FF3C6149h, 0.0
    dd -24.889, -1.2143, -14.222, 0FF3A5B44h, 0.0
    dd -21.333, -1.1213, -10.667, 0FF3C6149h, 0.0
    dd -24.889, -1.1331, -10.667, 0FF3C6048h, 0.0
    dd -21.333, -1.2113, -14.222, 0FF3C6048h, 0.0
    dd -17.778, -1.1458, -14.222, 0FF3C6047h, 0.0
    dd -17.778, -1.0901, -10.667, 0FF3B5D45h, 0.0
    dd -21.333, -1.2113, -14.222, 0FF3C6048h, 0.0
    dd -17.778, -1.0901, -10.667, 0FF3B5D45h, 0.0
    dd -21.333, -1.1213, -10.667, 0FF3C6149h, 0.0
    dd -17.778, -1.1458, -14.222, 0FF3C6047h, 0.0
    dd -14.222, -1.0646, -14.222, 0FF3A5C44h, 0.0
    dd -14.222, -1.0770, -10.667, 0FF395942h, 0.0
    dd -17.778, -1.1458, -14.222, 0FF3C6047h, 0.0
    dd -14.222, -1.0770, -10.667, 0FF395942h, 0.0
    dd -17.778, -1.0901, -10.667, 0FF3B5D45h, 0.0
    dd -14.222, -1.0646, -14.222, 0FF3A5C44h, 0.0
    dd -10.667, -1.0110, -14.222, 0FF3A5B43h, 0.0
    dd -10.667, -1.0983, -10.667, 0FF3A5C43h, 0.0
    dd -14.222, -1.0646, -14.222, 0FF3A5C44h, 0.0
    dd -10.667, -1.0983, -10.667, 0FF3A5C43h, 0.0
    dd -14.222, -1.0770, -10.667, 0FF395942h, 0.0
    dd -10.667, -1.0110, -14.222, 0FF3A5B43h, 0.0
    dd -7.111, -1.0058, -14.222, 0FF3C5F46h, 0.0
    dd -7.111, -1.1411, -10.667, 0FF3C6048h, 0.0
    dd -10.667, -1.0110, -14.222, 0FF3A5B43h, 0.0
    dd -7.111, -1.1411, -10.667, 0FF3C6048h, 0.0
    dd -10.667, -1.0983, -10.667, 0FF3A5C43h, 0.0
    dd -7.111, -1.0058, -14.222, 0FF3C5F46h, 0.0
    dd -3.556, -1.0382, -14.222, 0FF3D634Ah, 0.0
    dd -3.556, -1.1699, -10.667, 0FF3C6048h, 0.0
    dd -7.111, -1.0058, -14.222, 0FF3C5F46h, 0.0
    dd -3.556, -1.1699, -10.667, 0FF3C6048h, 0.0
    dd -7.111, -1.1411, -10.667, 0FF3C6048h, 0.0
    dd -3.556, -1.0382, -14.222, 0FF3D634Ah, 0.0
    dd  0.000, -1.0729, -14.222, 0FF3D6249h, 0.0
    dd  0.000, -1.1452, -10.667, 0FF3A5C44h, 0.0
    dd -3.556, -1.0382, -14.222, 0FF3D634Ah, 0.0
    dd  0.000, -1.1452, -10.667, 0FF3A5C44h, 0.0
    dd -3.556, -1.1699, -10.667, 0FF3C6048h, 0.0
    dd  0.000, -1.0729, -14.222, 0FF3D6249h, 0.0
    dd  3.556, -1.0680, -14.222, 0FF3A5D44h, 0.0
    dd  3.556, -1.0443, -10.667, 0FF395A42h, 0.0
    dd  0.000, -1.0729, -14.222, 0FF3D6249h, 0.0
    dd  3.556, -1.0443, -10.667, 0FF395A42h, 0.0
    dd  0.000, -1.1452, -10.667, 0FF3A5C44h, 0.0
    dd  3.556, -1.0680, -14.222, 0FF3A5D44h, 0.0
    dd  7.111, -0.9969, -14.222, 0FF3A5B43h, 0.0
    dd  7.111, -0.8762, -10.667, 0FF3C6047h, 0.0
    dd  3.556, -1.0680, -14.222, 0FF3A5D44h, 0.0
    dd  7.111, -0.8762, -10.667, 0FF3C6047h, 0.0
    dd  3.556, -1.0443, -10.667, 0FF395A42h, 0.0
    dd  7.111, -0.9969, -14.222, 0FF3A5B43h, 0.0
    dd 10.667, -0.8630, -14.222, 0FF3D6249h, 0.0
    dd 10.667, -0.6820, -10.667, 0FF426B50h, 0.0
    dd  7.111, -0.9969, -14.222, 0FF3A5B43h, 0.0
    dd 10.667, -0.6820, -10.667, 0FF426B50h, 0.0
    dd  7.111, -0.8762, -10.667, 0FF3C6047h, 0.0
    dd 10.667, -0.8630, -14.222, 0FF3D6249h, 0.0
    dd 14.222, -0.7016, -14.222, 0FF416C51h, 0.0
    dd 14.222, -0.5214, -10.667, 0FF447054h, 0.0
    dd 10.667, -0.8630, -14.222, 0FF3D6249h, 0.0
    dd 14.222, -0.5214, -10.667, 0FF447054h, 0.0
    dd 10.667, -0.6820, -10.667, 0FF426B50h, 0.0
    dd 14.222, -0.7016, -14.222, 0FF416C51h, 0.0
    dd 17.778, -0.5670, -14.222, 0FF436F53h, 0.0
    dd 17.778, -0.4493, -10.667, 0FF426D50h, 0.0
    dd 14.222, -0.7016, -14.222, 0FF416C51h, 0.0
    dd 17.778, -0.4493, -10.667, 0FF426D50h, 0.0
    dd 14.222, -0.5214, -10.667, 0FF447054h, 0.0
    dd 17.778, -0.5670, -14.222, 0FF436F53h, 0.0
    dd 21.333, -0.5098, -14.222, 0FF41694Eh, 0.0
    dd 21.333, -0.4937, -10.667, 0FF3F674Bh, 0.0
    dd 17.778, -0.5670, -14.222, 0FF436F53h, 0.0
    dd 21.333, -0.4937, -10.667, 0FF3F674Bh, 0.0
    dd 17.778, -0.4493, -10.667, 0FF426D50h, 0.0
    dd 21.333, -0.5098, -14.222, 0FF41694Eh, 0.0
    dd 24.889, -0.5553, -14.222, 0FF3E654Ah, 0.0
    dd 24.889, -0.6437, -10.667, 0FF3F654Bh, 0.0
    dd 21.333, -0.5098, -14.222, 0FF41694Eh, 0.0
    dd 24.889, -0.6437, -10.667, 0FF3F654Bh, 0.0
    dd 21.333, -0.4937, -10.667, 0FF3F674Bh, 0.0
    dd 24.889, -0.5553, -14.222, 0FF3E654Ah, 0.0
    dd 28.444, -0.6920, -14.222, 0FF3E664Bh, 0.0
    dd 28.444, -0.8523, -10.667, 0FF40674Dh, 0.0
    dd 24.889, -0.5553, -14.222, 0FF3E654Ah, 0.0
    dd 28.444, -0.8523, -10.667, 0FF40674Dh, 0.0
    dd 24.889, -0.6437, -10.667, 0FF3F654Bh, 0.0
    dd 28.444, -0.6920, -14.222, 0FF3E664Bh, 0.0
    dd 32.000, -0.8748, -14.222, 0FF3F674Dh, 0.0
    dd 32.000, -1.0547, -10.667, 0FF3E634Ah, 0.0
    dd 28.444, -0.6920, -14.222, 0FF3E664Bh, 0.0
    dd 32.000, -1.0547, -10.667, 0FF3E634Ah, 0.0
    dd 28.444, -0.8523, -10.667, 0FF40674Dh, 0.0
    dd -32.000, -0.9583, -10.667, 0FF3A5C44h, 0.0
    dd -28.444, -1.0858, -10.667, 0FF3A5C44h, 0.0
    dd -28.444, -1.0216, -7.111, 0FF3E624Ah, 0.0
    dd -32.000, -0.9583, -10.667, 0FF3A5C44h, 0.0
    dd -28.444, -1.0216, -7.111, 0FF3E624Ah, 0.0
    dd -32.000, -0.9510, -7.111, 0FF3B5F45h, 0.0
    dd -28.444, -1.0858, -10.667, 0FF3A5C44h, 0.0
    dd -24.889, -1.1331, -10.667, 0FF3C6048h, 0.0
    dd -24.889, -1.0452, -7.111, 0FF3E634Ah, 0.0
    dd -28.444, -1.0858, -10.667, 0FF3A5C44h, 0.0
    dd -24.889, -1.0452, -7.111, 0FF3E634Ah, 0.0
    dd -28.444, -1.0216, -7.111, 0FF3E624Ah, 0.0
    dd -24.889, -1.1331, -10.667, 0FF3C6048h, 0.0
    dd -21.333, -1.1213, -10.667, 0FF3C6149h, 0.0
    dd -21.333, -1.0556, -7.111, 0FF3B5F46h, 0.0
    dd -24.889, -1.1331, -10.667, 0FF3C6048h, 0.0
    dd -21.333, -1.0556, -7.111, 0FF3B5F46h, 0.0
    dd -24.889, -1.0452, -7.111, 0FF3E634Ah, 0.0
    dd -21.333, -1.1213, -10.667, 0FF3C6149h, 0.0
    dd -17.778, -1.0901, -10.667, 0FF3B5D45h, 0.0
    dd -17.778, -1.0840, -7.111, 0FF395942h, 0.0
    dd -21.333, -1.1213, -10.667, 0FF3C6149h, 0.0
    dd -17.778, -1.0840, -7.111, 0FF395942h, 0.0
    dd -21.333, -1.0556, -7.111, 0FF3B5F46h, 0.0
    dd -17.778, -1.0901, -10.667, 0FF3B5D45h, 0.0
    dd -14.222, -1.0770, -10.667, 0FF395942h, 0.0
    dd -14.222, -1.1402, -7.111, 0FF395A42h, 0.0
    dd -17.778, -1.0901, -10.667, 0FF3B5D45h, 0.0
    dd -14.222, -1.1402, -7.111, 0FF395A42h, 0.0
    dd -17.778, -1.0840, -7.111, 0FF395942h, 0.0
    dd -14.222, -1.0770, -10.667, 0FF395942h, 0.0
    dd -10.667, -1.0983, -10.667, 0FF3A5C43h, 0.0
    dd -10.667, -1.2063, -7.111, 0FF3C5E46h, 0.0
    dd -14.222, -1.0770, -10.667, 0FF395942h, 0.0
    dd -10.667, -1.2063, -7.111, 0FF3C5E46h, 0.0
    dd -14.222, -1.1402, -7.111, 0FF395A42h, 0.0
    dd -10.667, -1.0983, -10.667, 0FF3A5C43h, 0.0
    dd -7.111, -1.1411, -10.667, 0FF3C6048h, 0.0
    dd -7.111, -1.2436, -7.111, 0FF3D6048h, 0.0
    dd -10.667, -1.0983, -10.667, 0FF3A5C43h, 0.0
    dd -7.111, -1.2436, -7.111, 0FF3D6048h, 0.0
    dd -10.667, -1.2063, -7.111, 0FF3C5E46h, 0.0
    dd -7.111, -1.1411, -10.667, 0FF3C6048h, 0.0
    dd -3.556, -1.1699, -10.667, 0FF3C6048h, 0.0
    dd -3.556, -1.2092, -7.111, 0FF3B5C44h, 0.0
    dd -7.111, -1.1411, -10.667, 0FF3C6048h, 0.0
    dd -3.556, -1.2092, -7.111, 0FF3B5C44h, 0.0
    dd -7.111, -1.2436, -7.111, 0FF3D6048h, 0.0
    dd -3.556, -1.1699, -10.667, 0FF3C6048h, 0.0
    dd  0.000, -1.1452, -10.667, 0FF3A5C44h, 0.0
    dd  0.000, -1.0593, -7.111, 0FF395A42h, 0.0
    dd -3.556, -1.1699, -10.667, 0FF3C6048h, 0.0
    dd  0.000, -1.0593, -7.111, 0FF395A42h, 0.0
    dd -3.556, -1.2092, -7.111, 0FF3B5C44h, 0.0
    dd  0.000, -1.1452, -10.667, 0FF3A5C44h, 0.0
    dd  3.556, -1.0443, -10.667, 0FF395A42h, 0.0
    dd  3.556, -0.8884, -7.111, 0FF3C5F46h, 0.0
    dd  0.000, -1.1452, -10.667, 0FF3A5C44h, 0.0
    dd  3.556, -0.8884, -7.111, 0FF3C5F46h, 0.0
    dd  0.000, -1.0593, -7.111, 0FF395A42h, 0.0
    dd  3.556, -1.0443, -10.667, 0FF395A42h, 0.0
    dd  7.111, -0.8762, -10.667, 0FF3C6047h, 0.0
    dd  7.111, -0.6568, -7.111, 0FF416B4Fh, 0.0
    dd  3.556, -1.0443, -10.667, 0FF395A42h, 0.0
    dd  7.111, -0.6568, -7.111, 0FF416B4Fh, 0.0
    dd  3.556, -0.8884, -7.111, 0FF3C5F46h, 0.0
    dd  7.111, -0.8762, -10.667, 0FF3C6047h, 0.0
    dd 10.667, -0.6820, -10.667, 0FF426B50h, 0.0
    dd 10.667, -0.4589, -7.111, 0FF457256h, 0.0
    dd  7.111, -0.8762, -10.667, 0FF3C6047h, 0.0
    dd 10.667, -0.4589, -7.111, 0FF457256h, 0.0
    dd  7.111, -0.6568, -7.111, 0FF416B4Fh, 0.0
    dd 10.667, -0.6820, -10.667, 0FF426B50h, 0.0
    dd 14.222, -0.5214, -10.667, 0FF447054h, 0.0
    dd 14.222, -0.3566, -7.111, 0FF47715Ch, 0.0
    dd 10.667, -0.6820, -10.667, 0FF426B50h, 0.0
    dd 14.222, -0.3566, -7.111, 0FF47715Ch, 0.0
    dd 10.667, -0.4589, -7.111, 0FF457256h, 0.0
    dd 14.222, -0.5214, -10.667, 0FF447054h, 0.0
    dd 17.778, -0.4493, -10.667, 0FF426D50h, 0.0
    dd 17.778, -0.3831, -7.111, 0FF436A52h, 0.0
    dd 14.222, -0.5214, -10.667, 0FF447054h, 0.0
    dd 17.778, -0.3831, -7.111, 0FF436A52h, 0.0
    dd 14.222, -0.3566, -7.111, 0FF47715Ch, 0.0
    dd 17.778, -0.4493, -10.667, 0FF426D50h, 0.0
    dd 21.333, -0.4937, -10.667, 0FF3F674Bh, 0.0
    dd 21.333, -0.5313, -7.111, 0FF3F674Ch, 0.0
    dd 17.778, -0.4493, -10.667, 0FF426D50h, 0.0
    dd 21.333, -0.5313, -7.111, 0FF3F674Ch, 0.0
    dd 17.778, -0.3831, -7.111, 0FF436A52h, 0.0
    dd 21.333, -0.4937, -10.667, 0FF3F674Bh, 0.0
    dd 24.889, -0.6437, -10.667, 0FF3F654Bh, 0.0
    dd 24.889, -0.7560, -7.111, 0FF40684Eh, 0.0
    dd 21.333, -0.4937, -10.667, 0FF3F674Bh, 0.0
    dd 24.889, -0.7560, -7.111, 0FF40684Eh, 0.0
    dd 21.333, -0.5313, -7.111, 0FF3F674Ch, 0.0
    dd 24.889, -0.6437, -10.667, 0FF3F654Bh, 0.0
    dd 28.444, -0.8523, -10.667, 0FF40674Dh, 0.0
    dd 28.444, -0.9916, -7.111, 0FF3F654Bh, 0.0
    dd 24.889, -0.6437, -10.667, 0FF3F654Bh, 0.0
    dd 28.444, -0.9916, -7.111, 0FF3F654Bh, 0.0
    dd 24.889, -0.7560, -7.111, 0FF40684Eh, 0.0
    dd 28.444, -0.8523, -10.667, 0FF40674Dh, 0.0
    dd 32.000, -1.0547, -10.667, 0FF3E634Ah, 0.0
    dd 32.000, -1.1763, -7.111, 0FF3B5D45h, 0.0
    dd 28.444, -0.8523, -10.667, 0FF40674Dh, 0.0
    dd 32.000, -1.1763, -7.111, 0FF3B5D45h, 0.0
    dd 28.444, -0.9916, -7.111, 0FF3F654Bh, 0.0
    dd -32.000, -0.9510, -7.111, 0FF3B5F45h, 0.0
    dd -28.444, -1.0216, -7.111, 0FF3E624Ah, 0.0
    dd -28.444, -0.9763, -3.556, 0FF3F654Ch, 0.0
    dd -32.000, -0.9510, -7.111, 0FF3B5F45h, 0.0
    dd -28.444, -0.9763, -3.556, 0FF3F654Ch, 0.0
    dd -32.000, -0.9328, -3.556, 0FF3E634Ah, 0.0
    dd -28.444, -1.0216, -7.111, 0FF3E624Ah, 0.0
    dd -24.889, -1.0452, -7.111, 0FF3E634Ah, 0.0
    dd -24.889, -1.0190, -3.556, 0FF3D6148h, 0.0
    dd -28.444, -1.0216, -7.111, 0FF3E624Ah, 0.0
    dd -24.889, -1.0190, -3.556, 0FF3D6148h, 0.0
    dd -28.444, -0.9763, -3.556, 0FF3F654Ch, 0.0
    dd -24.889, -1.0452, -7.111, 0FF3E634Ah, 0.0
    dd -21.333, -1.0556, -7.111, 0FF3B5F46h, 0.0
    dd -21.333, -1.0864, -3.556, 0FF395A43h, 0.0
    dd -24.889, -1.0452, -7.111, 0FF3E634Ah, 0.0
    dd -21.333, -1.0864, -3.556, 0FF395A43h, 0.0
    dd -24.889, -1.0190, -3.556, 0FF3D6148h, 0.0
    dd -21.333, -1.0556, -7.111, 0FF3B5F46h, 0.0
    dd -17.778, -1.0840, -7.111, 0FF395942h, 0.0
    dd -17.778, -1.1819, -3.556, 0FF385841h, 0.0
    dd -21.333, -1.0556, -7.111, 0FF3B5F46h, 0.0
    dd -17.778, -1.1819, -3.556, 0FF385841h, 0.0
    dd -21.333, -1.0864, -3.556, 0FF395A43h, 0.0
    dd -17.778, -1.0840, -7.111, 0FF395942h, 0.0
    dd -14.222, -1.1402, -7.111, 0FF395A42h, 0.0
    dd -14.222, -1.2810, -3.556, 0FF3B5D45h, 0.0
    dd -17.778, -1.0840, -7.111, 0FF395942h, 0.0
    dd -14.222, -1.2810, -3.556, 0FF3B5D45h, 0.0
    dd -17.778, -1.1819, -3.556, 0FF385841h, 0.0
    dd -14.222, -1.1402, -7.111, 0FF395A42h, 0.0
    dd -10.667, -1.2063, -7.111, 0FF3C5E46h, 0.0
    dd -10.667, -1.3394, -3.556, 0FF3D6048h, 0.0
    dd -14.222, -1.1402, -7.111, 0FF395A42h, 0.0
    dd -10.667, -1.3394, -3.556, 0FF3D6048h, 0.0
    dd -14.222, -1.2810, -3.556, 0FF3B5D45h, 0.0
    dd -10.667, -1.2063, -7.111, 0FF3C5E46h, 0.0
    dd -7.111, -1.2436, -7.111, 0FF3D6048h, 0.0
    dd -7.111, -1.3094, -3.556, 0FF3B5D46h, 0.0
    dd -10.667, -1.2063, -7.111, 0FF3C5E46h, 0.0
    dd -7.111, -1.3094, -3.556, 0FF3B5D46h, 0.0
    dd -10.667, -1.3394, -3.556, 0FF3D6048h, 0.0
    dd -7.111, -1.2436, -7.111, 0FF3D6048h, 0.0
    dd -3.556, -1.2092, -7.111, 0FF3B5C44h, 0.0
    dd -3.556, -1.0445, -3.556, 0FF395B43h, 0.0
    dd -7.111, -1.2436, -7.111, 0FF3D6048h, 0.0
    dd -3.556, -1.0445, -3.556, 0FF395B43h, 0.0
    dd -7.111, -1.3094, -3.556, 0FF3B5D46h, 0.0
    dd -3.556, -1.2092, -7.111, 0FF3B5C44h, 0.0
    dd  0.000, -1.0593, -7.111, 0FF395A42h, 0.0
    dd  0.000, -0.8764, -3.556, 0FF3B5E45h, 0.0
    dd -3.556, -1.2092, -7.111, 0FF3B5C44h, 0.0
    dd  0.000, -0.8764, -3.556, 0FF3B5E45h, 0.0
    dd -3.556, -1.0445, -3.556, 0FF395B43h, 0.0
    dd  0.000, -1.0593, -7.111, 0FF395A42h, 0.0
    dd  3.556, -0.8884, -7.111, 0FF3C5F46h, 0.0
    dd  3.556, -0.7264, -3.556, 0FF40684Dh, 0.0
    dd  0.000, -1.0593, -7.111, 0FF395A42h, 0.0
    dd  3.556, -0.7264, -3.556, 0FF40684Dh, 0.0
    dd  0.000, -0.8764, -3.556, 0FF3B5E45h, 0.0
    dd  3.556, -0.8884, -7.111, 0FF3C5F46h, 0.0
    dd  7.111, -0.6568, -7.111, 0FF416B4Fh, 0.0
    dd  7.111, -0.4236, -3.556, 0FF467357h, 0.0
    dd  3.556, -0.8884, -7.111, 0FF3C5F46h, 0.0
    dd  7.111, -0.4236, -3.556, 0FF467357h, 0.0
    dd  3.556, -0.7264, -3.556, 0FF40684Dh, 0.0
    dd  7.111, -0.6568, -7.111, 0FF416B4Fh, 0.0
    dd 10.667, -0.4589, -7.111, 0FF457256h, 0.0
    dd 10.667, -0.2650, -3.556, 0FF4F776Ch, 0.0
    dd  7.111, -0.6568, -7.111, 0FF416B4Fh, 0.0
    dd 10.667, -0.2650, -3.556, 0FF4F776Ch, 0.0
    dd  7.111, -0.4236, -3.556, 0FF467357h, 0.0
    dd 10.667, -0.4589, -7.111, 0FF457256h, 0.0
    dd 14.222, -0.3566, -7.111, 0FF47715Ch, 0.0
    dd 14.222, -0.2438, -3.556, 0FF4D7167h, 0.0
    dd 10.667, -0.4589, -7.111, 0FF457256h, 0.0
    dd 14.222, -0.2438, -3.556, 0FF4D7167h, 0.0
    dd 10.667, -0.2650, -3.556, 0FF4F776Ch, 0.0
    dd 14.222, -0.3566, -7.111, 0FF47715Ch, 0.0
    dd 17.778, -0.3831, -7.111, 0FF436A52h, 0.0
    dd 17.778, -0.3571, -3.556, 0FF446B57h, 0.0
    dd 14.222, -0.3566, -7.111, 0FF47715Ch, 0.0
    dd 17.778, -0.3571, -3.556, 0FF446B57h, 0.0
    dd 14.222, -0.2438, -3.556, 0FF4D7167h, 0.0
    dd 17.778, -0.3831, -7.111, 0FF436A52h, 0.0
    dd 21.333, -0.5313, -7.111, 0FF3F674Ch, 0.0
    dd 21.333, -0.5656, -3.556, 0FF426B50h, 0.0
    dd 17.778, -0.3831, -7.111, 0FF436A52h, 0.0
    dd 21.333, -0.5656, -3.556, 0FF426B50h, 0.0
    dd 17.778, -0.3571, -3.556, 0FF446B57h, 0.0
    dd 21.333, -0.5313, -7.111, 0FF3F674Ch, 0.0
    dd 24.889, -0.7560, -7.111, 0FF40684Eh, 0.0
    dd 24.889, -0.8071, -3.556, 0FF416A50h, 0.0
    dd 21.333, -0.5313, -7.111, 0FF3F674Ch, 0.0
    dd 24.889, -0.8071, -3.556, 0FF416A50h, 0.0
    dd 21.333, -0.5656, -3.556, 0FF426B50h, 0.0
    dd 24.889, -0.7560, -7.111, 0FF40684Eh, 0.0
    dd 28.444, -0.9916, -7.111, 0FF3F654Bh, 0.0
    dd 28.444, -1.0210, -3.556, 0FF3D6249h, 0.0
    dd 24.889, -0.7560, -7.111, 0FF40684Eh, 0.0
    dd 28.444, -1.0210, -3.556, 0FF3D6249h, 0.0
    dd 24.889, -0.8071, -3.556, 0FF416A50h, 0.0
    dd 28.444, -0.9916, -7.111, 0FF3F654Bh, 0.0
    dd 32.000, -1.1763, -7.111, 0FF3B5D45h, 0.0
    dd 32.000, -1.1693, -3.556, 0FF395841h, 0.0
    dd 28.444, -0.9916, -7.111, 0FF3F654Bh, 0.0
    dd 32.000, -1.1693, -3.556, 0FF395841h, 0.0
    dd 28.444, -1.0210, -3.556, 0FF3D6249h, 0.0
    dd -32.000, -0.9328, -3.556, 0FF3E634Ah, 0.0
    dd -28.444, -0.9763, -3.556, 0FF3F654Ch, 0.0
    dd -28.444, -0.9633,  0.000, 0FF3E634Ah, 0.0
    dd -32.000, -0.9328, -3.556, 0FF3E634Ah, 0.0
    dd -28.444, -0.9633,  0.000, 0FF3E634Ah, 0.0
    dd -32.000, -0.8936,  0.000, 0FF40674Dh, 0.0
    dd -28.444, -0.9763, -3.556, 0FF3F654Ch, 0.0
    dd -24.889, -1.0190, -3.556, 0FF3D6148h, 0.0
    dd -24.889, -1.0711,  0.000, 0FF3A5B43h, 0.0
    dd -28.444, -0.9763, -3.556, 0FF3F654Ch, 0.0
    dd -24.889, -1.0711,  0.000, 0FF3A5B43h, 0.0
    dd -28.444, -0.9633,  0.000, 0FF3E634Ah, 0.0
    dd -24.889, -1.0190, -3.556, 0FF3D6148h, 0.0
    dd -21.333, -1.0864, -3.556, 0FF395A43h, 0.0
    dd -21.333, -1.2152,  0.000, 0FF385740h, 0.0
    dd -24.889, -1.0190, -3.556, 0FF3D6148h, 0.0
    dd -21.333, -1.2152,  0.000, 0FF385740h, 0.0
    dd -24.889, -1.0711,  0.000, 0FF3A5B43h, 0.0
    dd -21.333, -1.0864, -3.556, 0FF395A43h, 0.0
    dd -17.778, -1.1819, -3.556, 0FF385841h, 0.0
    dd -17.778, -1.3641,  0.000, 0FF3A5C44h, 0.0
    dd -21.333, -1.0864, -3.556, 0FF395A43h, 0.0
    dd -17.778, -1.3641,  0.000, 0FF3A5C44h, 0.0
    dd -21.333, -1.2152,  0.000, 0FF385740h, 0.0
    dd -17.778, -1.1819, -3.556, 0FF385841h, 0.0
    dd -14.222, -1.2810, -3.556, 0FF3B5D45h, 0.0
    dd -14.222, -1.4661,  0.000, 0FF3D6048h, 0.0
    dd -17.778, -1.1819, -3.556, 0FF385841h, 0.0
    dd -14.222, -1.4661,  0.000, 0FF3D6048h, 0.0
    dd -17.778, -1.3641,  0.000, 0FF3A5C44h, 0.0
    dd -14.222, -1.2810, -3.556, 0FF3B5D45h, 0.0
    dd -10.667, -1.3394, -3.556, 0FF3D6048h, 0.0
    dd -10.667, -1.4698,  0.000, 0FF3C5E46h, 0.0
    dd -14.222, -1.2810, -3.556, 0FF3B5D45h, 0.0
    dd -10.667, -1.4698,  0.000, 0FF3C5E46h, 0.0
    dd -14.222, -1.4661,  0.000, 0FF3D6048h, 0.0
    dd -10.667, -1.3394, -3.556, 0FF3D6048h, 0.0
    dd -7.111, -1.3094, -3.556, 0FF3B5D46h, 0.0
    dd -7.111, -1.2882,  0.000, 0FF395942h, 0.0
    dd -10.667, -1.3394, -3.556, 0FF3D6048h, 0.0
    dd -7.111, -1.2882,  0.000, 0FF395942h, 0.0
    dd -10.667, -1.4698,  0.000, 0FF3C5E46h, 0.0
    dd -7.111, -1.3094, -3.556, 0FF3B5D46h, 0.0
    dd -3.556, -1.0445, -3.556, 0FF395B43h, 0.0
    dd -3.556, -0.9476,  0.000, 0FF3A5D44h, 0.0
    dd -7.111, -1.3094, -3.556, 0FF3B5D46h, 0.0
    dd -3.556, -0.9476,  0.000, 0FF3A5D44h, 0.0
    dd -7.111, -1.2882,  0.000, 0FF395942h, 0.0
    dd -3.556, -1.0445, -3.556, 0FF395B43h, 0.0
    dd  0.000, -0.8764, -3.556, 0FF3B5E45h, 0.0
    dd  0.000, -0.8200,  0.000, 0FF3E644Ah, 0.0
    dd -3.556, -1.0445, -3.556, 0FF395B43h, 0.0
    dd  0.000, -0.8200,  0.000, 0FF3E644Ah, 0.0
    dd -3.556, -0.9476,  0.000, 0FF3A5D44h, 0.0
    dd  0.000, -0.8764, -3.556, 0FF3B5E45h, 0.0
    dd  3.556, -0.7264, -3.556, 0FF40684Dh, 0.0
    dd  3.556, -0.6774,  0.000, 0FF436C51h, 0.0
    dd  0.000, -0.8764, -3.556, 0FF3B5E45h, 0.0
    dd  3.556, -0.6774,  0.000, 0FF436C51h, 0.0
    dd  0.000, -0.8200,  0.000, 0FF3E644Ah, 0.0
    dd  3.556, -0.7264, -3.556, 0FF40684Dh, 0.0
    dd  7.111, -0.4236, -3.556, 0FF467357h, 0.0
    dd  7.111, -0.3378,  0.000, 0FF4B7561h, 0.0
    dd  3.556, -0.7264, -3.556, 0FF40684Dh, 0.0
    dd  7.111, -0.3378,  0.000, 0FF4B7561h, 0.0
    dd  3.556, -0.6774,  0.000, 0FF436C51h, 0.0
    dd  7.111, -0.4236, -3.556, 0FF467357h, 0.0
    dd 10.667, -0.2650, -3.556, 0FF4F776Ch, 0.0
    dd 10.667, -0.1834,  0.000, 0FF527471h, 0.0
    dd  7.111, -0.4236, -3.556, 0FF467357h, 0.0
    dd 10.667, -0.1834,  0.000, 0FF527471h, 0.0
    dd  7.111, -0.3378,  0.000, 0FF4B7561h, 0.0
    dd 10.667, -0.2650, -3.556, 0FF4F776Ch, 0.0
    dd 14.222, -0.2438, -3.556, 0FF4D7167h, 0.0
    dd 14.222, -0.2251,  0.000, 0FF4E7069h, 0.0
    dd 10.667, -0.2650, -3.556, 0FF4F776Ch, 0.0
    dd 14.222, -0.2251,  0.000, 0FF4E7069h, 0.0
    dd 10.667, -0.1834,  0.000, 0FF527471h, 0.0
    dd 14.222, -0.2438, -3.556, 0FF4D7167h, 0.0
    dd 17.778, -0.3571, -3.556, 0FF446B57h, 0.0
    dd 17.778, -0.3718,  0.000, 0FF467059h, 0.0
    dd 14.222, -0.2438, -3.556, 0FF4D7167h, 0.0
    dd 17.778, -0.3718,  0.000, 0FF467059h, 0.0
    dd 14.222, -0.2251,  0.000, 0FF4E7069h, 0.0
    dd 17.778, -0.3571, -3.556, 0FF446B57h, 0.0
    dd 21.333, -0.5656, -3.556, 0FF426B50h, 0.0
    dd 21.333, -0.5693,  0.000, 0FF446F53h, 0.0
    dd 17.778, -0.3571, -3.556, 0FF446B57h, 0.0
    dd 21.333, -0.5693,  0.000, 0FF446F53h, 0.0
    dd 17.778, -0.3718,  0.000, 0FF467059h, 0.0
    dd 21.333, -0.5656, -3.556, 0FF426B50h, 0.0
    dd 24.889, -0.8071, -3.556, 0FF416A50h, 0.0
    dd 24.889, -0.7630,  0.000, 0FF41694Fh, 0.0
    dd 21.333, -0.5656, -3.556, 0FF426B50h, 0.0
    dd 24.889, -0.7630,  0.000, 0FF41694Fh, 0.0
    dd 21.333, -0.5693,  0.000, 0FF446F53h, 0.0
    dd 24.889, -0.8071, -3.556, 0FF416A50h, 0.0
    dd 28.444, -1.0210, -3.556, 0FF3D6249h, 0.0
    dd 28.444, -0.9184,  0.000, 0FF3C5F47h, 0.0
    dd 24.889, -0.8071, -3.556, 0FF416A50h, 0.0
    dd 28.444, -0.9184,  0.000, 0FF3C5F47h, 0.0
    dd 24.889, -0.7630,  0.000, 0FF41694Fh, 0.0
    dd 28.444, -1.0210, -3.556, 0FF3D6249h, 0.0
    dd 32.000, -1.1693, -3.556, 0FF395841h, 0.0
    dd 32.000, -1.0305,  0.000, 0FF395B43h, 0.0
    dd 28.444, -1.0210, -3.556, 0FF3D6249h, 0.0
    dd 32.000, -1.0305,  0.000, 0FF395B43h, 0.0
    dd 28.444, -0.9184,  0.000, 0FF3C5F47h, 0.0
    dd -32.000, -0.8936,  0.000, 0FF40674Dh, 0.0
    dd -28.444, -0.9633,  0.000, 0FF3E634Ah, 0.0
    dd -28.444, -0.9702,  3.556, 0FF3B5E46h, 0.0
    dd -32.000, -0.8936,  0.000, 0FF40674Dh, 0.0
    dd -28.444, -0.9702,  3.556, 0FF3B5E46h, 0.0
    dd -32.000, -0.8305,  3.556, 0FF40674Dh, 0.0
    dd -28.444, -0.9633,  0.000, 0FF3E634Ah, 0.0
    dd -24.889, -1.0711,  0.000, 0FF3A5B43h, 0.0
    dd -24.889, -1.1638,  3.556, 0FF385740h, 0.0
    dd -28.444, -0.9633,  0.000, 0FF3E634Ah, 0.0
    dd -24.889, -1.1638,  3.556, 0FF385740h, 0.0
    dd -28.444, -0.9702,  3.556, 0FF3B5E46h, 0.0
    dd -24.889, -1.0711,  0.000, 0FF3A5B43h, 0.0
    dd -21.333, -1.2152,  0.000, 0FF385740h, 0.0
    dd -21.333, -1.3745,  3.556, 0FF3A5B43h, 0.0
    dd -24.889, -1.0711,  0.000, 0FF3A5B43h, 0.0
    dd -21.333, -1.3745,  3.556, 0FF3A5B43h, 0.0
    dd -24.889, -1.1638,  3.556, 0FF385740h, 0.0
    dd -21.333, -1.2152,  0.000, 0FF385740h, 0.0
    dd -17.778, -1.3641,  0.000, 0FF3A5C44h, 0.0
    dd -17.778, -1.5435,  3.556, 0FF3C6048h, 0.0
    dd -21.333, -1.2152,  0.000, 0FF385740h, 0.0
    dd -17.778, -1.5435,  3.556, 0FF3C6048h, 0.0
    dd -21.333, -1.3745,  3.556, 0FF3A5B43h, 0.0
    dd -17.778, -1.3641,  0.000, 0FF3A5C44h, 0.0
    dd -14.222, -1.4661,  0.000, 0FF3D6048h, 0.0
    dd -14.222, -1.6112,  3.556, 0FF3C5F47h, 0.0
    dd -17.778, -1.3641,  0.000, 0FF3A5C44h, 0.0
    dd -14.222, -1.6112,  3.556, 0FF3C5F47h, 0.0
    dd -17.778, -1.5435,  3.556, 0FF3C6048h, 0.0
    dd -14.222, -1.4661,  0.000, 0FF3D6048h, 0.0
    dd -10.667, -1.4698,  0.000, 0FF3C5E46h, 0.0
    dd -10.667, -1.5408,  3.556, 0FF395A42h, 0.0
    dd -14.222, -1.4661,  0.000, 0FF3D6048h, 0.0
    dd -10.667, -1.5408,  3.556, 0FF395A42h, 0.0
    dd -14.222, -1.6112,  3.556, 0FF3C5F47h, 0.0
    dd -10.667, -1.4698,  0.000, 0FF3C5E46h, 0.0
    dd -7.111, -1.2882,  0.000, 0FF395942h, 0.0
    dd -7.111, -1.3321,  3.556, 0FF385740h, 0.0
    dd -10.667, -1.4698,  0.000, 0FF3C5E46h, 0.0
    dd -7.111, -1.3321,  3.556, 0FF385740h, 0.0
    dd -10.667, -1.5408,  3.556, 0FF395A42h, 0.0
    dd -7.111, -1.2882,  0.000, 0FF395942h, 0.0
    dd -3.556, -0.9476,  0.000, 0FF3A5D44h, 0.0
    dd -3.556, -0.9574,  3.556, 0FF3C5F47h, 0.0
    dd -7.111, -1.2882,  0.000, 0FF395942h, 0.0
    dd -3.556, -0.9574,  3.556, 0FF3C5F47h, 0.0
    dd -7.111, -1.3321,  3.556, 0FF385740h, 0.0
    dd -3.556, -0.9476,  0.000, 0FF3A5D44h, 0.0
    dd  0.000, -0.8200,  0.000, 0FF3E644Ah, 0.0
    dd  0.000, -0.7763,  3.556, 0FF406A4Fh, 0.0
    dd -3.556, -0.9476,  0.000, 0FF3A5D44h, 0.0
    dd  0.000, -0.7763,  3.556, 0FF406A4Fh, 0.0
    dd -3.556, -0.9574,  3.556, 0FF3C5F47h, 0.0
    dd  0.000, -0.8200,  0.000, 0FF3E644Ah, 0.0
    dd  3.556, -0.6774,  0.000, 0FF436C51h, 0.0
    dd  3.556, -0.5926,  3.556, 0FF436E53h, 0.0
    dd  0.000, -0.8200,  0.000, 0FF3E644Ah, 0.0
    dd  3.556, -0.5926,  3.556, 0FF436E53h, 0.0
    dd  0.000, -0.7763,  3.556, 0FF406A4Fh, 0.0
    dd  3.556, -0.6774,  0.000, 0FF436C51h, 0.0
    dd  7.111, -0.3378,  0.000, 0FF4B7561h, 0.0
    dd  7.111, -0.3033,  3.556, 0FF4A7161h, 0.0
    dd  3.556, -0.6774,  0.000, 0FF436C51h, 0.0
    dd  7.111, -0.3033,  3.556, 0FF4A7161h, 0.0
    dd  3.556, -0.5926,  3.556, 0FF436E53h, 0.0
    dd  7.111, -0.3378,  0.000, 0FF4B7561h, 0.0
    dd 10.667, -0.1834,  0.000, 0FF527471h, 0.0
    dd 10.667, -0.2618,  3.556, 0FF4B6F64h, 0.0
    dd  7.111, -0.3378,  0.000, 0FF4B7561h, 0.0
    dd 10.667, -0.2618,  3.556, 0FF4B6F64h, 0.0
    dd  7.111, -0.3033,  3.556, 0FF4A7161h, 0.0
    dd 10.667, -0.1834,  0.000, 0FF527471h, 0.0
    dd 14.222, -0.2251,  0.000, 0FF4E7069h, 0.0
    dd 14.222, -0.3210,  3.556, 0FF497060h, 0.0
    dd 10.667, -0.1834,  0.000, 0FF527471h, 0.0
    dd 14.222, -0.3210,  3.556, 0FF497060h, 0.0
    dd 10.667, -0.2618,  3.556, 0FF4B6F64h, 0.0
    dd 14.222, -0.2251,  0.000, 0FF4E7069h, 0.0
    dd 17.778, -0.3718,  0.000, 0FF467059h, 0.0
    dd 17.778, -0.4332,  3.556, 0FF447256h, 0.0
    dd 14.222, -0.2251,  0.000, 0FF4E7069h, 0.0
    dd 17.778, -0.4332,  3.556, 0FF447256h, 0.0
    dd 14.222, -0.3210,  3.556, 0FF497060h, 0.0
    dd 17.778, -0.3718,  0.000, 0FF467059h, 0.0
    dd 21.333, -0.5693,  0.000, 0FF446F53h, 0.0
    dd 21.333, -0.5532,  3.556, 0FF436F53h, 0.0
    dd 17.778, -0.3718,  0.000, 0FF467059h, 0.0
    dd 21.333, -0.5532,  3.556, 0FF436F53h, 0.0
    dd 17.778, -0.4332,  3.556, 0FF447256h, 0.0
    dd 21.333, -0.5693,  0.000, 0FF446F53h, 0.0
    dd 24.889, -0.7630,  0.000, 0FF41694Fh, 0.0
    dd 24.889, -0.6549,  3.556, 0FF3F674Ch, 0.0
    dd 21.333, -0.5693,  0.000, 0FF446F53h, 0.0
    dd 24.889, -0.6549,  3.556, 0FF3F674Ch, 0.0
    dd 21.333, -0.5532,  3.556, 0FF436F53h, 0.0
    dd 24.889, -0.7630,  0.000, 0FF41694Fh, 0.0
    dd 28.444, -0.9184,  0.000, 0FF3C5F47h, 0.0
    dd 28.444, -0.7398,  3.556, 0FF3D6147h, 0.0
    dd 24.889, -0.7630,  0.000, 0FF41694Fh, 0.0
    dd 28.444, -0.7398,  3.556, 0FF3D6147h, 0.0
    dd 24.889, -0.6549,  3.556, 0FF3F674Ch, 0.0
    dd 28.444, -0.9184,  0.000, 0FF3C5F47h, 0.0
    dd 32.000, -1.0305,  0.000, 0FF395B43h, 0.0
    dd 32.000, -0.8306,  3.556, 0FF3D6248h, 0.0
    dd 28.444, -0.9184,  0.000, 0FF3C5F47h, 0.0
    dd 32.000, -0.8306,  3.556, 0FF3D6248h, 0.0
    dd 28.444, -0.7398,  3.556, 0FF3D6147h, 0.0
    dd -32.000, -0.8305,  3.556, 0FF40674Dh, 0.0
    dd -28.444, -0.9702,  3.556, 0FF3B5E46h, 0.0
    dd -28.444, -0.9783,  7.111, 0FF3A5C44h, 0.0
    dd -32.000, -0.8305,  3.556, 0FF40674Dh, 0.0
    dd -28.444, -0.9783,  7.111, 0FF3A5C44h, 0.0
    dd -32.000, -0.7623,  7.111, 0FF3F644Bh, 0.0
    dd -28.444, -0.9702,  3.556, 0FF3B5E46h, 0.0
    dd -24.889, -1.1638,  3.556, 0FF385740h, 0.0
    dd -24.889, -1.2346,  7.111, 0FF395A42h, 0.0
    dd -28.444, -0.9702,  3.556, 0FF3B5E46h, 0.0
    dd -24.889, -1.2346,  7.111, 0FF395A42h, 0.0
    dd -28.444, -0.9783,  7.111, 0FF3A5C44h, 0.0
    dd -24.889, -1.1638,  3.556, 0FF385740h, 0.0
    dd -21.333, -1.3745,  3.556, 0FF3A5B43h, 0.0
    dd -21.333, -1.4684,  7.111, 0FF3C5F47h, 0.0
    dd -24.889, -1.1638,  3.556, 0FF385740h, 0.0
    dd -21.333, -1.4684,  7.111, 0FF3C5F47h, 0.0
    dd -24.889, -1.2346,  7.111, 0FF395A42h, 0.0
    dd -21.333, -1.3745,  3.556, 0FF3A5B43h, 0.0
    dd -17.778, -1.5435,  3.556, 0FF3C6048h, 0.0
    dd -17.778, -1.6133,  7.111, 0FF3C6048h, 0.0
    dd -21.333, -1.3745,  3.556, 0FF3A5B43h, 0.0
    dd -17.778, -1.6133,  7.111, 0FF3C6048h, 0.0
    dd -21.333, -1.4684,  7.111, 0FF3C5F47h, 0.0
    dd -17.778, -1.5435,  3.556, 0FF3C6048h, 0.0
    dd -14.222, -1.6112,  3.556, 0FF3C5F47h, 0.0
    dd -14.222, -1.6244,  7.111, 0FF3A5B43h, 0.0
    dd -17.778, -1.5435,  3.556, 0FF3C6048h, 0.0
    dd -14.222, -1.6244,  7.111, 0FF3A5B43h, 0.0
    dd -17.778, -1.6133,  7.111, 0FF3C6048h, 0.0
    dd -14.222, -1.6112,  3.556, 0FF3C5F47h, 0.0
    dd -10.667, -1.5408,  3.556, 0FF395A42h, 0.0
    dd -10.667, -1.4955,  7.111, 0FF385740h, 0.0
    dd -14.222, -1.6112,  3.556, 0FF3C5F47h, 0.0
    dd -10.667, -1.4955,  7.111, 0FF385740h, 0.0
    dd -14.222, -1.6244,  7.111, 0FF3A5B43h, 0.0
    dd -10.667, -1.5408,  3.556, 0FF395A42h, 0.0
    dd -7.111, -1.3321,  3.556, 0FF385740h, 0.0
    dd -7.111, -1.2616,  7.111, 0FF395942h, 0.0
    dd -10.667, -1.5408,  3.556, 0FF395A42h, 0.0
    dd -7.111, -1.2616,  7.111, 0FF395942h, 0.0
    dd -10.667, -1.4955,  7.111, 0FF385740h, 0.0
    dd -7.111, -1.3321,  3.556, 0FF385740h, 0.0
    dd -3.556, -0.9574,  3.556, 0FF3C5F47h, 0.0
    dd -3.556, -0.9853,  7.111, 0FF3E644Ah, 0.0
    dd -7.111, -1.3321,  3.556, 0FF385740h, 0.0
    dd -3.556, -0.9853,  7.111, 0FF3E644Ah, 0.0
    dd -7.111, -1.2616,  7.111, 0FF395942h, 0.0
    dd -3.556, -0.9574,  3.556, 0FF3C5F47h, 0.0
    dd  0.000, -0.7763,  3.556, 0FF406A4Fh, 0.0
    dd  0.000, -0.7470,  7.111, 0FF426A50h, 0.0
    dd -3.556, -0.9574,  3.556, 0FF3C5F47h, 0.0
    dd  0.000, -0.7470,  7.111, 0FF426A50h, 0.0
    dd -3.556, -0.9853,  7.111, 0FF3E644Ah, 0.0
    dd  0.000, -0.7763,  3.556, 0FF406A4Fh, 0.0
    dd  3.556, -0.5926,  3.556, 0FF436E53h, 0.0
    dd  3.556, -0.5674,  7.111, 0FF416A4Eh, 0.0
    dd  0.000, -0.7763,  3.556, 0FF406A4Fh, 0.0
    dd  3.556, -0.5674,  7.111, 0FF416A4Eh, 0.0
    dd  0.000, -0.7470,  7.111, 0FF426A50h, 0.0
    dd  3.556, -0.5926,  3.556, 0FF436E53h, 0.0
    dd  7.111, -0.3033,  3.556, 0FF4A7161h, 0.0
    dd  7.111, -0.4856,  7.111, 0FF3F674Ch, 0.0
    dd  3.556, -0.5926,  3.556, 0FF436E53h, 0.0
    dd  7.111, -0.4856,  7.111, 0FF3F674Ch, 0.0
    dd  3.556, -0.5674,  7.111, 0FF416A4Eh, 0.0
    dd  7.111, -0.3033,  3.556, 0FF4A7161h, 0.0
    dd 10.667, -0.2618,  3.556, 0FF4B6F64h, 0.0
    dd 10.667, -0.4790,  7.111, 0FF41694Eh, 0.0
    dd  7.111, -0.3033,  3.556, 0FF4A7161h, 0.0
    dd 10.667, -0.4790,  7.111, 0FF41694Eh, 0.0
    dd  7.111, -0.4856,  7.111, 0FF3F674Ch, 0.0
    dd 10.667, -0.2618,  3.556, 0FF4B6F64h, 0.0
    dd 14.222, -0.3210,  3.556, 0FF497060h, 0.0
    dd 14.222, -0.5083,  7.111, 0FF446F53h, 0.0
    dd 10.667, -0.2618,  3.556, 0FF4B6F64h, 0.0
    dd 14.222, -0.5083,  7.111, 0FF446F53h, 0.0
    dd 10.667, -0.4790,  7.111, 0FF41694Eh, 0.0
    dd 14.222, -0.3210,  3.556, 0FF497060h, 0.0
    dd 17.778, -0.4332,  3.556, 0FF447256h, 0.0
    dd 17.778, -0.5370,  7.111, 0FF447054h, 0.0
    dd 14.222, -0.3210,  3.556, 0FF497060h, 0.0
    dd 17.778, -0.5370,  7.111, 0FF447054h, 0.0
    dd 14.222, -0.5083,  7.111, 0FF446F53h, 0.0
    dd 17.778, -0.4332,  3.556, 0FF447256h, 0.0
    dd 21.333, -0.5532,  3.556, 0FF436F53h, 0.0
    dd 21.333, -0.5489,  7.111, 0FF416A4Fh, 0.0
    dd 17.778, -0.4332,  3.556, 0FF447256h, 0.0
    dd 21.333, -0.5489,  7.111, 0FF416A4Fh, 0.0
    dd 17.778, -0.5370,  7.111, 0FF447054h, 0.0
    dd 21.333, -0.5532,  3.556, 0FF436F53h, 0.0
    dd 24.889, -0.6549,  3.556, 0FF3F674Ch, 0.0
    dd 24.889, -0.5550,  7.111, 0FF3F654Ah, 0.0
    dd 21.333, -0.5532,  3.556, 0FF436F53h, 0.0
    dd 24.889, -0.5550,  7.111, 0FF3F654Ah, 0.0
    dd 21.333, -0.5489,  7.111, 0FF416A4Fh, 0.0
    dd 24.889, -0.6549,  3.556, 0FF3F674Ch, 0.0
    dd 28.444, -0.7398,  3.556, 0FF3D6147h, 0.0
    dd 28.444, -0.5864,  7.111, 0FF40664Ch, 0.0
    dd 24.889, -0.6549,  3.556, 0FF3F674Ch, 0.0
    dd 28.444, -0.5864,  7.111, 0FF40664Ch, 0.0
    dd 24.889, -0.5550,  7.111, 0FF3F654Ah, 0.0
    dd 28.444, -0.7398,  3.556, 0FF3D6147h, 0.0
    dd 32.000, -0.8306,  3.556, 0FF3D6248h, 0.0
    dd 32.000, -0.6768,  7.111, 0FF426A50h, 0.0
    dd 28.444, -0.7398,  3.556, 0FF3D6147h, 0.0
    dd 32.000, -0.6768,  7.111, 0FF426A50h, 0.0
    dd 28.444, -0.5864,  7.111, 0FF40664Ch, 0.0
    dd -32.000, -0.7623,  7.111, 0FF3F644Bh, 0.0
    dd -28.444, -0.9783,  7.111, 0FF3A5C44h, 0.0
    dd -28.444, -0.9798, 10.667, 0FF3B5D45h, 0.0
    dd -32.000, -0.7623,  7.111, 0FF3F644Bh, 0.0
    dd -28.444, -0.9798, 10.667, 0FF3B5D45h, 0.0
    dd -32.000, -0.7278, 10.667, 0FF3D6148h, 0.0
    dd -28.444, -0.9783,  7.111, 0FF3A5C44h, 0.0
    dd -24.889, -1.2346,  7.111, 0FF395A42h, 0.0
    dd -24.889, -1.2361, 10.667, 0FF3C5E46h, 0.0
    dd -28.444, -0.9783,  7.111, 0FF3A5C44h, 0.0
    dd -24.889, -1.2361, 10.667, 0FF3C5E46h, 0.0
    dd -28.444, -0.9798, 10.667, 0FF3B5D45h, 0.0
    dd -24.889, -1.2346,  7.111, 0FF395A42h, 0.0
    dd -21.333, -1.4684,  7.111, 0FF3C5F47h, 0.0
    dd -21.333, -1.4287, 10.667, 0FF3D6048h, 0.0
    dd -24.889, -1.2346,  7.111, 0FF395A42h, 0.0
    dd -21.333, -1.4287, 10.667, 0FF3D6048h, 0.0
    dd -24.889, -1.2361, 10.667, 0FF3C5E46h, 0.0
    dd -21.333, -1.4684,  7.111, 0FF3C5F47h, 0.0
    dd -17.778, -1.6133,  7.111, 0FF3C6048h, 0.0
    dd -17.778, -1.5084, 10.667, 0FF3B5C44h, 0.0
    dd -21.333, -1.4684,  7.111, 0FF3C5F47h, 0.0
    dd -17.778, -1.5084, 10.667, 0FF3B5C44h, 0.0
    dd -21.333, -1.4287, 10.667, 0FF3D6048h, 0.0
    dd -17.778, -1.6133,  7.111, 0FF3C6048h, 0.0
    dd -14.222, -1.6244,  7.111, 0FF3A5B43h, 0.0
    dd -14.222, -1.4617, 10.667, 0FF385740h, 0.0
    dd -17.778, -1.6133,  7.111, 0FF3C6048h, 0.0
    dd -14.222, -1.4617, 10.667, 0FF385740h, 0.0
    dd -17.778, -1.5084, 10.667, 0FF3B5C44h, 0.0
    dd -14.222, -1.6244,  7.111, 0FF3A5B43h, 0.0
    dd -10.667, -1.4955,  7.111, 0FF385740h, 0.0
    dd -10.667, -1.3153, 10.667, 0FF395841h, 0.0
    dd -14.222, -1.6244,  7.111, 0FF3A5B43h, 0.0
    dd -10.667, -1.3153, 10.667, 0FF395841h, 0.0
    dd -14.222, -1.4617, 10.667, 0FF385740h, 0.0
    dd -10.667, -1.4955,  7.111, 0FF385740h, 0.0
    dd -7.111, -1.2616,  7.111, 0FF395942h, 0.0
    dd -7.111, -1.1231, 10.667, 0FF3B5F47h, 0.0
    dd -10.667, -1.4955,  7.111, 0FF385740h, 0.0
    dd -7.111, -1.1231, 10.667, 0FF3B5F47h, 0.0
    dd -10.667, -1.3153, 10.667, 0FF395841h, 0.0
    dd -7.111, -1.2616,  7.111, 0FF395942h, 0.0
    dd -3.556, -0.9853,  7.111, 0FF3E644Ah, 0.0
    dd -3.556, -0.9447, 10.667, 0FF3F664Ch, 0.0
    dd -7.111, -1.2616,  7.111, 0FF395942h, 0.0
    dd -3.556, -0.9447, 10.667, 0FF3F664Ch, 0.0
    dd -7.111, -1.1231, 10.667, 0FF3B5F47h, 0.0
    dd -3.556, -0.9853,  7.111, 0FF3E644Ah, 0.0
    dd  0.000, -0.7470,  7.111, 0FF426A50h, 0.0
    dd  0.000, -0.8219, 10.667, 0FF3F654Bh, 0.0
    dd -3.556, -0.9853,  7.111, 0FF3E644Ah, 0.0
    dd  0.000, -0.8219, 10.667, 0FF3F654Bh, 0.0
    dd -3.556, -0.9447, 10.667, 0FF3F664Ch, 0.0
    dd  0.000, -0.7470,  7.111, 0FF426A50h, 0.0
    dd  3.556, -0.5674,  7.111, 0FF416A4Eh, 0.0
    dd  3.556, -0.7650, 10.667, 0FF3D6147h, 0.0
    dd  0.000, -0.7470,  7.111, 0FF426A50h, 0.0
    dd  3.556, -0.7650, 10.667, 0FF3D6147h, 0.0
    dd  0.000, -0.8219, 10.667, 0FF3F654Bh, 0.0
    dd  3.556, -0.5674,  7.111, 0FF416A4Eh, 0.0
    dd  7.111, -0.4856,  7.111, 0FF3F674Ch, 0.0
    dd  7.111, -0.7533, 10.667, 0FF3D6249h, 0.0
    dd  3.556, -0.5674,  7.111, 0FF416A4Eh, 0.0
    dd  7.111, -0.7533, 10.667, 0FF3D6249h, 0.0
    dd  3.556, -0.7650, 10.667, 0FF3D6147h, 0.0
    dd  7.111, -0.4856,  7.111, 0FF3F674Ch, 0.0
    dd 10.667, -0.4790,  7.111, 0FF41694Eh, 0.0
    dd 10.667, -0.7497, 10.667, 0FF40684Eh, 0.0
    dd  7.111, -0.4856,  7.111, 0FF3F674Ch, 0.0
    dd 10.667, -0.7497, 10.667, 0FF40684Eh, 0.0
    dd  7.111, -0.7533, 10.667, 0FF3D6249h, 0.0
    dd 10.667, -0.4790,  7.111, 0FF41694Eh, 0.0
    dd 14.222, -0.5083,  7.111, 0FF446F53h, 0.0
    dd 14.222, -0.7217, 10.667, 0FF426C51h, 0.0
    dd 10.667, -0.4790,  7.111, 0FF41694Eh, 0.0
    dd 14.222, -0.7217, 10.667, 0FF426C51h, 0.0
    dd 10.667, -0.7497, 10.667, 0FF40684Eh, 0.0
    dd 14.222, -0.5083,  7.111, 0FF446F53h, 0.0
    dd 17.778, -0.5370,  7.111, 0FF447054h, 0.0
    dd 17.778, -0.6594, 10.667, 0FF41694Eh, 0.0
    dd 14.222, -0.5083,  7.111, 0FF446F53h, 0.0
    dd 17.778, -0.6594, 10.667, 0FF41694Eh, 0.0
    dd 14.222, -0.7217, 10.667, 0FF426C51h, 0.0
    dd 17.778, -0.5370,  7.111, 0FF447054h, 0.0
    dd 21.333, -0.5489,  7.111, 0FF416A4Fh, 0.0
    dd 21.333, -0.5821, 10.667, 0FF3F654Bh, 0.0
    dd 17.778, -0.5370,  7.111, 0FF447054h, 0.0
    dd 21.333, -0.5821, 10.667, 0FF3F654Bh, 0.0
    dd 17.778, -0.6594, 10.667, 0FF41694Eh, 0.0
    dd 21.333, -0.5489,  7.111, 0FF416A4Fh, 0.0
    dd 24.889, -0.5550,  7.111, 0FF3F654Ah, 0.0
    dd 24.889, -0.5301, 10.667, 0FF3F674Ch, 0.0
    dd 21.333, -0.5489,  7.111, 0FF416A4Fh, 0.0
    dd 24.889, -0.5301, 10.667, 0FF3F674Ch, 0.0
    dd 21.333, -0.5821, 10.667, 0FF3F654Bh, 0.0
    dd 24.889, -0.5550,  7.111, 0FF3F654Ah, 0.0
    dd 28.444, -0.5864,  7.111, 0FF40664Ch, 0.0
    dd 28.444, -0.5457, 10.667, 0FF426C51h, 0.0
    dd 24.889, -0.5550,  7.111, 0FF3F654Ah, 0.0
    dd 28.444, -0.5457, 10.667, 0FF426C51h, 0.0
    dd 24.889, -0.5301, 10.667, 0FF3F674Ch, 0.0
    dd 28.444, -0.5864,  7.111, 0FF40664Ch, 0.0
    dd 32.000, -0.6768,  7.111, 0FF426A50h, 0.0
    dd 32.000, -0.6519, 10.667, 0FF436E53h, 0.0
    dd 28.444, -0.5864,  7.111, 0FF40664Ch, 0.0
    dd 32.000, -0.6519, 10.667, 0FF436E53h, 0.0
    dd 28.444, -0.5457, 10.667, 0FF426C51h, 0.0
    dd -32.000, -0.7278, 10.667, 0FF3D6148h, 0.0
    dd -28.444, -0.9798, 10.667, 0FF3B5D45h, 0.0
    dd -28.444, -0.9803, 14.222, 0FF3D6249h, 0.0
    dd -32.000, -0.7278, 10.667, 0FF3D6148h, 0.0
    dd -28.444, -0.9803, 14.222, 0FF3D6249h, 0.0
    dd -32.000, -0.7636, 14.222, 0FF3D6148h, 0.0
    dd -28.444, -0.9798, 10.667, 0FF3B5D45h, 0.0
    dd -24.889, -1.2361, 10.667, 0FF3C5E46h, 0.0
    dd -24.889, -1.1589, 14.222, 0FF3D6048h, 0.0
    dd -28.444, -0.9798, 10.667, 0FF3B5D45h, 0.0
    dd -24.889, -1.1589, 14.222, 0FF3D6048h, 0.0
    dd -28.444, -0.9803, 14.222, 0FF3D6249h, 0.0
    dd -24.889, -1.2361, 10.667, 0FF3C5E46h, 0.0
    dd -21.333, -1.4287, 10.667, 0FF3D6048h, 0.0
    dd -21.333, -1.2516, 14.222, 0FF3B5D46h, 0.0
    dd -24.889, -1.2361, 10.667, 0FF3C5E46h, 0.0
    dd -21.333, -1.2516, 14.222, 0FF3B5D46h, 0.0
    dd -24.889, -1.1589, 14.222, 0FF3D6048h, 0.0
    dd -21.333, -1.4287, 10.667, 0FF3D6048h, 0.0
    dd -17.778, -1.5084, 10.667, 0FF3B5C44h, 0.0
    dd -17.778, -1.2439, 14.222, 0FF385841h, 0.0
    dd -21.333, -1.4287, 10.667, 0FF3D6048h, 0.0
    dd -17.778, -1.2439, 14.222, 0FF385841h, 0.0
    dd -21.333, -1.2516, 14.222, 0FF3B5D46h, 0.0
    dd -17.778, -1.5084, 10.667, 0FF3B5C44h, 0.0
    dd -14.222, -1.4617, 10.667, 0FF385740h, 0.0
    dd -14.222, -1.1581, 14.222, 0FF385941h, 0.0
    dd -17.778, -1.5084, 10.667, 0FF3B5C44h, 0.0
    dd -14.222, -1.1581, 14.222, 0FF385941h, 0.0
    dd -17.778, -1.2439, 14.222, 0FF385841h, 0.0
    dd -14.222, -1.4617, 10.667, 0FF385740h, 0.0
    dd -10.667, -1.3153, 10.667, 0FF395841h, 0.0
    dd -10.667, -1.0420, 14.222, 0FF3C6047h, 0.0
    dd -14.222, -1.4617, 10.667, 0FF385740h, 0.0
    dd -10.667, -1.0420, 14.222, 0FF3C6047h, 0.0
    dd -14.222, -1.1581, 14.222, 0FF385941h, 0.0
    dd -10.667, -1.3153, 10.667, 0FF395841h, 0.0
    dd -7.111, -1.1231, 10.667, 0FF3B5F47h, 0.0
    dd -7.111, -0.9468, 14.222, 0FF3F674Ch, 0.0
    dd -10.667, -1.3153, 10.667, 0FF395841h, 0.0
    dd -7.111, -0.9468, 14.222, 0FF3F674Ch, 0.0
    dd -10.667, -1.0420, 14.222, 0FF3C6047h, 0.0
    dd -7.111, -1.1231, 10.667, 0FF3B5F47h, 0.0
    dd -3.556, -0.9447, 10.667, 0FF3F664Ch, 0.0
    dd -3.556, -0.9055, 14.222, 0FF3E644Bh, 0.0
    dd -7.111, -1.1231, 10.667, 0FF3B5F47h, 0.0
    dd -3.556, -0.9055, 14.222, 0FF3E644Bh, 0.0
    dd -7.111, -0.9468, 14.222, 0FF3F674Ch, 0.0
    dd -3.556, -0.9447, 10.667, 0FF3F664Ch, 0.0
    dd  0.000, -0.8219, 10.667, 0FF3F654Bh, 0.0
    dd  0.000, -0.9198, 14.222, 0FF3B5E46h, 0.0
    dd -3.556, -0.9447, 10.667, 0FF3F664Ch, 0.0
    dd  0.000, -0.9198, 14.222, 0FF3B5E46h, 0.0
    dd -3.556, -0.9055, 14.222, 0FF3E644Bh, 0.0
    dd  0.000, -0.8219, 10.667, 0FF3F654Bh, 0.0
    dd  3.556, -0.7650, 10.667, 0FF3D6147h, 0.0
    dd  3.556, -0.9618, 14.222, 0FF3A5C44h, 0.0
    dd  0.000, -0.8219, 10.667, 0FF3F654Bh, 0.0
    dd  3.556, -0.9618, 14.222, 0FF3A5C44h, 0.0
    dd  0.000, -0.9198, 14.222, 0FF3B5E46h, 0.0
    dd  3.556, -0.7650, 10.667, 0FF3D6147h, 0.0
    dd  7.111, -0.7533, 10.667, 0FF3D6249h, 0.0
    dd  7.111, -0.9891, 14.222, 0FF3D6148h, 0.0
    dd  3.556, -0.7650, 10.667, 0FF3D6147h, 0.0
    dd  7.111, -0.9891, 14.222, 0FF3D6148h, 0.0
    dd  3.556, -0.9618, 14.222, 0FF3A5C44h, 0.0
    dd  7.111, -0.7533, 10.667, 0FF3D6249h, 0.0
    dd 10.667, -0.7497, 10.667, 0FF40684Eh, 0.0
    dd 10.667, -0.9668, 14.222, 0FF3F654Ch, 0.0
    dd  7.111, -0.7533, 10.667, 0FF3D6249h, 0.0
    dd 10.667, -0.9668, 14.222, 0FF3F654Ch, 0.0
    dd  7.111, -0.9891, 14.222, 0FF3D6148h, 0.0
    dd 10.667, -0.7497, 10.667, 0FF40684Eh, 0.0
    dd 14.222, -0.7217, 10.667, 0FF426C51h, 0.0
    dd 14.222, -0.8853, 14.222, 0FF3E654Bh, 0.0
    dd 10.667, -0.7497, 10.667, 0FF40684Eh, 0.0
    dd 14.222, -0.8853, 14.222, 0FF3E654Bh, 0.0
    dd 10.667, -0.9668, 14.222, 0FF3F654Ch, 0.0
    dd 14.222, -0.7217, 10.667, 0FF426C51h, 0.0
    dd 17.778, -0.6594, 10.667, 0FF41694Eh, 0.0
    dd 17.778, -0.7668, 14.222, 0FF3D6248h, 0.0
    dd 14.222, -0.7217, 10.667, 0FF426C51h, 0.0
    dd 17.778, -0.7668, 14.222, 0FF3D6248h, 0.0
    dd 14.222, -0.8853, 14.222, 0FF3E654Bh, 0.0
    dd 17.778, -0.6594, 10.667, 0FF41694Eh, 0.0
    dd 21.333, -0.5821, 10.667, 0FF3F654Bh, 0.0
    dd 21.333, -0.6571, 14.222, 0FF3E6349h, 0.0
    dd 17.778, -0.6594, 10.667, 0FF41694Eh, 0.0
    dd 21.333, -0.6571, 14.222, 0FF3E6349h, 0.0
    dd 17.778, -0.7668, 14.222, 0FF3D6248h, 0.0
    dd 21.333, -0.5821, 10.667, 0FF3F654Bh, 0.0
    dd 24.889, -0.5301, 10.667, 0FF3F674Ch, 0.0
    dd 24.889, -0.6057, 14.222, 0FF416A4Fh, 0.0
    dd 21.333, -0.5821, 10.667, 0FF3F654Bh, 0.0
    dd 24.889, -0.6057, 14.222, 0FF416A4Fh, 0.0
    dd 21.333, -0.6571, 14.222, 0FF3E6349h, 0.0
    dd 24.889, -0.5301, 10.667, 0FF3F674Ch, 0.0
    dd 28.444, -0.5457, 10.667, 0FF426C51h, 0.0
    dd 28.444, -0.6433, 14.222, 0FF436E53h, 0.0
    dd 24.889, -0.5301, 10.667, 0FF3F674Ch, 0.0
    dd 28.444, -0.6433, 14.222, 0FF436E53h, 0.0
    dd 24.889, -0.6057, 14.222, 0FF416A4Fh, 0.0
    dd 28.444, -0.5457, 10.667, 0FF426C51h, 0.0
    dd 32.000, -0.6519, 10.667, 0FF436E53h, 0.0
    dd 32.000, -0.7669, 14.222, 0FF41684Dh, 0.0
    dd 28.444, -0.5457, 10.667, 0FF426C51h, 0.0
    dd 32.000, -0.7669, 14.222, 0FF41684Dh, 0.0
    dd 28.444, -0.6433, 14.222, 0FF436E53h, 0.0
    dd -32.000, -0.7636, 14.222, 0FF3D6148h, 0.0
    dd -28.444, -0.9803, 14.222, 0FF3D6249h, 0.0
    dd -28.444, -0.9855, 17.778, 0FF3F654Bh, 0.0
    dd -32.000, -0.7636, 14.222, 0FF3D6148h, 0.0
    dd -28.444, -0.9855, 17.778, 0FF3F654Bh, 0.0
    dd -32.000, -0.8743, 17.778, 0FF3D6349h, 0.0
    dd -28.444, -0.9803, 14.222, 0FF3D6249h, 0.0
    dd -24.889, -1.1589, 14.222, 0FF3D6048h, 0.0
    dd -24.889, -1.0289, 17.778, 0FF3D6249h, 0.0
    dd -28.444, -0.9803, 14.222, 0FF3D6249h, 0.0
    dd -24.889, -1.0289, 17.778, 0FF3D6249h, 0.0
    dd -28.444, -0.9855, 17.778, 0FF3F654Bh, 0.0
    dd -24.889, -1.1589, 14.222, 0FF3D6048h, 0.0
    dd -21.333, -1.2516, 14.222, 0FF3B5D46h, 0.0
    dd -21.333, -0.9948, 17.778, 0FF3B5D44h, 0.0
    dd -24.889, -1.1589, 14.222, 0FF3D6048h, 0.0
    dd -21.333, -0.9948, 17.778, 0FF3B5D44h, 0.0
    dd -24.889, -1.0289, 17.778, 0FF3D6249h, 0.0
    dd -21.333, -1.2516, 14.222, 0FF3B5D46h, 0.0
    dd -17.778, -1.2439, 14.222, 0FF385841h, 0.0
    dd -17.778, -0.9080, 17.778, 0FF3B5E45h, 0.0
    dd -21.333, -1.2516, 14.222, 0FF3B5D46h, 0.0
    dd -17.778, -0.9080, 17.778, 0FF3B5E45h, 0.0
    dd -21.333, -0.9948, 17.778, 0FF3B5D44h, 0.0
    dd -17.778, -1.2439, 14.222, 0FF385841h, 0.0
    dd -14.222, -1.1581, 14.222, 0FF385941h, 0.0
    dd -14.222, -0.8157, 17.778, 0FF3E644Bh, 0.0
    dd -17.778, -1.2439, 14.222, 0FF385841h, 0.0
    dd -14.222, -0.8157, 17.778, 0FF3E644Bh, 0.0
    dd -17.778, -0.9080, 17.778, 0FF3B5E45h, 0.0
    dd -14.222, -1.1581, 14.222, 0FF385941h, 0.0
    dd -10.667, -1.0420, 14.222, 0FF3C6047h, 0.0
    dd -10.667, -0.7660, 17.778, 0FF426A4Fh, 0.0
    dd -14.222, -1.1581, 14.222, 0FF385941h, 0.0
    dd -10.667, -0.7660, 17.778, 0FF426A4Fh, 0.0
    dd -14.222, -0.8157, 17.778, 0FF3E644Bh, 0.0
    dd -10.667, -1.0420, 14.222, 0FF3C6047h, 0.0
    dd -7.111, -0.9468, 14.222, 0FF3F674Ch, 0.0
    dd -7.111, -0.7863, 17.778, 0FF40684Eh, 0.0
    dd -10.667, -1.0420, 14.222, 0FF3C6047h, 0.0
    dd -7.111, -0.7863, 17.778, 0FF40684Eh, 0.0
    dd -10.667, -0.7660, 17.778, 0FF426A4Fh, 0.0
    dd -7.111, -0.9468, 14.222, 0FF3F674Ch, 0.0
    dd -3.556, -0.9055, 14.222, 0FF3E644Bh, 0.0
    dd -3.556, -0.8713, 17.778, 0FF3C6047h, 0.0
    dd -7.111, -0.9468, 14.222, 0FF3F674Ch, 0.0
    dd -3.556, -0.8713, 17.778, 0FF3C6047h, 0.0
    dd -7.111, -0.7863, 17.778, 0FF40684Eh, 0.0
    dd -3.556, -0.9055, 14.222, 0FF3E644Bh, 0.0
    dd  0.000, -0.9198, 14.222, 0FF3B5E46h, 0.0
    dd  0.000, -0.9852, 17.778, 0FF3A5C43h, 0.0
    dd -3.556, -0.9055, 14.222, 0FF3E644Bh, 0.0
    dd  0.000, -0.9852, 17.778, 0FF3A5C43h, 0.0
    dd -3.556, -0.8713, 17.778, 0FF3C6047h, 0.0
    dd  0.000, -0.9198, 14.222, 0FF3B5E46h, 0.0
    dd  3.556, -0.9618, 14.222, 0FF3A5C44h, 0.0
    dd  3.556, -1.0780, 17.778, 0FF3B5D46h, 0.0
    dd  0.000, -0.9198, 14.222, 0FF3B5E46h, 0.0
    dd  3.556, -1.0780, 17.778, 0FF3B5D46h, 0.0
    dd  0.000, -0.9852, 17.778, 0FF3A5C43h, 0.0
    dd  3.556, -0.9618, 14.222, 0FF3A5C44h, 0.0
    dd  7.111, -0.9891, 14.222, 0FF3D6148h, 0.0
    dd  7.111, -1.1078, 17.778, 0FF3E6249h, 0.0
    dd  3.556, -0.9618, 14.222, 0FF3A5C44h, 0.0
    dd  7.111, -1.1078, 17.778, 0FF3E6249h, 0.0
    dd  3.556, -1.0780, 17.778, 0FF3B5D46h, 0.0
    dd  7.111, -0.9891, 14.222, 0FF3D6148h, 0.0
    dd 10.667, -0.9668, 14.222, 0FF3F654Ch, 0.0
    dd 10.667, -1.0602, 17.778, 0FF3D6249h, 0.0
    dd  7.111, -0.9891, 14.222, 0FF3D6148h, 0.0
    dd 10.667, -1.0602, 17.778, 0FF3D6249h, 0.0
    dd  7.111, -1.1078, 17.778, 0FF3E6249h, 0.0
    dd 10.667, -0.9668, 14.222, 0FF3F654Ch, 0.0
    dd 14.222, -0.8853, 14.222, 0FF3E654Bh, 0.0
    dd 14.222, -0.9550, 17.778, 0FF3B5E46h, 0.0
    dd 10.667, -0.9668, 14.222, 0FF3F654Ch, 0.0
    dd 14.222, -0.9550, 17.778, 0FF3B5E46h, 0.0
    dd 10.667, -1.0602, 17.778, 0FF3D6249h, 0.0
    dd 14.222, -0.8853, 14.222, 0FF3E654Bh, 0.0
    dd 17.778, -0.7668, 14.222, 0FF3D6248h, 0.0
    dd 17.778, -0.8377, 17.778, 0FF3C5E46h, 0.0
    dd 14.222, -0.8853, 14.222, 0FF3E654Bh, 0.0
    dd 17.778, -0.8377, 17.778, 0FF3C5E46h, 0.0
    dd 14.222, -0.9550, 17.778, 0FF3B5E46h, 0.0
    dd 17.778, -0.7668, 14.222, 0FF3D6248h, 0.0
    dd 21.333, -0.6571, 14.222, 0FF3E6349h, 0.0
    dd 21.333, -0.7603, 17.778, 0FF3F654Bh, 0.0
    dd 17.778, -0.7668, 14.222, 0FF3D6248h, 0.0
    dd 21.333, -0.7603, 17.778, 0FF3F654Bh, 0.0
    dd 17.778, -0.8377, 17.778, 0FF3C5E46h, 0.0
    dd 21.333, -0.6571, 14.222, 0FF3E6349h, 0.0
    dd 24.889, -0.6057, 14.222, 0FF416A4Fh, 0.0
    dd 24.889, -0.7578, 17.778, 0FF426A50h, 0.0
    dd 21.333, -0.6571, 14.222, 0FF3E6349h, 0.0
    dd 24.889, -0.7578, 17.778, 0FF426A50h, 0.0
    dd 21.333, -0.7603, 17.778, 0FF3F654Bh, 0.0
    dd 24.889, -0.6057, 14.222, 0FF416A4Fh, 0.0
    dd 28.444, -0.6433, 14.222, 0FF436E53h, 0.0
    dd 28.444, -0.8331, 17.778, 0FF40674Dh, 0.0
    dd 24.889, -0.6057, 14.222, 0FF416A4Fh, 0.0
    dd 28.444, -0.8331, 17.778, 0FF40674Dh, 0.0
    dd 24.889, -0.7578, 17.778, 0FF426A50h, 0.0
    dd 28.444, -0.6433, 14.222, 0FF436E53h, 0.0
    dd 32.000, -0.7669, 14.222, 0FF41684Dh, 0.0
    dd 32.000, -0.9547, 17.778, 0FF3B5E46h, 0.0
    dd 28.444, -0.6433, 14.222, 0FF436E53h, 0.0
    dd 32.000, -0.9547, 17.778, 0FF3B5E46h, 0.0
    dd 28.444, -0.8331, 17.778, 0FF40674Dh, 0.0
    dd -32.000, -0.8743, 17.778, 0FF3D6349h, 0.0
    dd -28.444, -0.9855, 17.778, 0FF3F654Bh, 0.0
    dd -28.444, -0.9862, 21.333, 0FF3E644Ah, 0.0
    dd -32.000, -0.8743, 17.778, 0FF3D6349h, 0.0
    dd -28.444, -0.9862, 21.333, 0FF3E644Ah, 0.0
    dd -32.000, -1.0186, 21.333, 0FF3E644Bh, 0.0
    dd -28.444, -0.9855, 17.778, 0FF3F654Bh, 0.0
    dd -24.889, -1.0289, 17.778, 0FF3D6249h, 0.0
    dd -24.889, -0.8836, 21.333, 0FF3C6047h, 0.0
    dd -28.444, -0.9855, 17.778, 0FF3F654Bh, 0.0
    dd -24.889, -0.8836, 21.333, 0FF3C6047h, 0.0
    dd -28.444, -0.9862, 21.333, 0FF3E644Ah, 0.0
    dd -24.889, -1.0289, 17.778, 0FF3D6249h, 0.0
    dd -21.333, -0.9948, 17.778, 0FF3B5D44h, 0.0
    dd -21.333, -0.7424, 21.333, 0FF3D6147h, 0.0
    dd -24.889, -1.0289, 17.778, 0FF3D6249h, 0.0
    dd -21.333, -0.7424, 21.333, 0FF3D6147h, 0.0
    dd -24.889, -0.8836, 21.333, 0FF3C6047h, 0.0
    dd -21.333, -0.9948, 17.778, 0FF3B5D44h, 0.0
    dd -17.778, -0.9080, 17.778, 0FF3B5E45h, 0.0
    dd -17.778, -0.6149, 21.333, 0FF40684Dh, 0.0
    dd -21.333, -0.9948, 17.778, 0FF3B5D44h, 0.0
    dd -17.778, -0.6149, 21.333, 0FF40684Dh, 0.0
    dd -21.333, -0.7424, 21.333, 0FF3D6147h, 0.0
    dd -17.778, -0.9080, 17.778, 0FF3B5E45h, 0.0
    dd -14.222, -0.8157, 17.778, 0FF3E644Bh, 0.0
    dd -14.222, -0.5520, 21.333, 0FF436F53h, 0.0
    dd -17.778, -0.9080, 17.778, 0FF3B5E45h, 0.0
    dd -14.222, -0.5520, 21.333, 0FF436F53h, 0.0
    dd -17.778, -0.6149, 21.333, 0FF40684Dh, 0.0
    dd -14.222, -0.8157, 17.778, 0FF3E644Bh, 0.0
    dd -10.667, -0.7660, 17.778, 0FF426A4Fh, 0.0
    dd -10.667, -0.5817, 21.333, 0FF436E53h, 0.0
    dd -14.222, -0.8157, 17.778, 0FF3E644Bh, 0.0
    dd -10.667, -0.5817, 21.333, 0FF436E53h, 0.0
    dd -14.222, -0.5520, 21.333, 0FF436F53h, 0.0
    dd -10.667, -0.7660, 17.778, 0FF426A4Fh, 0.0
    dd -7.111, -0.7863, 17.778, 0FF40684Eh, 0.0
    dd -7.111, -0.6961, 21.333, 0FF3E654Bh, 0.0
    dd -10.667, -0.7660, 17.778, 0FF426A4Fh, 0.0
    dd -7.111, -0.6961, 21.333, 0FF3E654Bh, 0.0
    dd -10.667, -0.5817, 21.333, 0FF436E53h, 0.0
    dd -7.111, -0.7863, 17.778, 0FF40684Eh, 0.0
    dd -3.556, -0.8713, 17.778, 0FF3C6047h, 0.0
    dd -3.556, -0.8552, 21.333, 0FF3C5E45h, 0.0
    dd -7.111, -0.7863, 17.778, 0FF40684Eh, 0.0
    dd -3.556, -0.8552, 21.333, 0FF3C5E45h, 0.0
    dd -7.111, -0.6961, 21.333, 0FF3E654Bh, 0.0
    dd -3.556, -0.8713, 17.778, 0FF3C6047h, 0.0
    dd  0.000, -0.9852, 17.778, 0FF3A5C43h, 0.0
    dd  0.000, -1.0027, 21.333, 0FF3C5E46h, 0.0
    dd -3.556, -0.8713, 17.778, 0FF3C6047h, 0.0
    dd  0.000, -1.0027, 21.333, 0FF3C5E46h, 0.0
    dd -3.556, -0.8552, 21.333, 0FF3C5E45h, 0.0
    dd  0.000, -0.9852, 17.778, 0FF3A5C43h, 0.0
    dd  3.556, -1.0780, 17.778, 0FF3B5D46h, 0.0
    dd  3.556, -1.0901, 21.333, 0FF3D614Ah, 0.0
    dd  0.000, -0.9852, 17.778, 0FF3A5C43h, 0.0
    dd  3.556, -1.0901, 21.333, 0FF3D614Ah, 0.0
    dd  0.000, -1.0027, 21.333, 0FF3C5E46h, 0.0
    dd  3.556, -1.0780, 17.778, 0FF3B5D46h, 0.0
    dd  7.111, -1.1078, 17.778, 0FF3E6249h, 0.0
    dd  7.111, -1.0962, 21.333, 0FF3D6249h, 0.0
    dd  3.556, -1.0780, 17.778, 0FF3B5D46h, 0.0
    dd  7.111, -1.0962, 21.333, 0FF3D6249h, 0.0
    dd  3.556, -1.0901, 21.333, 0FF3D614Ah, 0.0
    dd  7.111, -1.1078, 17.778, 0FF3E6249h, 0.0
    dd 10.667, -1.0602, 17.778, 0FF3D6249h, 0.0
    dd 10.667, -1.0348, 21.333, 0FF3B5D46h, 0.0
    dd  7.111, -1.1078, 17.778, 0FF3E6249h, 0.0
    dd 10.667, -1.0348, 21.333, 0FF3B5D46h, 0.0
    dd  7.111, -1.0962, 21.333, 0FF3D6249h, 0.0
    dd 10.667, -1.0602, 17.778, 0FF3D6249h, 0.0
    dd 14.222, -0.9550, 17.778, 0FF3B5E46h, 0.0
    dd 14.222, -0.9472, 21.333, 0FF3A5C44h, 0.0
    dd 10.667, -1.0602, 17.778, 0FF3D6249h, 0.0
    dd 14.222, -0.9472, 21.333, 0FF3A5C44h, 0.0
    dd 10.667, -1.0348, 21.333, 0FF3B5D46h, 0.0
    dd 14.222, -0.9550, 17.778, 0FF3B5E46h, 0.0
    dd 17.778, -0.8377, 17.778, 0FF3C5E46h, 0.0
    dd 17.778, -0.8830, 21.333, 0FF3C6147h, 0.0
    dd 14.222, -0.9550, 17.778, 0FF3B5E46h, 0.0
    dd 17.778, -0.8830, 21.333, 0FF3C6147h, 0.0
    dd 14.222, -0.9472, 21.333, 0FF3A5C44h, 0.0
    dd 17.778, -0.8377, 17.778, 0FF3C5E46h, 0.0
    dd 21.333, -0.7603, 17.778, 0FF3F654Bh, 0.0
    dd 21.333, -0.8772, 21.333, 0FF3F664Ch, 0.0
    dd 17.778, -0.8377, 17.778, 0FF3C5E46h, 0.0
    dd 21.333, -0.8772, 21.333, 0FF3F664Ch, 0.0
    dd 17.778, -0.8830, 21.333, 0FF3C6147h, 0.0
    dd 21.333, -0.7603, 17.778, 0FF3F654Bh, 0.0
    dd 24.889, -0.7578, 17.778, 0FF426A50h, 0.0
    dd 24.889, -0.9346, 21.333, 0FF3F664Ch, 0.0
    dd 21.333, -0.7603, 17.778, 0FF3F654Bh, 0.0
    dd 24.889, -0.9346, 21.333, 0FF3F664Ch, 0.0
    dd 21.333, -0.8772, 21.333, 0FF3F664Ch, 0.0
    dd 24.889, -0.7578, 17.778, 0FF426A50h, 0.0
    dd 28.444, -0.8331, 17.778, 0FF40674Dh, 0.0
    dd 28.444, -1.0277, 21.333, 0FF3C5E46h, 0.0
    dd 24.889, -0.7578, 17.778, 0FF426A50h, 0.0
    dd 28.444, -1.0277, 21.333, 0FF3C5E46h, 0.0
    dd 24.889, -0.9346, 21.333, 0FF3F664Ch, 0.0
    dd 28.444, -0.8331, 17.778, 0FF40674Dh, 0.0
    dd 32.000, -0.9547, 17.778, 0FF3B5E46h, 0.0
    dd 32.000, -1.1094, 21.333, 0FF395941h, 0.0
    dd 28.444, -0.8331, 17.778, 0FF40674Dh, 0.0
    dd 32.000, -1.1094, 21.333, 0FF395941h, 0.0
    dd 28.444, -1.0277, 21.333, 0FF3C5E46h, 0.0
    dd -32.000, -1.0186, 21.333, 0FF3E644Bh, 0.0
    dd -28.444, -0.9862, 21.333, 0FF3E644Ah, 0.0
    dd -28.444, -0.9579, 24.889, 0FF3C6047h, 0.0
    dd -32.000, -1.0186, 21.333, 0FF3E644Bh, 0.0
    dd -28.444, -0.9579, 24.889, 0FF3C6047h, 0.0
    dd -32.000, -1.1239, 24.889, 0FF3C6149h, 0.0
    dd -28.444, -0.9862, 21.333, 0FF3E644Ah, 0.0
    dd -24.889, -0.8836, 21.333, 0FF3C6047h, 0.0
    dd -24.889, -0.7499, 24.889, 0FF3D6047h, 0.0
    dd -28.444, -0.9862, 21.333, 0FF3E644Ah, 0.0
    dd -24.889, -0.7499, 24.889, 0FF3D6047h, 0.0
    dd -28.444, -0.9579, 24.889, 0FF3C6047h, 0.0
    dd -24.889, -0.8836, 21.333, 0FF3C6047h, 0.0
    dd -21.333, -0.7424, 21.333, 0FF3D6147h, 0.0
    dd -21.333, -0.5598, 24.889, 0FF40684Dh, 0.0
    dd -24.889, -0.8836, 21.333, 0FF3C6047h, 0.0
    dd -21.333, -0.5598, 24.889, 0FF40684Dh, 0.0
    dd -24.889, -0.7499, 24.889, 0FF3D6047h, 0.0
    dd -21.333, -0.7424, 21.333, 0FF3D6147h, 0.0
    dd -17.778, -0.6149, 21.333, 0FF40684Dh, 0.0
    dd -17.778, -0.4453, 24.889, 0FF447154h, 0.0
    dd -21.333, -0.7424, 21.333, 0FF3D6147h, 0.0
    dd -17.778, -0.4453, 24.889, 0FF447154h, 0.0
    dd -21.333, -0.5598, 24.889, 0FF40684Dh, 0.0
    dd -17.778, -0.6149, 21.333, 0FF40684Dh, 0.0
    dd -14.222, -0.5520, 21.333, 0FF436F53h, 0.0
    dd -14.222, -0.4390, 24.889, 0FF457255h, 0.0
    dd -17.778, -0.6149, 21.333, 0FF40684Dh, 0.0
    dd -14.222, -0.4390, 24.889, 0FF457255h, 0.0
    dd -17.778, -0.4453, 24.889, 0FF447154h, 0.0
    dd -14.222, -0.5520, 21.333, 0FF436F53h, 0.0
    dd -10.667, -0.5817, 21.333, 0FF436E53h, 0.0
    dd -10.667, -0.5363, 24.889, 0FF416B4Fh, 0.0
    dd -14.222, -0.5520, 21.333, 0FF436F53h, 0.0
    dd -10.667, -0.5363, 24.889, 0FF416B4Fh, 0.0
    dd -14.222, -0.4390, 24.889, 0FF457255h, 0.0
    dd -10.667, -0.5817, 21.333, 0FF436E53h, 0.0
    dd -7.111, -0.6961, 21.333, 0FF3E654Bh, 0.0
    dd -7.111, -0.6974, 24.889, 0FF3D6248h, 0.0
    dd -10.667, -0.5817, 21.333, 0FF436E53h, 0.0
    dd -7.111, -0.6974, 24.889, 0FF3D6248h, 0.0
    dd -10.667, -0.5363, 24.889, 0FF416B4Fh, 0.0
    dd -7.111, -0.6961, 21.333, 0FF3E654Bh, 0.0
    dd -3.556, -0.8552, 21.333, 0FF3C5E45h, 0.0
    dd -3.556, -0.8644, 24.889, 0FF3C6148h, 0.0
    dd -7.111, -0.6961, 21.333, 0FF3E654Bh, 0.0
    dd -3.556, -0.8644, 24.889, 0FF3C6148h, 0.0
    dd -7.111, -0.6974, 24.889, 0FF3D6248h, 0.0
    dd -3.556, -0.8552, 21.333, 0FF3C5E45h, 0.0
    dd  0.000, -1.0027, 21.333, 0FF3C5E46h, 0.0
    dd  0.000, -0.9847, 24.889, 0FF3E644Ah, 0.0
    dd -3.556, -0.8552, 21.333, 0FF3C5E45h, 0.0
    dd  0.000, -0.9847, 24.889, 0FF3E644Ah, 0.0
    dd -3.556, -0.8644, 24.889, 0FF3C6148h, 0.0
    dd  0.000, -1.0027, 21.333, 0FF3C5E46h, 0.0
    dd  3.556, -1.0901, 21.333, 0FF3D614Ah, 0.0
    dd  3.556, -1.0319, 24.889, 0FF3E644Bh, 0.0
    dd  0.000, -1.0027, 21.333, 0FF3C5E46h, 0.0
    dd  3.556, -1.0319, 24.889, 0FF3E644Bh, 0.0
    dd  0.000, -0.9847, 24.889, 0FF3E644Ah, 0.0
    dd  3.556, -1.0901, 21.333, 0FF3D614Ah, 0.0
    dd  7.111, -1.0962, 21.333, 0FF3D6249h, 0.0
    dd  7.111, -1.0137, 24.889, 0FF3C5F47h, 0.0
    dd  3.556, -1.0901, 21.333, 0FF3D614Ah, 0.0
    dd  7.111, -1.0137, 24.889, 0FF3C5F47h, 0.0
    dd  3.556, -1.0319, 24.889, 0FF3E644Bh, 0.0
    dd  7.111, -1.0962, 21.333, 0FF3D6249h, 0.0
    dd 10.667, -1.0348, 21.333, 0FF3B5D46h, 0.0
    dd 10.667, -0.9654, 24.889, 0FF3A5C44h, 0.0
    dd  7.111, -1.0962, 21.333, 0FF3D6249h, 0.0
    dd 10.667, -0.9654, 24.889, 0FF3A5C44h, 0.0
    dd  7.111, -1.0137, 24.889, 0FF3C5F47h, 0.0
    dd 10.667, -1.0348, 21.333, 0FF3B5D46h, 0.0
    dd 14.222, -0.9472, 21.333, 0FF3A5C44h, 0.0
    dd 14.222, -0.9316, 24.889, 0FF3C5F45h, 0.0
    dd 10.667, -1.0348, 21.333, 0FF3B5D46h, 0.0
    dd 14.222, -0.9316, 24.889, 0FF3C5F45h, 0.0
    dd 10.667, -0.9654, 24.889, 0FF3A5C44h, 0.0
    dd 14.222, -0.9472, 21.333, 0FF3A5C44h, 0.0
    dd 17.778, -0.8830, 21.333, 0FF3C6147h, 0.0
    dd 17.778, -0.9437, 24.889, 0FF3E644Bh, 0.0
    dd 14.222, -0.9472, 21.333, 0FF3A5C44h, 0.0
    dd 17.778, -0.9437, 24.889, 0FF3E644Bh, 0.0
    dd 14.222, -0.9316, 24.889, 0FF3C5F45h, 0.0
    dd 17.778, -0.8830, 21.333, 0FF3C6147h, 0.0
    dd 21.333, -0.8772, 21.333, 0FF3F664Ch, 0.0
    dd 21.333, -1.0050, 24.889, 0FF3F644Bh, 0.0
    dd 17.778, -0.8830, 21.333, 0FF3C6147h, 0.0
    dd 21.333, -1.0050, 24.889, 0FF3F644Bh, 0.0
    dd 17.778, -0.9437, 24.889, 0FF3E644Bh, 0.0
    dd 21.333, -0.8772, 21.333, 0FF3F664Ch, 0.0
    dd 24.889, -0.9346, 21.333, 0FF3F664Ch, 0.0
    dd 24.889, -1.0885, 24.889, 0FF3B5E46h, 0.0
    dd 21.333, -0.8772, 21.333, 0FF3F664Ch, 0.0
    dd 24.889, -1.0885, 24.889, 0FF3B5E46h, 0.0
    dd 21.333, -1.0050, 24.889, 0FF3F644Bh, 0.0
    dd 24.889, -0.9346, 21.333, 0FF3F664Ch, 0.0
    dd 28.444, -1.0277, 21.333, 0FF3C5E46h, 0.0
    dd 28.444, -1.1495, 24.889, 0FF385840h, 0.0
    dd 24.889, -0.9346, 21.333, 0FF3F664Ch, 0.0
    dd 28.444, -1.1495, 24.889, 0FF385840h, 0.0
    dd 24.889, -1.0885, 24.889, 0FF3B5E46h, 0.0
    dd 28.444, -1.0277, 21.333, 0FF3C5E46h, 0.0
    dd 32.000, -1.1094, 21.333, 0FF395941h, 0.0
    dd 32.000, -1.1468, 24.889, 0FF395A41h, 0.0
    dd 28.444, -1.0277, 21.333, 0FF3C5E46h, 0.0
    dd 32.000, -1.1468, 24.889, 0FF395A41h, 0.0
    dd 28.444, -1.1495, 24.889, 0FF385840h, 0.0
    dd -32.000, -1.1239, 24.889, 0FF3C6149h, 0.0
    dd -28.444, -0.9579, 24.889, 0FF3C6047h, 0.0
    dd -28.444, -0.8778, 28.444, 0FF3B5E45h, 0.0
    dd -32.000, -1.1239, 24.889, 0FF3C6149h, 0.0
    dd -28.444, -0.8778, 28.444, 0FF3B5E45h, 0.0
    dd -32.000, -1.1270, 28.444, 0FF3B5D45h, 0.0
    dd -28.444, -0.9579, 24.889, 0FF3C6047h, 0.0
    dd -24.889, -0.7499, 24.889, 0FF3D6047h, 0.0
    dd -24.889, -0.6366, 28.444, 0FF3E654Bh, 0.0
    dd -28.444, -0.9579, 24.889, 0FF3C6047h, 0.0
    dd -24.889, -0.6366, 28.444, 0FF3E654Bh, 0.0
    dd -28.444, -0.8778, 28.444, 0FF3B5E45h, 0.0
    dd -24.889, -0.7499, 24.889, 0FF3D6047h, 0.0
    dd -21.333, -0.5598, 24.889, 0FF40684Dh, 0.0
    dd -21.333, -0.4678, 28.444, 0FF436F53h, 0.0
    dd -24.889, -0.7499, 24.889, 0FF3D6047h, 0.0
    dd -21.333, -0.4678, 28.444, 0FF436F53h, 0.0
    dd -24.889, -0.6366, 28.444, 0FF3E654Bh, 0.0
    dd -21.333, -0.5598, 24.889, 0FF40684Dh, 0.0
    dd -17.778, -0.4453, 24.889, 0FF447154h, 0.0
    dd -17.778, -0.4112, 28.444, 0FF467458h, 0.0
    dd -21.333, -0.5598, 24.889, 0FF40684Dh, 0.0
    dd -17.778, -0.4112, 28.444, 0FF467458h, 0.0
    dd -21.333, -0.4678, 28.444, 0FF436F53h, 0.0
    dd -17.778, -0.4453, 24.889, 0FF447154h, 0.0
    dd -14.222, -0.4390, 24.889, 0FF457255h, 0.0
    dd -14.222, -0.4679, 28.444, 0FF436D52h, 0.0
    dd -17.778, -0.4453, 24.889, 0FF447154h, 0.0
    dd -14.222, -0.4679, 28.444, 0FF436D52h, 0.0
    dd -17.778, -0.4112, 28.444, 0FF467458h, 0.0
    dd -14.222, -0.4390, 24.889, 0FF457255h, 0.0
    dd -10.667, -0.5363, 24.889, 0FF416B4Fh, 0.0
    dd -10.667, -0.6024, 28.444, 0FF3E644Ah, 0.0
    dd -14.222, -0.4390, 24.889, 0FF457255h, 0.0
    dd -10.667, -0.6024, 28.444, 0FF3E644Ah, 0.0
    dd -14.222, -0.4679, 28.444, 0FF436D52h, 0.0
    dd -10.667, -0.5363, 24.889, 0FF416B4Fh, 0.0
    dd -7.111, -0.6974, 24.889, 0FF3D6248h, 0.0
    dd -7.111, -0.7592, 28.444, 0FF3D6249h, 0.0
    dd -10.667, -0.5363, 24.889, 0FF416B4Fh, 0.0
    dd -7.111, -0.7592, 28.444, 0FF3D6249h, 0.0
    dd -10.667, -0.6024, 28.444, 0FF3E644Ah, 0.0
    dd -7.111, -0.6974, 24.889, 0FF3D6248h, 0.0
    dd -3.556, -0.8644, 24.889, 0FF3C6148h, 0.0
    dd -3.556, -0.8857, 28.444, 0FF3E654Bh, 0.0
    dd -7.111, -0.6974, 24.889, 0FF3D6248h, 0.0
    dd -3.556, -0.8857, 28.444, 0FF3E654Bh, 0.0
    dd -7.111, -0.7592, 28.444, 0FF3D6249h, 0.0
    dd -3.556, -0.8644, 24.889, 0FF3C6148h, 0.0
    dd  0.000, -0.9847, 24.889, 0FF3E644Ah, 0.0
    dd  0.000, -0.9530, 28.444, 0FF3F654Ch, 0.0
    dd -3.556, -0.8644, 24.889, 0FF3C6148h, 0.0
    dd  0.000, -0.9530, 28.444, 0FF3F654Ch, 0.0
    dd -3.556, -0.8857, 28.444, 0FF3E654Bh, 0.0
    dd  0.000, -0.9847, 24.889, 0FF3E644Ah, 0.0
    dd  3.556, -1.0319, 24.889, 0FF3E644Bh, 0.0
    dd  3.556, -0.9647, 28.444, 0FF3D6249h, 0.0
    dd  0.000, -0.9847, 24.889, 0FF3E644Ah, 0.0
    dd  3.556, -0.9647, 28.444, 0FF3D6249h, 0.0
    dd  0.000, -0.9530, 28.444, 0FF3F654Ch, 0.0
    dd  3.556, -1.0319, 24.889, 0FF3E644Bh, 0.0
    dd  7.111, -1.0137, 24.889, 0FF3C5F47h, 0.0
    dd  7.111, -0.9508, 28.444, 0FF3A5D44h, 0.0
    dd  3.556, -1.0319, 24.889, 0FF3E644Bh, 0.0
    dd  7.111, -0.9508, 28.444, 0FF3A5D44h, 0.0
    dd  3.556, -0.9647, 28.444, 0FF3D6249h, 0.0
    dd  7.111, -1.0137, 24.889, 0FF3C5F47h, 0.0
    dd 10.667, -0.9654, 24.889, 0FF3A5C44h, 0.0
    dd 10.667, -0.9499, 28.444, 0FF3A5E45h, 0.0
    dd  7.111, -1.0137, 24.889, 0FF3C5F47h, 0.0
    dd 10.667, -0.9499, 28.444, 0FF3A5E45h, 0.0
    dd  7.111, -0.9508, 28.444, 0FF3A5D44h, 0.0
    dd 10.667, -0.9654, 24.889, 0FF3A5C44h, 0.0
    dd 14.222, -0.9316, 24.889, 0FF3C5F45h, 0.0
    dd 14.222, -0.9882, 28.444, 0FF3D6249h, 0.0
    dd 10.667, -0.9654, 24.889, 0FF3A5C44h, 0.0
    dd 14.222, -0.9882, 28.444, 0FF3D6249h, 0.0
    dd 10.667, -0.9499, 28.444, 0FF3A5E45h, 0.0
    dd 14.222, -0.9316, 24.889, 0FF3C5F45h, 0.0
    dd 17.778, -0.9437, 24.889, 0FF3E644Bh, 0.0
    dd 17.778, -1.0644, 28.444, 0FF3E634Ah, 0.0
    dd 14.222, -0.9316, 24.889, 0FF3C5F45h, 0.0
    dd 17.778, -1.0644, 28.444, 0FF3E634Ah, 0.0
    dd 14.222, -0.9882, 28.444, 0FF3D6249h, 0.0
    dd 17.778, -0.9437, 24.889, 0FF3E644Bh, 0.0
    dd 21.333, -1.0050, 24.889, 0FF3F644Bh, 0.0
    dd 21.333, -1.1492, 28.444, 0FF3B5E45h, 0.0
    dd 17.778, -0.9437, 24.889, 0FF3E644Bh, 0.0
    dd 21.333, -1.1492, 28.444, 0FF3B5E45h, 0.0
    dd 17.778, -1.0644, 28.444, 0FF3E634Ah, 0.0
    dd 21.333, -1.0050, 24.889, 0FF3F644Bh, 0.0
    dd 24.889, -1.0885, 24.889, 0FF3B5E46h, 0.0
    dd 24.889, -1.1972, 28.444, 0FF385841h, 0.0
    dd 21.333, -1.0050, 24.889, 0FF3F644Bh, 0.0
    dd 24.889, -1.1972, 28.444, 0FF385841h, 0.0
    dd 21.333, -1.1492, 28.444, 0FF3B5E45h, 0.0
    dd 24.889, -1.0885, 24.889, 0FF3B5E46h, 0.0
    dd 28.444, -1.1495, 24.889, 0FF385840h, 0.0
    dd 28.444, -1.1689, 28.444, 0FF385841h, 0.0
    dd 24.889, -1.0885, 24.889, 0FF3B5E46h, 0.0
    dd 28.444, -1.1689, 28.444, 0FF385841h, 0.0
    dd 24.889, -1.1972, 28.444, 0FF385841h, 0.0
    dd 28.444, -1.1495, 24.889, 0FF385840h, 0.0
    dd 32.000, -1.1468, 24.889, 0FF395A41h, 0.0
    dd 32.000, -1.0507, 28.444, 0FF3C6047h, 0.0
    dd 28.444, -1.1495, 24.889, 0FF385840h, 0.0
    dd 32.000, -1.0507, 28.444, 0FF3C6047h, 0.0
    dd 28.444, -1.1689, 28.444, 0FF385841h, 0.0
    dd -32.000, -1.1270, 28.444, 0FF3B5D45h, 0.0
    dd -28.444, -0.8778, 28.444, 0FF3B5E45h, 0.0
    dd -28.444, -0.7499, 32.000, 0FF3D6148h, 0.0
    dd -32.000, -1.1270, 28.444, 0FF3B5D45h, 0.0
    dd -28.444, -0.7499, 32.000, 0FF3D6148h, 0.0
    dd -32.000, -1.0148, 32.000, 0FF3A5C44h, 0.0
    dd -28.444, -0.8778, 28.444, 0FF3B5E45h, 0.0
    dd -24.889, -0.6366, 28.444, 0FF3E654Bh, 0.0
    dd -24.889, -0.5452, 32.000, 0FF426C51h, 0.0
    dd -28.444, -0.8778, 28.444, 0FF3B5E45h, 0.0
    dd -24.889, -0.5452, 32.000, 0FF426C51h, 0.0
    dd -28.444, -0.7499, 32.000, 0FF3D6148h, 0.0
    dd -24.889, -0.6366, 28.444, 0FF3E654Bh, 0.0
    dd -21.333, -0.4678, 28.444, 0FF436F53h, 0.0
    dd -21.333, -0.4465, 32.000, 0FF457356h, 0.0
    dd -24.889, -0.6366, 28.444, 0FF3E654Bh, 0.0
    dd -21.333, -0.4465, 32.000, 0FF457356h, 0.0
    dd -24.889, -0.5452, 32.000, 0FF426C51h, 0.0
    dd -21.333, -0.4678, 28.444, 0FF436F53h, 0.0
    dd -17.778, -0.4112, 28.444, 0FF467458h, 0.0
    dd -17.778, -0.4614, 32.000, 0FF436E53h, 0.0
    dd -21.333, -0.4678, 28.444, 0FF436F53h, 0.0
    dd -17.778, -0.4614, 32.000, 0FF436E53h, 0.0
    dd -21.333, -0.4465, 32.000, 0FF457356h, 0.0
    dd -17.778, -0.4112, 28.444, 0FF467458h, 0.0
    dd -14.222, -0.4679, 28.444, 0FF436D52h, 0.0
    dd -14.222, -0.5608, 32.000, 0FF3F664Bh, 0.0
    dd -17.778, -0.4112, 28.444, 0FF467458h, 0.0
    dd -14.222, -0.5608, 32.000, 0FF3F664Bh, 0.0
    dd -17.778, -0.4614, 32.000, 0FF436E53h, 0.0
    dd -14.222, -0.4679, 28.444, 0FF436D52h, 0.0
    dd -10.667, -0.6024, 28.444, 0FF3E644Ah, 0.0
    dd -10.667, -0.6941, 32.000, 0FF3D6349h, 0.0
    dd -14.222, -0.4679, 28.444, 0FF436D52h, 0.0
    dd -10.667, -0.6941, 32.000, 0FF3D6349h, 0.0
    dd -14.222, -0.5608, 32.000, 0FF3F664Bh, 0.0
    dd -10.667, -0.6024, 28.444, 0FF3E644Ah, 0.0
    dd -7.111, -0.7592, 28.444, 0FF3D6249h, 0.0
    dd -7.111, -0.8118, 32.000, 0FF3F654Ch, 0.0
    dd -10.667, -0.6024, 28.444, 0FF3E644Ah, 0.0
    dd -7.111, -0.8118, 32.000, 0FF3F654Ch, 0.0
    dd -10.667, -0.6941, 32.000, 0FF3D6349h, 0.0
    dd -7.111, -0.7592, 28.444, 0FF3D6249h, 0.0
    dd -3.556, -0.8857, 28.444, 0FF3E654Bh, 0.0
    dd -3.556, -0.8861, 32.000, 0FF40674Dh, 0.0
    dd -7.111, -0.7592, 28.444, 0FF3D6249h, 0.0
    dd -3.556, -0.8861, 32.000, 0FF40674Dh, 0.0
    dd -7.111, -0.8118, 32.000, 0FF3F654Ch, 0.0
    dd -3.556, -0.8857, 28.444, 0FF3E654Bh, 0.0
    dd  0.000, -0.9530, 28.444, 0FF3F654Ch, 0.0
    dd  0.000, -0.9190, 32.000, 0FF3E644Bh, 0.0
    dd -3.556, -0.8857, 28.444, 0FF3E654Bh, 0.0
    dd  0.000, -0.9190, 32.000, 0FF3E644Bh, 0.0
    dd -3.556, -0.8861, 32.000, 0FF40674Dh, 0.0
    dd  0.000, -0.9530, 28.444, 0FF3F654Ch, 0.0
    dd  3.556, -0.9647, 28.444, 0FF3D6249h, 0.0
    dd  3.556, -0.9370, 32.000, 0FF3B5E45h, 0.0
    dd  0.000, -0.9530, 28.444, 0FF3F654Ch, 0.0
    dd  3.556, -0.9370, 32.000, 0FF3B5E45h, 0.0
    dd  0.000, -0.9190, 32.000, 0FF3E644Bh, 0.0
    dd  3.556, -0.9647, 28.444, 0FF3D6249h, 0.0
    dd  7.111, -0.9508, 28.444, 0FF3A5D44h, 0.0
    dd  7.111, -0.9736, 32.000, 0FF3A5C44h, 0.0
    dd  3.556, -0.9647, 28.444, 0FF3D6249h, 0.0
    dd  7.111, -0.9736, 32.000, 0FF3A5C44h, 0.0
    dd  3.556, -0.9370, 32.000, 0FF3B5E45h, 0.0
    dd  7.111, -0.9508, 28.444, 0FF3A5D44h, 0.0
    dd 10.667, -0.9499, 28.444, 0FF3A5E45h, 0.0
    dd 10.667, -1.0485, 32.000, 0FF3C5F47h, 0.0
    dd  7.111, -0.9508, 28.444, 0FF3A5D44h, 0.0
    dd 10.667, -1.0485, 32.000, 0FF3C5F47h, 0.0
    dd  7.111, -0.9736, 32.000, 0FF3A5C44h, 0.0
    dd 10.667, -0.9499, 28.444, 0FF3A5E45h, 0.0
    dd 14.222, -0.9882, 28.444, 0FF3D6249h, 0.0
    dd 14.222, -1.1546, 32.000, 0FF3D6148h, 0.0
    dd 10.667, -0.9499, 28.444, 0FF3A5E45h, 0.0
    dd 14.222, -1.1546, 32.000, 0FF3D6148h, 0.0
    dd 10.667, -1.0485, 32.000, 0FF3C5F47h, 0.0
    dd 14.222, -0.9882, 28.444, 0FF3D6249h, 0.0
    dd 17.778, -1.0644, 28.444, 0FF3E634Ah, 0.0
    dd 17.778, -1.2569, 32.000, 0FF3C5E46h, 0.0
    dd 14.222, -0.9882, 28.444, 0FF3D6249h, 0.0
    dd 17.778, -1.2569, 32.000, 0FF3C5E46h, 0.0
    dd 14.222, -1.1546, 32.000, 0FF3D6148h, 0.0
    dd 17.778, -1.0644, 28.444, 0FF3E634Ah, 0.0
    dd 21.333, -1.1492, 28.444, 0FF3B5E45h, 0.0
    dd 21.333, -1.3064, 32.000, 0FF395941h, 0.0
    dd 17.778, -1.0644, 28.444, 0FF3E634Ah, 0.0
    dd 21.333, -1.3064, 32.000, 0FF395941h, 0.0
    dd 17.778, -1.2569, 32.000, 0FF3C5E46h, 0.0
    dd 21.333, -1.1492, 28.444, 0FF3B5E45h, 0.0
    dd 24.889, -1.1972, 28.444, 0FF385841h, 0.0
    dd 24.889, -1.2619, 32.000, 0FF385740h, 0.0
    dd 21.333, -1.1492, 28.444, 0FF3B5E45h, 0.0
    dd 24.889, -1.2619, 32.000, 0FF385740h, 0.0
    dd 21.333, -1.3064, 32.000, 0FF395941h, 0.0
    dd 24.889, -1.1972, 28.444, 0FF385841h, 0.0
    dd 28.444, -1.1689, 28.444, 0FF385841h, 0.0
    dd 28.444, -1.1106, 32.000, 0FF3B5E45h, 0.0
    dd 24.889, -1.1972, 28.444, 0FF385841h, 0.0
    dd 28.444, -1.1106, 32.000, 0FF3B5E45h, 0.0
    dd 24.889, -1.2619, 32.000, 0FF385740h, 0.0
    dd 28.444, -1.1689, 28.444, 0FF385841h, 0.0
    dd 32.000, -1.0507, 28.444, 0FF3C6047h, 0.0
    dd 32.000, -0.8778, 32.000, 0FF40674Dh, 0.0
    dd 28.444, -1.1689, 28.444, 0FF385841h, 0.0
    dd 32.000, -0.8778, 32.000, 0FF40674Dh, 0.0
    dd 28.444, -1.1106, 32.000, 0FF3B5E45h, 0.0

; cube front
    dd -0.55,  0.55, -0.55, 0FFFFDFA8h, 1.0
    dd  0.55,  0.55, -0.55, 0FFFFE2B2h, 1.0
    dd  0.55, -0.55, -0.55, 0FFFFB37Ah, 1.0

    dd -0.55,  0.55, -0.55, 0FFFFDFA8h, 1.0
    dd  0.55, -0.55, -0.55, 0FFFFB37Ah, 1.0
    dd -0.55, -0.55, -0.55, 0FFFFB37Ah, 1.0

    ; cube back
    dd -0.55,  0.55,  0.55, 0FF9BE8FFh, 1.0
    dd  0.55, -0.55,  0.55, 0FF76C7FFh, 1.0
    dd  0.55,  0.55,  0.55, 0FF9BE8FFh, 1.0

    dd -0.55,  0.55,  0.55, 0FF9BE8FFh, 1.0
    dd -0.55, -0.55,  0.55, 0FF76C7FFh, 1.0
    dd  0.55, -0.55,  0.55, 0FF76C7FFh, 1.0

    ; cube left
    dd -0.55,  0.55, -0.55, 0FF98F0A8h, 1.0
    dd -0.55, -0.55, -0.55, 0FF74D68Ah, 1.0
    dd -0.55, -0.55,  0.55, 0FF74D68Ah, 1.0

    dd -0.55,  0.55, -0.55, 0FF98F0A8h, 1.0
    dd -0.55, -0.55,  0.55, 0FF74D68Ah, 1.0
    dd -0.55,  0.55,  0.55, 0FF98F0A8h, 1.0

    ; cube right
    dd  0.55,  0.55, -0.55, 0FFFFB98Eh, 1.0
    dd  0.55, -0.55,  0.55, 0FFFF8666h, 1.0
    dd  0.55, -0.55, -0.55, 0FFFF8666h, 1.0

    dd  0.55,  0.55, -0.55, 0FFFFB98Eh, 1.0
    dd  0.55,  0.55,  0.55, 0FFFFB98Eh, 1.0
    dd  0.55, -0.55,  0.55, 0FFFF8666h, 1.0

    ; cube top
    dd -0.55,  0.55, -0.55, 0FFF6F8FFh, 1.0
    dd  0.55,  0.55,  0.55, 0FFF3FBFFh, 1.0
    dd  0.55,  0.55, -0.55, 0FFF6F8FFh, 1.0

    dd -0.55,  0.55, -0.55, 0FFF6F8FFh, 1.0
    dd -0.55,  0.55,  0.55, 0FFF3FBFFh, 1.0
    dd  0.55,  0.55,  0.55, 0FFF3FBFFh, 1.0

    ; cube bottom
    dd -0.55, -0.55, -0.55, 0FF6A5E98h, 1.0
    dd  0.55, -0.55, -0.55, 0FF7E6ABBh, 1.0
    dd  0.55, -0.55,  0.55, 0FF7E6ABBh, 1.0

    dd -0.55, -0.55, -0.55, 0FF6A5E98h, 1.0
    dd  0.55, -0.55,  0.55, 0FF7E6ABBh, 1.0
    dd -0.55, -0.55,  0.55, 0FF6A5E98h, 1.0

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
g_depthTex      resq 1
g_dsv           resq 1
g_worldRS       resq 1

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

g_shaderBlob         resq 1
g_shaderBytecodePtr  resq 1
g_shaderBytecodeSize resq 1

g_hex32Buffer   resb 11
g_hex64Buffer   resb 19

g_worldCBData   resd 16

g_lastTick      resq 1
g_dtSeconds     resd 1

g_mouseX            resd 1
g_mouseY            resd 1
g_mouseDX           resd 1
g_mouseDY           resd 1
g_mouseInitialized  resd 1
g_mouseLDown        resd 1
g_mouseLPressed     resd 1
g_mouseLReleased    resd 1
g_mouseRDown        resd 1
g_mouseRPressed     resd 1
g_mouseRReleased    resd 1

g_spaceDown         resd 1
g_spacePressed      resd 1
g_pDown             resd 1
g_pPressed          resd 1
g_rDown             resd 1
g_rPressed          resd 1
g_tabDown           resd 1
g_tabPressed        resd 1
g_wDown             resd 1
g_aDown             resd 1
g_sDown             resd 1
g_dDown             resd 1
g_qDown             resd 1
g_eDown             resd 1

g_cubePosY      resd 1
g_cubeVelY      resd 1
g_cubeAngle     resd 1
g_cubeEnergy    resd 1
g_cubeHeight01  resd 1
g_cubeHeld      resd 1
g_physicsPaused resd 1

g_camPosX       resd 1
g_camPosY       resd 1
g_camPosZ       resd 1
g_camYaw        resd 1
g_camPitch      resd 1
g_camFov        resd 1
g_lightStrength resd 1
g_shaderModeIndex resd 1

g_uiMouseOver   resd 1
g_uiHotWidget   resd 1
g_uiActiveWidget resd 1
g_uiDropdownOpen resd 1
g_uiDropdownIndex resd 1
g_uiSliderFov01  resd 1
g_uiSliderLight01 resd 1
g_menuVisible   resd 1
g_uiVertexCount resd 1
g_uiWritePtr    resq 1
g_uiVertices    resb UI_MAX_VERTICES * 12

g_ovlWnd        resq 1
g_ovlMemDC      resq 1
g_ovlBitmap     resq 1
g_ovlOldBitmap  resq 1

g_wc            resb WNDCLASSEXA_size
g_rect          resb RECT_size
g_msg           resb MSG_size
g_swapDesc      resb DXGI_SWAP_CHAIN_DESC_size
g_bufDesc       resb D3D11_BUFFER_DESC_size
g_subData       resb D3D11_SUBRESOURCE_DATA_size
g_blendDesc     resb D3D11_BLEND_DESC_size
g_tex2DDesc     resb D3D11_TEXTURE2D_DESC_size
g_rsDesc        resb D3D11_RASTERIZER_DESC_size

