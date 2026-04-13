
%ifndef DX11_COMMON_INC
%define DX11_COMMON_INC

%define TRUE                            1
%define FALSE                           0

%define WINDOW_WIDTH                    1280
%define WINDOW_HEIGHT                   720

%define UI_MAX_VERTICES                 512
%define WORLD_VERTEX_COUNT              36

%define UI_PANEL_X                      24
%define UI_PANEL_Y                      24
%define UI_PANEL_W                      320
%define UI_PANEL_H                      264

%define UI_BUTTON_X                     48
%define UI_BUTTON_W                     272
%define UI_BUTTON_H                     38
%define UI_BUTTON1_Y                    72
%define UI_BUTTON2_Y                    118
%define UI_BUTTON3_Y                    164

%define UI_BAR_X                        48
%define UI_BAR_Y                        224
%define UI_BAR_W                        272
%define UI_BAR_H                        24

%define CS_VREDRAW                      0001h
%define CS_HREDRAW                      0002h

%define WS_FIXEDWINDOW                  00CA0000h
%define CW_USEDEFAULT                   80000000h
%define SW_SHOWDEFAULT                  10

%define WM_DESTROY                      0002h
%define WM_CLOSE                        0010h
%define WM_QUIT                         0012h
%define WM_KEYDOWN                      0100h
%define WM_KEYUP                        0101h
%define WM_MOUSEMOVE                    0200h
%define WM_LBUTTONDOWN                  0201h
%define WM_LBUTTONUP                    0202h

%define VK_ESCAPE                       1Bh
%define VK_SPACE                        20h
%define VK_P                            50h
%define VK_R                            52h

%define IDC_ARROW                       32512
%define PM_REMOVE                       0001h
%define MB_ICONERROR                    0010h
%define EXCEPTION_CONTINUE_SEARCH       0

%define D3D_DRIVER_TYPE_HARDWARE        1
%define D3D_DRIVER_TYPE_WARP            5
%define D3D11_SDK_VERSION               7

%define GENERIC_WRITE                   40000000h
%define FILE_SHARE_READ                 00000001h
%define CREATE_ALWAYS                   2
%define FILE_ATTRIBUTE_NORMAL           00000080h

%define DXGI_FORMAT_R8G8B8A8_UNORM      28
%define DXGI_FORMAT_R32_FLOAT           41
%define DXGI_FORMAT_R32G32_FLOAT        16
%define DXGI_FORMAT_R32G32B32_FLOAT     6

%define DXGI_USAGE_RENDER_TARGET_OUTPUT 00000020h
%define DXGI_SWAP_EFFECT_DISCARD        0

%define D3D11_USAGE_DEFAULT             0
%define D3D11_BIND_VERTEX_BUFFER        00000001h
%define D3D11_BIND_CONSTANT_BUFFER      00000004h
%define D3D11_INPUT_PER_VERTEX_DATA     0
%define D3D11_PRIMITIVE_TOPOLOGY_LINELIST 2
%define D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST 4

%define D3D11_BLEND_ZERO                1
%define D3D11_BLEND_ONE                 2
%define D3D11_BLEND_SRC_ALPHA           5
%define D3D11_BLEND_INV_SRC_ALPHA       6
%define D3D11_BLEND_OP_ADD              1
%define D3D11_COLOR_WRITE_ENABLE_ALL    0Fh

%define D3DCOMPILE_ENABLE_STRICTNESS    00000800h

%define IUnknown_Release                         16

%define IDXGISwapChain_Present                   64
%define IDXGISwapChain_GetBuffer                 72

%define ID3D11Device_CreateBuffer                24
%define ID3D11Device_CreateRenderTargetView      72
%define ID3D11Device_CreateInputLayout           88
%define ID3D11Device_CreateVertexShader          96
%define ID3D11Device_CreatePixelShader          120
%define ID3D11Device_CreateBlendState           160

%define ID3D11DeviceContext_VSSetConstantBuffers   56
%define ID3D11DeviceContext_PSSetShader            72
%define ID3D11DeviceContext_VSSetShader            88
%define ID3D11DeviceContext_Draw                  104
%define ID3D11DeviceContext_IASetInputLayout      136
%define ID3D11DeviceContext_IASetVertexBuffers    144
%define ID3D11DeviceContext_IASetPrimitiveTopology 192
%define ID3D11DeviceContext_OMSetRenderTargets    264
%define ID3D11DeviceContext_OMSetBlendState       280
%define ID3D11DeviceContext_RSSetViewports        352
%define ID3D11DeviceContext_UpdateSubresource     384
%define ID3D11DeviceContext_ClearRenderTargetView 400

