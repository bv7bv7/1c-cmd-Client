CHCP 866
ECHO bv7(c) ver.20110325 Завершить работу пользователей 1С

IF ERRORLEVEL 1 GOTO :EOF
SETLOCAL
CALL "%~dp0УстановкаПараметров.cmd"
CALL "%~dp0exec.cmd" "Завершить работу пользователей 1С" wait "%v8exe%" ENTERPRISE /F"%DataBase%" /WA- /N"%AdminUser%" /P%AdminPassword% /UC%Key% /DisableStartupMessages /Out"%Log%" -NoTruncate /CЗавершитьРаботуПользователей
