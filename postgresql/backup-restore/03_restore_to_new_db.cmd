@echo off
chcp 65001 > nul

echo Восстановление резервной копии в новую БД

:: Параметры восстановления БД (psql --help)
:: Путь к приложению psqlPath
SET psqlPath=.\x64\psql.exe
:: Имя сервера PostgreSQL
SET host=localhost
:: Порт для доступа к службе PostgreSQL. По умолчанию 5432. Нужно укзаывать если на компютере работает несколько экземпляров PostgreSQL
SET port=5432
:: Имя пользователя для подключения
SET username=postgres
:: Пароль пользователя для подключения
SET password=#TODO_password#
:: Имя БД, в которую будет восстанавливаться резервная копия
SET targetDbName=#TODO_pgdatabase_new_name#
:: Имя файла с sql скриптом создания новой БД
SET createEmptyScript=create_new_db.sql
:: Имя файла с резервной копией БД
SET backupfile=postgre_backup.sql

:: Выполнение скрипта создания новой БД
%psqlPath% -E -F p --dbname=postgresql://%username%:%password%@%host%:%port%/postgres --file="%createEmptyScript%"

:: Восстановление БД
%psqlPath% -E -F p --dbname=postgresql://%username%:%password%@%host%:%port%/"%targetDbName%" --file="%backupfile%"

pause