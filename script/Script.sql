-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 15-Mar-2018 às 22:04
-- Versão do servidor: 10.1.9-MariaDB-log
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leancrud_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('6e73b8f3r76h9048heuql501jgf985h8', '127.0.0.1', 1520908167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303930383136373b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('9en723mi50d4nekns11v0kbi2mfdfrbg', '127.0.0.1', 1520907532, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303930373533323b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('a1md3flvljn9qhait9b6siujim8hu1ka', '127.0.0.1', 1520936802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303933363830323b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('aojgh4ci4n9r7ra408r6lvv846t4gj2h', '127.0.0.1', 1520907864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303930373836343b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('bn3l86103gvnnuq9i62idfpervc7c2hq', '127.0.0.1', 1520909819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303930393831393b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('c0b54g1fgt79vurm4durkf5kuhj4bv5r', '127.0.0.1', 1520936939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303933363830323b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('dfjcju56g90u686kha1t3nc2v005rqdr', '192.168.1.45', 1521146644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532313134363336363b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('dtpt8j02u5f6kmukl50addlukm5elnjr', '127.0.0.1', 1520910338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303931303333383b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('ecl0n605ni9o6vhq1olsl9dbi78eb2f8', '127.0.0.1', 1520910910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303931303931303b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('mugsu9uv27ehots9m53gh8i0juo5h1il', '::1', 1521146366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532313134363336353b),
('qep7l6igkevfag3nvj98gtuv562tcbvd', '127.0.0.1', 1520911121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303931303931303b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b),
('srjq0v4p2frdbtfcvdq3ca9ke8b7ajqo', '127.0.0.1', 1520906929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532303930363932393b757365725f69647c693a313b757365726e616d657c733a343a22726f6f74223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b67726f75705f757365725f7265665f69647c693a313b);

-- --------------------------------------------------------

--
-- Estrutura da tabela `lean_coluna`
--

CREATE TABLE `lean_coluna` (
  `coluna_id` int(11) NOT NULL,
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
  `show_grid` enum('Sim','Nao') DEFAULT 'Nao'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lean_coluna`
--

INSERT INTO `lean_coluna` (`coluna_id`, `tabela_id`, `coluna`, `display`, `PK`, `FK`, `data_type`, `length`, `not_null`, `auto_incr`, `comment`, `default`, `show_grid`) VALUES
(1, 1, 'user_id', 'Id Usuário', 'Sim', 'Nao', 'int', '11', 'Sim', 'Sim', NULL, NULL, 'Nao'),
(2, 1, 'username', 'Nome do Usuário', 'Nao', 'Nao', 'varchar', '255', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(3, 1, 'email', 'E-mail', 'Nao', 'Nao', 'varchar', '255', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(4, 1, 'password', 'Senha', 'Nao', 'Nao', 'varchar', '255', 'Sim', 'Nao', NULL, NULL, 'Nao'),
(5, 1, 'avatar', 'Foto do Perfil', 'Nao', 'Nao', 'varchar', '255', 'Nao', 'Nao', NULL, 'default.jpg', 'Nao'),
(6, 1, 'created_at', 'Data de Criação', 'Nao', 'Nao', 'datetime', NULL, 'Nao', 'Nao', NULL, NULL, 'Sim'),
(7, 1, 'updated_at', 'Data de Alteração', 'Nao', 'Nao', 'datetime', NULL, 'Nao', 'Nao', NULL, NULL, 'Sim'),
(9, 1, 'is_confirmed', 'Usuário Confirmado', 'Nao', 'Nao', 'tinyint', '1', 'Nao', 'Nao', NULL, '0', 'Sim'),
(10, 1, 'is_deleted', 'Conta canelada', 'Nao', 'Nao', 'tinyint', '1', 'Nao', 'Nao', NULL, '0', 'Sim'),
(11, 1, 'group_user_ref_id', 'Grupo de Usuário', 'Nao', 'Sim', 'int', '11', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(12, 2, 'id', 'Id Sessão', 'Sim', 'Nao', 'varchar', '40', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(13, 2, 'ip_address', 'Endereço de IP', 'Nao', 'Nao', 'varchar', '45', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(14, 2, 'timestamp', 'TimesTamp', 'Nao', 'Nao', 'int', '10', 'Sim', 'Nao', NULL, '0', 'Sim'),
(15, 2, 'data', 'Dados', 'Nao', 'Nao', 'blob', NULL, 'Sim', 'Nao', NULL, NULL, 'Sim'),
(16, 3, 'group_user_id', 'Id Grupo Usuário', 'Sim', 'Nao', 'int', '11', 'Sim', 'Sim', NULL, NULL, 'Nao'),
(17, 3, 'groupname', 'Nome do Grupo de Usuário', 'Nao', 'Nao', 'varchar', '255', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(18, 3, 'user_type', 'Tipo de Usuário', 'Nao', 'Nao', 'enum', '''Adm'',''User''', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(19, 4, 'tabela_id', 'Id Tabela', 'Sim', 'Nao', 'int', '11', 'Sim', 'Sim', NULL, NULL, 'Nao'),
(20, 4, 'tabela', 'Nome da Tabela', 'Nao', 'Nao', 'varchar', '255', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(21, 4, 'display', 'Nome de Apresentação', 'Nao', 'Nao', 'varchar', '255', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(22, 4, 'group_user_ref_id', 'Grupo de Usuario', 'Nao', 'Sim', 'int', '11', 'Sim', 'Nao', NULL, NULL, 'Nao'),
(23, 4, 'slug', 'Slug', 'Nao', 'Nao', 'varchar', '128', 'Nao', 'Nao', NULL, NULL, 'Sim'),
(24, 5, 'coluna_id', 'Id Coluna', 'Sim', 'Nao', 'int', '11', 'Sim', 'Sim', NULL, NULL, 'Nao'),
(25, 5, 'tabela_id', 'Id Tabela Ref', 'Nao', 'Sim', 'int', '11', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(26, 5, 'coluna', 'Nome da Coluna', 'Nao', 'Nao', 'varchar', '255', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(27, 5, 'display', 'Nome de Apresentação', 'Nao', 'Nao', 'varchar', '255', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(28, 5, 'PK', 'Chave Primária', 'Nao', 'Nao', 'enum', '''Sim'',''Nao''', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(29, 5, 'FK', 'Chave Relacional', 'Nao', 'Nao', 'enum', '''Sim'',''Nao''', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(30, 5, 'data_type', 'Tipo de Dados', 'Nao', 'Nao', 'enum', '''char'',''varchar'',''tinytext'',''text'',''mediumtext'',''longtext'',''binary'',''varbinary'',''bit'',''tinyint'',''smallint'',''mediumint'',''int'',''bigint'',''decimal'',''dec'',''numeric'',''fixed'',''float'',''double'',''double precision'',''real'',''float'',''bool'',''boolean'',''date'',''datetime'',''', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(31, 5, 'length', 'Tamanho', 'Nao', 'Nao', 'varchar', '255', 'Nao', 'Nao', NULL, NULL, 'Sim'),
(32, 5, 'not_null', 'Campo obrigatório', 'Nao', 'Nao', 'enum', '''Sim'',''Nao''', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(33, 5, 'auto_incr', 'Auto Incrementa', 'Nao', 'Nao', 'enum', '''Sim'',''Nao''', 'Sim', 'Nao', NULL, NULL, 'Nao'),
(34, 5, 'comment', 'Comentário', 'Nao', 'Nao', 'varchar', '2000', 'Nao', 'Nao', NULL, NULL, 'Nao'),
(35, 5, '''default''', 'Valor Inicial', 'Nao', 'Nao', 'varchar', '255', 'Nao', 'Nao', NULL, NULL, 'Sim'),
(36, 5, 'show_grid', 'Mostra na Gride', 'Nao', 'Nao', 'enum', '''Sim'',''Nao''', 'Nao', 'Nao', NULL, NULL, 'Sim'),
(37, 6, 'lean_menu_id', 'Id lean_menu', 'Sim', 'Nao', 'int', '11', 'Sim', 'Sim', NULL, NULL, 'Nao'),
(38, 6, 'nome_menu', 'Nome do Menu', 'Nao', 'Nao', 'varchar', '80', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(39, 6, 'menu_titulo', 'Título do Menu', 'Nao', 'Nao', 'varchar', '80', 'Nao', 'Nao', NULL, NULL, 'Sim'),
(40, 7, 'lean_submenu_id', 'Id lean_submenu', 'Sim', 'Nao', 'int', '11', 'Sim', 'Sim', NULL, NULL, 'Nao'),
(41, 7, 'nome_submenu', 'Sub Menu', 'Nao', 'Nao', 'varchar', '80', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(42, 7, 'tabela_id', 'Nome da Tabela', 'Nao', 'Sim', 'int', '11', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(43, 7, 'lean_menu_id', 'Meu Principal', 'Nao', 'Sim', 'int', '11', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(44, 7, 'slug', 'Link', 'Nao', 'Nao', 'varchar', '128', 'Nao', 'Nao', NULL, NULL, 'Sim'),
(45, 6, 'group_user_ref_id', 'Grupo de Usuário', 'Nao', 'Sim', 'int', '11', 'Sim', 'Nao', NULL, NULL, 'Sim'),
(48, 6, 'tag_i', 'Icone', 'Nao', 'Nao', 'varchar', '50', 'Nao', 'Nao', NULL, NULL, 'Nao'),
(49, 4, 'dm_filtrar_usuario', 'Filtrar por Código do Usuário', 'Nao', 'Nao', 'enum', '''Sim'',''Nao''', 'Sim', 'Nao', NULL, 'Nao', 'Sim');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lean_foreignkey`
--

CREATE TABLE `lean_foreignkey` (
  `foreignkey_id` int(11) NOT NULL,
  `coluna_ref_id` int(11) NOT NULL,
  `tabela_fk_id` int(11) NOT NULL,
  `coluna_fk_id` int(11) NOT NULL,
  `coluna_display_fk_id` int(11) NOT NULL,
  `tabela_pai` enum('Sim','Nao') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lean_foreignkey`
--

INSERT INTO `lean_foreignkey` (`foreignkey_id`, `coluna_ref_id`, `tabela_fk_id`, `coluna_fk_id`, `coluna_display_fk_id`, `tabela_pai`) VALUES
(1, 18, 3, 16, 17, 'Nao'),
(2, 25, 4, 19, 21, 'Sim'),
(3, 42, 4, 19, 21, 'Nao'),
(4, 43, 6, 37, 38, 'Sim'),
(5, 45, 3, 16, 17, 'Nao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lean_group_users`
--

CREATE TABLE `lean_group_users` (
  `group_user_id` int(11) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `user_type` enum('Adm','User') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lean_group_users`
--

INSERT INTO `lean_group_users` (`group_user_id`, `groupname`, `user_type`) VALUES
(1, 'Grupo de Administradores', 'Adm'),
(2, 'Grupo de Usuário', 'User');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lean_log_script`
--

CREATE TABLE `lean_log_script` (
  `log_script_id` int(11) NOT NULL,
  `tipo` enum('Erro','Debug','Info') NOT NULL,
  `mensagem` varchar(2000) NOT NULL,
  `data_log` datetime NOT NULL,
  `tabela_id` int(11) NOT NULL,
  `comando_sql` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lean_menu`
--

CREATE TABLE `lean_menu` (
  `lean_menu_id` int(11) NOT NULL,
  `nome_menu` varchar(80) NOT NULL,
  `menu_titulo` varchar(80) DEFAULT NULL,
  `group_user_ref_id` int(11) NOT NULL,
  `tag_i` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lean_menu`
--

INSERT INTO `lean_menu` (`lean_menu_id`, `nome_menu`, `menu_titulo`, `group_user_ref_id`, `tag_i`) VALUES
(2, 'Dashboard', 'Administrador', 1, 'ti-home');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lean_submenu`
--

CREATE TABLE `lean_submenu` (
  `lean_submenu_id` int(11) NOT NULL,
  `nome_submenu` varchar(80) NOT NULL,
  `tabela_id` int(11) NOT NULL,
  `lean_menu_id` int(11) NOT NULL,
  `slug` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lean_submenu`
--

INSERT INTO `lean_submenu` (`lean_submenu_id`, `nome_submenu`, `tabela_id`, `lean_menu_id`, `slug`) VALUES
(1, 'Cadastro de Tabelas', 4, 2, 'lean_tabela'),
(2, 'Grupo de Usuários', 3, 2, NULL),
(3, 'Usuários', 1, 2, NULL),
(4, 'Menu Principal', 6, 2, NULL),
(5, 'Sessão', 2, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `lean_tabela`
--

CREATE TABLE `lean_tabela` (
  `tabela_id` int(11) NOT NULL COMMENT 'id da tabela',
  `tabela` varchar(128) NOT NULL COMMENT 'nome da tabela',
  `display` varchar(128) NOT NULL COMMENT 'nome que vai representar a tabela',
  `slug` varchar(128) NOT NULL COMMENT 'link',
  `group_user_ref_id` int(11) NOT NULL,
  `dm_filtrar_usuario` enum('Sim','Nao') NOT NULL DEFAULT 'Nao'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lean_tabela`
--

INSERT INTO `lean_tabela` (`tabela_id`, `tabela`, `display`, `slug`, `group_user_ref_id`, `dm_filtrar_usuario`) VALUES
(1, 'lean_users', 'Usuários', 'lean_users', 1, 'Nao'),
(2, 'ci_sessions', 'Sessões', 'sessions', 1, 'Nao'),
(3, 'lean_group_users', 'Grupo de Usuários', 'cad_lean_group_users', 1, 'Nao'),
(4, 'lean_tabela', 'Cadastro de Tabela', 'lean_tabela', 1, 'Nao'),
(5, 'lean_coluna', 'Cadastro de Colunas', 'lean_coluna', 1, 'Nao'),
(6, 'lean_menu', 'Menu Principal', '', 1, 'Nao'),
(7, 'lean_submenu', 'Sub Menu', '', 1, 'Nao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lean_users`
--

CREATE TABLE `lean_users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) DEFAULT 'default.jpg',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `group_user_ref_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lean_users`
--

INSERT INTO `lean_users` (`user_id`, `username`, `email`, `password`, `avatar`, `created_at`, `updated_at`, `is_confirmed`, `is_deleted`, `group_user_ref_id`) VALUES
(1, 'root', 'root@root.com', '$2y$10$d9Tu3ZNtvfEcucQBF6Y9EegDFuqbkpUeXxn1UtZns1g0ZwMF2bSqi', 'default.jpg', '2018-01-01 00:00:00', NULL, 1, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `lean_coluna`
--
ALTER TABLE `lean_coluna`
  ADD PRIMARY KEY (`coluna_id`),
  ADD KEY `FK_lean_coluna_tabela_id` (`tabela_id`);

--
-- Indexes for table `lean_foreignkey`
--
ALTER TABLE `lean_foreignkey`
  ADD PRIMARY KEY (`foreignkey_id`),
  ADD KEY `fk_foreignkey_coluna_ref` (`coluna_ref_id`),
  ADD KEY `fk_foreignkey_tabela_fk` (`tabela_fk_id`),
  ADD KEY `fk_foreignkey_coluna_fk` (`coluna_fk_id`);

--
-- Indexes for table `lean_group_users`
--
ALTER TABLE `lean_group_users`
  ADD PRIMARY KEY (`group_user_id`);

--
-- Indexes for table `lean_log_script`
--
ALTER TABLE `lean_log_script`
  ADD PRIMARY KEY (`log_script_id`),
  ADD KEY `fk_tabela_log_script` (`tabela_id`);

--
-- Indexes for table `lean_menu`
--
ALTER TABLE `lean_menu`
  ADD PRIMARY KEY (`lean_menu_id`),
  ADD KEY `FK_lean_menu_group_user_id` (`group_user_ref_id`);

--
-- Indexes for table `lean_submenu`
--
ALTER TABLE `lean_submenu`
  ADD PRIMARY KEY (`lean_submenu_id`),
  ADD KEY `FK_lean_submenu_tabela_id` (`tabela_id`),
  ADD KEY `FK_lean_submenu_lean_menu_id` (`lean_menu_id`);

--
-- Indexes for table `lean_tabela`
--
ALTER TABLE `lean_tabela`
  ADD PRIMARY KEY (`tabela_id`),
  ADD KEY `fk_tabela_group_user` (`group_user_ref_id`);

--
-- Indexes for table `lean_users`
--
ALTER TABLE `lean_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_users_group_user` (`group_user_ref_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lean_coluna`
--
ALTER TABLE `lean_coluna`
  MODIFY `coluna_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `lean_foreignkey`
--
ALTER TABLE `lean_foreignkey`
  MODIFY `foreignkey_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `lean_group_users`
--
ALTER TABLE `lean_group_users`
  MODIFY `group_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lean_log_script`
--
ALTER TABLE `lean_log_script`
  MODIFY `log_script_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lean_menu`
--
ALTER TABLE `lean_menu`
  MODIFY `lean_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `lean_submenu`
--
ALTER TABLE `lean_submenu`
  MODIFY `lean_submenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `lean_tabela`
--
ALTER TABLE `lean_tabela`
  MODIFY `tabela_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id da tabela', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `lean_users`
--
ALTER TABLE `lean_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `lean_coluna`
--
ALTER TABLE `lean_coluna`
  ADD CONSTRAINT `FK_lean_coluna_tabela_id` FOREIGN KEY (`tabela_id`) REFERENCES `lean_tabela` (`tabela_id`),
  ADD CONSTRAINT `fk_tabela_coluna` FOREIGN KEY (`tabela_id`) REFERENCES `lean_tabela` (`tabela_id`);

--
-- Limitadores para a tabela `lean_foreignkey`
--
ALTER TABLE `lean_foreignkey`
  ADD CONSTRAINT `fk_foreignkey_coluna_fk` FOREIGN KEY (`coluna_fk_id`) REFERENCES `lean_coluna` (`coluna_id`),
  ADD CONSTRAINT `fk_foreignkey_coluna_ref` FOREIGN KEY (`coluna_ref_id`) REFERENCES `lean_coluna` (`coluna_id`),
  ADD CONSTRAINT `fk_foreignkey_tabela_fk` FOREIGN KEY (`tabela_fk_id`) REFERENCES `lean_tabela` (`tabela_id`);

--
-- Limitadores para a tabela `lean_log_script`
--
ALTER TABLE `lean_log_script`
  ADD CONSTRAINT `fk_tabela_log_script` FOREIGN KEY (`tabela_id`) REFERENCES `lean_tabela` (`tabela_id`);

--
-- Limitadores para a tabela `lean_menu`
--
ALTER TABLE `lean_menu`
  ADD CONSTRAINT `FK_lean_menu_group_user_id` FOREIGN KEY (`group_user_ref_id`) REFERENCES `lean_group_users` (`group_user_id`);

--
-- Limitadores para a tabela `lean_submenu`
--
ALTER TABLE `lean_submenu`
  ADD CONSTRAINT `FK_lean_submenu_lean_menu_id` FOREIGN KEY (`lean_menu_id`) REFERENCES `lean_menu` (`lean_menu_id`),
  ADD CONSTRAINT `FK_lean_submenu_tabela_id` FOREIGN KEY (`tabela_id`) REFERENCES `lean_tabela` (`tabela_id`);

--
-- Limitadores para a tabela `lean_tabela`
--
ALTER TABLE `lean_tabela`
  ADD CONSTRAINT `fk_tabela_group_user` FOREIGN KEY (`group_user_ref_id`) REFERENCES `lean_group_users` (`group_user_id`);

--
-- Limitadores para a tabela `lean_users`
--
ALTER TABLE `lean_users`
  ADD CONSTRAINT `fk_users_group_user` FOREIGN KEY (`group_user_ref_id`) REFERENCES `lean_group_users` (`group_user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
