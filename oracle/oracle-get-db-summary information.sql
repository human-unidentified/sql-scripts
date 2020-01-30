begin
    dbms_stats.gather_schema_stats ('TFLEXDOCS_ORACLE');
end;
/

-- Tables + Size MB
select owner, table_name, round((num_rows * avg_row_len) / (1024 * 1024)) MB
from all_tables
where owner = 'TFLEXDOCS_ORACLE'
--and num_rows > 0  -- Ignore empty Tables.
order by MB desc
;

--Tables + Rows
select owner, table_name, num_rows
from all_tables
where owner = 'TFLEXDOCS_ORACLE'
--  and num_rows > 0          -- Ignore empty Tables.
order by num_rows desc
;

SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH
FROM user_tab_cols
order by TABLE_NAME, COLUMN_ID;