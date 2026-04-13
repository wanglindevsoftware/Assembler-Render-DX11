@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "ROOT=%~dp0"
pushd "%ROOT%" >nul

set "NASM_EXE="
set "GOLINK_EXE="
set "TOOLS_DIR=%ROOT%tools"
set "GOLINK_DIR=%TOOLS_DIR%\golink"
set "GOLINK_ZIP=%TOOLS_DIR%\Golink.zip"
set "GOLINK_ZIP_SHA256=F0F682C5FC55217F5B93922475910840F5DCD8467F7891DF12D7856554C3D160"
set "GOLINK_EXE_SHA256=9A0FC1B5168B2C642786770EE1A779AC66E0B6AFAAFA8F8A2B7619A3164FE168"

if exist "%ROOT%nasm.exe" set "NASM_EXE=%ROOT%nasm.exe"
if not defined NASM_EXE if exist "%ROOT%tools\nasm\nasm.exe" set "NASM_EXE=%ROOT%tools\nasm\nasm.exe"
if not defined NASM_EXE (
    for %%I in (nasm.exe) do if not "%%~$PATH:I"=="" set "NASM_EXE=%%~$PATH:I"
)

if not defined NASM_EXE (
    echo [ERROR] NASM not found.
    echo Put nasm.exe next to this BAT, or in tools\nasm\nasm.exe, or add NASM to PATH.
    echo Example:
    echo   winget install -e --id NASM.NASM --accept-package-agreements --accept-source-agreements
    popd >nul
    exit /b 1
)

if exist "%ROOT%GoLink.exe" set "GOLINK_EXE=%ROOT%GoLink.exe"
if not defined GOLINK_EXE if exist "%GOLINK_DIR%\GoLink.exe" set "GOLINK_EXE=%GOLINK_DIR%\GoLink.exe"
if not defined GOLINK_EXE if exist "%GOLINK_DIR%\golink.exe" set "GOLINK_EXE=%GOLINK_DIR%\golink.exe"
if not defined GOLINK_EXE (
    for %%I in (GoLink.exe golink.exe) do if not "%%~$PATH:I"=="" set "GOLINK_EXE=%%~$PATH:I"
)

if not defined GOLINK_EXE (
    call :download_golink
    if errorlevel 1 (
        popd >nul
        exit /b 1
    )
)

call :hash_file "%GOLINK_EXE%" GOLINK_HASH
if errorlevel 1 (
    echo [ERROR] Could not hash GoLink.exe.
    popd >nul
    exit /b 1
)
if /I not "!GOLINK_HASH!"=="%GOLINK_EXE_SHA256%" (
    echo [ERROR] GoLink.exe hash mismatch.
    echo Expected: %GOLINK_EXE_SHA256%
    echo Actual:   !GOLINK_HASH!
    popd >nul
    exit /b 1
)

if not exist build mkdir build

echo [1/2] Assembling modular main.asm ...
pushd "%ROOT%src" >nul
"%NASM_EXE%" -f win64 "main.asm" -o "%ROOT%build\main.obj"
set "ASM_ERR=!ERRORLEVEL!"
popd >nul
if not "!ASM_ERR!"=="0" (
    exit /b !ASM_ERR!
)

echo [2/2] Linking ...
"%GOLINK_EXE%" /fo "%ROOT%dx11_nasm_ui_cube.exe" /entry WinMainCRTStartup /mix ^
  "%ROOT%build\main.obj" kernel32.dll user32.dll gdi32.dll d3d11.dll dxgi.dll
if errorlevel 1 (
    popd >nul
    exit /b 1
)

echo.
echo OK: %ROOT%dx11_nasm_ui_cube.exe
echo [INFO] GUI + renderer + embedded shaders are inside the EXE.
popd >nul
exit /b 0

:download_golink
echo [INFO] GoLink not found. Downloading a local copy into tools\golink ...
if not exist "%TOOLS_DIR%" mkdir "%TOOLS_DIR%"
if exist "%GOLINK_DIR%" rd /s /q "%GOLINK_DIR%"
mkdir "%GOLINK_DIR%" >nul 2>nul

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -UseBasicParsing 'https://www.godevtool.com/Golink.zip' -OutFile '%GOLINK_ZIP%'"
if errorlevel 1 (
    echo [ERROR] Failed to download Golink.zip from the official site.
    exit /b 1
)

call :hash_file "%GOLINK_ZIP%" ZIP_HASH
if errorlevel 1 (
    echo [ERROR] Could not hash Golink.zip.
    exit /b 1
)
if /I not "!ZIP_HASH!"=="%GOLINK_ZIP_SHA256%" (
    echo [ERROR] Golink.zip hash mismatch.
    echo Expected: %GOLINK_ZIP_SHA256%
    echo Actual:   !ZIP_HASH!
    exit /b 1
)

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
  "Expand-Archive -LiteralPath '%GOLINK_ZIP%' -DestinationPath '%GOLINK_DIR%' -Force"
if errorlevel 1 (
    echo [ERROR] Failed to extract Golink.zip.
    exit /b 1
)

for /r "%GOLINK_DIR%" %%F in (GoLink.exe golink.exe) do (
    if not defined GOLINK_EXE set "GOLINK_EXE=%%F"
)

if not defined GOLINK_EXE (
    echo [ERROR] GoLink.exe was not found after extraction.
    exit /b 1
)

exit /b 0

:hash_file
setlocal EnableExtensions EnableDelayedExpansion
set "FILE=%~1"
set "OUTVAR=%~2"
set "HASH="

set "_HASH_FILE=%FILE%"
for /f "usebackq delims=" %%H in (`powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:_HASH_FILE; if (-not (Test-Path -LiteralPath $p)) { exit 3 }; (Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToUpperInvariant()" 2^>nul`) do (
    if not defined HASH set "HASH=%%H"
)
set "_HASH_FILE="

if not defined HASH (
    for /f "usebackq delims=" %%H in (`certutil -hashfile "%FILE%" SHA256 2^>nul ^| findstr /R /B /I "[0-9A-F][0-9A-F]"`) do (
        if not defined HASH set "HASH=%%H"
    )
)

if not defined HASH (
    endlocal & exit /b 1
)

set "HASH=!HASH: =!"
endlocal & set "%OUTVAR%=%HASH%"
exit /b 0
