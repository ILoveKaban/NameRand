@echo off
cls
pushd %0\..
:check
if not exist Conf.cfv2_nameRand (
 echo �R���t�B�O�t�@�C��������܂���B
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
echo 1.�������̐ݒ�
echo 2.�쐬���̕\��(���ݔ�Ή�)
echo 3.�I��
choice /c 123 >nul
set el=%errorlevel%
if %el% == 1 goto strSet
if %el% == 2 goto viewSet
if %el% == 3 goto :eof

:strSet
set inp=
call :defaultHeader
echo ��������ݒ�c(���݂̐ݒ�: %strLength%)
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