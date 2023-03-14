ECHO bv7(c) ver.20110325 Установка параметров

REM Имя БД
SET DataBaseName=database

REM Путь к БД
SET DataBase=C:\1C-bases-path\%DataBaseName%

REM Видимость (show - отображать, hide - скрывать)
SET visible=show

REM Путь к выгрузке БД
SET DumpBasePath=%~dp0..\Копии

REM Имя выгрузки
set DumpBaseName=%DataBaseName%-

REM Расширение выгрузки
SET DumpBaseExtension=.dt

REM Расширение файла для сохранения записей, удаляемых из журнала регистрации
SET DumpLogExtension=.elf

REM Максимальное количество выгрузок
set DumpCount=10

REM Имя файла для служебных сообщений
SET Log=%~dp0%DataBaseName%.log

REM Путь и имя исполняемого файла 1С
SET v8exe=C:\Program Files (x86)\1cv8\8.3.9.2170\bin\1cv8.exe

REM Имя администатора
SET AdminUser=Администратор

REM Пароль администратора
SET AdminPassword=AdminPassword

REM Имя пользователя для обмена данными
SET ExchangeUser=ОбменДанными

REM Пароль пользователя для обмена данными
SET ExchangePassword=ExchangePassword

REM Ключ блокировки
SET Key=ПакетноеОбновлениеКонфигурацииИБ

REM Заголовок окна 1С содержит
SET iTitle1C=1С:Предприятие

REM Строка для запуска обмена
SET cmdExchange="%v8exe%" ENTERPRISE /F"%DataBase%" /WA- /N"%ExchangeUser%" /P%ExchangePassword% /DisableStartupMessages

REM Строка для определения процесса обмена
SET cmdExchangeChk="%v8exe%" ENTERPRISE /F"%DataBase%" %%/N"%ExchangeUser%" %%