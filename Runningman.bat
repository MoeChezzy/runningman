@Echo off
Echo off
cls
color f
set productname=Runningman
set productauthor=Chezzy

:MENU
cls
TITLE %productname% by %productauthor%
set /p highscore=<hiscore.sve
echo Runningman
echo.
echo High score: %highscore%
echo.
echo [1] - Start
echo [2] - Help
echo [3] - Exit
choice /c 123 /n >NUL
if %errorlevel%==3 exit
if %errorlevel%==2 goto HELP
if %errorlevel%==1 goto BEGIN

:HELP
cls
TITLE %productname% by %productauthor%
echo Runningman is a game to test your reflexes and quick thinking skills.
echo You will be given a path, and you must press the key that corresponds to the
echo marked tile.
echo Left: f
echo Middle 1: g
echo Middle 2: h
echo Right: j
echo.
echo If you press the wrong key you're out.
echo.
echo Press any key to go back
pause > NUL
goto MENU

:BEGIN
cls
set times=-1
goto LOOPA

:LOOP
if "%errorlevel%" NEQ "%randomint%" goto FAIL
:LOOPA
set /a times=%times% + 1
TITLE %productname% by %productauthor%: %times%
set /a randomint=%random% * 4 / 32767 + 1
if "%randomint%"=="1" (
echo ----------------------------------[*][ ][ ][ ]----------------------------------
choice /c fghj /n >NUL
if %errorlevel%==1 goto LOOP
if "%errorlevel%" NEQ "1" goto LOOP
)
if "%randomint%"=="2" (
echo ----------------------------------[ ][*][ ][ ]----------------------------------
choice /c fghj /n >NUL
if %errorlevel%==2 goto LOOP
if "%errorlevel%" NEQ "2" goto LOOP
)
if "%randomint%"=="3" (
echo ----------------------------------[ ][ ][*][ ]----------------------------------
choice /c fghj /n >NUL
if %errorlevel%==3 goto LOOP
if "%errorlevel%" NEQ "3" goto LOOP
)
if "%randomint%"=="4" (
echo ----------------------------------[ ][ ][ ][*]----------------------------------
choice /c fghj /n >NUL
if %errorlevel%==4 goto LOOP
if "%errorlevel%" NEQ "4" goto LOOP
)
goto LOOP

:FAIL
cls
echo You messed up.
echo Times: %times%
set /p temphiscore=<hiscore.sve
if "%times%" GTR "%temphiscore%" call :SAVESCORE
echo Press any key to continue.
pause > NUL
goto MENU

:SAVESCORE
>hiscore.sve echo %times%
echo New high score!
echo.