-- Сбор статистики
begin
    dbms_stats.gather_schema_stats ('TFLEXDOCS_ORACLE');
end;
/

-- Получение размера таблиц в Мб
select owner, table_name, round((num_rows * avg_row_len) / (1024 * 1024)) MB
from all_tables
where owner = 'TFLEXDOCS_ORACLE'
order by MB desc
;

-- Получение количества строк в таблицах
select owner, table_name, num_rows
from all_tables
where owner = 'TFLEXDOCS_ORACLE'
order by num_rows desc
;

-- Получение метаданных о столбцах таблиц
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH
FROM user_tab_cols
order by TABLE_NAME, COLUMN_ID;