@echo off
chcp 65001 > nul

echo Создание резервной копии БД

:: Параметры создания копии БД (pg_dump --help)

:: Путь к приложению pg_dump
SET pgdumpPath=.\x64\pg_dump.exe
:: Имя сервера PostgreSQL
SET host=localhost
:: Порт для доступа к службе PostgreSQL. По умолчанию 5432. Нужно укзаывать если на компютере работает несколько экземпляров PostgreSQL
SET port=5432
:: Имя пользователя для подключения
SET username=postgres
:: Пароль пользователя для подключения
SET password=#TODO_password#
:: Имя резервируемой БД
SET sourceDbName=#TODO_pgdatabase#
:: Имя файла с резеhвной копией БД. !ВНИМАНИЕ! Если указывается полный путь для создаваемого файла, то папка для файла должна существовать.
SET backupfile=postgre_backup.sql

:: Создание копии БД
%pgdumpPath% -F p -E UTF8 -b --dbname=postgresql://%username%:%password%@%host%:%port%/"%sourceDbName%" --file="%backupfile%"

pause