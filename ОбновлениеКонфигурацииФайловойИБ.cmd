CHCP 866
ECHO bv7(c) v.20170808 Обновление конфигурации 1С файловой ИБ

REM GOTO :EOF

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION
CALL "%~dp0УстановкаПараметров.cmd"
CALL "%~dp0ЗавершитьРаботуПользователей.cmd"
IF ERRORLEVEL 1 GOTO :EOF
CALL "%~dp0exec.cmd" "Обновление конфигурации 1С" wait "%v8exe%" CONFIG /F"%DataBase%" /WA- /N"%AdminUser%" /P%AdminPassword% /UpdateDBCfg /UC%Key% /DisableStartupMessages /Out"%Log%" -NoTruncate
IF ERRORLEVEL 1 GOTO :EOF
CALL "%~dp0РазрешитьРаботуПользователей.cmd"
CALL "%~dp0ЗапускФоновогоОбмена.cmd"