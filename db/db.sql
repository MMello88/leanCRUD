/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.5-10.1.31-MariaDB : Database - leancrud_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`leancrud_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `leancrud_db`;

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

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('0coibr7ak1dbrmhl7sji5uhmv9egjvu6','::1',1523301958,'__ci_last_regenerate|i:1523301958;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('13gbj8nkmr6sho56mhms89ns360miu7i','::1',1522857311,'__ci_last_regenerate|i:1522857311;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('1nn6ofs1m2feg7qq4lu1q4gt1jdcjaas','::1',1523040163,'__ci_last_regenerate|i:1523040163;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('2l69kgaim3ubs04v82o7dl6trml7m4m8','::1',1522702219,'__ci_last_regenerate|i:1522702219;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('33j18p3q76v5fsekfldaeahiiklg2ti5','::1',1523100235,'__ci_last_regenerate|i:1523100235;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('3banhb359pj7n48nsa3fcntj2oejomks','::1',1523273533,'__ci_last_regenerate|i:1523273397;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('3cci05bmehgjtrb614rql5tf9i9s2it1','::1',1522953310,'__ci_last_regenerate|i:1522953310;user_id|i:2;username|s:7:\"Matheus\";logged_in|b:1;is_confirmed|b:0;group_user_ref_id|i:3;'),('46650s150h3djhsssg5uchssnamgc4c5','::1',1523359952,'__ci_last_regenerate|i:1523359934;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('4hfo9ot4l3oj4g04c65pihtohas3jpm0','::1',1522959745,'__ci_last_regenerate|i:1522959745;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('5b0icg1s1tt8qni2e9t1i0cv88oq88i7','::1',1522858569,'__ci_last_regenerate|i:1522858569;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('5i61qouiikvnctes4pra427e1unil6uc','::1',1523041267,'__ci_last_regenerate|i:1523041267;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('60ru2ntu01qjc3vghe27an7jnc9n54na','::1',1522859316,'__ci_last_regenerate|i:1522859316;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('613iv5sab54fn6i3uondkjl9udtc5e4b','::1',1522693009,'__ci_last_regenerate|i:1522693009;user_id|i:3;username|s:5:\"admin\";logged_in|b:1;is_confirmed|b:0;group_user_ref_id|i:3;'),('6ag2vigpaeltj9d958op35dp7kbkh852','::1',1523041352,'__ci_last_regenerate|i:1523041267;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('6gbbc1bv20ijsvgd5960soo746era4u0','::1',1522693537,'__ci_last_regenerate|i:1522693438;user_id|i:3;username|s:5:\"admin\";logged_in|b:1;is_confirmed|b:0;group_user_ref_id|i:3;'),('6nton987mecvedlnk9vmnoifnlu7ua0p','::1',1523380423,'__ci_last_regenerate|i:1523380423;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('6qho45404qp8h52thf5rdetqkh6pjnp0','::1',1523381081,'__ci_last_regenerate|i:1523380423;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('6ti8jgh3hrgps92a471fv533kavqbl0e','::1',1523305203,'__ci_last_regenerate|i:1523305203;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('71lag80aos2biq0grb5ihtetj49ssoea','::1',1523108824,'__ci_last_regenerate|i:1523108792;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('76ntoo9q4d6ioi8qrigv75skq1jo1101','::1',1523100556,'__ci_last_regenerate|i:1523100556;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('7e6jch6nlnlu9i7v1s479olo5ol66nu4','::1',1523359934,'__ci_last_regenerate|i:1523359934;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('865kjt27vtd3igo7uukmtkckq6h3dock','::1',1523019524,'__ci_last_regenerate|i:1523019524;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('8mibfgef27cdl33b0e8j1n3b12d5m31a','::1',1523305318,'__ci_last_regenerate|i:1523305304;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('9kmpfgs70hpb0jaid6cqn5ov19qfl7f0','::1',1523301478,'__ci_last_regenerate|i:1523301478;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('9q28ovlph4m4tn3ostub7qo1ojhigsda','::1',1522945449,'__ci_last_regenerate|i:1522945449;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('9u097c4sjjcjkdk56vi4c003qklc1h64','::1',1523380082,'__ci_last_regenerate|i:1523380081;'),('a89m2u8uopg3s37iuhp77f8kh3t4qcn9','::1',1523272190,'__ci_last_regenerate|i:1523272190;'),('b0ucjuqsu47eq0qvof90m8bjckni2lt9','::1',1523028389,'__ci_last_regenerate|i:1523028389;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('cf2v2lrtfidska875l8gcfodnt6p3s5p','::1',1523023069,'__ci_last_regenerate|i:1523023069;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('dhcker7v2ue3cjdmi3gk7rrv3c6jose2','::1',1522693438,'__ci_last_regenerate|i:1522693438;user_id|i:3;username|s:5:\"admin\";logged_in|b:1;is_confirmed|b:0;group_user_ref_id|i:3;'),('dtd4mtvh9cq34q5qtka3qakjr0fr1oqn','::1',1522859322,'__ci_last_regenerate|i:1522859316;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('e2nm4mgtt7a4n84e4g19m2pevm1k0qol','::1',1523099919,'__ci_last_regenerate|i:1523099919;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('ed9nunlj0vhstef845mtb5m2g89ikm48','::1',1523272543,'__ci_last_regenerate|i:1523272543;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('ef2d08jpr4dcblfloboi8ig8jbmlqhn7','::1',1522959746,'__ci_last_regenerate|i:1522959745;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('ekst2nvqosas8015oqr72klbe370m4eq','::1',1522762107,'__ci_last_regenerate|i:1522762085;user_id|i:2;username|s:7:\"Matheus\";logged_in|b:1;is_confirmed|b:0;group_user_ref_id|i:3;'),('fia0ndu7didbchpo73aspimh0d2haaej','::1',1523019905,'__ci_last_regenerate|i:1523019905;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('gcn7bcpc0fp08bv7s2mbdgi5td806e6i','::1',1523036617,'__ci_last_regenerate|i:1523036617;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('glfk1ks02eue7qae1c48tiqkj3aqa2tl','::1',1522947016,'__ci_last_regenerate|i:1522947016;user_id|i:3;username|s:5:\"admin\";logged_in|b:1;is_confirmed|b:0;group_user_ref_id|i:2;'),('gprg4iueg89qltil8tvcikhjcta7e2b3','::1',1522690023,'__ci_last_regenerate|i:1522690023;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('h5jbmfql5pp1pkicu1hsv11c9f18f68i','::1',1522947929,'__ci_last_regenerate|i:1522947929;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('hg8ag2khbcviemifl90k3s4jr6di867k','::1',1523020648,'__ci_last_regenerate|i:1523020648;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('jomsh5acuhpapiebjbhbrn2mtfrhbf98','::1',1523371119,'__ci_last_regenerate|i:1523371119;'),('l9hqfcgorligvf7u8mgpf78alu6f3sqe','::1',1522691943,'__ci_last_regenerate|i:1522691943;user_id|i:3;username|s:5:\"admin\";logged_in|b:1;is_confirmed|b:0;group_user_ref_id|i:3;'),('mcoruuv9710fum2fvuhc44j96ppklv6p','::1',1523371131,'__ci_last_regenerate|i:1523371119;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('n5uerfs5pud32tl8cj0hkth4ij9ms7ua','::1',1522689505,'__ci_last_regenerate|i:1522689505;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('nqqed3qhgrutaafak6gru9ebcgvk3r5m','::1',1523039857,'__ci_last_regenerate|i:1523039857;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('phletgqp50pud266r46hnmk6n5i4k6fe','::1',1523019217,'__ci_last_regenerate|i:1523019217;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('qah880onptl15ahvkrssrc615i6tdcu6','::1',1523273397,'__ci_last_regenerate|i:1523273397;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('qdktugho0hpb2lb3stn3pgq55go8p388','::1',1522685858,'__ci_last_regenerate|i:1522685858;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('rqmvsu05rf1falscfoni0o8hl2cj348q','::1',1522691262,'__ci_last_regenerate|i:1522691262;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('s3v75aremnphn6nb13g045b3jo51hk3n','::1',1523273091,'__ci_last_regenerate|i:1523273091;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('simhbnho396skq5fdoksl2damrmrg0oa','::1',1522686693,'__ci_last_regenerate|i:1522686693;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('t04jioeg8186en6tdltaa6cbn21ujf08','::1',1522948259,'__ci_last_regenerate|i:1522948259;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('teb8i4b0kffrjnj7qcgprklvdbf93ocs','::1',1522702225,'__ci_last_regenerate|i:1522702219;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('u3mh58ds39g1iu071aeq109r5di1ip58','::1',1523013289,'__ci_last_regenerate|i:1523013289;'),('u46nnv501uhsug8sqor3j4sn8kaposnf','::1',1523034933,'__ci_last_regenerate|i:1523034933;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('u7k5ds9v5jl002kr204jokukjj9g7equ','::1',1522944005,'__ci_last_regenerate|i:1522944005;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('u7uf83f45impiv6cq9pkvsr2t95lh5l8','::1',1523035280,'__ci_last_regenerate|i:1523035280;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('ud0v2guj729o53fp70urdqv6hfkd65ua','::1',1523100573,'__ci_last_regenerate|i:1523100556;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('ukeo1cssojpe6t90cbkbcsrojnhvfm3q','::1',1522944326,'__ci_last_regenerate|i:1522944326;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;'),('uouipbvlpcpjetjqp3kjl2pofg8inofm','::1',1522686270,'__ci_last_regenerate|i:1522686270;user_id|i:1;username|s:4:\"root\";logged_in|b:1;is_confirmed|b:1;group_user_ref_id|i:1;');

/*Table structure for table `lean_coluna` */

DROP TABLE IF EXISTS `lean_coluna`;

CREATE TABLE `lean_coluna` (
  `coluna_id` int(11) NOT NULL AUTO_INCREMENT,
  `tabela_id` int(11) NOT NULL,
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
  KEY `FK_lean_coluna_tabela_ref_id` (`tabela_id`),
  CONSTRAINT `FK_lean_coluna_tabela_ref_id` FOREIGN KEY (`tabela_id`) REFERENCES `lean_tabela` (`tabela_id`),
  CONSTRAINT `fk_tabela_coluna` FOREIGN KEY (`tabela_id`) REFERENCES `lean_tabela` (`tabela_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Data for the table `lean_coluna` */

