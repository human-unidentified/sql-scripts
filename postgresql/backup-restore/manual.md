﻿# Скрипты для работы с задачами резервирования БД PostgreSQL

Данные скрипты предназначены для облегчения работы с резервными копиями PostgreSQL

## Создание резервной копии

1. Указать в файле ``01_backup_db.cmd`` параметры создания резервной копии
2. Выполнить файл ``01_backup_db.cmd``
3. В результате будет получен текстовый файл с sql коммандами наполнения БД

## Восстановление в БД в существующую БД

1. Отредактировать файл ``clear_existing_DB.sql``, указав в нем имя перезаписываемой БД
2. Указать в файле ``02_restore_to_existing_db.cmd`` параметры восстановления
3. Выполнить файл ``02_restore_to_existing_db.cmd``

## Восстановление в БД в новую

1. Отредактировать файл ``create_new_db.sql``, указав в нем имя новой БД
2. Указать в файле ``03_restore_to_new_db.cmd`` параметры восстановления
3. Выполнить файл ``03_restore_to_new_db.cmd``
