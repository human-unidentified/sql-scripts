@echo off
chcp 65001 > nul

echo Восстановление резервной копии в существующую БД
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
SET targetDbName=#TODO_pgdatabase#
:: Имя файла с sql скриптом очистки существующей БД
SET clearExistingScript=clear_existing_DB.sql
:: Имя файла с резервной копией БД
SET backupfile=postgre_backup.sql

:: Выполнение скрипта удаления и создания БД
%psqlPath% -E -F p --dbname=postgresql://%username%:%password%@%host%:%port%/postgres --file="%clearExistingScript%"

:: Восстановление БД
%psqlPath% -E -F p --dbname=postgresql://%username%:%password%@%host%:%port%/"%targetDbName%" --file="%backupfile%"

pause
