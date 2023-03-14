CHCP 866
ECHO bv7(c) ver.20170808 Скрыть фоновый обмен

SETLOCAL
CALL "%~dp0УстановкаПараметров.cmd"
SET cmdStr=%cmdExchangeChk:\=\\%
SET cmdStr=%cmdStr:"=\"%
SET cmdStr=%cmdStr:(=^(%
SET cmdStr=%cmdStr:)=^)%
FOR /F "usebackq tokens=2 delims==" %%i IN (`wmic process where "CommandLine like '%cmdStr%'" get ProcessId /VALUE`) DO "%~dp0nircmd.exe" win %visible% process /%%i
