CHCP 866
ECHO bv7(c) ver.20170808 Показать фоновый обмен

SETLOCAL
CALL "%~dp0УстановкаПараметров.cmd"
"%~dp0nircmd.exe" win show ititle "%iTitle1C%"
"%~dp0nircmd.exe" win show ititle "cmd.exe"