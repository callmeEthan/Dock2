echo off
title Drag n drop Task
set src=%1
set des=%2
set mov=%3
set src=%src:"=%
set des=%des:"=%
cls
echo Checking source file...
set type=0
if exist "%src%\*" (set type=1) else (set type=2)
if %type%==1 (echo Path is directory) & (goto DIRCOPY)
if %type%==2 (echo Path is file) & (goto FILECOPY)
if %type%==0 (echo Path check failed) & (goto FAILEND)
pause

:DIRCOPY
For %%A in ("%src%") do (
    Set Folder=%%~dpA
    Set Name=%%~nxA
)
if %mov%=="1" goto DIRMOVE
echo Copying directory to:
echo %des%
robocopy "%src%" "%des%\%Name%" /e
exit

:DIRMOVE
echo Moving directory to:
echo %des%
robocopy "%src%" "%des%\%Name%" /e /move
exit

:FILECOPY
For %%A in ("%src%") do (
    Set Folder=%%~dpA
    Set Name=%%~nxA
)
set Folder=%Folder:~0,-1%
echo File: %Name%
echo Path: %Folder%
if %mov%=="1" goto FILEMOVE
echo Copying file to:
echo %des%
robocopy "%Folder%" "%des%" "%Name%" /A-:SH
exit

:FILEMOVE
echo Moving file to:
echo %des%
robocopy "%Folder%" "%des%" "%Name%" /move /A-:SH
exit


:FAILEND
echo Unable to copy file (File check failed)
pause
exit