insert  into `lean_coluna`(`coluna_id`,`tabela_id`,`coluna`,`display`,`PK`,`FK`,`data_type`,`length`,`not_null`,`auto_incr`,`comment`,`default`,`show_grid`) values (1,1,'user_id','Id Usuário','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(2,1,'username','Nome do Usuário','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(3,1,'email','E-mail','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(4,1,'password','Senha','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Nao'),(5,1,'avatar','Foto do Perfil','Nao','Nao','varchar','255','Nao','Nao',NULL,'default.jpg','Nao'),(6,1,'created_at','Data de Criação','Nao','Nao','datetime',NULL,'Nao','Nao',NULL,NULL,'Sim'),(7,1,'updated_at','Data de Alteração','Nao','Nao','datetime',NULL,'Nao','Nao',NULL,NULL,'Sim'),(9,1,'is_confirmed','Usuário Confirmado','Nao','Nao','tinyint','1','Nao','Nao',NULL,'0','Sim'),(10,1,'is_deleted','Conta canelada','Nao','Nao','tinyint','1','Nao','Nao',NULL,'0','Sim'),(11,1,'group_user_ref_id','Grupo de Usuário','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(12,2,'id','Id Sessão','Sim','Nao','varchar','40','Sim','Nao',NULL,NULL,'Sim'),(13,2,'ip_address','Endereço de IP','Nao','Nao','varchar','45','Sim','Nao',NULL,NULL,'Sim'),(14,2,'timestamp','TimesTamp','Nao','Nao','int','10','Sim','Nao',NULL,'0','Sim'),(15,2,'data','Dados','Nao','Nao','blob',NULL,'Sim','Nao',NULL,NULL,'Sim'),(16,3,'group_user_id','Id Grupo Usuário','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(17,3,'groupname','Nome do Grupo de Usuário','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(18,3,'user_type','Tipo de Usuário','Nao','Nao','enum','\'root\',\'Adm\',\'User\'','Sim','Nao',NULL,NULL,'Sim'),(19,4,'tabela_id','Id Tabela','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(20,4,'tabela','Nome da Tabela','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(21,4,'display','Nome de Apresentação','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(22,4,'group_user_ref_id','Grupo de Usuario','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Nao'),(23,4,'slug','Slug','Nao','Nao','varchar','128','Nao','Nao',NULL,NULL,'Sim'),(24,5,'coluna_id','Id Coluna','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(25,5,'tabela_ref_id','Id Tabela Ref','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(26,5,'coluna','Nome da Coluna','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(27,5,'display','Nome de Apresentação','Nao','Nao','varchar','255','Sim','Nao',NULL,NULL,'Sim'),(28,5,'PK','Chave Primária','Nao','Nao','enum','\'Sim\',\'Nao\'','Sim','Nao',NULL,NULL,'Sim'),(29,5,'FK','Chave Relacional','Nao','Nao','enum','\'Sim\',\'Nao\'','Sim','Nao',NULL,NULL,'Sim'),(30,5,'data_type','Tipo de Dados','Nao','Nao','enum','\'char\',\'varchar\',\'tinytext\',\'text\',\'mediumtext\',\'longtext\',\'binary\',\'varbinary\',\'bit\',\'tinyint\',\'smallint\',\'mediumint\',\'int\',\'bigint\',\'decimal\',\'dec\',\'numeric\',\'fixed\',\'float\',\'double\',\'double precision\',\'real\',\'float\',\'bool\',\'boolean\',\'date\',\'datetime\',\'','Sim','Nao',NULL,NULL,'Sim'),(31,5,'length','Tamanho','Nao','Nao','varchar','255','Nao','Nao',NULL,NULL,'Sim'),(32,5,'not_null','Campo obrigatório','Nao','Nao','enum','\'Sim\',\'Nao\'','Sim','Nao',NULL,NULL,'Sim'),(33,5,'auto_incr','Auto Incrementa','Nao','Nao','enum','\'Sim\',\'Nao\'','Sim','Nao',NULL,NULL,'Nao'),(34,5,'comment','Comentário','Nao','Nao','varchar','2000','Nao','Nao',NULL,NULL,'Nao'),(35,5,'\'default\'','Valor Inicial','Nao','Nao','varchar','255','Nao','Nao',NULL,NULL,'Sim'),(36,5,'show_grid','Mostra na Gride','Nao','Nao','enum','\'Sim\',\'Nao\'','Nao','Nao',NULL,NULL,'Sim'),(37,6,'lean_menu_id','Id lean_menu','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(38,6,'nome_menu','Nome do Menu','Nao','Nao','varchar','80','Sim','Nao',NULL,NULL,'Sim'),(39,6,'menu_titulo','Título do Menu','Nao','Nao','varchar','80','Nao','Nao',NULL,NULL,'Sim'),(40,7,'lean_submenu_id','Id lean_submenu','Sim','Nao','int','11','Sim','Sim',NULL,NULL,'Nao'),(41,7,'nome_submenu','Sub Menu','Nao','Nao','varchar','80','Sim','Nao',NULL,NULL,'Sim'),(42,7,'tabela_id','Nome da Tabela','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(43,7,'lean_menu_id','Meu Principal','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(44,7,'slug','Link','Nao','Nao','varchar','128','Nao','Nao',NULL,NULL,'Sim'),(45,6,'group_user_ref_id','Grupo de Usuário','Nao','Sim','int','11','Sim','Nao',NULL,NULL,'Sim'),(48,6,'tag_i','Icone','Nao','Nao','varchar','50','Nao','Nao',NULL,NULL,'Nao'),(49,4,'dm_filtrar_usuario','Filtrar por Código do Usuário','Nao','Nao','enum','\'Sim\',\'Nao\'','Sim','Nao',NULL,'Nao','Sim');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `lean_foreignkey` */

insert  into `lean_foreignkey`(`foreignkey_id`,`coluna_ref_id`,`tabela_fk_id`,`coluna_fk_id`,`coluna_display_fk_id`,`tabela_pai`) values (1,18,3,16,17,'Nao'),(2,25,4,19,21,'Sim'),(3,42,4,19,21,'Nao'),(4,43,6,37,38,'Sim'),(5,45,3,16,17,'Nao');

/*Table structure for table `lean_group_users` */

DROP TABLE IF EXISTS `lean_group_users`;

CREATE TABLE `lean_group_users` (
  `group_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  `user_type` enum('root','Adm','User') NOT NULL,
  PRIMARY KEY (`group_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `lean_group_users` */

insert  into `lean_group_users`(`group_user_id`,`groupname`,`user_type`) values (1,'Gerenciador','root'),(2,'Administrador','Adm'),(3,'Usuário','User');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `lean_menu` */

insert  into `lean_menu`(`lean_menu_id`,`nome_menu`,`menu_titulo`,`group_user_ref_id`,`tag_i`) values (2,'Dashboard','Administrador',1,'ti-home');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `lean_submenu` */

insert  into `lean_submenu`(`lean_submenu_id`,`nome_submenu`,`tabela_id`,`lean_menu_id`,`slug`) values (1,'Cadastro de Tabelas',4,2,'lean_tabela'),(2,'Grupo de Usuários',3,2,NULL),(3,'Usuários',1,2,NULL),(4,'Menu Principal',6,2,NULL),(5,'Sessão',2,2,NULL);

/*Table structure for table `lean_tabela` */

DROP TABLE IF EXISTS `lean_tabela`;

CREATE TABLE `lean_tabela` (
  `tabela_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id da tabela',
  `tabela` varchar(128) NOT NULL COMMENT 'nome da tabela',
  `display` varchar(128) NOT NULL COMMENT 'nome que vai representar a tabela',
  `slug` varchar(128) NOT NULL COMMENT 'link',
  `group_user_ref_id` int(11) NOT NULL,
  `dm_filtrar_usuario` enum('Sim','Nao') NOT NULL DEFAULT 'Nao',
  PRIMARY KEY (`tabela_id`),
  KEY `fk_tabela_group_user` (`group_user_ref_id`),
  CONSTRAINT `fk_tabela_group_user` FOREIGN KEY (`group_user_ref_id`) REFERENCES `lean_group_users` (`group_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `lean_tabela` */

insert  into `lean_tabela`(`tabela_id`,`tabela`,`display`,`slug`,`group_user_ref_id`,`dm_filtrar_usuario`) values (1,'lean_users','Usuários','lean_users',1,'Nao'),(2,'ci_sessions','Sessões','sessions',1,'Nao'),(3,'lean_group_users','Grupo de Usuários','cad_lean_group_users',1,'Nao'),(4,'lean_tabela','Cadastro de Tabela','lean_tabela',1,'Nao'),(5,'lean_coluna','Cadastro de Colunas','lean_coluna',1,'Nao'),(6,'lean_menu','Menu Principal','',1,'Nao'),(7,'lean_submenu','Sub Menu','',1,'Nao');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `lean_users` */

insert  into `lean_users`(`user_id`,`username`,`email`,`password`,`avatar`,`created_at`,`updated_at`,`is_confirmed`,`is_deleted`,`group_user_ref_id`) values (1,'root','root@root.com','$2y$10$d9Tu3ZNtvfEcucQBF6Y9EegDFuqbkpUeXxn1UtZns1g0ZwMF2bSqi','default.jpg','2018-01-01 00:00:00',NULL,1,0,1),(2,'Matheus','matheus.gnu@gmail.com','$2y$10$6hZzeKHviMOMO1tDzGkSgOcUrURm9P2..QucA/N5fF/ZklzVBTLrG','default.jpg','2018-04-02 17:41:56',NULL,0,0,3),(3,'admin','admin@admin.com','$2y$10$qEsIfTuc2XS7IUo2Q8uRYOHOuy9cH0gt.W50A0s2dR2uVLN.ahkA2','default.jpg','2018-04-02 19:50:06',NULL,0,0,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
