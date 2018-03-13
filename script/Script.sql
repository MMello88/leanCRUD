/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.5-10.1.10-MariaDB : Database - leancrud_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`leancrud_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ci_sessions` */

LOCK TABLES `ci_sessions` WRITE;

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('6e73b8f3r76h9048heuql501jgf985h8','127.0.0.1',1520908167,'__ci_last_regenerate|i:1520908167;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('9en723mi50d4nekns11v0kbi2mfdfrbg','127.0.0.1',1520907532,'__ci_last_regenerate|i:1520907532;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('a1md3flvljn9qhait9b6siujim8hu1ka','127.0.0.1',1520936802,'__ci_last_regenerate|i:1520936802;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('aojgh4ci4n9r7ra408r6lvv846t4gj2h','127.0.0.1',1520907864,'__ci_last_regenerate|i:1520907864;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('bn3l86103gvnnuq9i62idfpervc7c2hq','127.0.0.1',1520909819,'__ci_last_regenerate|i:1520909819;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('c0b54g1fgt79vurm4durkf5kuhj4bv5r','127.0.0.1',1520936939,'__ci_last_regenerate|i:1520936802;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('dtpt8j02u5f6kmukl50addlukm5elnjr','127.0.0.1',1520910338,'__ci_last_regenerate|i:1520910338;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('ecl0n605ni9o6vhq1olsl9dbi78eb2f8','127.0.0.1',1520910910,'__ci_last_regenerate|i:1520910910;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('qep7l6igkevfag3nvj98gtuv562tcbvd','127.0.0.1',1520911121,'__ci_last_regenerate|i:1520910910;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('srjq0v4p2frdbtfcvdq3ca9ke8b7ajqo','127.0.0.1',1520906929,'__ci_last_regenerate|i:1520906929;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;');

UNLOCK TABLES;

/*Table structure for table `lean_coluna` */

DROP TABLE IF EXISTS `lean_coluna`;

CREATE TABLE `lean_coluna` (
  `coluna_id` int(11) NOT NULL AUTO_INCREMENT,
  `tabela_ref_id` int(11) NOT NULL,
  `coluna` varchar(255) NOT NULL,
  `display` varchar(255) NOT NULL,
  `PK` enum('Sim','Nao') NOT NULL DEFAULT 'Nao',
  `FK` enum('Sim','Nao') NOT NULL DEFAULT 'Nao',
  `data_type` enum('char','varchar','tinytext','text','mediumtext','longtext','binary','varbinary','bit','tinyint','smallint','mediumint','int','bigint','decimal','dec','numeric','fixed','float','double','double precision','real','float','bool','boolean','date','datetime','timestamp','time','year','tinyblob','blob','mediumblob','longtext','enum') NOT NULL DEFAULT 'varchar',
  `length` varchar(255) DEFAULT NULL,
  `not_null` enum('Sim','Nao') NOT NULL DEFAULT 'Nao',
  `auto_incr` enum('Sim','Nao') NOT NULL DEFAULT 'Nao',
  `comment` varchar(2000) DEFAULT NULL,
  `default` varchar(255) DEFAULT NULL,
  `show_grid` enum('Sim','Nao') DEFAULT 'Nao',
  PRIMARY KEY (`coluna_id`),
  KEY `FK_lean_coluna_tabela_ref_id` (`tabela_ref_id`),
  CONSTRAINT `FK_lean_coluna_tabela_ref_id` FOREIGN KEY (`tabela_ref_id`) REFERENCES `lean_tabela` (`tabela_id`),
  CONSTRAINT `fk_tabela_coluna` FOREIGN KEY (`tabela_ref_id`) REFERENCES `lean_tabela` (`tabela_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `lean_coluna` */

LOCK TABLES `lean_coluna` WRITE;

insert  into `lean_coluna`(`coluna_id`,`tabela_ref_id`,`coluna`,`display`,`PK`,`FK`,`data_type`,`length`,`not_null`,`auto_incr`,`comment`,`default`,`show_grid`) values (1,1,'user_id','Id Usuário','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(2,1,'username','Nome do Usuário','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(3,1,'email','E-mail','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(4,1,'password','Senha','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Nao'),(5,1,'avatar','Foto do Perfil','Nao','Nao','varchar','255','Nao','Nao',NULL,'default.jpg','Nao'),(6,1,'created_at','Data de Criação','Nao','Nao','datetime',NULL,'Nao','Nao',NULL,NULL,'Sim'),(7,1,'updated_at','Data de Alteração','Nao','Nao','datetime',NULL,'Nao','Nao',NULL,NULL,'Sim'),(9,1,'is_confirmed','Usuário Confirmado','Nao','Nao','tinyint','1','Nao','Nao',NULL,'0','Sim'),(10,1,'is_deleted','Conta canelada','Nao','Nao','tinyint','1','Nao','Nao',NULL,'0','Sim'),(11,1,'group_user_ref_id','Grupo de Usuário','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(12,2,'id','Id Sessão','Sim','Nao','varchar','40','Sim','Nao',NULL,NULL,'Sim'),(13,2,'ip_address','Endereço de IP','Nao','Nao','varchar','45','Sim','Nao',NULL,NULL,'Sim'),(14,2,'timestamp','TimesTamp','Nao','Nao','int','10','Sim','Nao',NULL,'0','Sim'),(15,2,'data','Dados','Nao','Nao','blob',NULL,'Sim','Nao',NULL,NULL,'Sim'),(16,3,'group_user_id','Id Grupo Usuário','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(17,3,'groupname','Nome do Grupo de Usuário','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(18,3,'user_type','Tipo de Usuário','Nao','Nao','enum','\'Adm\',\'User\'','Sim','Nao',NULL,NULL,'Sim'),(19,4,'tabela_id','Id Tabela','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(20,4,'tabela','Nome da Tabela','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(21,4,'display','Nome de Apresentação','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(22,4,'group_user_ref_id','Grupo de Usuario','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Nao'),(23,4,'slug','Slug','Nao','Nao','varchar','128','Nao','Nao',NULL,NULL,'Sim'),(24,5,'coluna_id','Id Coluna','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(25,5,'tabela_ref_id','Id Tabela Ref','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(26,5,'coluna','Nome da Coluna','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(27,5,'display','Nome de Apresentação','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(28,5,'PK','Chave Primária','Nao','Nao','enum','\'Sim\',\'Nao\'','Sim','Nao',NULL,NULL,'Sim'),(29,5,'FK','Chave Relacional','Nao','Nao','enum','\'Sim\',\'Nao\'','Sim','Nao',NULL,NULL,'Sim'),(30,5,'data_type','Tipo de Dados','Nao','Nao','enum','\'char\',\'varchar\',\'tinytext\',\'text\',\'mediumtext\',\'longtext\',\'binary\',\'varbinary\',\'bit\',\'tinyint\',\'smallint\',\'mediumint\',\'int\',\'bigint\',\'decimal\',\'dec\',\'numeric\',\'fixed\',\'float\',\'double\',\'double precision\',\'real\',\'float\',\'bool\',\'boolean\',\'date\',\'datetime\',\'','Sim','Nao',NULL,NULL,'Sim'),(31,5,'length','Tamanho','Nao','Nao','varchar','255','Nao','Nao',NULL,NULL,'Sim'),(32,5,'not_null','Campo obrigatório','Nao','Nao','enum','\'Sim\',\'Nao\'','Sim','Nao',NULL,NULL,'Sim'),(33,5,'auto_incr','Auto Incrementa','Nao','Nao','enum','\'Sim\',\'Nao\'','Sim','Nao',NULL,NULL,'Nao'),(34,5,'comment','Comentário','Nao','Nao','varchar','2000','Nao','Nao',NULL,NULL,'Nao'),(35,5,'\'default\'','Valor Inicial','Nao','Nao','varchar','255','Nao','Nao',NULL,NULL,'Sim'),(36,5,'show_grid','Mostra na Gride','Nao','Nao','enum','\'Sim\',\'Nao\'','Nao','Nao',NULL,NULL,'Sim'),(37,6,'lean_menu_id','Id lean_menu','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(38,6,'nome_menu','Nome do Menu','Nao','Nao','varchar','80','Sim','Nao',NULL,NULL,'Sim'),(39,6,'menu_titulo','Título do Menu','Nao','Nao','varchar','80','Nao','Nao',NULL,NULL,'Sim'),(40,7,'lean_submenu_id','Id lean_submenu','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(41,7,'nome_submenu','Sub Menu','Nao','Nao','varchar','80','Sim','Nao',NULL,NULL,'Sim'),(42,7,'tabela_id','Nome da Tabela','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(43,7,'lean_menu_id','Meu Principal','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(44,7,'slug','Link','Nao','Nao','varchar','128','Nao','Nao',NULL,NULL,'Sim'),(45,6,'group_user_ref_id','Grupo de Usuário','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(48,6,'tag_i','Icone','Nao','Nao','varchar','50','Nao','Nao',NULL,NULL,'Nao');

UNLOCK TABLES;

/*Table structure for table `lean_foreignkey` */

DROP TABLE IF EXISTS `lean_foreignkey`;

CREATE TABLE `lean_foreignkey` (
  `foreignkey_id` int(11) NOT NULL AUTO_INCREMENT,
  `coluna_ref_id` int(11) NOT NULL,
  `tabela_fk_id` int(11) NOT NULL,
  `coluna_fk_id` int(11) NOT NULL,
  `coluna_display_fk_id` int(11) NOT NULL,
  `tabela_pai` enum('Sim','Nao') NOT NULL,
  PRIMARY KEY (`foreignkey_id`),
  KEY `fk_foreignkey_coluna_ref` (`coluna_ref_id`),
  KEY `fk_foreignkey_tabela_fk` (`tabela_fk_id`),
  KEY `fk_foreignkey_coluna_fk` (`coluna_fk_id`),
  CONSTRAINT `fk_foreignkey_coluna_fk` FOREIGN KEY (`coluna_fk_id`) REFERENCES `lean_coluna` (`coluna_id`),
  CONSTRAINT `fk_foreignkey_coluna_ref` FOREIGN KEY (`coluna_ref_id`) REFERENCES `lean_coluna` (`coluna_id`),
  CONSTRAINT `fk_foreignkey_tabela_fk` FOREIGN KEY (`tabela_fk_id`) REFERENCES `lean_tabela` (`tabela_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `lean_foreignkey` */

LOCK TABLES `lean_foreignkey` WRITE;

insert  into `lean_foreignkey`(`foreignkey_id`,`coluna_ref_id`,`tabela_fk_id`,`coluna_fk_id`,`coluna_display_fk_id`,`tabela_pai`) values (1,18,3,16,17,'Nao'),(2,25,4,19,21,'Sim'),(3,42,4,19,21,'Nao'),(4,43,6,37,38,'Sim'),(5,45,3,16,17,'Nao');

UNLOCK TABLES;

/*Table structure for table `lean_group_users` */

DROP TABLE IF EXISTS `lean_group_users`;

CREATE TABLE `lean_group_users` (
  `group_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  `user_type` enum('Adm','User') NOT NULL,
  PRIMARY KEY (`group_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lean_group_users` */

LOCK TABLES `lean_group_users` WRITE;

insert  into `lean_group_users`(`group_user_id`,`groupname`,`user_type`) values (1,'Grupo de Administradores','Adm'),(2,'Grupo de Usuário','User');

UNLOCK TABLES;

/*Table structure for table `lean_log_script` */

DROP TABLE IF EXISTS `lean_log_script`;

CREATE TABLE `lean_log_script` (
  `log_script_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Erro','Debug','Info') NOT NULL,
  `mensagem` varchar(2000) NOT NULL,
  `data_log` datetime NOT NULL,
  `tabela_id` int(11) NOT NULL,
  `comando_sql` varchar(2000) NOT NULL,
  PRIMARY KEY (`log_script_id`),
  KEY `fk_tabela_log_script` (`tabela_id`),
  CONSTRAINT `fk_tabela_log_script` FOREIGN KEY (`tabela_id`) REFERENCES `lean_tabela` (`tabela_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lean_log_script` */

LOCK TABLES `lean_log_script` WRITE;

UNLOCK TABLES;

/*Table structure for table `lean_menu` */

DROP TABLE IF EXISTS `lean_menu`;

CREATE TABLE `lean_menu` (
  `lean_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_menu` varchar(80) NOT NULL,
  `menu_titulo` varchar(80) DEFAULT NULL,
  `group_user_ref_id` int(11) NOT NULL,
  `tag_i` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lean_menu_id`),
  KEY `FK_lean_menu_group_user_id` (`group_user_ref_id`),
  CONSTRAINT `FK_lean_menu_group_user_id` FOREIGN KEY (`group_user_ref_id`) REFERENCES `lean_group_users` (`group_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `lean_menu` */

LOCK TABLES `lean_menu` WRITE;

insert  into `lean_menu`(`lean_menu_id`,`nome_menu`,`menu_titulo`,`group_user_ref_id`,`tag_i`) values (2,'Dashboard','Administrador',1,'ti-home');

UNLOCK TABLES;

/*Table structure for table `lean_submenu` */

DROP TABLE IF EXISTS `lean_submenu`;

CREATE TABLE `lean_submenu` (
  `lean_submenu_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_submenu` varchar(80) NOT NULL,
  `tabela_id` int(11) NOT NULL,
  `lean_menu_id` int(11) NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`lean_submenu_id`),
  KEY `FK_lean_submenu_tabela_id` (`tabela_id`),
  KEY `FK_lean_submenu_lean_menu_id` (`lean_menu_id`),
  CONSTRAINT `FK_lean_submenu_lean_menu_id` FOREIGN KEY (`lean_menu_id`) REFERENCES `lean_menu` (`lean_menu_id`),
  CONSTRAINT `FK_lean_submenu_tabela_id` FOREIGN KEY (`tabela_id`) REFERENCES `lean_tabela` (`tabela_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `lean_submenu` */

LOCK TABLES `lean_submenu` WRITE;

insert  into `lean_submenu`(`lean_submenu_id`,`nome_submenu`,`tabela_id`,`lean_menu_id`,`slug`) values (1,'Cadastro de Tabelas',4,2,'lean_tabela'),(2,'Grupo de Usuários',3,2,NULL),(3,'Usuários',1,2,NULL),(4,'Menu Principal',6,2,NULL),(5,'Sessão',2,2,NULL);

UNLOCK TABLES;

/*Table structure for table `lean_tabela` */

DROP TABLE IF EXISTS `lean_tabela`;

CREATE TABLE `lean_tabela` (
  `tabela_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id da tabela',
  `tabela` varchar(128) NOT NULL COMMENT 'nome da tabela',
  `display` varchar(128) NOT NULL COMMENT 'nome que vai representar a tabela',
  `slug` varchar(128) NOT NULL COMMENT 'link',
  `group_user_ref_id` int(11) NOT NULL,
  PRIMARY KEY (`tabela_id`),
  KEY `fk_tabela_group_user` (`group_user_ref_id`),
  CONSTRAINT `fk_tabela_group_user` FOREIGN KEY (`group_user_ref_id`) REFERENCES `lean_group_users` (`group_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `lean_tabela` */

LOCK TABLES `lean_tabela` WRITE;

insert  into `lean_tabela`(`tabela_id`,`tabela`,`display`,`slug`,`group_user_ref_id`) values (1,'lean_users','Usuários','lean_users',1),(2,'ci_sessions','Sessões','sessions',1),(3,'lean_group_users','Grupo de Usuários','cad_lean_group_users',1),(4,'lean_tabela','Cadastro de Tabela','lean_tabela',1),(5,'lean_coluna','Cadastro de Colunas','lean_coluna',1),(6,'lean_menu','Menu Principal','',1),(7,'lean_submenu','Sub Menu','',1);

UNLOCK TABLES;

/*Table structure for table `lean_users` */

DROP TABLE IF EXISTS `lean_users`;

CREATE TABLE `lean_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) DEFAULT 'default.jpg',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `group_user_ref_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_users_group_user` (`group_user_ref_id`),
  CONSTRAINT `fk_users_group_user` FOREIGN KEY (`group_user_ref_id`) REFERENCES `lean_group_users` (`group_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lean_users` */

LOCK TABLES `lean_users` WRITE;

insert  into `lean_users`(`user_id`,`username`,`email`,`password`,`avatar`,`created_at`,`updated_at`,`is_confirmed`,`is_deleted`,`group_user_ref_id`) values (1,'root','root@root.com','$2y$10$d9Tu3ZNtvfEcucQBF6Y9EegDFuqbkpUeXxn1UtZns1g0ZwMF2bSqi','default.jpg','2018-01-01 00:00:00',NULL,1,0,1);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
