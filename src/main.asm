
default rel
bits 64

extern GetModuleHandleA
extern RegisterClassExA
extern AdjustWindowRectEx
extern CreateWindowExA
extern ShowWindow
extern UpdateWindow
extern DefWindowProcA
extern DestroyWindow
extern PostQuitMessage
extern PeekMessageA
extern TranslateMessage
extern DispatchMessageA
extern ExitProcess
extern LoadCursorA
extern GetTickCount64
extern MessageBoxA
extern CreateFileA
extern WriteFile
extern CloseHandle
extern OutputDebugStringA
extern IsDebuggerPresent
extern AddVectoredExceptionHandler
extern RemoveVectoredExceptionHandler
extern LoadLibraryA
extern GetProcAddress
extern FreeLibrary

extern D3D11CreateDeviceAndSwapChain

%include "Common.inc"
%include "Globals.asm"
%include "Shaders.asm"
%include "Log.asm"
%include "Physics.asm"
%include "UI.asm"
%include "Render_UI.asm"
%include "Renderer.asm"
%include "App.asm"
