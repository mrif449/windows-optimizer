@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM Initialize variables
SET "section1=0"
SET "section2=0"
SET "section3=0"
SET "section4=0"
SET "section5=0"
SET "section6=0"


:MENU
CLS
ECHO 1. Removing System Softwares [!section1!]
ECHO 2. Remove Reserve Storage [!section2!]
ECHO 3. Adding Main Context Menu [!section3!]
ECHO 4. Removing AMD Radeon Software Context Menu [!section4!]
ECHO 5. Reinstall System Apps [!section5!]
ECHO 6. Clean Temporary Junks [!section6!]

CHOICE /C 123456E /N /M "Press the number of the section you want to toggle, or 'E' to execute: "

IF ERRORLEVEL 7 GOTO EXECUTE

IF ERRORLEVEL 6 (
    IF "!section6!"=="0" (
        SET "section6=1"
    ) ELSE (
        SET "section6=0"
    )
    GOTO MENU
)
IF ERRORLEVEL 5 (
    IF "!section5!"=="0" (
        SET "section5=1"
    ) ELSE (
        SET "section5=0"
    )
    GOTO MENU
)
IF ERRORLEVEL 4 (
    IF "!section4!"=="0" (
        SET "section4=1"
    ) ELSE (
        SET "section4=0"
    )
    GOTO MENU
)
IF ERRORLEVEL 3 (
    IF "!section3!"=="0" (
        SET "section3=1"
    ) ELSE (
        SET "section3=0"
    )
    GOTO MENU
)
IF ERRORLEVEL 2 (
    IF "!section2!"=="0" (
        SET "section2=1"
    ) ELSE (
        SET "section2=0"
    )
    GOTO MENU
)
IF ERRORLEVEL 1 (
    IF "!section1!"=="0" (
        SET "section1=1"
    ) ELSE (
        SET "section1=0"
    )
    GOTO MENU
)

:EXECUTE
IF "%section1%"=="1" (
    Get-AppxPackage *Microsoft.YourPhone* -AllUsers | Remove-AppxPackage
    Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage
    Get-AppxPackage *Microsoft.People* -AllUsers | Remove-AppxPackage
    Get-AppxPackage *Microsoft.WindowsCamera* -AllUsers | Remove-AppxPackage
    get-appxpackage *communicationsapps* | remove-appxpackage
    get-appxpackage *maps* | remove-appxpackage
    get-appxpackage *feedback* | remove-appxpackage
    get-appxpackage *officehub* | remove-appxpackage
    get-appxpackage *onenote* | remove-appxpackage
    get-appxpackage *getstarted* | remove-appxpackage
    get-appxpackage *skypeapp* | remove-appxpackage
    get-appxpackage *solitaire* | remove-appxpackage
    get-appxpackage *zunevideo* | remove-appxpackage
    get-appxpackage *sticky* | remove-appxpackage
    get-appxpackage *3d* | remove-appxpackage
    get-appxpackage *soundrecorder* | remove-appxpackage
    get-appxpackage *bingweather* | remove-appxpackage
    get-appxpackage *xbox* | remove-appxpackage
    Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage
    get-appxpackage *Microsoft. WindowsAlarms* | remove-appxpackage
    Get-AppxPackage *WebExperience* | Remove-AppxPackage
    REM Add more commands for section 1 if needed
)
IF "%section2%"=="1" (
    powercfg.exe /hibernate off
    Set-WindowsReservedStorageState -State disabled
    REM Add more commands for section 2 if needed
)
IF "%section3%"=="1" (
    reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
    REM Add more commands for section 3 if needed
)
IF "%section4%"=="1" (
    Get-AppxPackage -AllUsers AdvancedMicroDevicesInc-RSXCM | Remove-AppxPackage -AllUsers
    REM Add more commands for section 4 if needed
)
IF "%section5%"=="1" (
    Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
    REM Add more commands for section 5 if needed
)
IF "%section6%"=="1" (
    :input_username
set /p username="Enter your username: "

if not exist "C:\Users\%username%" (
    echo Invalid username. Please try again.
    goto input_username
)

for %%d in (
    "C:\Program Files (x86)\Temp\*.*"
    "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data\*.*"
    "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Code Cache\js\*.*"
    "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Service Worker\CacheStorage\*.*"
    "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Service Worker\ScriptCache\*.*"
    "C:\Users\%username%\AppData\Local\Temp\*.*"
    "C:\Users\%username%\AppData\Local\npm-cache\_cacache\index-v5\*.*"
    "C:\Users\%username%\AppData\Local\npm-cache\_logs\*.*"
    "C:\Users\%username%\AppData\Local\npm-cache\_npx\*.*"
    "C:\Windows\SoftwareDistribution\Download\*.*"
    "C:\Program Files\Microsoft Office\Updates\Download\PackageFiles\*.*"
    "C:\Program Files (x86)\Google\Update\Download\*.*"
    "C:\Users\%username%\AppData\Local\D3DSCache\*.*"
    "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\DawnCache\*.*"
) do (
    if exist %%d (
        echo Deleting files in %%d
        del /s /q "%%d"
    ) else (
        echo Directory %%d not found.
    )
)
    REM Add more commands for section 5 if needed
)

ECHO.
ECHO Press any key to exit...
PAUSE >nul
