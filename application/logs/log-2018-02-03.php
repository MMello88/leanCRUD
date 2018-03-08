<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2018-02-03 20:33:32 --> Query error: You can't delete all columns with ALTER TABLE; use DROP TABLE instead - Invalid query: ALTER TABLE `filho` DROP COLUMN `cidade_id`
ERROR - 2018-02-03 20:33:35 --> Query error: You can't delete all columns with ALTER TABLE; use DROP TABLE instead - Invalid query: ALTER TABLE `filho` DROP COLUMN `cidade_id`
ERROR - 2018-02-03 20:34:06 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `filho`' at line 2 - Invalid query: SELECT `filho`.
FROM `filho`
ERROR - 2018-02-03 20:34:20 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `filho`' at line 2 - Invalid query: SELECT `filho`.
FROM `filho`
ERROR - 2018-02-03 20:49:00 --> Query error: Duplicate column name 'cidade_id' - Invalid query: ALTER TABLE `filho` ADD COLUMN `cidade_id` int(11)  NOT NULL ;
ERROR - 2018-02-03 20:49:23 --> Query error: Duplicate column name 'cidade_id' - Invalid query: ALTER TABLE `filho` ADD COLUMN `cidade_id` int(11)  NOT NULL ;
ERROR - 2018-02-03 20:50:42 --> Query error: Key column 'cidade_id' doesn't exist in table - Invalid query: ALTER TABLE filho ADD CONSTRAINT FK_filho_cidade_id FOREIGN KEY (cidade_id) REFERENCES cidade(cidade_id); 
