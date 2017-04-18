@echo off
cls
pushd %0\..
:check
if not exist Conf.cfv2_nameRand (
 echo コンフィグファイルがありません。
 pause
 start /wait NameRand.exe
 goto check
)
for /f "delims== tokens=1,* eol=#" %%i in ('findstr /r "[a-zA-Z0-9][a-zA-Z0-9]*=" "Conf.cfv2_nameRand"') do set %%i=%%j

goto start

:defaultHeader
cls
echo ----------------------------------
echo Config Editor v1 for NameRand v2.x
echo Author: Tateshiki0529
echo URL: http://tslab.ml/
echo ----------------------------------
echo;
exit /b

:start
call :defaultHeader
echo 1.文字数の設定
echo 2.作成時の表示(現在非対応)
echo 3.終了
choice /c 123 >nul
set el=%errorlevel%
if %el% == 1 goto strSet
if %el% == 2 goto viewSet
if %el% == 3 goto :eof

:strSet
set inp=
call :defaultHeader
echo 文字数を設定…(現在の設定: %strLength%)
set /p "inp=-->"
if "%inp%" == "" goto start
call :write
goto strSet

:viewSet
goto start

:write
echo # Create: %date% %time%> Conf.cfv2_nameRand
echo strLength=%inp%>> Conf.cfv2_nameRand
echo view=true>> Conf.cfv2_nameRand
for /f "delims== tokens=1,* eol=#" %%i in ('findstr /r "[a-zA-Z0-9][a-zA-Z0-9]*=" "Conf.cfv2_nameRand"') do set %%i=%%j
exit /b