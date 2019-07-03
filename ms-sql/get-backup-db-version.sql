/*
( 'SQL Server 2017',    869,   140)
( 'SQL Server 2016',    852,   130)
( 'SQL Server 2014',    782,   120)
( 'SQL Server 2012',    706,   110)
( 'SQL Server 2008 R2', 661,   100)
( 'SQL Server 2008 R2', 660,   100)
( 'SQL Server 2008',    655,   100)
*/

declare @backupFileName nvarchar(255) = 'D:\DB_Backups\TFlexDOCs_sql2017_v17\TFlexDOCs_sql2017_v17_17002.bak'

RESTORE HEADERONLY FROM DISK = @backupFileName