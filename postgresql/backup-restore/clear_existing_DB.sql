-- Скрипт очистки БД, через операции удаления и создания БД. 
SELECT pg_catalog.set_config('search_path', '', false);

--  Перевод БД в однопользовательский режим. Раскоментировать если БД не удаляется
/*
UPDATE pg_database SET datallowconn = 'false' WHERE datname = 'todo_databasename';
ALTER DATABASE "todo_databasename" CONNECTION LIMIT 1;
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'todo_databasename';
*/

DROP DATABASE "todo_databasename";
CREATE DATABASE "todo_databasename";