%define ID3DBlob_GetBufferPointer                 24
%define ID3DBlob_GetBufferSize                    32

struc WNDCLASSEXA
    .cbSize          resd 1
    .style           resd 1
    .lpfnWndProc     resq 1
    .cbClsExtra      resd 1
    .cbWndExtra      resd 1
    .hInstance       resq 1
    .hIcon           resq 1
    .hCursor         resq 1
    .hbrBackground   resq 1
    .lpszMenuName    resq 1
    .lpszClassName   resq 1
    .hIconSm         resq 1
endstruc

struc RECT
    .left   resd 1
    .top    resd 1
    .right  resd 1
    .bottom resd 1
endstruc

struc MSG
    .hwnd      resq 1
    .message   resd 1
    .pad0      resd 1
    .wParam    resq 1
    .lParam    resq 1
    .time      resd 1
    .pt_x      resd 1
    .pt_y      resd 1
    .lPrivate  resd 1
    .pad1      resd 1
endstruc

struc DXGI_RATIONAL
    .Numerator   resd 1
    .Denominator resd 1
endstruc

struc DXGI_MODE_DESC
    .Width             resd 1
    .Height            resd 1
    .RefreshRate       resb DXGI_RATIONAL_size
    .Format            resd 1
    .ScanlineOrdering  resd 1
    .Scaling           resd 1
endstruc

struc DXGI_SAMPLE_DESC
    .Count   resd 1
    .Quality resd 1
endstruc

struc DXGI_SWAP_CHAIN_DESC
    .BufferDesc     resb DXGI_MODE_DESC_size
    .SampleDesc     resb DXGI_SAMPLE_DESC_size
    .BufferUsage    resd 1
    .BufferCount    resd 1
    .pad0           resd 1
    .OutputWindow   resq 1
    .Windowed       resd 1
    .SwapEffect     resd 1
    .Flags          resd 1
    .pad1           resd 1
endstruc

struc D3D11_BUFFER_DESC
    .ByteWidth           resd 1
    .Usage               resd 1
    .BindFlags           resd 1
    .CPUAccessFlags      resd 1
    .MiscFlags           resd 1
    .StructureByteStride resd 1
endstruc

struc D3D11_SUBRESOURCE_DATA
    .pSysMem          resq 1
    .SysMemPitch      resd 1
    .SysMemSlicePitch resd 1
endstruc

struc D3D11_INPUT_ELEMENT_DESC
    .SemanticName         resq 1
    .SemanticIndex        resd 1
    .Format               resd 1
    .InputSlot            resd 1
    .AlignedByteOffset    resd 1
    .InputSlotClass       resd 1
    .InstanceDataStepRate resd 1
endstruc

struc D3D11_VIEWPORT
    .TopLeftX resd 1
    .TopLeftY resd 1
    .Width    resd 1
    .Height   resd 1
    .MinDepth resd 1
    .MaxDepth resd 1
endstruc

struc D3D11_RENDER_TARGET_BLEND_DESC
    .BlendEnable           resd 1
    .SrcBlend              resd 1
    .DestBlend             resd 1
    .BlendOp               resd 1
    .SrcBlendAlpha         resd 1
    .DestBlendAlpha        resd 1
    .BlendOpAlpha          resd 1
    .RenderTargetWriteMask resb 1
    .pad0                  resb 3
endstruc

struc D3D11_BLEND_DESC
    .AlphaToCoverageEnable  resd 1
    .IndependentBlendEnable resd 1
    .RenderTarget0          resb D3D11_RENDER_TARGET_BLEND_DESC_size
    .RenderTarget1          resb D3D11_RENDER_TARGET_BLEND_DESC_size
    .RenderTarget2          resb D3D11_RENDER_TARGET_BLEND_DESC_size
    .RenderTarget3          resb D3D11_RENDER_TARGET_BLEND_DESC_size
    .RenderTarget4          resb D3D11_RENDER_TARGET_BLEND_DESC_size
    .RenderTarget5          resb D3D11_RENDER_TARGET_BLEND_DESC_size
    .RenderTarget6          resb D3D11_RENDER_TARGET_BLEND_DESC_size
    .RenderTarget7          resb D3D11_RENDER_TARGET_BLEND_DESC_size
endstruc

%endif
