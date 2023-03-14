CHCP 866
ECHO bv7(c) v.20110325 Разрешить работу пользователей

SETLOCAL
CALL "%~dp0УстановкаПараметров.cmd"
CALL "%~dp0exec.cmd" "Разрешить работу пользователей" wait "%v8exe%" ENTERPRISE /F"%DataBase%" /WA- /N"%AdminUser%" /P%AdminPassword% /UC%Key% /DisableStartupMessages /Out"%Log%" -NoTruncate /CРазрешитьРаботуПользователей
