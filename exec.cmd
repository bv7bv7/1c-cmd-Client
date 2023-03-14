CHCP 866
ECHO bv7(c) ver.20170803 Выполняет команду (возможно скрыто, возможно с ожиданием завершения, не выполняется если запущен другой экземпляр)

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO ---%DATE% %TIME% %~1>>"%Log%"

SET cmd=%3
:nextPar
SHIFT /3
IF `%3`==``  GOTO exitPar
SET cmd=%cmd% %3
GOTO nextPar
:exitPar

SET cmdStr=%cmd:\=\\%
SET cmdStr=%cmdStr:"=\"%
SET cmdStr=%cmdStr:(=^(%
SET cmdStr=%cmdStr:)=^)%
SET /A run=0
FOR /F "usebackq tokens=2 delims==" %%i IN (`wmic process where "CommandLine='%cmdStr%'" get ProcessId /VALUE`) DO SET /A run+=1
IF %run%==0 GOTO exitChk2
ECHO 	Ошибка. Запущен другой экземпляр строки: %cmd%>>"%Log%"
EXIT /b 1
:exitChk2

"%~dp0nircmd.exe" exec %visible% %cmd%
IF /I "%2" == "nowait" GOTO :EOF
SET /A tm=0

:nextWait
IF /I "%2" == "wait" GOTO :skipTime
IF %tm% GEQ %2 GOTO :EOF
SET /A tm+=3000

:skipTime
"%~dp0nircmd.exe" wait 3000
SET /A run=0
FOR /F "usebackq tokens=2 delims==" %%i IN (`wmic process where "CommandLine='%cmdStr%'" get ProcessId /VALUE`) DO SET /A run+=1
IF %run% GTR 0 GOTO :nextWait
