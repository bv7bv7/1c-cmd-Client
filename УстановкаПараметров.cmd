ECHO bv7(c) ver.20110325 ��⠭���� ��ࠬ��஢

REM ��� ��
SET DataBaseName=database

REM ���� � ��
SET DataBase=C:\1C-bases-path\%DataBaseName%

REM ��������� (show - �⮡ࠦ���, hide - ��뢠��)
SET visible=show

REM ���� � ���㧪� ��
SET DumpBasePath=%~dp0..\�����

REM ��� ���㧪�
set DumpBaseName=%DataBaseName%-

REM ����७�� ���㧪�
SET DumpBaseExtension=.dt

REM ����७�� 䠩�� ��� ��࠭���� ����ᥩ, 㤠�塞�� �� ��ୠ�� ॣ����樨
SET DumpLogExtension=.elf

REM ���ᨬ��쭮� ������⢮ ���㧮�
set DumpCount=10

REM ��� 䠩�� ��� �㦥���� ᮮ�饭��
SET Log=%~dp0%DataBaseName%.log

REM ���� � ��� �ᯮ��塞��� 䠩�� 1�
SET v8exe=C:\Program Files (x86)\1cv8\8.3.9.2170\bin\1cv8.exe

REM ��� ����������
SET AdminUser=�����������

REM ��஫� �����������
SET AdminPassword=AdminPassword

REM ��� ���짮��⥫� ��� ������ ����묨
SET ExchangeUser=���������묨

REM ��஫� ���짮��⥫� ��� ������ ����묨
SET ExchangePassword=ExchangePassword

REM ���� �����஢��
SET Key=����⭮��������������䨣��樨��

REM ��������� ���� 1� ᮤ�ন�
SET iTitle1C=1�:�।���⨥

REM ��ப� ��� ����᪠ ������
SET cmdExchange="%v8exe%" ENTERPRISE /F"%DataBase%" /WA- /N"%ExchangeUser%" /P%ExchangePassword% /DisableStartupMessages

REM ��ப� ��� ��।������ ����� ������
SET cmdExchangeChk="%v8exe%" ENTERPRISE /F"%DataBase%" %%/N"%ExchangeUser%" %%