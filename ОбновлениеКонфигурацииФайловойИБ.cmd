CHCP 866
ECHO bv7(c) v.20170808 ���������� ���䨣��樨 1� 䠩����� ��

REM GOTO :EOF

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION
CALL "%~dp0��⠭������ࠬ��஢.cmd"
CALL "%~dp0�������쐠���㏮�짮��⥫��.cmd"
IF ERRORLEVEL 1 GOTO :EOF
CALL "%~dp0exec.cmd" "���������� ���䨣��樨 1�" wait "%v8exe%" CONFIG /F"%DataBase%" /WA- /N"%AdminUser%" /P%AdminPassword% /UpdateDBCfg /UC%Key% /DisableStartupMessages /Out"%Log%" -NoTruncate
IF ERRORLEVEL 1 GOTO :EOF
CALL "%~dp0������쐠���㏮�짮��⥫��.cmd"
CALL "%~dp0����᪔�������������.cmd"