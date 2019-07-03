/*Получение всех новых объектов в справочных таблицах*/
use TFlexDOCs_sql2017

CREATE TABLE #processedTables ( tableName NVARCHAR(255) )

-- получение всех таблиц в которых есть поле s_CreationDate
INSERT INTO #processedTables
SELECT DISTINCT (sch_col.TABLE_NAME) AS tableName
FROM INFORMATION_SCHEMA.COLUMNS sch_col
WHERE sch_col.COLUMN_NAME = 's_CreationDate'

DECLARE @dateFrom varchar(255) = '2019-06-25 12:50:22.000' -- Дата\время начиная с которой проверяются созданные объекты
DECLARE @tableName varchar(255)
DECLARE @tableNameCursor CURSOR;

SET @tableNameCursor = CURSOR LOCAL
FOR SELECT * FROM #processedTables

OPEN @tableNameCursor

FETCH NEXT FROM @tableNameCursor INTO @tableName;

WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @sql NVARCHAR(1024) = '
	if (exists (select * from '+ @tableName + ' tbl where tbl.s_CreationDate > '''+ @dateFrom +''' )) BEGIN
		select ''' + @tableName +'''
		select * from ' + @tableName + ' tbl where tbl.s_CreationDate > '''+ @dateFrom +''';
	END'

	EXEC sys.sp_executesql @sql;

	FETCH NEXT FROM @tableNameCursor INTO @tableName;
END;

CLOSE @tableNameCursor
DEALLOCATE @tableNameCursor

DROP TABLE #processedTables
