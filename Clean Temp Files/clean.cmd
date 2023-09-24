@echo off
setlocal enabledelayedexpansion

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

echo Done!
pause >nul

