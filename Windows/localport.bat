@echo off
title localport.top - free port forwarding service

cls
if exist "ssh.exe" (
    echo ssh exist
	timeout 3
	echo.
) else (
    echo ssh not exist
	pause
)

cls
echo _____________________________________________________________
echo        __   __           __   __   __  ___  ___  __   __
echo   ^|   ^|  ^| ^|    /_\ ^|   ^|__) ^|  ^| ^|__)  ^|    ^|  ^|  ^| ^|__)
echo   ^|__ ^|__^| ^|__ /   \^|__ ^|    ^|__^| ^| \   ^|  . ^|  ^|__^| ^|
echo.
echo _____________________________________________________________ 
echo(         localport.top - free port forwarding service
echo -------------------------------------------------------------
echo(                         sansamour
REM                        v1 31 Aug 2020:
echo _____________________________________________________________
echo.
echo      *ssh installed required*
echo Parameters : [local port] [option]
echo.
echo      parameter [option] : random  = random http subdomain forwarded
echo      parameter [option] : mysub   = custom http subdomain forwarded
echo.
echo Examples :
echo  80 mysub                //localhost:80 forward to subdomain mysub
echo  80 random               //localhost:80 forward to random subdomain
echo.
echo.

set domain=localport.top
set port=80

if "%1" == "" (	
	echo _________________________________________________________________
	set /p local= "local port [80]:" || set "local=80"
	echo _________________________________________________________________
	set /p option= "option [random]:" || set "option=random"
) else (	
	set local=%1
	set option=%2
)
 
	echo.
	echo running : %local% %option%
	echo SSH command: ssh -R %port%:localhost:%local% %option%@%domain%
	echo.
	
	
	if %option%==random      (ssh -R %port%:localhost:%local% %option%@%domain%) else (
	if %option% GEQ 1        (ssh -R %port%:localhost:%local% %option%@%domain%) )

pause
