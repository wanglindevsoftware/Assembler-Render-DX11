@echo off
setlocal EnableExtensions EnableDelayedExpansion

call "%~dp0build_nasm_release.bat" || exit /b 1

echo [RUN] Starting dx11_nasm_ui_cube.exe ...
"%~dp0dx11_nasm_ui_cube.exe"
set "APP_EXIT=!ERRORLEVEL!"

echo [INFO] dx11_nasm_ui_cube.exe exited with code !APP_EXIT!.
if exist "%~dp0dx11_nasm_ui_cube.log" (
    echo [INFO] Last log lines:
    powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "Get-Content -LiteralPath '%~dp0dx11_nasm_ui_cube.log' -Tail 25"
) else (
    echo [WARN] Log file was not created.
)

exit /b !APP_EXIT!
