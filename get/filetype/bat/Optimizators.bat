@echo off
:: Pārbauda, vai skripts ir palaists kā administrators
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Skripts palaists ar administratora tiesībām.
) else (
    echo [KĻŪDA] Lūdzu, palaid šo failu kā Administrators!
    pause
    exit
)

title Windows Super Tikritajs un Optimizators
color 0A
cls

echo ===========================================================================
echo    WINDOWS SISTĒMAS OPTIMIZĀCIJA UN TĪRĪŠANA IZVEIDOJA DATORU PALIDZIBA
echo ===========================================================================
echo.

:: 1. DNS kešatmiņas attīrīšana interneta ātrumam
echo [1/4] Attīra DNS kešatmiņu...
ipconfig /flushdns
echo.

:: 2. Windows Temp (pagaidu) failu dzēšana
echo [2/4] Dzēš sistēmas pagaidu (Temp) failus...
del /s /f /q %userprofile%\AppData\Local\Temp\*.* 2>nul
rmdir /s /q %userprofile%\AppData\Local\Temp\ 2>nul
mkdir %userprofile%\AppData\Local\Temp\

del /s /f /q C:\Windows\Temp\*.* 2>nul
rmdir /s /q C:\Windows\Temp\ 2>nul
mkdir C:\Windows\Temp\
echo.

:: 3. Prefetch mapes tīrīšana (paātrina vecāku failu ielādi)
echo [3/4] Tīra Prefetch mapi...
del /s /f /q C:\Windows\Prefetch\*.* 2>nul
echo.

:: 4. Sistēmas failu pārbaude un labošana (DISM un SFC)
echo [4/4] Pārbauda un labo sistēmas failus (tas var aizņemt brīdi)...
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow
echo.

echo ======================================================
echo    TĪRĪŠANA PABEIGTA! TAVS DATORS TAGAD IR ĀTRĀKS!
echo ======================================================
pause
exit
