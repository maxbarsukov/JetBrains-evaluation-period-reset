@echo off

set "fileEvl=other.xml"
set "tmpfileEvl=%fileEvl:~0,-4%.temp"
set "package=%UserProfile%"

cd %package%
for /d %%d in (%package%\.PhpStorm*) do (
	IF EXIST "%%d\config\eval" (
		ECHO Removing %package%\%%d\config\eval
		rmdir /S/Q "%%d\config\eval"
	)
	ECHO.
	IF EXIST "%%d\config\options\%fileEvl%" (
		cd %%d\config\options
		type %fileEvl% | find /v /i "evl" > %tmpfileEvl%
		echo Y|move %tmpfileEvl% %fileEvl%
	)
)
set "package=%UserProfile%\AppData\Roaming\JetBrains"
cd %package%
IF EXIST "consentOptions" (
    ECHO Removing %package%\consentOptions
    rmdir /S/Q "consentOptions"
)
IF EXIST "PermanentUserId" (
    ECHO Removing %package%\PermanentUserId
    del /F/Q "PermanentUserId"
)
IF EXIST "PermanentDeviceId" (
    ECHO Removing %package%\PermanentDeviceId
    del /F/Q "PermanentDeviceId"
)
for /d %%d in (%package%\PhpStorm*) do (
	IF EXIST "%%d\eval" (
		ECHO Removing %package%\%%d\eval
		rmdir /S/Q "%%d\eval"
	)
	ECHO.
	IF EXIST "%%d\options\%fileEvl%" (
		cd %%d\options
		type %fileEvl% | find /v /i "evl" > %tmpfileEvl%
		echo Y|move %tmpfileEvl% %fileEvl%
	)
)

reg query "HKCU\Software\JavaSoft\Prefs\jetbrains" 2> nul
IF %ERRORLEVEL% EQU 1 goto finish
ECHO Removing "HKCU\Software\JavaSoft\Prefs\jetbrains" from registry
reg delete "HKCU\Software\JavaSoft\Prefs\jetbrains" /f
:finish
ECHO.
ECHO Now try to run PhpStorm
ECHO.
del "other.xml"
pause
