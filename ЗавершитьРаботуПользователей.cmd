CHCP 866
ECHO bv7(c) ver.20110325 �������� ࠡ��� ���짮��⥫�� 1�

IF ERRORLEVEL 1 GOTO :EOF
SETLOCAL
CALL "%~dp0��⠭������ࠬ��஢.cmd"
CALL "%~dp0exec.cmd" "�������� ࠡ��� ���짮��⥫�� 1�" wait "%v8exe%" ENTERPRISE /F"%DataBase%" /WA- /N"%AdminUser%" /P%AdminPassword% /UC%Key% /DisableStartupMessages /Out"%Log%" -NoTruncate /C�������쐠���㏮�짮��⥫��
