CHCP 866
ECHO bv7(c) ver.20110325 Выгрузка файловой ИБ 1С

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION
CALL "%~dp0УстановкаПараметров.cmd"

IF NOT EXIST "%DumpBasePath%" MKDIR "%DumpBasePath%"

ECHO Получение номера выгрузки...
set CurrentNumber=%DumpBaseName%0
for /F "delims=/" %%F IN ('dir "%DumpBasePath%\%DumpBaseName%*%DumpBaseExtension%" /OD /TW /B') DO SET CurrentNumber=%%~nF
set CurrentNumber=!CurrentNumber:%DumpBaseName%=!
set /A CurrentNumber+=1
if %CurrentNumber% GTR %DumpCount% set CurrentNumber=1

ECHO Получение текущей даты...
:: Code by Herbert Kleebauer
echo Bj@jzh`0X-`/PPPPPPa(DE(DM(DO(Dh(Ls(Lu(LX(LeZRR]EEEUYRX2Dx=>%TMP%\d_t.com
echo 0DxFP,0Xx.t0P,=XtGsB4o@$?PIyU WwX0GwUY Wv;ovBX2Gv0ExGIuht6>>%TMP%\d_t.com
echo LisqMz`wGH@wKuur`G@w?ogBgGG}G?j_egoNOG?w?`gBLksqgG`w?WgBgG>>%TMP%\d_t.com
echo G}G?R_MgoNMy?wSx@W?s?W?@zAB`LrFuBLyt~vuco{@LuKooD?BFHqrIcP>>%TMP%\d_t.com
echo _sdDxb1T??=?rILO_sdDqx1T??=?rILO_sdDnl1T??=?rILO_sdD`c1T??>>%TMP%\d_t.com
echo =?rILO_sdDgg1T??=?rILO_sdDll1T??=?rILO_sdDrr1T??=??IL?0xxx>>%TMP%\d_t.com
for /F "delims=" %%C IN ('%TMP%\d_t.com') DO %%C
del %TMP%\d_t.com
REM century: %_cy%, year: %_yr%, month: %_mo%, day: %_da%, hour: %_hh%, minute: %_mm%,  second: %_ss%
CALL "%~dp0ЗавершитьРаботуПользователей.cmd"
IF ERRORLEVEL 1 GOTO :EOF
SET cmdStr=%cmdExchangeChk:\=\\%
SET cmdStr=%cmdStr:"=\"%
FOR /F "usebackq tokens=2 delims==" %%i IN (`wmic process where "CommandLine like '%cmdStr%'" get ProcessId /VALUE`) DO "%~dp0nircmd.exe" win close process /%%i
CALL "%~dp0exec.cmd" "Выгрузка БД" wait "%v8exe%" CONFIG /F"%DataBase%" /WA- /N"%AdminUser%" /P%AdminPassword% /UC%Key% /DisableStartupMessages -NoTruncate /DumpIB"%DumpBasePath%\%DumpBaseName%%CurrentNumber%%DumpBaseExtension%"
IF ERRORLEVEL 1 GOTO :EOF
CALL "%~dp0exec.cmd" "Реиндексация и пересчет итогов БД" wait "%v8exe%" CONFIG /F"%DataBase%" /WA- /N"%AdminUser%" /P%AdminPassword% /UC%Key% /DisableStartupMessages -NoTruncate /IBCheckAndRepair -ReIndex -RecalcTotals
IF ERRORLEVEL 1 GOTO :EOF
CALL "%~dp0exec.cmd" "Сокращение журнала регистрации БД" wait "%v8exe%" CONFIG /F"%DataBase%" /WA- /N"%AdminUser%" /P%AdminPassword% /UC%Key% /DisableStartupMessages -NoTruncate /ReduceEventLogSize %_cy%%_yr%-%_mo%-%_da% -saveAs"%DumpBasePath%\%DumpBaseName%%CurrentNumber%%DumpLogExtension%"
IF ERRORLEVEL 1 GOTO :EOF
CALL "%~dp0РазрешитьРаботуПользователей.cmd"
CALL "%~dp0ЗапускФоновогоОбмена.cmd"