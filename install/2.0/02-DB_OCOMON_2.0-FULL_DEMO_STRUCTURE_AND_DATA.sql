-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 08/07/2020 às 14:51
-- Versão do servidor: 8.0.18
-- Versão do PHP: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE DATABASE /*!32312 IF NOT EXISTS*/`ocomon_2` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE USER 'ocomon_2'@'localhost' IDENTIFIED BY 'senha_ocomon_mysql';
GRANT SELECT , INSERT , UPDATE , DELETE ON `ocomon_2` . * TO 'ocomon_2'@'localhost';
GRANT Drop ON ocomon_2.* TO 'ocomon_2'@'localhost';
FLUSH PRIVILEGES;

USE `ocomon_2`;

--
-- Banco de dados: `ocomon_2`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `areaxarea_abrechamado`
--

CREATE TABLE `areaxarea_abrechamado` (
  `area` int(4) UNSIGNED NOT NULL COMMENT 'Área para a qual se quer abrir o chamado.',
  `area_abrechamado` int(4) UNSIGNED NOT NULL COMMENT 'Área que pode abrir chamado.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `areaxarea_abrechamado`
--

INSERT INTO `areaxarea_abrechamado` (`area`, `area_abrechamado`) VALUES
(1, 1),
(3, 1),
(4, 1),
(1, 2),
(1, 3),
(3, 3),
(4, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `assentamentos`
--

CREATE TABLE `assentamentos` (
  `numero` int(11) NOT NULL,
  `ocorrencia` int(11) NOT NULL DEFAULT '0',
  `assentamento` text NOT NULL,
  `data` datetime DEFAULT NULL,
  `responsavel` int(4) NOT NULL DEFAULT '0',
  `asset_privated` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_assentamento` int(1) NOT NULL DEFAULT '0' COMMENT 'Tipo do assentamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `assentamentos`
--

INSERT INTO `assentamentos` (`numero`, `ocorrencia`, `assentamento`, `data`, `responsavel`, `asset_privated`, `tipo_assentamento`) VALUES
(1, 1, 'Em atendimento por operador', '2020-07-06 17:25:16', 3, 0, 0),
(2, 1, 'Solicitação de instalação de Software : Telegram', '2020-07-06 17:27:16', 3, 0, 0),
(3, 1, 'Software instalado conforme solicitado.', '2020-07-06 17:27:16', 3, 0, 0),
(4, 1, 'Obrigado pelo excelente atendimento.', '2020-07-06 17:36:38', 2, 0, 0),
(5, 3, 'Em atendimento por operador', '2020-07-06 17:38:29', 3, 0, 0),
(6, 3, 'Ocorrência encaminhada/alterada por operador', '2020-07-06 17:38:52', 3, 0, 0),
(7, 3, 'Ocorrência encaminhada/alterada por operador', '2020-07-06 17:39:26', 3, 0, 0),
(8, 3, 'A impressora estava com papel trancado no rolamento;', '2020-07-06 17:40:47', 3, 0, 0),
(9, 3, 'Foi aberta a tampa principal do equipamento e realizada a retirada do papel. Testes ok.', '2020-07-06 17:40:47', 3, 0, 0),
(10, 2, 'Em atendimento por operador2', '2020-07-06 17:42:31', 4, 0, 0),
(11, 2, 'Solicitação de liberação de porta.', '2020-07-06 17:43:07', 4, 0, 0),
(12, 2, 'Porta liberada no servidor web.', '2020-07-06 17:43:07', 4, 0, 0),
(13, 4, 'Em atendimento por operador', '2020-07-06 20:34:48', 3, 0, 0),
(14, 10, 'Em atendimento por admin', '2020-07-08 14:48:41', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `assistencia`
--

CREATE TABLE `assistencia` (
  `assist_cod` int(4) NOT NULL,
  `assist_desc` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de tipos de assistencia para manutencao';

--
-- Despejando dados para a tabela `assistencia`
--

INSERT INTO `assistencia` (`assist_cod`, `assist_desc`) VALUES
(1, 'Contrato de Manutenção'),
(2, 'Garantia do Fabricante'),
(3, 'Sem Cobertura');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avisos`
--

CREATE TABLE `avisos` (
  `aviso_id` int(11) NOT NULL,
  `avisos` text,
  `data` datetime DEFAULT NULL,
  `origem` int(4) NOT NULL DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `area` int(11) NOT NULL DEFAULT '0',
  `origembkp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `cat_cod` int(4) NOT NULL,
  `cat_desc` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de categoria de softwares';

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`cat_cod`, `cat_desc`) VALUES
(1, 'Escritório'),
(2, 'Browser'),
(3, 'Editor'),
(4, 'Visualizador'),
(5, 'Jogos'),
(6, 'Sistema Operacional'),
(7, 'Antivírus'),
(8, 'E-mail'),
(9, 'Desenvolvimento'),
(10, 'Utilitários'),
(11, 'Compactador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoriaxproblema_sistemas`
--

CREATE TABLE `categoriaxproblema_sistemas` (
  `prob_id` int(11) NOT NULL DEFAULT '0',
  `ctps_id` int(11) NOT NULL DEFAULT '0',
  `ctps_id_old` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cat_problema_sistemas`
--

CREATE TABLE `cat_problema_sistemas` (
  `ctps_id` int(10) NOT NULL DEFAULT '0',
  `ctps_descricao` varchar(100) NOT NULL DEFAULT '',
  `ctps_peso` decimal(10,2) NOT NULL DEFAULT '1.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ccusto`
--

CREATE TABLE `ccusto` (
  `codigo` int(4) NOT NULL,
  `codccusto` varchar(6) NOT NULL DEFAULT '',
  `descricao` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de Centros de Custo';

--
-- Despejando dados para a tabela `ccusto`
--

INSERT INTO `ccusto` (`codigo`, `codccusto`, `descricao`) VALUES
(1, '001', 'Default');

-- --------------------------------------------------------

--
-- Estrutura para tabela `config`
--

CREATE TABLE `config` (
  `conf_cod` int(4) NOT NULL,
  `conf_sql_user` varchar(20) NOT NULL DEFAULT 'ocomon',
  `conf_sql_passwd` varchar(50) DEFAULT NULL,
  `conf_sql_server` varchar(40) NOT NULL DEFAULT 'localhost',
  `conf_sql_db` varchar(40) NOT NULL DEFAULT 'ocomon',
  `conf_db_ccusto` varchar(40) NOT NULL DEFAULT 'ocomon',
  `conf_tb_ccusto` varchar(40) NOT NULL DEFAULT 'CCUSTO',
  `conf_ccusto_id` varchar(20) NOT NULL DEFAULT 'codigo',
  `conf_ccusto_desc` varchar(20) NOT NULL DEFAULT 'descricao',
  `conf_ccusto_cod` varchar(20) NOT NULL DEFAULT 'codccusto',
  `conf_ocomon_site` varchar(100) NOT NULL DEFAULT 'http://localhost/ocomon/',
  `conf_inst_terceira` int(4) NOT NULL DEFAULT '-1',
  `conf_log_path` varchar(50) NOT NULL DEFAULT '../../includes/logs/',
  `conf_logo_path` varchar(50) NOT NULL DEFAULT '../../includes/logos',
  `conf_icons_path` varchar(50) NOT NULL DEFAULT '../../includes/icons/',
  `conf_help_icon` varchar(50) NOT NULL DEFAULT '../../includes/icons/solucoes2.png',
  `conf_help_path` varchar(50) NOT NULL DEFAULT '../../includes/help/',
  `conf_language` varchar(15) NOT NULL DEFAULT 'pt_BR.php',
  `conf_auth_type` varchar(30) NOT NULL DEFAULT 'SYSTEM',
  `conf_upld_size` int(10) NOT NULL DEFAULT '307200',
  `conf_upld_width` int(5) NOT NULL DEFAULT '800',
  `conf_upld_height` int(5) NOT NULL DEFAULT '600',
  `conf_formatBar` varchar(40) DEFAULT '%%mural%',
  `conf_page_size` int(3) NOT NULL DEFAULT '50',
  `conf_prob_tipo_1` varchar(30) NOT NULL DEFAULT 'Categoria 1',
  `conf_prob_tipo_2` varchar(30) NOT NULL DEFAULT 'Categoria 2',
  `conf_prob_tipo_3` varchar(30) NOT NULL DEFAULT 'Categoria 3',
  `conf_allow_change_theme` int(1) NOT NULL DEFAULT '0',
  `conf_upld_file_types` varchar(30) NOT NULL DEFAULT '%%IMG%',
  `conf_date_format` varchar(20) NOT NULL DEFAULT '%d/%m/%Y %H:%M:%S',
  `conf_days_bf` int(3) NOT NULL DEFAULT '30',
  `conf_wrty_area` int(4) NOT NULL DEFAULT '1',
  `conf_allow_reopen` tinyint(1) NOT NULL DEFAULT '1',
  `conf_allow_date_edit` tinyint(1) NOT NULL DEFAULT '0',
  `conf_schedule_status` int(4) NOT NULL DEFAULT '1',
  `conf_schedule_status_2` int(4) NOT NULL DEFAULT '1',
  `conf_foward_when_open` int(4) NOT NULL DEFAULT '1',
  `conf_desc_sla_out` int(1) NOT NULL DEFAULT '0',
  `conf_qtd_max_anexos` int(2) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de configurações diversas do sistema';

--
-- Despejando dados para a tabela `config`
--

INSERT INTO `config` (`conf_cod`, `conf_sql_user`, `conf_sql_passwd`, `conf_sql_server`, `conf_sql_db`, `conf_db_ccusto`, `conf_tb_ccusto`, `conf_ccusto_id`, `conf_ccusto_desc`, `conf_ccusto_cod`, `conf_ocomon_site`, `conf_inst_terceira`, `conf_log_path`, `conf_logo_path`, `conf_icons_path`, `conf_help_icon`, `conf_help_path`, `conf_language`, `conf_auth_type`, `conf_upld_size`, `conf_upld_width`, `conf_upld_height`, `conf_formatBar`, `conf_page_size`, `conf_prob_tipo_1`, `conf_prob_tipo_2`, `conf_prob_tipo_3`, `conf_allow_change_theme`, `conf_upld_file_types`, `conf_date_format`, `conf_days_bf`, `conf_wrty_area`, `conf_allow_reopen`, `conf_allow_date_edit`, `conf_schedule_status`, `conf_schedule_status_2`, `conf_foward_when_open`, `conf_desc_sla_out`, `conf_qtd_max_anexos`) VALUES
(1, 'ocomon', NULL, 'localhost', 'ocomon', 'ocomon', 'CCUSTO', 'codigo', 'descricao', 'codccusto', 'http://localhost/ocomon_2.0/', -1, '../../includes/logs/', '../../includes/logos', '../../includes/icons/', '../../includes/icons/solucoes2.png', '../../includes/help/', 'pt_BR.php', 'SYSTEM', 307200, 800, 600, '%%mural%', 50, 'Tipo de Manutenção', 'Origem do Problema', 'Nível de Atendimento', 0, '%%IMG%PDF%NMSO%', '%d/%m/%Y %H:%M:%S', 30, 1, 1, 0, 1, 1, 1, 0, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `configusercall`
--

CREATE TABLE `configusercall` (
  `conf_cod` int(4) NOT NULL,
  `conf_name` varchar(50) DEFAULT 'Default',
  `conf_user_opencall` int(1) NOT NULL DEFAULT '0',
  `conf_custom_areas` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `conf_ownarea` int(4) NOT NULL DEFAULT '1',
  `conf_ownarea_2` varchar(200) DEFAULT NULL,
  `conf_opentoarea` int(4) NOT NULL DEFAULT '1',
  `conf_scr_area` int(1) NOT NULL DEFAULT '1',
  `conf_scr_prob` int(1) NOT NULL DEFAULT '1',
  `conf_scr_desc` int(1) NOT NULL DEFAULT '1',
  `conf_scr_unit` int(1) NOT NULL DEFAULT '1',
  `conf_scr_tag` int(1) NOT NULL DEFAULT '1',
  `conf_scr_chktag` int(1) NOT NULL DEFAULT '1',
  `conf_scr_chkhist` int(1) NOT NULL DEFAULT '1',
  `conf_scr_contact` int(1) NOT NULL DEFAULT '1',
  `conf_scr_fone` int(1) NOT NULL DEFAULT '1',
  `conf_scr_local` int(1) NOT NULL DEFAULT '1',
  `conf_scr_btloadlocal` int(1) NOT NULL DEFAULT '1',
  `conf_scr_searchbylocal` int(1) NOT NULL DEFAULT '1',
  `conf_scr_operator` int(1) NOT NULL DEFAULT '1',
  `conf_scr_date` int(1) NOT NULL DEFAULT '1',
  `conf_scr_status` int(1) NOT NULL DEFAULT '1',
  `conf_scr_replicate` int(1) NOT NULL DEFAULT '1',
  `conf_scr_mail` int(1) NOT NULL DEFAULT '1',
  `conf_scr_msg` text NOT NULL,
  `conf_scr_upload` int(1) NOT NULL DEFAULT '0',
  `conf_scr_schedule` tinyint(1) NOT NULL DEFAULT '0',
  `conf_scr_foward` tinyint(1) NOT NULL DEFAULT '0',
  `conf_scr_prior` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela de configuração para usuários de somente abertura de chamados';

--
-- Despejando dados para a tabela `configusercall`
--

INSERT INTO `configusercall` (`conf_cod`, `conf_name`, `conf_user_opencall`, `conf_custom_areas`, `conf_ownarea`, `conf_ownarea_2`, `conf_opentoarea`, `conf_scr_area`, `conf_scr_prob`, `conf_scr_desc`, `conf_scr_unit`, `conf_scr_tag`, `conf_scr_chktag`, `conf_scr_chkhist`, `conf_scr_contact`, `conf_scr_fone`, `conf_scr_local`, `conf_scr_btloadlocal`, `conf_scr_searchbylocal`, `conf_scr_operator`, `conf_scr_date`, `conf_scr_status`, `conf_scr_replicate`, `conf_scr_mail`, `conf_scr_msg`, `conf_scr_upload`, `conf_scr_schedule`, `conf_scr_foward`, `conf_scr_prior`) VALUES
(1, 'Default', 0, '2', 2, '2', 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 'Seu chamado foi aberto com sucesso no sistema de ocorrências! O número é %numero%. Aguarde o atendimento pela equipe de suporte.', 0, 0, 0, 1),
(2, 'Campos Padrão', 1, NULL, 1, '2', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 'Seu chamado foi aberto com sucesso no sistema de ocorrências! O número é %numero%. Aguarde o atendimento pela equipe de suporte.', 1, 1, 1, 1),
(3, 'Campos mínimos', 1, NULL, 1, '2', 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 'Seu chamado foi aberto com sucesso no sistema de ocorrências! O número é %numero%. Aguarde o atendimento pela equipe de suporte.', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contatos`
--

CREATE TABLE `contatos` (
  `contact_id` int(5) NOT NULL,
  `contact_login` varchar(15) NOT NULL,
  `contact_name` varchar(40) NOT NULL,
  `contact_email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de Contatos';

-- --------------------------------------------------------

--
-- Estrutura para tabela `doc_time`
--

CREATE TABLE `doc_time` (
  `doc_id` int(6) NOT NULL,
  `doc_oco` int(6) NOT NULL,
  `doc_open` int(10) NOT NULL DEFAULT '0',
  `doc_edit` int(10) NOT NULL DEFAULT '0',
  `doc_close` int(10) NOT NULL DEFAULT '0',
  `doc_user` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela para armazenar o tempo de documentacao de cada chamado';

--
-- Despejando dados para a tabela `doc_time`
--

INSERT INTO `doc_time` (`doc_id`, `doc_oco`, `doc_open`, `doc_edit`, `doc_close`, `doc_user`) VALUES
(1, 1, 0, 0, 0, 2),
(2, 1, 0, 0, 0, 3),
(3, 2, 0, 0, 0, 3),
(4, 3, 0, 0, 0, 2),
(5, 3, 0, 0, 0, 3),
(6, 2, 0, 0, 0, 4),
(7, 4, 0, 0, 0, 5),
(8, 4, 0, 0, 0, 3),
(9, 5, 0, 0, 0, 3),
(10, 6, 0, 0, 0, 1),
(11, 7, 0, 0, 0, 1),
(12, 8, 0, 0, 0, 3),
(13, 9, 0, 0, 0, 3),
(14, 10, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `dominios`
--

CREATE TABLE `dominios` (
  `dom_cod` int(4) NOT NULL,
  `dom_desc` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de Domínios de Rede';

--
-- Despejando dados para a tabela `dominios`
--

INSERT INTO `dominios` (`dom_cod`, `dom_desc`) VALUES
(1, 'ARQUIVOS');

-- --------------------------------------------------------

--
-- Estrutura para tabela `email_warranty`
--

CREATE TABLE `email_warranty` (
  `ew_id` int(6) NOT NULL,
  `ew_piece_type` int(1) NOT NULL DEFAULT '0',
  `ew_piece_id` int(6) NOT NULL,
  `ew_sent_first_alert` tinyint(1) NOT NULL DEFAULT '0',
  `ew_sent_last_alert` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de controle para envio de email sobre prazo de garantias';

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `empr_id` int(11) NOT NULL,
  `material` text NOT NULL,
  `responsavel` int(4) NOT NULL DEFAULT '0',
  `data_empr` datetime DEFAULT NULL,
  `data_devol` datetime DEFAULT NULL,
  `quem` varchar(100) DEFAULT NULL,
  `local` varchar(100) DEFAULT NULL,
  `ramal` varchar(20) DEFAULT NULL,
  `responsavelbkp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamentos`
--

CREATE TABLE `equipamentos` (
  `comp_cod` int(4) UNSIGNED NOT NULL,
  `comp_inv` int(6) NOT NULL DEFAULT '0',
  `comp_sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comp_marca` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `comp_mb` int(4) DEFAULT NULL,
  `comp_proc` int(4) UNSIGNED DEFAULT NULL,
  `comp_memo` int(4) UNSIGNED DEFAULT NULL,
  `comp_video` int(4) UNSIGNED DEFAULT NULL,
  `comp_som` int(4) UNSIGNED DEFAULT NULL,
  `comp_rede` int(4) UNSIGNED DEFAULT NULL,
  `comp_modelohd` int(4) UNSIGNED DEFAULT NULL,
  `comp_modem` int(4) UNSIGNED DEFAULT NULL,
  `comp_cdrom` int(4) UNSIGNED DEFAULT NULL,
  `comp_dvd` int(4) UNSIGNED DEFAULT NULL,
  `comp_grav` int(4) UNSIGNED DEFAULT NULL,
  `comp_nome` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comp_local` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `comp_fornecedor` int(4) DEFAULT NULL,
  `comp_nf` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comp_coment` text,
  `comp_data` datetime DEFAULT NULL,
  `comp_valor` float DEFAULT NULL,
  `comp_data_compra` datetime DEFAULT NULL,
  `comp_inst` int(4) NOT NULL DEFAULT '0',
  `comp_ccusto` int(6) DEFAULT NULL,
  `comp_tipo_equip` int(4) NOT NULL DEFAULT '0',
  `comp_tipo_imp` int(4) DEFAULT NULL,
  `comp_resolucao` int(4) DEFAULT NULL,
  `comp_polegada` int(4) DEFAULT NULL,
  `comp_fab` int(4) NOT NULL DEFAULT '0',
  `comp_situac` int(4) DEFAULT NULL,
  `comp_reitoria` int(4) DEFAULT NULL,
  `comp_tipo_garant` int(4) DEFAULT NULL,
  `comp_garant_meses` int(4) DEFAULT NULL,
  `comp_assist` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela principal modulo de inventario de computadores';

--
-- Despejando dados para a tabela `equipamentos`
--

INSERT INTO `equipamentos` (`comp_cod`, `comp_inv`, `comp_sn`, `comp_marca`, `comp_mb`, `comp_proc`, `comp_memo`, `comp_video`, `comp_som`, `comp_rede`, `comp_modelohd`, `comp_modem`, `comp_cdrom`, `comp_dvd`, `comp_grav`, `comp_nome`, `comp_local`, `comp_fornecedor`, `comp_nf`, `comp_coment`, `comp_data`, `comp_valor`, `comp_data_compra`, `comp_inst`, `comp_ccusto`, `comp_tipo_equip`, `comp_tipo_imp`, `comp_resolucao`, `comp_polegada`, `comp_fab`, `comp_situac`, `comp_reitoria`, `comp_tipo_garant`, `comp_garant_meses`, `comp_assist`) VALUES
(1, 1, '12345', 1, NULL, 2, 3, 4, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'COMPUTADOR_01', 3, 1, '001', 'Notebook do departamento de Contar a pagar', '2020-07-05 16:51:56', 3500, '2019-06-16 00:00:00', 1, 1, 2, -1, NULL, NULL, 2, 1, NULL, 2, 3, NULL),
(2, 2, '12345678', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 3, 1, '001', 'Impressora do departamento de contas a pagar', '2020-07-05 16:54:04', 890, '2019-06-16 16:54:04', 1, 1, 3, 3, NULL, NULL, 7, 1, NULL, 2, 1, NULL),
(3, 3, '', 2, NULL, 13, 12, 7, NULL, 9, 1, NULL, NULL, NULL, NULL, 'COMPUTADOR_02', 1, 1, '1234', '', '2020-07-05 16:57:20', 4200, '2020-01-01 16:57:20', 1, 1, 1, NULL, NULL, NULL, 3, 1, NULL, 2, 3, NULL),
(4, 5, '345345', 1, NULL, 2, 3, 4, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'COMPUTADOR_03', 4, 1, '1234', 'Notebook do Diretor', '2020-07-05 17:15:21', 3500, '2019-06-16 17:15:21', 1, 1, 2, NULL, NULL, NULL, 2, 1, NULL, 2, 3, NULL),
(5, 7, '34535290', 2, NULL, 6, 12, 7, NULL, NULL, 8, NULL, NULL, NULL, NULL, 'COMPUTADOR_7', 4, NULL, '', '', '2020-07-06 17:00:13', 0, '2018-01-20 00:00:00', 1, 1, 1, -1, NULL, NULL, 3, 3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipxpieces`
--

CREATE TABLE `equipxpieces` (
  `eqp_id` int(4) NOT NULL,
  `eqp_equip_inv` int(6) NOT NULL,
  `eqp_equip_inst` int(4) NOT NULL,
  `eqp_piece_id` int(6) NOT NULL,
  `eqp_piece_modelo_id` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de associacao de equipamentos com componentes';

--
-- Despejando dados para a tabela `equipxpieces`
--

INSERT INTO `equipxpieces` (`eqp_id`, `eqp_equip_inv`, `eqp_equip_inst`, `eqp_piece_id`, `eqp_piece_modelo_id`) VALUES
(1, 1, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `estoq_cod` int(4) NOT NULL,
  `estoq_tipo` int(4) NOT NULL DEFAULT '0',
  `estoq_desc` int(4) NOT NULL DEFAULT '0',
  `estoq_sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `estoq_local` int(4) NOT NULL DEFAULT '0',
  `estoq_comentario` varchar(250) DEFAULT NULL,
  `estoq_tag_inv` int(6) DEFAULT NULL,
  `estoq_tag_inst` int(6) DEFAULT NULL,
  `estoq_nf` varchar(255) DEFAULT NULL,
  `estoq_warranty` int(3) DEFAULT NULL,
  `estoq_value` float DEFAULT NULL,
  `estoq_situac` int(2) DEFAULT NULL,
  `estoq_data_compra` date DEFAULT NULL,
  `estoq_ccusto` int(6) DEFAULT NULL,
  `estoq_vendor` int(6) DEFAULT NULL,
  `estoq_partnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de estoque de itens.';

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`estoq_cod`, `estoq_tipo`, `estoq_desc`, `estoq_sn`, `estoq_local`, `estoq_comentario`, `estoq_tag_inv`, `estoq_tag_inst`, `estoq_nf`, `estoq_warranty`, `estoq_value`, `estoq_situac`, `estoq_data_compra`, `estoq_ccusto`, `estoq_vendor`, `estoq_partnumber`) VALUES
(2, 12, 5, '12345', 3, 'Vinculado ao equipamento 1', 4, 1, '1234', 1, 560, 1, '2019-06-06', 1, 1, '35645656');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fabricantes`
--

CREATE TABLE `fabricantes` (
  `fab_cod` int(4) NOT NULL,
  `fab_nome` varchar(30) NOT NULL DEFAULT '',
  `fab_tipo` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de fabricantes de equipamentos do Invmon';

--
-- Despejando dados para a tabela `fabricantes`
--

INSERT INTO `fabricantes` (`fab_cod`, `fab_nome`, `fab_tipo`) VALUES
(1, 'Default', 3),
(2, 'Acer', 1),
(3, 'Dell', 3),
(4, 'Asus', 3),
(5, 'Apple', 3),
(6, 'Intel', 1),
(7, 'Epson', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `feriados`
--

CREATE TABLE `feriados` (
  `cod_feriado` int(4) NOT NULL,
  `data_feriado` datetime DEFAULT NULL,
  `desc_feriado` varchar(40) DEFAULT NULL,
  `fixo_feriado` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de feriados';

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `forn_cod` int(4) NOT NULL,
  `forn_nome` varchar(30) NOT NULL DEFAULT '',
  `forn_fone` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de fornecedores de equipamentos';

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`forn_cod`, `forn_nome`, `forn_fone`) VALUES
(1, 'Default', '0800-00-00-00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `global_tickets`
--

CREATE TABLE `global_tickets` (
  `gt_ticket` int(6) NOT NULL,
  `gt_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela para permitir acesso global as ocorrencias';

--
-- Despejando dados para a tabela `global_tickets`
--

INSERT INTO `global_tickets` (`gt_ticket`, `gt_id`) VALUES
(10, '17534134941773313027629533'),
(8, '20228926217396227255206192'),
(3, '22513040137682895621410957'),
(7, '227178163194218197112116169277'),
(1, '229129290286214168120107186287'),
(9, '23526619476155157812810263'),
(4, '25012517525321331710916391'),
(6, '290282195235525628724536286'),
(5, '412221281441961421072288148'),
(2, '9915219924222615321521232177');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

CREATE TABLE `historico` (
  `hist_cod` int(4) NOT NULL,
  `hist_inv` int(6) NOT NULL DEFAULT '0',
  `hist_inst` int(4) NOT NULL DEFAULT '0',
  `hist_local` int(4) NOT NULL DEFAULT '0',
  `hist_data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de controle de histórico de locais por onde o equipam';

--
-- Despejando dados para a tabela `historico`
--

INSERT INTO `historico` (`hist_cod`, `hist_inv`, `hist_inst`, `hist_local`, `hist_data`) VALUES
(1, 1, 1, 3, '2020-07-05 16:51:56'),
(2, 2, 1, 3, '2020-07-05 16:54:04'),
(3, 3, 1, 1, '2020-07-05 16:57:20'),
(4, 5, 1, 4, '2020-07-05 17:10:34'),
(5, 5, 1, 4, '2020-07-05 17:15:21'),
(6, 7, 1, 4, '2020-07-06 16:36:41'),
(7, 7, 1, 4, '2020-07-06 16:52:31'),
(8, 7, 1, 4, '2020-07-06 16:57:10'),
(9, 7, 1, 4, '2020-07-06 17:00:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hist_pieces`
--

CREATE TABLE `hist_pieces` (
  `hp_id` int(6) NOT NULL,
  `hp_piece_id` int(6) NOT NULL,
  `hp_piece_local` int(4) DEFAULT NULL,
  `hp_comp_inv` int(6) DEFAULT NULL,
  `hp_comp_inst` int(4) DEFAULT NULL,
  `hp_uid` int(6) NOT NULL,
  `hp_date` datetime NOT NULL,
  `hp_technician` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de histórico de movimentacões de peças avulsas';

--
-- Despejando dados para a tabela `hist_pieces`
--

INSERT INTO `hist_pieces` (`hp_id`, `hp_piece_id`, `hp_piece_local`, `hp_comp_inv`, `hp_comp_inst`, `hp_uid`, `hp_date`, `hp_technician`) VALUES
(1, 2, 3, 1, 1, 1, '2020-07-05 17:03:35', NULL),
(2, 4, 5, NULL, NULL, 1, '2020-07-06 08:25:40', NULL),
(3, 3, 5, NULL, NULL, 1, '2020-07-06 08:32:45', 1),
(4, 3, 5, NULL, NULL, 1, '2020-07-06 08:33:09', 1),
(5, 4, 5, NULL, NULL, 1, '2020-07-06 08:33:32', 1),
(6, 4, 5, NULL, NULL, 1, '2020-07-06 08:46:04', 1),
(7, 5, 5, NULL, NULL, 1, '2020-07-06 09:05:54', NULL),
(8, 6, 5, NULL, NULL, 1, '2020-07-06 09:06:57', NULL),
(9, 7, 5, NULL, NULL, 1, '2020-07-06 09:07:42', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `hw_alter`
--

CREATE TABLE `hw_alter` (
  `hwa_cod` int(4) NOT NULL,
  `hwa_inst` int(4) NOT NULL,
  `hwa_inv` int(6) NOT NULL,
  `hwa_item` int(4) NOT NULL,
  `hwa_user` int(4) NOT NULL,
  `hwa_data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela para armazenar alteracoes de hw';

-- --------------------------------------------------------

--
-- Estrutura para tabela `hw_sw`
--

CREATE TABLE `hw_sw` (
  `hws_cod` int(4) NOT NULL,
  `hws_sw_cod` int(4) NOT NULL DEFAULT '0',
  `hws_hw_cod` int(4) NOT NULL DEFAULT '0',
  `hws_hw_inst` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de relacionamentos entre equipamentos e softwares';

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens`
--

CREATE TABLE `imagens` (
  `img_cod` int(4) NOT NULL,
  `img_oco` int(4) DEFAULT NULL,
  `img_inst` int(4) DEFAULT NULL,
  `img_inv` int(6) DEFAULT NULL,
  `img_model` int(4) DEFAULT NULL,
  `img_nome` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_tipo` varchar(20) NOT NULL,
  `img_bin` longblob NOT NULL,
  `img_largura` int(4) DEFAULT NULL,
  `img_altura` int(4) DEFAULT NULL,
  `img_size` bigint(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de imagens anexas aos chamados';

--
-- Despejando dados para a tabela `imagens`
--

INSERT INTO `imagens` (`img_cod`, `img_oco`, `img_inst`, `img_inv`, `img_model`, `img_nome`, `img_tipo`, `img_bin`, `img_largura`, `img_altura`, `img_size`) VALUES
(1, NULL, NULL, NULL, 1, 'notebook-Acer-aspire-5-A515-52G-50NT-com-SSD-128-GB-de-fábrica.jpg', 'image/jpeg', 0xffd8ffe000104a46494600010100000100010000ffdb0043000604040504040605050506060607090e0909080809120d0d0a0e1512161615121414171a211c17181f1914141d271d1f2223252525161c292c28242b21242524ffdb00430106060609080911090911241814182424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424ffc2001108015402d003011100021101031101ffc4001d000001040301010000000000000000000000020304050106070809ffc4001b01010101010101010100000000000000000001020304050607ffda000c03010002100310000000f54800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000092391aa311c611aa45a0f16795bc2c000824732060c99300060c9803260c0c0c560c000e44d000306000c0180300003e5a00000000000000000000000921912a2118884723ea46238c00b1c1ca74707c912c92613f2b58700d3cf2774881420c1903036451249326004091020c14717140d8081220498218914284081224c1808f5f66f64800000000000c104acaad2bcaf21590aa210c8e669c87070729c1c8729c1c1e850e0f0e538383a3b2c82613f2ba859ca2bcd5b8d0830a018405000bac8a850912a9131823e593036206c686867440d89c9bd1224c88303280e1e94cdf4d40000000000703dce7540f8e8e8e0e0f0e0e8e4394ec394e4394f4394e43b4e0ec2c7070707296382870912cb2c32be8e595e59dc872ac7d5b415d323c8ab5eb24ee49ab6887724d679e9b9a6308e43868466b28c110afd2b59abb20800000000013cf5657a660000000000396ee715ac0e0e8e0b1d1c1c1c1e87072950f5390e53a383a3838390e0e0e0b1ca58a162c7a5945965a51e5bda1c2094a847cc9b3e3747bcec2d3f79efbe8f3eb97a4765c6abf3a39f46f9ea1f3d54a322f2424723130ea5acec763034006b06be5c91c74a636d3ca84fd3d5b1e988000000000086716e939b8e0e0e0e0e0b1c1c1c143c390e0e8e0ed390e0e5383d0e0e0a1c162e9428c8e0e8fcba39e73b21ca80163b9aa2d1aadf571e81e8e36fe7e949d79f42ebe567d1e699e6f66b7c3d31f976c73d53cdd3f3ae98ce6311084742d67d2366cc72c3a80b03c88799cefc5017c7023e981f33c9fa9ead97d3100000000000148709e93561d162858e0e0e0e0b1c8707074707070747870729c87050e0b162a9664050e1a39c1258cac86494b537fdc46f3cab5362fa1e6d9fcfd11ebf0f4699de786e14bae73f4ebd8eb438e94dcf6ef1eb233308d1592d7d9b2b3ea3dcda0f361e8f1c01060c9e0e2f4e067d1f3e7013f53d5b2fa6200000000000034bae1db956382c50e0e0e0b1c163b0e0e0e0e0e0e0e8e0e0e5383d0a162cc99146683269271495b5862c4b4f673b209efcf4de5d2cbd399fcfa49efc3ab79fa4eb2cf9e8c6b4e6a83281946238dcd4b880cc3b2f2cee3ac6d34d0900000003060f9de4ed4f5757a6314000000000000396ee721a8e2c7058e0a1c163838390e0e5390e0e0ba721d1c1da705c6458b32640051a41c4154ad8eb4e5cccebcf7bf3f4e6735435b1cad539da6eb8b612dae35b7736a34c91e1b223354d2621335d4df9cef86eafeecdffc3ebcebf41c369f95d32681f778da70d6fbf03bebfefe73395b3f2ef9afe9bccc93ebd5acfa6268000000000000239c5f739bd02c7058a1e14382c58e438382858e0e0e0f938983646ac8a3319140069671c6903c6476a1f5e4f78fd1174a14b2cf49de7f7584d48f5fcf7b16ee6fa430ff006e5a9f2eac4441aca311f588765387837b27e7baf25fd779a87ae7a1fe5fd173e4d376f15fd9f8faff00e47d5c87f5de5911d4bf29e96f6d23ee71d7fdb89f5ead3d310000000000000015070de934e322c50f0e0a16382c50e0b87058a1c2c8ba582991a1ba70c99146400d30e4535331a8d49cd83ac3bbcada639eb32b3a3bc7bc9bcf7f5da315ae5ddcefe7beebca87976888da55ad58d5c412bd2becdd7f1de9e35fb3f26f3f96f4732fd2f9faefe3fd6e65c3bf6fe3ec1f90f5734fd4f9fadfe3fd517a66a3db9aff0046740fbbc6769eae99f4c4d0000000000000006a55c3f78a069c162c707050e0a142c58e42a962c543c323c38394e8b142cc801a71cbb1d24c42a469b22ea9ceed9653e2c6d462cc73d6ff00355eb2b1bb75bbb8de4d1b48372d108a988244b9afb2a92d3e1f5a7f44b6f95bd17ee71de3e1f6677393fea7cdb37837b77c6ed5deac49e5a95c6e83fa1e14fe8cceb3d5c7a6250000000000000000e676722e8810a32382c7050a142850e0b1719162850a162e9c1c142cc801a79cfb1d26c3440c75d837cd78dcc669e21f7cedbd39ec1e7e9171abac6f5acf4da6e29aeae758a3d62674e6de77539b5b9d339cd26d59655a5195bacd5d914000eca28ddcd38dd8e527322769ead8f4cc000000000000000036719dce714c0a322c50b162850a162cc8b150b322c599174a163864051a61a3e3a5cc2cd21760c36bd178b4f557d26f3a9d82f1e558ed73e7ed55cf7d0fa72a5db5a39cfa7cb7fdfcbbbf9bd5adf3ed579b4f2c12b52beca5d2a59aba8a8001bd9e8634b37639896c79d09da7a9a3d410000000000000000015a70de934da4c28c99166458b322c50a142c599858a1428556458a1464d3cd3b1d2f0c9a513b79e8de7ed5f7347a43d4dcba73e9f991ba4e59e0f5f6392a74dafa72e4fcfa72fefc6f6cddb975a3aa59aa919661a535954d52ea57dc368001b393cb735a36939a8c13b4f5347a82000000000000000000357ae23bc6b8d064519322cc8a322cc8e0b322c542cc8b322eb228c99356357e5e997ae4a35bd663635bde351f4ab6abf58b9d63abf93d161d79724e5e8bbc573a73ea3e8f3f278d00b49b9f9372d7b55f730d3050374dacc06625cb6800000000013abd587a6a000000000000000000039c59c93a29e1228c8a3264c8b166458a162cc8b322cd86106008e3e69a6a58f4ec70ceb9a48b9bbd248b8e4f7553cf52e3a6e373f734c95ccdc6e5bef1ace652951155d31b16372d6b9226a6336974a920d90d86c00000000009d5eadaf4ce400000000000000000001c6f7398e9160001464599322c58a14285991664b788e34580e8e95650e3adf4e9191cb97d2b274bfbcf95c53e6f40e5d905bdc6bfa8cabc4ad4e67be34dbce73764cf5bce1eca9e9e6a9df28645582b57642488cb681b27d0f9db2fabc52e139a8962de874e3ae70f5ebbf2fe9cdaf569e9a8000000000000000041188b4c9075392d6934dc0064c8a0142850b162859916386e91832462949651141cfadce3d78bc64a33ac56922ce7d0ee6d9ea5de37b143453d2e9835c634675e899e526dd5efa9333077e78ccc0b6b52091598a8d81d57ee7e77dadf23eee73ad5faf2adebcae7975a85f347d7f87c8be07e8e6d7ab4f4d4000000000000432b6cafb22dacd390e8e0e15672ab9d55ac1900146050b32382c50a1428985cc47a76165554a296344c74a0e5daeb59be6a46b9a91c4d1c513cdff001a9934d90ea94708773a0ef33ae366e5d28f7e886e51188895f50c8a43662a360759fb3f03dc7f1fef54fabc945eaf2b99d43ebcadfe5fd5f267d5f8dc6be37dd9b5eabaf4e640000000c94b652d54d56dca0747874747da747e1d1e35739a694509014064c8a142850b1664599322c5181406b6729e7d63f3dec171b4696d4f442d4aecdb1caccdb736335069354ace09b354ed68dd7cd333d18be97220b8c4bc61b5108acc4222360755fb1f13da5f2bec55fbbe7d77a3845d636ef9ff0046b38fa3caff0053e3714f8df766d7ab0f4dc00000055d71fde21981c1c1d1e1e1f1d1f1d1e69e1711ce795abd574000645019322cc8b162858b32036471c280e778d46e7d32596f3b116444b933a86bb79798a9a87acb34821cafad29aede505b7af44b10a2ad8ae01b48647120761fb9f9bf5d7c7fd023d7e481d394fe7d312e3cdeaf2b7d6f8bc4be27df9b5eab3d3900000018359351dca4b948c081c1c1e1e1c126b66b8d6ae6b4493a2b35374cc000028c99142858b1403634383e5c1726bf1c033634dda557332749f95d4d482297d8b65a96949a7198651cd459625902e254db36d74945735111ec5c36302000eadf67e0fb17e57daa1fa1f3f1648c747f1a6b877f327d3f93c53e27de9b67aad7d390000000001546a366b5bca46c6c6c9073539b4d401459108769f8eb35ad180000326451901b303a4f2e4b035d8d2f2ea5a501c256af341cd4944ccd6cb66a773a6a4fb9d86ea510e6743c6945915247d6653455294f731d123c46cd4589120756fbff009af5f7c5fd054f4e6df6f3b7ac3bc7d7ae66f07fa7f238ff00c3fbf36cf55dbe9cc800000000001a354ad5b52b2e65110c8c9ac9a74d6a6531286cbe3a156ae2848a32036302878bb2e4b03548d072a05eab1db0e98721af1e69044aa91bcd9b3570bb2e14bab1f1b93d38482263504ac6644d377359a916ae71b90d54691af3c58e91a54e36d6f9a000dcfea7c6dd7d5e55bab7e9f991eaf3c5f42a1ad1f9fa353f91f5e6d7aad3d39280000000000000569abd9a0e9c672deb451bf5c8531a7cd686519ba96da54460608c38391b055c17c4f224799f17ae9da8e943e0071aaf256e332ca220b1c1cb66e355ecc8d665e350ec54b0ec6a1bac6a019b32581bcb467373a8de6a4489031588c5998caa6b2895231591eb3d312fa732000000000000000049526a367105e99ac4dd2ca69988e45355279c7e9a251704e36c1e88642362cddd237c1f0000038cd796370103600060c000912240c080147558af201a50c56000c0019100600000c0a147a2f17d370000000000000000000182a8a2b2a744147c7a5962d97a794338e94b52c414a6f91b466ef71bc8f000000001c76bca3b981664af87e920248d191dac0903060446070040d8051181214a188c0e566300364c0a64547a5337d2d0000000000000000000000015e6825317bb9b666f1bd4d748e6e8742c5dc87000000000000d0abcf7b9af9180d8c946451930647058a0000163e24c0c0901b1020480810244883024d30412cd8ee7b7675d9b1540000000000000000000000000366ba6bc6c86c02c0000000000000895a0edcbd8d19ab12116032480303a24910f5345815e5815c4d2bc7c882c498100363c41251563c472594e4f2b09a4736b67a5b5d5716d60000000000000000000000000000000000000000000126ada6bba79f2ce7b124925516a5792886482490c9e4416363a2c607c8804919142448d8d92c8649208926114b02b0b01b8d96bd046f52ed983800000000000000000000000000000000000000000052d506a69f5e6e2b48c5e15e4923110bb2a0b82ac49705417a549308236599445f1af124b729cb528498288238206cd80ae8955565a0d1de4ead16d9bb240000000000000000000000000000000000000000030695d2463919c7c74ae2b8db0d7c9a0519b69ad96c558c9b01af17e540d1b21405c914a936c3563643572c4684118983a531b215516155a5a183a21dc22dab6ac5b18000000f2b9a6d20a4003d771be800000000000000000000000001a9ea55691ce5c5010c8e304b1c218f88269180c891b126004891060b0211346078804d2113c82384b2bc904615588c9605c1d60bb2446e78aa000003c946c65711460d1ebd571d04e53f8bf9bbbfe83d9a8fc4f2cff005747f76d3eff00abcffbb7c7173b11c40f4b9d8c000000000000acad3771d1620a32ac64480a1432400014060c181260c0912209e5a193024c081224048d8dd20400a1459c6ce4d0305f62ec9000001e44ae6a362c50c9ec98e82713fe7df22efe87783e7e7b17d4f452f83949fda7d1f2e9e8934339b1d5c887a800000000000049a26e314f0e424aaaaa18300064aa20510aa048181318a4098408125b1b19801020c08306048d891022801e2c2364250091937ce76600001e45395d024e95f9df248e79f46fdbf56e3eadf2bfc5fcea6f071d8feb7a66fa354be0e5d5ff0069f47c227accf33158754219e9f00000000000359ad7371d1e1c80adaa9238903260d784528c80008306040884881b2ccda049830206cc09306040d981158143d1646c04a12248a4c8e818a0001e44396524da3e6f0de3e279e97dbd3d27f67d1bbf6df37fc9f8331858dcf2bd35ff00d67bfc97bbb8920c9587723d1200000000004339ff0048b1f1d1c95242b2a88c20400c94b40a0001260c093036221220b3365100606c4091260040d991062b23d1665f8f00922904ddb17648000e4fe0e5c3e036cf95e77f9a275bdbbf41ebdcba587c6394d6208ab6b7aeab74b235d36f34d3762600000000001a9d68fa8ba7e1e1e5065209104001954a2cc9914657025140a2024c0830617298122693181ba20ac093118a048f134b51c30208c44371c5dfe00000000000000000000000000000000003069c733ad548e25306440d8c8901200600c00000180126040b032640500019032028c8228cae47070715e3633a446f82c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffc4003c10000103020403060504020101090000000100020304110512132106141510162231334020233032412434355142506143252644465253607071ffda0008010100010802ff00eced4605ccc411ac8973adfc73a573722d794acef280ba6ec81bfc2f9a28fefe6e9d7374eb9ba75cd53ae6e9d73502e6a9d7374eb9ba75cdd3ae6e9d7374eb9ba75cdd3ae6e9d7374e9d5d4adf3ea548ba951aea746ba9d1aea7469b88d23bcb9ba75cdd3ae6e9d7374eb9ba65ce532e72997394cb9da65ced32e769573b4ab9da55ced2ae7a9573d4a99530486ccf6f74668c799ac802388408e251fe3a97f47117235f22e6e52b5de566255fe30502814d759037edc56acd1d1b9ed739cf76672babababababa2b29594a1b0575757575995d5d5d3e77073ad75757575757575995d58ab21b2bfc60906e386f1192b69df1cdf55d3c4cfb8e2148d4717a408e3707e0e383f071a97f0716a928d7d4946a65779e627ceeafec6e8140a6bec81bf6711fecd88bc356a85a816a059c2d459d665995d5d5fb2c5642b23969b96995a6e590ad217b9cab2ab2b2d97856662d58d6b44b5a25ab12d68d6b316ab119630b598b55965acd5acd4246b8d8707fa955f5318acaad7c8cbbddf7595bde5d02814c7d90370b88ff64c5279f6dbe302e83535974299ce69736cacadf013f0945393bea43ea05c1fea557d4afa5bf84b98637169f7e0a05472655c446f42c2a43ba1d99d6640a71b05a6c761d1ca1454d9d84aa3a5b67cedb852ba5329284c038b4695da1c2d65b1595385938a015aeadd8553524b5b2e94341c322a237f31dcea55dcba45dc9a35dc9a35dc9a4557c398450902a7a5f0faa5e1fc1eba4d3a7a8c0b06a494c53c1c3f8454c72c9174ac05774a8fe55943ea05c1fea557d49236cac2c7575213707dfdd5d02b1b77e8c052f9fc015d647bbed84b990381e6323c114d5b2676cb1cf435150e756450b9ce3b32473e99ed030c392ea380885cc2f658a6c777b53ecd36525883664248b92db9db2a2110885c39fca3551fdf55d93f12e1d4d33e1906e2fdbc6ffb8a5ece0bfe5645c57fcdccb877f8ac67b2836c3e9fb21f502e0ff52abead4d3ebb36ab83fcc7fa0bac64fe9427f9a22dd965651c6db173a9a0e669bc18ad20633519331d03803149f25a995b23217344136a8b986a432ce4dc42c0b1cd7b8b2499d5176d88d521492945d75aa48016aff7b1f2ca9d6f245611cc0ae1cb515f354dd577093eb2ae59d345801db605650ac02e2bfe6e65c3bfc5633d90d3455784c304ca1f502e0ff52abeb57535ef2b2a21c87337dfdd631fb60bf29edb6eacb2ab1458490c5e3a4d30aa6a9f527287c7b260759a16e1ae0a376676c2a8c34cd7b19347278538b46561ad1972a78d93dab2d965562afbaba3d987d6f2155aeb0ec6a90b257cdd730d5d7b0c5de0c2d77830b5de0c2d77830b5de0c2d77830b5d7f0b5d7f0b5d7f0b5d7f0bec87d40b83fd4aafaf5d4ba66ea48cc4eb1f657fa175757edc5cfe982779ec493d80ff6f7866e04a5c41422a7899fa895ba12ecf9490a390e9b53a4d88501b5d6b36d15d9334e570639f2cd98d76f916eadd964e604f65965d9108a64524efc91d7e1f350866ac34d2d5ca2287a25dfa4aa20929667452c1844b2c02792a70992083988d41049532b6288e11042724f5d86cb421af34985f33486a9c30374c0f2a416920a87d40b83fd4aafaef6091a5aeaca52d769b88ca6df5aff0005d0dd08df7b26c249d9e1add82babfc58afed8221057b2d93a91ae2c0aab2b6466413bdd60e94e72d697c7a677610f0021185e5127452303496888854fb489fa7571d9d1d3b051bf48ab23e1598595d5d39394755353b5ed8b16de830f4247c449658b9c03788cfebc34e214f2d7d151cf4b450bf0ea0ac96a961cee4f08abab62ccecb9544c73f871e1b82d1ce2b63a87574cda8ac9e56287d40b83fd4aaf615100a88f2aa980ef7ff008f617513cf908e66a617875d6a01b35d26737575757f8b15fdb85f95f8442765c8e71f99086c89ae6cec21cd8dc06ee1e2b9786b8d8b6c16a1714d2a0c52466c855d2cdeabd94f76e8d28945548410f68f090bf2514e6a22c8a2894562dfb0c3d395231985b056d4cb23ea25748fc5a7930b91b434985cefc544b4758a88731805644da7a87d2cc258b9c96bb03ab7cf4b512d2f0f3df0c18e56e70c971ba58e8f119228943ea05c1fea557b1aea6d51a8c9e2ff0036fb0beeb3bbb2eaeaeaeaeaeaeaeaeaeb14fdb04c0b2a23651d25e374858d73e9f21103a37dd31bb14037378c40248dcf6c7472c96b369cb25cb2b30d749f64946f8e40c5cbc918bbda3c952cba24299c4c377395db9f2a28ee9c3b1c8a72aead6d4d352c4282a29e9aa756a2aab30caa99d34d5668ce5e51d895157c2c15fd4e92920922a05435d2d04e258df2e0b39ce6ab118f95e4e928eba91b87ba8eaa3adc2e95c2486aaa64ac9df3caa1f502e0ff0052abd96214b92f2b668b21bfb6bababababababac50fe9941e4579a2134cc58e6329e032531b6e459cd164630e7593869821b45eac6d589521aa689e3c16b4d349a12627796432281d23360c02606de49ae73da4ba499ad765501130d9e3fb7228ee9c894edd14e4ef8786b0a8713a97ebe255784be092281941876158441595544cc3f12c7e16453bb008ebdf43363d84f49ab0c6a87d40b83fefaaf6445c58d652e83f227b34cdbdb5d5d5d5fb715fdaaa6176ab27376bad6b5da60d9ec753d89f3b279cb7b35b9b6546dfd535060ca2d5b1fcd254ff00a88616a31c91f9bcb2968e3631b0eb3de5b35436981cd1cf95f9d53d48126f2ca094e2114f3bec53914e28a77c384bebe09ccd4159ff006b6053d55760f5f8b5132284be8e0a4e2ca3d0c4709abaec76711f19d4b1f55040d50fa817067df57ece785b511963aa2120ba390820d8fb6babf6e29fb5549f6accb329ce6399424b05d4cdcaff000dd38dca62a7b67baa4acd583c78835a61d414f23db20220c4e3b0d5a89229ea2f152c6e83339d8d47791918b694b67345cde2172df11784f7271574e4f759128a3f0d1623558738ba96b718aec41b96a21e23c4e9e21131988d532b39c12712e2b2b6c5ce2f24b943ea05c19f7d5fb4ada5e61976cb1e61b7bac4b7a7547e4e5ff3d8ff000dd324713b6732462fb84f726b9367b36c83e6a3a0cae98c0296d1b364d93651c9670239a6e9872c52673cb24135fd431cd93c4aa6b013e01169b3302512ae8a90a2e47eac3ea05c1ff7d57b5c4a97ce764f1dbc43d9c9298c80192bdc13a69186c9eecf082632be5dd628468ed467cd18c2ca8c40820b699806d4f4ed7c7bf2b0ca3e5d4372bcb4840105415f213131f54f129f01d8abec826bcfe6ae76baec14f531657364712d6acf622ccce4dd147b094f7045108fd48bd40b83fd4aaf6d5b49cbbf6923d33ecea3ee0a2dde117171b9ff00c385100586fa770c0a48a37e9de0a589ee95ccd36c7148c7ba95accce5cb8ddc638ad7c9238c244623f9119924aa707c9751039c260a7986e19a253dd9f74e6ab2b26aa90048e0ac3cd3dc5c434322638b637c45ad8f28905ad628a29c9dd87b696945407931e0d24b7c87009c590c0662ba14c17469b3654ec1a66f9d4521a7683d917a817077a955ec89b232b0233ff5ac548d1330b1f34241746f2329b1f6005cd969dfcf482d20a561d3d984e4701aafbb5564b23636b991544ba85730230ebb2a9ef249e689251a97dd6ab9f9156c921b6a7dc537c287926ee02cbb220593c58acc81375581ac85ce5e4d5434d4efb991b4858e9d5c8598908a289d9128f61edc0a212bded3053b18cb07d3172969591fdfa6c5040d905e3aea7744dd458d8b06f645ea05c1dea557d674ac6f99ac8c791ac3f8e61e5665757575755306bb369a3ce2fec63934dd997389d387fdcda9ca2c39b283ec083ae555d4e482e8626637129b3907c5cc788b9b0bf3027b1a4b4822ae774d6cc5dbed737dd85471e5607205144abf8aeaea78ccb1b82753c8d6173a9db9ed7323d9216222c0a2480bf089d913d87b0f6f0f92272a33b2aba931364c8eae645ab94628dccd8dd1b8bdf4732c53f6e02c7bfc7b22f502e0ef52abe8b9ed67dceae8189d8a37fc1d884cef2333dff75d5d5d5d5d5d5d5d5d5d5643ff0059b3c5fe4df6d5e7e4293cd35d67597958a824019657decbf089cdb22d0c29d52e95b925a7633757b0d8bafd8e366a2ddae80ecabb985d68e5b04d93ff0051b857fca3d87b0f61edc089136d4e7e5855234def73f5f0c77989e903af4d4b0363607aafdd8d5c43e63b22f502e0ef52abe854e7d176431976e082df357575757575757575757575993ea638fee7c906a6564d1e99f65759c2d4595e55606e86c40bef96e566b14c9c0426bd8b5b27cb3704afb8a23c4a9bc31acd645d7457ff00ab37cc29d26d7335e468218edc84edfc882775f8b2ba74a02d4283ae8947e0e1d6e698a84d8350ae3a5a8a5af6b4d9f1e201f2889b3d7884906a8e78e22b886f7ec8bef0b83bd4aafa3350472f883e96a215e076cb4bfa2d70f3ecbababacc8ccd68b97e2d4edf29b1affd9762b38ddc26ceff000c99f754b3f39164739b90dbeb5d6759c9d865779b9ac07c990c87c9b423fcb18883290291f91c9b33987c3ab1c9f738ef64c36f2e61c0eec7e7f2b1bec49bf89b500340026ba07644eeb2d85d13b269ddc54cfbd9364b8caa370597f2bfe13c1213de3c812ae82cdf0e04eb4a53058045b0c5684b194d31dd818d90bc5a295eecb5168e38d8de213bdbb22fbc2e0ef52abe9cb4d14df7c9873dbe93b3c47c7b1f3c83f191c3b065237ab8ebb33b248e9d84b132e4fcd2c6f910648e2195d2c99bc6434dc881ce85d9a3bb6b20d66f91b7d2ccb5102e7f964b7ded87fa6d3bcad08a119df2e314509f09e2399d232c31233ed478a435eda512554adb9407634969d9ae69f3c8434923cfc2c98b7cda2fbf646774c976575255c4cd8baa0bca64a3c8e61a764d945acb37f5ac50909524a49202bab5fb2df0e057d4714d9d8016bdc58f7664cd3686a3a27cf518cb113d4e7b5b1c39eceec8bef0b83bd4aafaa5a1de7261d1bbec9296789076eaf7f3f965c5a321fc100ece930ca7914d80d87ca92967a6163f343bc4e6c47c4a2678be5d255cb4d287aa88410248fe2cc16a201ef4182f62ca77214d7fbb4e2a7198cd8d51c17c93e3f5326d1c54b5f88bdae6d1f07cefb73349c37414bba6b1ac166f14fec18a53621581f2f2570504242d3b3329dcc50eb36c246b6172754ff4c945b3165500767cd2c84dcc200ccfce0f858d01a2e5d3ed9413b2cc5441c7774af0e000b808b900ae89f8a82b1b499ee31fb15de02575a888dce2f0fe0712795e6c704b7555542a1b60a2fbc2e0ef52abd8494f1cbf749875bd3750186af997625cc4556658b0cae9e4a495d3438cd2cbb3dadced0e6789aa5a3827377bf0185e490fc267a7dd3b36f6c36af2fc89aa61313fb2e1670b516490a6b1a4d8329a44da46ff0093210c160180794d3c308f9b1d156e22ef052f07cf278aa6938728291358d6f976f14fec189d1e7dd680591a05968b16936d64d8d81582649905839ad7f9b0b5884a0276526e9cfcc15865b10d68f2d36fe74d8b4d8846c06e9e43c5969b5693168b169b5693568b568b568b56835683568356885a2d5a0d5a016805a016805a016804d8834dd7077a955ece4a58a4f37e12035e22a9e1a2d248a46e9c11c644ae6459a4cad2b4bfacae6a92364cdcb2746a1cd9969465a69a70d7bdce11e99ff3644d70b86c764c8a273f2b836c2c80014b510c1eab2aa6a8fdab308aea8fdc53607454fba6b1acf2f8b8a7f60cf69061f1df4a7149197c8d524703213217105d71ecb83bd4aaf6cfa68a4f3750b87a6e64d1fdcd91a4d857cf2411e7652cadaa803d68ff0052d313190f34d4b1c8ed138589250f59b248f8e4d7feb9d6c5571eab27a9a9fda478256d47eea9b04a2a5dda1a1be5f478a05f0f69570ae2f65659535e0ab85982b85982d50b55ab302ae15c2b8570ae15c2b85a9b596a159eeae15c2b8570b30570ae15c2d40b5020e0ae15c2b8598202e2eacaf62ae170734fea9fee64a78a5167d4e10e79bc0c655517cb5cc347a9048c919b57c3a550b9a863f0ad0a8af77820e1e71f5a0c228e021c0003cbea628f0ea7744b90a753d07cc6e8727323453d8da3c3299ac00f4ea55d3a9574ea55d3a9574ea55d3a9574ea55d3e9574fa55d3e9574fa55d3e9574fa55d3e910a1a45c8d22e46917214ab90a55c852ae42957214cb90a55c8532e429574fa65d3e997214cb90a65c8d32e46997234cb90959b37929d4144ed5f9dc9c0b047e844611eec807ce5c3a966fb8e01424ef0d053c03c0001e5f5a47e40aa85e32896b0173faa36ea3ae17f9a3148ca831064b7bf526db3183128a5796bba8b77cd0e2b0b89d4188ec09871685d9b523c45b20b866290f8b3b3158a4b00311843a40f18bc0533118ece2f18bc1bde0c4a396391e7ab476de1c562903d1c55adcd9a3c5e131bcb8e2566ddd1e2d118de5c312cedbb598a46627b9ccc4d8fd97518c31f9c62b0ed7ea0c6c25efeab1a18a43a4e71ea91a6d735f139c3a9a15c1d0e66f521951ad1a41edea11e5ba8dec9981eca0166a81f716ff5d23f339549b46b139bca11941365249bb1aa68e9e37e9a64d918f68b466032bdaf8e2918f10fea65c8e934b7c86a6fa769218e3d3bb26c914918635b2c4f7b992b59246f41c2696c6463237b9a9f3dc456744046c90b66d38e4628982724263c47231e1d26673d4d0361974cbe6ccd882d26980ce9b2b636cb1a82313c8234d22278903a5697bca9206b0b2cf9b5191b4c6c0e85ee45e5b6466b8b2a673753212dcb216363195e6371cac79626001ee81cd716bb4d942fd3934cd03b6b26badba69cc2ff00eb277dbc3d9572d9ae799a42f91ce44a24dc10662da70018e670ce29896c969499273b7cd889533c3446c6ba392d994326d2be401f21b00646f8154b9a2a086812c64390bf2ae7921efddb039ce9638df2ef2380f990a7e514f0b858bb714eed699dabf75ad9a563722aa00166566ab08736239a19afe271d848f0e607d48b4cecad7385d662897fe3e6aa8d478648c2d7650a7d49031ec21f60a5cef0c9182c034aa19b3b5b2806e141258dbfd5bdd91b744e637523acd58a4c4011b5ff00f30b04ce0c52691759a4469c01a48d08649b76d2b841312ea88cc3e17585903cce9471b9be22a9a4d02f72ded65954f3e631e422e6e69a4d16cc89711955954cf9e6ccc2731b9865c904cc52c2f646d2e69b104555dce352dc86d7518fd0ca9c4154f19beab6a1cd92573c474faa48006575d0614da50e6b8ab3542356092051888f8141691b25386e9333034f6707409968c96ac3a670932981db65ec85f9dbf43886799989646118836f73cfb573952b9ba95cdd42c09c5f8540e77bba89333b284e8f32930ba97925efc1e43e6cc2df1b2403a3238294ec29ce8e3628f0fa98768c60eece1c65c25f2c8e79e8b211650e0f2c59edd0e55d0e65d0e65d0e75d0e75d0e75d12a1745a85d1675d1a75d1a75d1e64fc3257c513174ba92ba54869b490c32a8372a6615236192343089dbf6c185be2cf7e8f2daca1c3248a50f5d1dff008e952eca3c39d1bc9430836b2661af8e46bc0c22ce2574a21c1ed3855e52f5d29de60e1723e5ced661354a081cc6375146fc8eba1bfc7c45fcb234579084191931074787533981f274e804d0c62b638e19323700fe220ec3593dca7cc4526a28aae674ac06a6a2586a2cab2a5f1c81b1cd5b4f461a2a70ac72aab71f30ae29c66a2834a0a69abb1fa263279ab31f9870f4156ce7f1ce5b9b5c3389cb89513b5feacf269b7e029e110acacacacac9fe10b5655ab22d5916acab5645ab2ad6956b4ab5a55af32e6265cc4cb98997313a85ef909cf65656565656565656565656edb2b2b26267c14d2ff81f8b897f932b564d917b89b9323dde7ab22739cf377601fc441d96be629f25e898c508cb511858937ec7a87e7d4b2f8be050e2ef8dd270a7f371ac6b87db8ace277715d6d2cd86c30c15e0b386f0d0583fee4ae07f4aafeadec14926a3aff0bd1f8a53bdbebd37dc7d93137e0bd8dc45209197f8b897f943f0418413bcef38753ecb0920d045654adcee91a9a0bc8627ed5e02c49fbb18a9ef0d53415c27fcd3157e27434d7a7a9c7b8761c2a904f162b54fabc0f0e7c9ff00929703fa557f56aa5ff003e1723f113737faf4dea7b10989bf0154f369bf7f87897f943dadc3aa1f1e75049cf503a254463829649960d299b0d8a472c3bd772822fd7109ff00c8a9be75659570c95398637c42ec29d086615889c2eb0548e2299f5a692bce31c47d5a8d902aca57b78628a53d74f43e98b82a22da19a4fa92c9a6c2e57b9bfc4e47e17df29b652ac558ab1562acb7562ac558ab1562ac5652b2b953b5c1f73ec02626fc05154736a3729f831ac38560cc7a1ccba1cca8a8ea297c2e970f22713d3d56186525f161109a7c3e288a6c6c66edc8dcd9969333665a518370e8d8ff00ba5a1a59edadd230e468699f0080b701c31a6e9f045245a4feefe16a28990b0471fd3aed807bb9ca60856d3ae729d7394eb9b8173502e621466856ac4b5215ab0ad5856ac2b5615ab0ad5856b42b5a15ad0ad6856b42b5a15af0ad7856bc2b5e15af0ad7856bc0b5e05af0ad7856b42b5a15ab12d5896ac4b5625ab0ad6896ac4b5225a912d4896a44b5a14da884215702e7205ce40b9da746b69d7394e551c61ef1233fd2546114355ea54f0a407d03c273fe3ba956bbab58bbab5abbad5cbbad5cbbad5ebbaf5ebbaf882eec620bbb1882eec620bbb1882eec622bbb188aeec622bbb188aeec622bbb188aeec622bbb188aeec622bbb388aeec622bbb188aeec622bbb188aeec622bbb388aeece22bbb1892eec622bbb188aeec622bbaf88aeebe22bbad882eeb57aeead7aeead7aeead7aeead72eea572eea56aeea56aeead62eea55aeea552ee9cea9b84e2ffaf4f8150536ed02de5ffc6fffc40044100001030104050b0203060406030000000100021103122131510410419192132022303240526171a1c142815062b105335372a2d1142343826093c2e1f0f17083b2ffda0008010100093f02ff00e4e78de9ea534a67ba0d4e4f2bdd1e754637d4ad22971855e971055e971055e971055e971055e9712af4b8957a5c4abd2e20abd2e20abd2e20abd2e20abd2e20abd2e20abd2e20abd2e355e9ef55d8b4862d218b4862d218b48a7bd57a5c6157a5c616914b8c2d22971855e97185a451e30b48a3c61691478c2d228f185a451e30b49a3c61693478c2d268f185a4d1e30b49a3c61693478c2ad4dc720eef351bbd540893f64d72a7ee9a1109c9c7b876cdc13892769ea5c538f5510dd9b4f54e29c7a9c51b4fa5b731d75560f52abb3ec655427d026542a8fbaa6c08b47a0554fd9547efef5e3d52a54ea952a7ad027590884e09c13c2a83715506e2aa0dc5541b8a784e4e4f0539394ebc9bf3d638d3a5e5b5389f53f81f8faebe31f2ef9937e7acecb8cb0e472fc13c7d40e987d9273d52ec80556e38b41400f284dfe854db1188581e7e1cc12ff5551ec7b1f6486ad22b7b2d22bfb2d26bfb2d26bfb2d26bfb2d3ead32709ffd2fdacfff00cfb2fda352a3a2602fda5518f1b217ed17b99444bcc60bf6b9dcb48d25e2ae0e6b2efbebc9bf3d66057ef1bfd433fc0fc7cf63b72ddaaaf26ef3ecb9520c3f500e90e52d28748dc98edca6587589592cd0e88e6f84afe37c0d4f7da6183d0e6784eafe09fd42c9bfa2fe0fc3b57f09bfa6bc9bf3d6dcf6f64a11e26e47f02f173aa86c2ad69f6c5fb5a11fe64e699f099d47e947a49db61c08bc28908ec8013ad03ccc021bb9a186a41ede0b1e57e06ad2dadb6e98b1cd0105937f45fc1f876a6da63a93647db5e4df9eb849fadb9857b4edfc07c5ceb32aa00264b9b884eb4365d08de1652bc3f2ba2ae74edda13027b660f42179f3ceb65b80444aa8da25f526c9f40b4ba6b4ca6b4da6b4da6b4da6b4da6b4da6b4da6b4da4b4da4b4ca4b4ca7af26fcf5ffbb79e03f80f8b9c0728e30dc8265bf3dab0d9a9e6211c46ac0389575c4a2231f65e7d534bdc760567a7914db4e2b4ed1396f05b4db2f6e2155a3a3d2381aae8955696914862ea6663536dbddb17ed2a14ea78402613995293fb35186415a452a2c0fb1d35a5e8d5dc3e86baf5711af26fcf5e241c42bfc27c43bab4ca737ec53a7edd4f8b9afe99d9921d117274c608dc355c86aa64b6ce3b3356d9eeaa4885db6e19217f6b0ea5f62de318af09f84e2d2445cb1382bdeca6d0ef540d5653a429b98cbcb4a1c9f2d4f93653762e3e9abf7ae228b4e5a89b392049ff0015b3f9534d2a54ba4fa8eb82ecbde48d7937e7b85c7107228597b711dc9adf52a2d0db10ba4138347962b1dbd4f8b98f0230f344927546a378d4e57eaa2d9cd08b4534d94481b4755e03f1a84d53fb8a5ff51f2465ef324a268b1ad169cdb8bce728f2a2c1731eec587d7576e93c55fb280e198956496bd904340da9e58eff0013123f953f97a64c16546832bb171032d7937e7b88ff0031bb3c432ee67acf1733e9d888973f75c86f51820e2064a6dcef0b128d8bef52563e69842d8af2e512356313d4020d1041f354b9568c079a669a5cefcc136b373e50aa55b96a62395a317ef546a07d5164d5aa6f8d5e841c085474ca24e2da76615234e84da7171973caa7588353949a7e8b43ad51e30e55f705da76bc9bf3dcbb0eedf979ac3bee7ccece251b2f0eb5392181d528ccc095984ce9fd4160734459c138c64a982409245d1a8a927c97ef07d276a11d75f4e909b39afd9cfa15c1b895a2bf4a7d600f936568d6346703d0276d92b4034e0d9e50144ba93c4b09d7937e7b960bb07b07e161df331cc25a320a5a4fbebdbafb5e58a0246d1721d33b537eebb75002e215ff00523fed0899d8610be50e74750c7bdcd1d20d1372d0ff00c357a5d97444ad0aa691a33fb3d1d87cd00cb6c738b47a1541f65cfedc74519349b7fdf5fe5ee7ff00a5da1ff93df33d4355ea656044ebcf55321a0f691b4a5d0a996fba16ee45b2e1d91b1068b57c8c54958784a8176cebaad8b58dd8aae5ccf0c405a4f45a207445cab135fc66f5a511fca004649da75fe5ee9fbc6e1e7e485fff009777bcf9815cb1688e60c76a607ce5b16364ddcdd88c92ec96739ab810aa5a93865dd726fcf751fce3e7bac608b4050b3513ab30b3d605f8a10b046f58cebbda3dd02dbb6f34de3d90b4d2305364e1abb11dd726fcf76fddbbb3e5e4b0ee79213ab3d57632af6976055bb21d1033536676629c6c8137629c79389f344c3d862539d85f92b89d8b695b13ac3ff5d5b79bb163a9bd9105117f575032ca7131935137fe54ef64ef656f854f0a74cebc9bf3dcca1aaf057687f50cfb986a0cdc833728bb21a9b87baa7d875a885a2c31e6f10714c104cc2682d3f4a02222362030b376c4012dc3329b63aa68b457aa74388c4ec4e8b237f5918b710840c9543b96911eb0aa56ff00927fb2ae1d1e49d684c442cf5e4df9eb9e1494d09dceb9edec94208d991ee37a67baa73f74cf74d0848410be7fbaa6d971957899574e2161ab10a047331e7629a5b19af75788bca3ff007eafc4cd58b19689c950e97485bcc812990f31378b8947fcda9da81f4c2f1859ebc9bf3d4903d53e7d1533f750df44e27ab1fce330aff9eef9f530ff003388fbabefc7a92bb5113d678d9f3aa9baa50aadb2fb388554624edda20a6e9159df9260faaa3c9bc8889980bc6178b5e4df9ea267c93ad7aa07ae7009e2c3cdd1f49eed77aa75abf661aaed572f4588d782cf9db353884d69bf689445a3edd678d9f3aa89b2e80cbfb4a88b60c1048ca714cd80dee8384e086040c56d7350badebc9bf3d4cb5d9842db7c936fdc9dbd0e7e09d6bd17f52a9655a3f65559f618afdeb7fabb910c1e69af7f9e01437f907caf7bd789648a160f961a8abd1464ea050f7ea71d570ea84cbd9f3a8d583d913d9f456dc5d7cbbea909d57d49ed45caa3c39f92c1a442cf5e4df9ead80a74f93934b1008ef4376a94e3636584daa77ae88f5bd547cee41e5bb2ccaa6ef39b939e06c0a6d0be715778865d68253c35533eafb82718c98211633f31fee54d677926318cb578c4ad1aad7f3886ef5c931a5d731aa30e64842467ab784e9e6beff245ce5efacea8f546eea8130e6ecf5460a3eebed7a93e49afcf04d38e242ce35e4df9eb44a961f24db6330b15053ba436283e89a3ee8167a27979fcc61517c7937fb26c676ae5ca4793821d2f7546a7266e74aec9c3a9053eff000b6f2a986f9d429ef7790e884594867ff75355c32566908fbaa756a9cce0ab060c9b8aa5ca3b37de800bf89fdd65cd2ba0553f74e42514d250808ca11cd30d5875626d46c56e2708055ae109b5250aa2e56f7041c3ec10371d7937e7b83427fd8a6ba6cd9bb056c37c40c052e34f0b498fa67784e0e07052a989cc5c555a9e8a8da1f96f541d03c959e4df85f873aef545d50e4c09aca5fcd7956ea7a980a1a32688d55033ee9952b5f7542ab064ec62a21e737de84733f89fdd14e2af52a509f553aa5301f54c694d8f4d52a55adea54a054dd92952a54a952a54a952a54a2512894514514515937e7b9b2fcc2816f1b917275ed68053729843723bd04d0f1e6a8dfea53ec7f0aa1dbe4ba567184e0d52ef3d8aef454c38c4de6edcae190bb5546b7d568b52a7e677442d27921e1a3fdd52b6ecdd79400e7ff13fbf7460b85ef16bf5c168e5ad660e332f54ba40c45e01de9a1a32ee7937e7bb342a9f62a9cf9b51bf228e015e769c11dea9db66f5cb539c434a710d19de51ece073086f4e86deb43a8e1e37f442d2b931e0a377baa40bbc4ebca1d56ca839c422111aa54ea8d71cc718f54e3bd3ba99eaf0e88ef2c055781fc37ded2b419a79d27cfea83a9ff304e07d16d4fb4ef0b6f2b45a8c8dafba554fb0548170da7143ad00875c65520a90000bef4cf74d13eaa9da3b4e6a905442a21516aa21510a8b5516aa2d5458a8b15162a0c5418b46a6b46a7b968f4f72a0c5419b95066e5459b95166e5458a8b5516aa4d549aa935516aa4d549aa935091b2f4d1bd5305b0a9350019df02a2d54e7d4aa60772c02a400f5542cb48b882a981fee542e02643a550b2332551d9373b1542cc0ce551b3026e7ad1a01c2fc551b3026e72a176dc6e547a2048338aa224ec92a87604f6b154437fde568ae6f86fed2a21a46c24deb453d01373b15a3d9caf37ad1fa43001dda5a38691b2f54048c05ac568c1b3d9c6f541b68602d62b4611b6f372a024602d62a874bc8ad1e1edd96b154e3ee568f65db05ac5521bd52e90d96f154c6f5425c0e01ca9338951974c6372a6d9cad2a339f4b04c04e5690227f123ea8b479cdc836c8100032a67694ded1f643f2868b974e3660bea324acee9fd536ea62138cbc5af443b717a364306010ecec0beb7629d3650fdd84fedf92bed817e4a1961b37057c19510f33e89ff00784dfdd8de9df545985d20f18a759526cb934c38a74db122e4dec089cd388b1b14c42077a06cbc5929a4c2690d7f4650395e615c1de7b55ab94c3bf11c1a11c4ec308bb8d3b0cdd29c2dbef7195d16ff003222c3013050bc99b8a37e18ab3737a5055cd3e6a096800495b3cd604de334d1607e6c548ca5301a85f13f29847a282c070c9002fbaf4ec44268938dea63d574fa3b4ac7d56133053434164fdd4ddb535a5e2f0a3ecb06ec2a2cec829d71106f4f7f127bb893ff00a9746d0bce0aa74b6cbc42113da2334ebf6f4c26e3da8cd3ba5b6f5f7d5b7f0ec36de81462cdf8045c47934056e554e8372dae4da8ff0030d9448206dcd5524baf214aa84586fba33e6a7b303d5131a9cee8323eea5120b9b01130a53cc5985329e417609dd1385e8e0aa740dc2f41db9541089bae4f02c5ead4157117deaffb48419f70154ece2ad6e4e88e90956dc4e4138df789baf46d6cc13cc3c6dbaf42d38628430f9ebc475155ed1645c1d0aad5ba7fd4c956a9b7fd4c957abc656915788ad22af1944937de7d7be603514fa729fee9c25fb7c93d3ef4ee8b46f2b487b0793e13a6f93e69f894f90b17363d359475c2850a14221112c9553fa911dbb4aa084e1d3855207aa208736155bbd53e6154bbd55417274820821543bd5498cd3bd027f4823137a78909c0138aab4bdd3e5c318eabc2d42a860b42f7993187d3e7b2714f7b5d5aa598b6662d478553a9467e9a8f8da064a8d72da8f8e5270e99192a6e6fa93f202f3fd4ea7fb2c613ee2724ee8e48ec5a453a6e23ea312abdad14b9f6440c36275873c5a2e55abb18fc0b9436bd636272c67f455f49e47c7b119a94dd1398ebb13d6d476f551dbd3ddbd5476f551dbd5476f551dbd5476f551dbd5476f551fbd557ef555fbd557ef4e27d7bbfdb9fe109eebbcd3894e27d4aa8ede9c4faaf3fd4ead8b35985e8bc9557b2c08e8ac9dfa2d2791b0c8eccad2295570a80f41d3b0adae79f75e03ffed66df9fc272efde11cc747904ce51de57a67262fe8e57eadac2b695985eabd35785cb48149cf665b1567bfa7661cbb41cf6ee5e0ff00ad66df9eb7efdf32ef181e77846b022271c51ff300854e6ab0ed5899fd757857d3257882ce16dbd51153956dabca6729008894cb02b528fb82550e4e1d689b5287fa8ef7ff00d2a3ff00d93e72beba9fa77a0503d4028140a05029a503de7b4de6dc40b9f97af92af43dff00b2af43dffb2ad41d4f29377b2ad4d8ff00a81982ab53639fdb17c1f64412d9bc7aea6347a0404e69a2734c6ce709a0faad1a8d48c2d30185a0e8dff2c2a148d21832cdc168549536ba9e1648b96854d3031a3000758fb2c18aac0fa2a8aa2a8aa7b2a9ecaa0dcaa8f7555beeab37dd566fbaacdf7559beeab37dd566fbaacdf7559beeab37dd566fbaacdf7559beeab37dd566fbaacdf7559beeab37dd566fbaacdf7559beeab37dd566fbaacdf7559aab35566aaad555beeaab7dd556fbaaadf7555beeaa8f7555beeaa8f75546e2aa0dcaa7b2a9ecaa2a8aa2a8aa0552d0197e0ba3b2731714f783f9955a69f453e8ef4fa3bd3e8f114ea3c48d2e25c9f1ae4f8d727c6b93e35c9f1ab1c6ac71ab1c6ac71ab1c6ac71a0ce3419c68338d0671a6b38d359c69ace34c6f1a6338d35bc69ace3419c68338d58e35638d58e35c9f1ae4f8d725c4b92e35c9712e4b89723c4b91e25c8ef5c8ef5c8ef468a3493e9aa8ddcaa3ffdb0b476b8e6fbff00e1dfffc4002c1000020102040504030101010100000000000111213110415161718191b1f020a1d1f130c1e140506070ffda0008010100013f21ff00e9ada576877c90f24e42166dc10f3cfb0f214365906c1c1215c750cc39ea1ddaf1a52042caf4bd87bb6bd5a3cf5477d64fa89f41fc0114f1453cd7d78ecad59f6e7d89f667d89f6233891bc7f279e69a58041c30c01e49fb3c93f67937ecf1efd9e3dfb36ffedbff00434577059cf2973e5d442dc30cc8f61afc8326919c8e43ce7b0eedfccce364b524421084fd02ca910b2b1b919cf798f550cea364fac3694d4b58d5d84b7b9225ae165b6f89ce372ac936c427b9327a93264890c89850bb78249249c5098d25535727e2d71b69e8ff002d8f62b517c7f82c5bf8945fb4af933df3fe46fdf259612b75e91762e4b9cce1b1360924916124e2842108448b12b9c42cac3d97b3298e7d080e31011111cc70b3859c0c86f262d23671adbc2e18dd2b4cf327aa3896123f70d7db1bfb7f03fe5bf81a7c4f63c73f47907e8f20fd0ff88fe0d97466dfa32d1c027f078932f3a21e1b8e5704fe5ba8beaa4e37d477afc416f1042c1084210842c562842f5c922c4af7db34226563da7b33b64938d220a086a8c76474be035c8af5cab898b01a18f118c7fe0cefbb7e59a6bbe3a9bf6fa155b4d0842c560842c5310b05f856124e09e232b6cd11069eccf686624541c0853d8b63525c4c57cdc4259a286b2d512cced65124a385b285c11d692a2708ec26d120db0db886f425b2c1be412b0ea3316ccad7356c55a07b46b020aae4dc3851126ec8a6ac9fecf0fe036793b1e0fc4f07e278bf12b3dd810fa50f0b79d0add0bfd59ff9344be775db63c5fc1736ce1a2899d1877dd8f05afe42d590656fccae9bcfd1670ee2160bd13e8421122649382c17a271982441605ef6c7eccec7a38b03bf1ba1006a5ccb5a7f46e836cc971b773e32c8783d548f6708e3f952e50eb34a715878512b44930f47e21b619d404cc90bc0ef2ef6190e689f53223dc1c165e9687eff0086a47bc9719212cf1f37ae37fc9693d8f0d936e91dbe1df76fcc2718eddd1eccbb3e9c32fa42784e28582c27d084489899248989fae492443a1fb33b45b60db04a81921c932aae4d59ef6e28e13f3ee202b52690c56f329ee4ef9c8c4fc89362c3953e07dc747d48809276253b8c85c8f465d52980728d1f0bdd1a3bfc46a93c3130a3bdb7eca3ac58c3ab31e93dcd8c518bb8499f5c2b444792d27b1e1c001f344d1a61df76fce345a2d08f295e6454cb85a90bd4b19c24913c644c9c13c649249249249c0dd3f665e3434423a9245584a649d1fa11140e57ae1cd4174faac8d5a2ae5aa51bb243c94b4e24395515e8269d3251421a264df065d8a9972dd1d52da6fc89912a94f4e0c4b2521f53326501d6b8f8d0d066409ab5545a917209b4c2b8df869f30a0d083fb11ff0073c16782cf059e0b3c16782cf319e633ce6796f0efbb7f8065b13f71fd3efc479b1f993249244c4244c9270927d02493a17b3275b392ef02d939162cc54b3116a9b82ba939d7513d29bd9668852a2d0a7a141644d3ce87eccd1b9ab48a7c5d63c89f4ddc4d126d144c61eb57348ec119931d7948d277b10b1747f50c9cb0a9dbc03073b15a235ea691456a0dfe62b498b92e6d01fa871e289eda8eb6ac1f9e8121ac75e0936b0654dbb85bb3bc27fb23e3a6ebc98b6db10d3c9e1df76ff00c8ac9c33343556c4bfc657971d3f9633e89f44924e09244f049a126d8f531ab5a508731ad481ecb757b09c492492493da3b333a6c49544af30c69f8b16f9546b642901506f424792890873561c974e8b314d9c8d09e4e255ad4271104586d4939711db142fe85ed33950a11777a872d4cf649a20da11cc8af44ea89437d5288b9b323621514b48c942cdc76d372ccf8f866f0e1918db7248af24ee247f094d5a6877a0da4ada2bf9f0616edd59df7c3498e6aa49946d12720eefd0312d25882a381cde1de76ff0008cecd4473cebc4693d7832a9c94357270582f5c92493810962ef0cc226cb6c874d82e9b28dcdd151c4c055c02c449249248dd27665c532152eaa22d94b530ee84deb4f248429af14cba443dd045dee3b319d3c0dad2c5121c91525a7c456710b2290db68afc88cf25653361082cdd5ea3bcde721d5ce2ca850d7945438e22f049ee42544b737e0455270356359afc5b866f4ea5b05d5457812ec98e9a4e1a324598e1239ed211edcdf21e4f5c98289323990ad8779dbfc435d523c0f617aab2f35132709f5492492492489949369acca1166d0885a2c082fc000fd07664c993a8f775751cf52f233e25f5693bca7f64fc97b66dcc9aa6ec5510d2d4538e6215cacba6673dc6d14e44c1038ea1999ac3b381aabeea0a18a08d653997954ec28252b917d1121cf6bbb1ce2a2cd58ef42cc2f71b1e29ea8b74141e469f4b1985abf59cbcf1f48292b1b24bba143bc3b8492c226dd3a326679ccdb964667d7389342a78584b22cc65379bc358430897cb8ed8771dbfc632192a942cfe6bd751fd7042c27d124938c924924e124922f580a0e1ecca9b41a7c25110ebb81774088d30e32e9babab1284a52ca856d014169201669a5360b34b1a0443970b5ac8d61bdc266ebf530d52eb4aa633e3d11415bb212d82917e80d556366b06b2296526de62f4646c667f595fea6171362daf965eb5953a0f5a8dac848dff002e7ac66ba97ca5fc4f53565146e9e1de76ff001f0872136a34c6e62793ddfcb7063354b3c6492719249249249249c249249f48492389ccae8493328ae84965ad6e322b54e8754dbee3934cba8d28aa49b563668d0b334da39e88cb94d11d19f11d2575d567343c5e7214745fd28cc5ab228e17088459aa286b5a8a05b7d1134524c8d2ca0c950f51d9ae7270e36ef11f1db4bd766ce30f72154089c92422d358768137fd5fe5591c4d3e6ae9df33f76de0b5924ecdcf93db0ef3b1e371ff001d92dd9abb64d09e12bed66b25f3b0c5797a249f4c924924924924924924e249276a5cb642bf315e4a832ea5911143272155d2820f34935b1a832457d4937a664712cac515ad09de64d212caeaaa092f4a5298452b912a90193b8a697d88c14334cec3e35cf76bc08568eb96a1d9b12ec8dc1ef430d68a1bdeba77185a747112d7ce609d04671e9be1c604e52eead19d2c3e2abd5faa5232a3d2ea36f0ef3b1e371ff2442e2ffdcdc4ad312d21dd3cdbf049249249249249384924e3249258bb47f623b49ad0bba2837395c6778e2646e9b93745a31c66e24f544ea08a90e64c70084d09427a8529264478662ddad062b9a6bcf389992443355554cdad09112e4f45a612696ca6a31d6e25e7524d1ae79b17dc4482b24830ff002771dbfcdc4364cad3e39edc09dd6df7c67d33e99249c249c284680c8e0b364c758d814955a524afa1c05b546132fc86b03b0d2717e06dbe13315851ab77272e5b4961b8ea352059b9196995b8f68aa58a142870812c34ccacf524991334646bea3ac48a9606f98a409cd2a8a875434ccf17275c0e4e1c41e5d12433f2bbcedfe79ad9afcdfd74e9a16955fb3f44fa249c2709249c270f6713d863dbaac61a5fab4a741ce6215096494a815e1df62b8d71127aa3626e3a2f02074d86589491d9692eb88a5d24998b333682a8a00d0c94c839143b840dc25505deba3ba34e41eb3928be64886bc44e938947191c960aadb8b6e4f85c9e576e7dcda1051446e477e38956622da4bf21b7afa0a4446ea664f266772b2a29f32289a38ff639139a3cc958928cedee259740e0d545b0ef3b7f8ce45cd23547011f20db9c1adcb2b768bf413cb8fe9cf55f827d524e0e525d8e8cc6945510610b4da1544030a943896dc12b2729a583a9282067adca9dd73a057791292330f34a093c293d085597cac2ccd255256217788a6f60c92a615e4769b7528c51334ae4af6594a238a0d5e8382b96c81617b22741e6b5344e22db633aed896d198d3d106fa45104e4b08e8c0791fa143db45cd45959564b232a16c85726bb249322d0d68866cc28495c44d656abb2a6a74643924b6f0c3bcedf9ceb3dda4fd511bb4e351ddf45093bb620b010e245b9a3d992723d0dae5554746af8ce32493849249384913050c89e811f042d5946c92c15100caf32859abe3e21d0a6b4cdadf2269f5aaedf06791d4252912511a288ccbad92892c257105ea1aaed27120d6d64c934338b59365733330a6c3b92dcb7bc0cab12954cacf939b48829478a50640a8ddc6a309e07e842d115a78b279164943e7653932d0922686afecc45c145c80a526741b656bc84dd9e7034f8191ecd3f5c3bcedf88e41297741af3ce6706ed076043bf308a08228a28a282176734a13d6e2bdd7233a48d4a7a09f52c249249249249c2709c27710e1b7f659e03d10a10910d6e236b14de99b96950b64d72c84a70ad6dc4ba5b850240ae52172a344499021c8f8889ca1d6335e429896a044eca7f431c924aa2e82b75134c9612e2e3a154433690ddd0a3c0dfa0ff00ed05f357dc8940a2b866b1a548cddcf4f37601751f0a1a92d50fc22d7ab559494ad7ba279b4c3bcedf84646929d61c416e465bb12208208a28a082082315768473c75c1589fd69e79741edd33f34f549384938c93e9340f417ee9d691094a8d537663b2851588490975254ac34869fbc5e968328012cf810ea5c545506684635522eba263112ee68813c5390d0bb1b8a296641c137f415424e8c992a9ea36c1ae4d131151bf31f3964c30f1a7f260ea2ee3c95bd0e59b854c88373b132f8027926e02aa013edbc9b569bcf8085b67a8e7334aa90f0efbb7e239cb63613746b52fa12c9412e955d06995c282ea46b91226208231576860624976e8891ae5c7ef626492ceae9818d1b82ec3d356dd5b9af73270e5237fa0ab9aeb3480e7d5197e292718ea3525c2dbd86a5bb8e553cd77b997ee27b8beadf37de8ba0c952dc6adecc62771645aaba3deefea2b64a3263aaa9b14678312928928ab02b724a5b04fa345a45d3981142636b01cae2e551a96286912ed4793223a4391d4e890ab4150c024851230f98dbd3a5603a8fb8fa8a9a561e69aa9ce0545c65686bc90a8a544d16b617f91d34acdb64e96d2685bfaf4d912ae8577d561df76fc9720e00f345721f954a132d5dba937d6ea84f7507ae2d6a24a43a3d50f5e2c96e3b9391bbddd47a372551af06908f380a492d5257dd19e59aab7bfc0a761a5f779115df566fac88f4c9dcbb79ec34e62aaf4493e8920b31a1ec5037cf5657639d5f5afed5c5b0d5a0af5628a0acd960ac9dcb3a9757fa1891b2ca06f33f2988c32abb4eb7667690285d702ba12e0ea391aa32f4e328dae8a0cd3609acba753d865158ce07c95d0ad13407a2a1ce93257109914f0145086b32aacb31bccd2651ac32b34242b0f8c61720b28f5204d565c4a821e8ba7033e94b5d0e51244e8a1f0147ec47ba075cc94b9ee43a19c2bbc4761d02b437012442d8f325877ddbf35caa1484d37e89d0baa78342c25a4bab3435b3c4b92bba54b9cb4bf46b853af13a34823a71995d190aeaa95f08bbe9492fc681cc9df5644d5caa2bae92294266565587719545b90b94e84543aaebb124fa2771a866a4a2d5d1172da50ba4b79e3e87f995e62639eb427cd8f0dd6ac70e6734d57a9917195cb717417bdcf7fa883a3f9f220045a1ec9d8575802b799828ad0a928cd64cb3933a14f96bc2a5d4e19a1196caecb0cd8e0ae38004c9b0d287cf9b25c2e2cdb3a8f9431ab91fd7f11e490796243318d2d8087e8493eca11da75e239f19a944f71cc92d1efd5859f32569cf2a514578e70d9ab945102eada95e7f3877ddbfc272baedf31957bc8f88df5d19216b91747310bd611761a4259afb8856396b4a22e241924bf788546528f0975487d0dc7c35f629c2dc9685d6844a2642abbfd1b3beab5c20d06a1bba2915ea8f29c7c18347f56f6d7c8d55d9e52553947e856d14eb98d70ef5a864e573d59c34aa7dde14750c2d3d1ed5d82dea2684a057823d4de39a47919cb8c33b6b2a6f51c4f418ae9b81ecb199b1dc5fa53d55c96aa9deb53241b1b9cb3711c2f3440be454b2326c526820f1b1bbfb4247f782f3bc5dde1b83706e0dff0042013746e0dc1b93725f247f8de84c976a4db0c77cb4692099abf9e35f03258d72a08719d9aaadc0f2e5d037cb0ee1b8927b72492e72dce439225edb777ee43b33b837941a54a6dd8b910ecce058a8d8b02bd291b9ddc86882d44591216cecad5e8501779b274fda3dd51ad2f1e6c410b36f5fb576ff001aed2d491575d24af13ec1875f77bbe3823775a79f50f4d0b24b8ebf9e7fd274499eed4aefbca2e12710871e51f4650a1cdce521d94ac4170d33c29dbaea89d09c0eb852f71188c3499cc3778ba759ab6de4688d37a35705358bc5bb3a429fd0f32b0ab174297e27e4b33a33791340d604bb92f0d7a2031a54cac508d328de1bc8de46f07ac8de46f21b391da2c2c655b40f319f33791bc8de46f23711bc8de46f2c06c318ccde46f23790d59a10849ae069049b8897c4bbd7fd3001ee85471574f09aa1524aca21fa999f0e1aeb6204bdea92ab140df92f8340d4bb6328239c7e373248f7216c217e5de7d9507abf52b0de4a0a58b4dd26424a522172154cc786cf05fa472650ff00567d59f547d51f547d60bf94279bcb015027d78893c214673ea0faf3ea7d5cdc97f563fe1954aadb946c7d144252d5da70f0c8f32e68ab5ee2affaece31a4cc79a50c9b3f9821cbf65059097e7e22ed81a792f32ab6cae4712e05d5e84e4af1294db6389ca70ccd26ccd7d88ca43239e812dd364be1a27a099b40e49d84712d5b61947a1e6ec43fc35309af0c1eeb8548ef3952e3d8872d1b4cb82195b7b66c7d8757c4a7b25b8e2d741761bb022e01ae519e66099e9a5f08eebd9ea21757282ead828a5f2c91f70f9352e91044e5b1cdbaba8f6273c8a675436ceb0e028d81a554be32f0742504d56df194e5558712119fc65074915adcbabdd88e23332398590dc6ae80c69d80f2648151baaff009b6249e5913faba211ac578721d6fa2e2bd6b39ffa2759aaedc708425ad4a5cf40acfcec8982e86cbac3e44dd9d20aedd492e8194a8a26e6b9b15dc89e8ca826b4e72c9323505b9a106aee74078a4e7ccd4b1677b136962568a8d5ddcdcbd5b9b52b5149e21214a2bcc729f19297ecb4828db3b086da492cdd523023449b94cd84137b8a989b2a66e2094c592a9dc7e5a56771d8ab86c52d0d389b0b17e960a68cb2a5828d7277c899137b152a0f3f02980d732c4b474b754caeb3b551393524132ccdd40aaed66ad8d1082bc7be9039f0ad3ba92a5eebb0e7499094a59ffcc8d1bbbe0a9e379d2a30eeab3424cd23e1278d5d46a24fbdd25a5bee52b726bdd8b75b699edb8cd1708569c069bcd22942b705ba63b19eb915faca2b7dc72b6b48e7228e652ad3d4999269d4992798ddc85249d4af24007272dab98cd088335557fa1f4396a924120b61dec3434cd22b526291c22735eda54bf4abea8b9e63948932a91358b37870555ac36e048dbfa9595f2c156552c9bf71b8215c4d2b85acdec505cd044cba76a82d77548c8c11e5a5474e655cae1225eeea579ba7e444e467d62d594f2b5b180940ebb0a3576824918e6614f0ced2df42607855388e5e78b310869d1953dbbbfe5a58f90d6bdd99b559042d94c6ad8459113844a8dda121e56729d0525752070a8de75392d039737756aa1b1509248e6d8c9773b4f52f276d284daa74ba37998b513d7cc2e7a6de117b5e8dc96e3add4afdcc6318cddc5a5d61c439ab65426ad564473144f9dc7327b5dd04461146b7cc99f686fda49744d934c4b3bd8aab550b202f25d6c9a6ab1c5731caad048d8fd4aa69a506facd9541ce0d0a20a82a2cc759823d4f17b14be76a15b8c99931d7ee56cb42cf88e9f0116ea448b9584d6ccd5935c9c8ca49a0850264ac2844102dadce5d39617cdcfc0cb7534853160eead8f3158e6149db5445d9efe8326d1b8dde4bbffd9e30310e79a761b96d56d4afd16adf37c14f0e5b341b60392eadc45126be416578987248b28c124612ba7da2ec23296d0c5ef0ae331b9e74373bfc1e69f83c89fc1beba3f83757bfc1bdeef837bdff0006ff00bfe0dff7fc1bbef2bd61e24442a9f12ba6fa3100f3aa9b588517a7c4396db0f468a0a761c86364e8a35e04a06cd2b26a5d50f44c950e04fda63eab951d45a68f4541294eacd0551d579908a193135921ea955a8d18e58db5655e8463e6abea51c73041a2ca4946f06af2663249567ebdf8cc16ed9e3bf69b64301ab3b4cb842a2dac702dc512126239e3d073aac3c12d0b59a12e6c94a68e5a4d7358dcb459f4118bad638b27cc8a740c8996d4158824dce924b3a14f70e07f5ece891ecbe66e2ca0ca7111a79d877f4f9995481a79715ea8ee5f9ff18a14fcd65d2473f42e7ac3ca757c8fb99f7b3efe7dccfbd1f723ec47dc4fbf9f673eca7de4fb79f772711598e3fc3e0c3c08231105a968b06675f81f5c8655d0910159b6709fa8ca514666fb9285ead38dd37e33de0d529a7cbec6b0d7eb52bf1189f3c7243534e4a3313cfcc47bda1aedcdd14acece94ac8a7bf7f415fc4fccb9a31ba2439b972e02160c4108208c69747e47e8e8fcd182a8b52dc59355268425e6b7fc575aab7c7ea338ea178a1dcfb0651770e1f0ea28cf21716224964b5d11d40c6f065cf0f3da195f02574a9b12fe91e1cd3d06f72e0f923dbfc396b16087f839bd582fcbde7e37e958b662f052f46ff09e31b66f69b160b2f5be9d4b3a7357aac2e045ae9f8f0f78ee88722fc8c8b1e141b6f1e936c0822ed926050b694c2e5856abaa9f743ac7d7f426b418a6f72940f6f6ce9c0d7e82e4fc8871cb88ddef76210843c0be9dcd18b66c33619b0fa12d191a19b0cda7e9cccefa73ea48c92d5fe68c1605a9662f16abfec5e9a358c8fa43ee4fee4ead56e783f4181a7d1622d44344d9f786e783694eb0090c8a7bc2a4fbfe8a8a0eb41247b2fd6892d30c530da4f2ff00d17ab929c844372eea5741c9c8a88e1c0a93dd11eae2192fc88ad5c92a711fbbd51f462d3f417d566dfa8daf50dff3be0fe47e03fe37c0fa8f81f41f03e83e07d67c0fa1f81f43f03c9f81e0fc0f07e0783f03c1f81e4fc0f27e0783f03c5f81f49f03e93e07d27c0facf81f51f03e83e07d2fc0f17e079afe0f05fc1e6bf83cf7f078ff0003c7f81f55f03e9be07d27c0fadf81f59f03e97e079a7e848f99f065dea13fe8799336dd060d0493118a9f759784ff00c59973be722a9a79935d8fd98887e47f07defe0fb5fc1e49fa3eff00f07ddfe3164db0db0db0db2da2da2d92d92d9fc110842610cfa71f403e8df8b1c0f7f252f9bf83c7fc9e3fe4f07f279bf83c1fc9e2fe4f17f22fee7f3178f1ff0027c2f7c9e132731090892597fe73ffc4002c10010002020102050403010101010100000100112131415161107191a1f081b1c1d130e1f12040506070ffda0008010100013f10ff00fa6eb479b53de684dcaf9167c13fce7df3542f5bbb69f63758f47765365feb22757eefca57e03e4c5cf5c0747fe41226875f567c43f33e55f99f2afccf997e67ccbf33e33f99f3bfccf8cfe67c6bf33e2df99f2afccf8b7e67c5bf33e55f99f26fccf8cfe6507cc9c3ff004d9afbdfa07d1f79f18fccf8c7e67c43f33e61f99f2cfccf9d7e67c6bf33e45f99f16fccf9f7e67cbff3ff0041a37215e853f6bd061ffd05d80eed4f4bb6c9b85f57d93dee6fcc07bb547cf1f689fcd334fe54cde1f947be337f317da9eec12051c71b1b1a773c6de87d4ea423a3dcf1c2a0bb777b01621845452f2b1a1d62b8f497fa4bea5efbf32dd7515d6267a1b364f8e7ea5ffb8fd4b12a86db677353e462b8731252e5db98b7997eb1456d3293447226a5ece22e09d1d98f5e62cc2dcc7a9e02dce19fe023fe64b56b2f6c546151862e2c52ea23413918ebcc8f777ea0ff0028a0b5a3ab3eb03f9667cdc9e69e957f9613ece591c8fdff005c7cdc7f49ed543f7b9afbe4fb29cdff000b9155a9d557c30bac1758284320c2081831ff00cf384146f0ae064767521d7b1f1be9d094d951d95e83f731ebd07ee763d07ee219af67ee740f41fb8d993d9fb859af67ee57a7b3f732feafdcf8abf72cebdafdcedefa7ee2f5f6fee7cf52ee3dc9d9cf991ff7910e3de25fda1fd4a6088df74117fedfa9b67defd468cfa1fa416c3e9fac16cbe920ec26d9843b3746c00c900aa6f6e1cffbacf941f8bcff005452894d9fee208f0be5c5df51bc32359cfb57bcc7bf44ee7a2136b2eaca9f31d7f925c549ab62891337d589356ed0e1095832f2de338e38e09048e0c1f0b2320c183060c1840a344f0af7b5f53fb871ed69f05f7ad747dd9a67d2054097af389c3b9fe1146f30c35986c2beb14ab618b86add5160a170ef5e92a21b84869ef00394e944489f6fc51950b752e71f4995a753271a398183c3ce729cbf93dafdc9f29d7f922f6fae3ed5ece47d4e16a8cd11e138ff0086306383e07e0120f84e320c7060c183060c1831c184102f854f80d932ff00d0ef074f67d5e7fc98cdb88d1be9374dccf776d63797ea815216bcbac068014d0c8b9836072ad1eb1096149697164466bac808b43c8f0c214318805f32e2accd0441cae1138518b6059b0a600d79b1d42ad6f4a23dc463b9d77518aa3a398f16fb9e92fa70d1dbacb11ddb7c89914c04bebe53162812b860d29a434672c6bd1edfdf97fa096efc7e597fce883f34f3c3ca3fc9cb9bb63f2873263bc4ebc966a43560a2ab56df4b9fe6e5433c78f76dc53c3dafdcfe50947374d611e11e11c8f0c2eaf0151c01d784e1c6ad016d4f7efe28f8060c1840c1831c64643c11040c706383060c041830810c4ae0f59c1bf550d21f16cc623d78eb2bbee5169a3d600d649821dc0a48c1066a8b647b11db2aa5d38cf780a171140e911348cae6d8b2594e597c6d6ab9790cd57991452ec345c2bf4c6b995c95a1bb631d2a52dcd1ab305f53d51bdfa52d818eced2a8dc2ae26ae4f652c710416407a3c239b7c42ccbacfd257802b47698b52b0f04d4cf51e0ecc5e22819a4104f27f8475633fbb80f047b5fb93e17aff2ea942d768e5d4d09f5d84c8fbbe705765d3ae4c24bf7be48242060c6cb416383081830638e1e2a20f0574183060c183e20bc226186f5bc3eecb22dbc1317dba6a03294712dd764791410e6a611c1ef2b62c0f482c04aaf5013a0944cbcfee4325b4a685335afacc9aadcab894b3b950a234938caed40c79f3efebd65cc694898b46bb94b49cd472807a270c2aab51e0daec05cb985ac012d8f930a629769aea4638cd73516de0775cc48a831d63cc1ca97dc3d372b3989675f48e0e25b26d3da0235994f7c8c9d7544962004aaacbf0cb072db5bce55baade478f09bab067f8b89dbdd403fe060dcedf7750a650993c3dafdc9f11d7f9bc1a99b4f90e78ba966f0aea1c3647c8df53fb8c750609060c17c0306103083c10c18782207c2183083c03bbfe408b24141ec43eec44072f68a38cb1788f7f04167814115b5f6e50bae3bf106ad1408dd88a54a34eb510e7b302d31c0c1a96de952f420b5f881d60c336afb5109c5595b6c57da114c0a801402fb5b129661822011d5117b0c4a916caf9f86039c141c47b3112882dd98c99bdd42da115e38ad7bcb1f2be20b891597d4461d0773f301ad9eb0015d964b8ceb2d5b876531a951af309e052ad7cd4c14fddaf901d91ddf561ddf523fd58ff563fd58ff00563fd58ff57fe1085df0efb1fb93e23aff003c6daf58beefa2ae141355abc9fd3c4183060c183060c183060c1f08820f151e088141841ff60086180029fab0f1d0515897c149b3bcbc039cc1c04ac5e7070f3ef0b2c0c483187585dd4acab3b5d2111b7b96c71a31be4930d8564bdf9cd69e25b15daeaa72c48b968695f581755c46da335e5d657663155575b7ae7503a3206cad3b601f78483060555a5718b7ed1ec6e9b5774885d21c5224032ec4bd05db99796e351c615dcc4437be4ee98098b87f58b3aa9ae190b6b9574075653ad0cd974b3d089a6fa0400daae02559c22db7e688a3ec845afa8eaf2c2b140b8fed75702783b3a8ef4d7062fa100cb15c51d48a93d5b3d3478861573687d808f1487d20e47a3e1f3bba7c075fe7add6e6043232cf056e89d2f59a7e8f40b3eaba9060c2060904840c183082082083c1115881a02d607a830e07398101dd30cbca4bbc24ba0274ce61e010781e79e7f03b8c02381015163167484513170e0b6f12a3b53ac7cac55cb29d6515940497668745858d784d969aed6409696a80a0ea6bd60683795cf15e72c4cdbb6588048a061b686316ea1cd4582697ac198ef2c8ac536f760b5da655cea88e0aba29ed1246d8245b57bd68b545952ba1bbd4464ae2ad62ae859b32ff00ee22a343ce510d1eb136bae089f44adbe23d2201c22d41b9be18bbddd65d8c0562c96669e6737bd09380ef729ffa8b84b09e4d8f2f1ce674df7b102b35e05eeadd0853f4855558a14a82d556daeb28fb8df51745746399c0dca30a3ef51f0f9ddd3e23affe05e5ae9990d275384e4b216e00592bc0790a6fa666558541ddc14163831c183060c18308208208d9f477455debda5ca48a42df7aeb51ea455d71f915aef28335a5b1075e7d214390a554298139c9e183f800bce2ea67de06aa5ec8f404fca3330d002bd017ead4b6ebe6e85856774f0faca12150eb85881311816f3ed309029935c60f58ff00d5749402fd7f113b4e4edb7cbe92ce82f1d19829762b17e52a0495149ce0c413d5504c39b9d0e05b795f683d90a2a8386aef505550b99d15e74df118c44bee37894919965d3196837de333f5f005dc8df54cf8de93c4857dedef11f03ea628647944dccebe6dc2d1662aff0033cd9b57819bf39360fd23c134d21695826963815649117aa31fc359a62aeb56b1f2b98d5fd873e0f8ddd3e43aff00e1a9e383ead77e7bb1a58e01b0bd850d88e690d2c840c2060c183061041041028416d7615cec4d316baab60b7ea1703d17d210de1104107fc05d0c17f4a0f78d29c1cf6cc4c1445116116d12ac4cad00301bb795a033e3a4205641a898cbaa8ccd2c80382d137e70ce39730dbe135ea553ad14e87310ef3be26e53ab812abe713601b578be841c28cbd6ee9568f3667510c70db70e93b9882a548bd8dc4061a47095a2e52a18c994468be6a98e8d46a5e9ea6f4b1d6c98b0551be38835aa0e13f30b9e89ad6a0cd214e2e542d33415fdd6d8b31bb4d0b160f04b2cf97b61a047def03e5f01bd0545f5229b05ccbde14f0dcd6cbaf726f90c2b7bb388c7b06469615a182544ba4e5045924877303ae4c3037f8a0e0070001e1f3bba7c075ffc5dcf6756e07417e87cc8ec99389a1749d9f106103058301082060c2082082061041e08820ff802156826573aa4ae46690a4c60a6cd76883cb078a325dd5a1ae7899f18cd03ef458eb17002096a1981a3a590da9577630590368ddac876b4cc2af650780c83d0d4bab0d02e30986622322c51a62f156079e3a520f1932a06db51dae29fac540e8914e12ed7d820b22c81672364bd28966003a1a837a2f12c691fa5b364840003d5d4f783ecbe5a602f1b234b1f5ef05d7a0799715f2095b2118a7d09b8e9e0e5ff0028f79ef6c984729f53cfbdc31a024ed75cd813606e3ebdc39a522d6cae5ab84b43efd27dd1e1f1bba2bed7dfff00c53fea81623b2a611cd5971c8ea1ae5cb2c2f6e4bb78d8f725cb841040c1f01041041041040c2082082083fe40c46520c5174ca06557a3045658cdbcde65f2b8552381c722a035585602d5b661088e47b7901cd79cb09405d8cddb820d634fbc1f6205b92b7ace6cd1eccfd664004752cc741ed50c5b336b28292ba887148ce8fb59887251e4c2154f39de8472d1a748b82581da6f75c19c33731d607b25d39989ea580bacb341a10665c21501652e3ae1922237b600e6a143361fa4b39bb91998ff00e441cefc3ba3ca41acfdf70a61cb734539d85eba18f9121a7e2757e87030ba72c7a65f1c36edfb69a7f42f87c6ee9ecbefff00c72bd2b759faa1ccace9d4c7b050fb9b8376b777ee78041210282c1ef060c2082082082082083c02083c43b7348fdccf946b2dd6de9995390157785b62d535da21c8af14b42ac35950eb09a2028bcd00ee2ce7eb1864e1dbea425a163d565577dcb4cf17ca8e9f7b350b9ca6b58299fde62242d8aecfeae5ccdc2018d5388dbe5e367962127e956875804bc9767193a20d5508b02454693a40d5c974d8996c537d8dde880caf7da394cebf31f628e2b6b2cb8ec71f5665a2c9cc1ae473018b4587ac21570798b0f5bdc59ff97fa702b8d042c38820fef712e55c8e2f9e0052fbed43333782d2c9391fdfa65c215938a0daaf2f87c6ee9edbff0027478656c03d87b1a6673aa0a84a038447eb8e905e70f24b972e0c1970820820820820820610411733d258de3c406f17db80218b0d5b354cbc5c596b4e670f2e267f32c46a544007a99cca7e6c6b3051da0c190030662d1ab214fe90b8252567230af780e31b3996b5db0cc8a7308666e364e9396e6e274e90cca75bade65374707973ec405d641ac73f786734d679c1e8b20bd3315dde896a15cc43c12a52a3a74c711d25961505bae2cb2c2e5ebb32c85181fa5fd618c1c595349c4c12aba94a2e62da134606c878ece08d73aff93e777421f2f3ff00961bec3ae0607718eaf51533f35e3d3f9972cf05be52deb060c2060c183082081841030f917b279c55d6441db1061390c24e29d5856298ddc11a5d9bb0c4c52b90cf33148fd65fcb206f8208caa828310d529f21f3ef137790306d8cc07433aeb00022a1772b9b606c5d82017d5ec129b186cb97c59d20a3648be8c744366abce10201c8f12b0cab0520857b47cb90ce9ee9bc119f00caeab45451a7328ef5c2daae2a1fcb6068f1bbbabf2972222c62e89ec6f9bf3810748bb2aa9375712a651bb0aaee92b1680eab60be5995a733818abc79c20b58a47a462b4aa7539d97f95f23ba7ca75ffcd02c6cbd58e368ea3d178559afa168fb5faf0b97e018305f0103081841040c2062faff0079820682dcc2e8970ad91fcbd1872280d72dc0facca2450334243aad44aca00d5aa701fa5a6c7005906053122904c6ae515b20f041d09553e1717bba18e2c2b5a5811e3923e0da2b13c074cc6cc530d95741ddb8ab4e674b751980a1dd534dd4720a8e7c3b53506f57d0a36786ea11d8daa32ba30bda18e94697d25055621b596ac0ed18c1d3a3292fbb5363b284bd50553d71309802ba57b73b941444d14331775ca3bb628d733017e440415814d43573b8e8ed37b93319704c2e4675daff00e06b1daed0f73a45057aed51d7e51f3544a28b3bcb5183de9d5ef8b4d64996d509039b5407bc29f430a562fc3e4774f88ebff8a3d99d56a759fa0b9cb5eeaa68c79097ac4a1688f08f08e44d3050aa4255ee0753938b1a463cc9cf03693c6e5cb7ca5cb840c183060c208184ddb8077625838b2b82746fd5fb8707c5e72fabb5d9e6e65b9521688e0fad4ae919cdb2857d260d770282cf655c18a5042d45782b4542634106aa296edc310868345a958216534e897ebcb61159337788a4b30174894bacbf3d14da4b550d0f3752cb44ece812b47e0caa0ab71b30ca5468facb0bf21163642ab410f9cb2f722f5c42266bec5ae53bc03a2340bba295f520b22104ecc5536981a159d84732a585bb03316d359e72f94cce79c749e9c6ebdc3d65d9e63395ff00805ef0e8e59b09918a276e584d1d0911219ab35e8156cd93cc6f5158035546cbd0558f6659d79b0a843bd58f100bfcd0865f0fc8ee9f11d7f9bb723a2be93197bb50f798507aa54dc81d2576d4f573e3c78231b8c5fa39760c3ebb0876d4690ec7b2fecc371b50b143bf85f82e5caf88308208207c087660b636759f09fa8da430c0a823a24598a8858f5561baa9454a175f797d42b44b7213d20f10ebb69791ce6b86a37c71bc80552de84c4c745aeacc1b590374794b32a59378cafd5966d91c7d6636849c58c1c14c05658fc42e49700658e50f2e25cd981a4485de6bf01d2aae355a57b447f331781015a816c3692f598e18ff0061d6805721b219b558a8dad6a3b5620027b82147d603c51139341fa73de566e5a2b29c37a848d3da3cca1ac5e331f4b662792405679877887fe2c28b07d12123ab4f4613e45535aa12c0aa99744453dcba1199e352affe4c0c8330cd90c5cc5a3e0ac975e028826f31afa2f87e0774f80ebfc3ef1b044b831380fbb50167411fb0b96a2fa8bef7358fd1751bc378d1a37fcd7a71783691a1c87d8dc162a21b653d7943d4804b972e5cb97e018410410410410308bf00cc7714a39fc11f58fe511b67f78ba05c11cdc7236abaee71f5e21bda0b1cba7ed2aed15732ed7501571f0c9b339a37de89a0887a0815bfd1c42d1b6a4b3d07f232aed7c5bfb97b90d632ebbd465d38f3b95b657074cc7c8cddfa18974bb774c5e028eb51d2102f341fd1315b4ae3052e29aca482e5deb135f770fc6212c7030255d429ccf433e90777d66fa9797acc3d7fc58396abf30ef215f7470bff0014f159519264a8e7e547d5d609cc1de55bd455a81a316dcb9c74d800f4805d6d818c74a098f07e4774f84ebfc116a619e3bcd77899e1cdad7bab5ef17ab1d2987c9e61fc8beaff00b86a53dfc576f2b8a2b5215f5bb04ddb9bd108b7549c4d0ba4ee972e5cb97e259082060c2081972e50db391b8ab472e832c0d4f3a95af2dfb4d09c29ae34d57b4260b4a6872c4de99b28c4fdc561d35294c7920825d839bbfcc205f82ba2b56fd65f852ed85e321be59781c1575338795074e9885a581bcd64f48a3447056bd23fea5ee40c19c1e53ace256964503aeff5180742ead77b8c040b626ba52157280a077b70c705e38d129766f3c445d4bb5d5799943acd4d05567ca2c734cee1e51c163d5966b886315f8b0d83ef1354d19beb86bb40c1f0785ddaea2d0d8852022c23e4ce2115ecfe1d0dda1cc68304a12daa00014a8ea0d2290e1309dc80e66badb87c3e2774f80ebfc14129d337d887a57bf0fd46603c9697bb69fa3f496dc2c53f3451e91196762df475eb50db37433ead43fe55dc750ff8da800e55959e481a9f55464c6964a3f21825ad8aac7c90244c1781c4bcad8bc77605539a4d94ecba1577b8fd7048bdfe7dfa398e0c9764ce308f725cb972e5cb97060c20818311dc0f50ed45056755e813dbf70ea172828eb68a792c06aef8b95e583e8c6a57badb675363ca2ed68ab71e812a0e875e5964acecc9d934c0c1c9d593f644300641113ac4707a95414e4e4dcb99537d3cc8996f8d64aa9e8b1bbef03bf92d63abbe59754ac594886e18be23321480f58fdd070e654b0eab04b958bb59500ec245c10734874d59a3d4867d5556939fb421e0c45707481c4cb8960a2516f284e1f1ef189adc018e34d1b8e71822b7ff000006bf708bef053d547b47ae02e8f347183729ab566d8d92a84c463564cce59135364baa50d65e65943f5edb522ed0722b38ed19564b2e9809d1df34abe1f33ba7c075fe3d7d03495e43b2589f87e3f718388b72fc8e3e971c8fac2f6dfd6e39eef4167a9fa9942b7615deb5f582859c09a7d25186e56c38bc17f594c0f673be468c55e4897282653362c4b0fa901ccd657a2a76df763349ea2e7dac7a832d56bb0fcda039872b82a0e5dc5d1d12d9e85a63a82f25586e5a0930d0e654ae0f5ca3cacd4cb972fc4b96c198477e01a8e577d183cdd4a47ab1bde80617eb03f2a19f0e8c0ffb4113c9dc09ceecd17ebe0ed176b215b7d3f743af7365f3ce936cc03fe03eb4f258e28cc02d5e5d71073b18a0662c0559488227719966ba777cb67ac6d96415bcb9fdc753a25d3519e1aba907af11350707b21415b05e58ed8dcef5fd32d93051d9eb33173795788846339bfa7acb46d57807a54adb46cb6d164665cf1e90eb05b2b6f78a1d095ef00ba4356731eb1966d825a25ec2542f6c0ba8eed852b46123e2ad5cfcc0f00667c3c1d2b48c239466505fb0ecb716f2a1b61073a0a43d77a03645a1dc8f48d9dc96828cb555b31152194174bcaba2a10a99787091f0f99dd3e03aff002d9b0611276d75b7cf488299f36bbfeab0ec7606fcc9b208bcea8fbb7ef009115ad694d87bcdb5234dadbe95bf6841488f6c76231a9f4b5fa69e9502f0c8ef2d053d58117d1bfdc23ee82bf4da75ecd657cd8a6e00e07781a7a4576c16e6e79dbe84680412a19cdd6b9246546345497f4564f4e27c12fe37126e9395b95eb10ef89ccb046dfc97f22afd9954e3b10be59b7d9229abfa1f2f9319ceeaaed92fde10ce397e7f4183ed7bfd7c1e81107f7922ec987f3565363becb5960e01a80851e1faac2c7f262d154baf38ad8d9d60045b88e666ab99ee2d3e8cab5c366576ed988f43966afb377700d2757853ab28d806487366d88c6f8946b5d1c6478ed062df0e2034572c0016b6d1476fdb39046ad752f58f5adfa4bece587b62b40f1d62670e0414a97285f693b38af304c5deac37825efb304527011e1b983ff04ed2c0279887d7630707d62aafd33ecc4d42f624502cc1e495e9fc69fbcdb965dac892fc2f0f4661bbbc795faf83e2774f98ebff00834f778a50f265922b8c6f5dfadcb14f66550de0be0214ded198a716a1494409609d876dc6edea709e9f81083284da2c7a64ef14d5ef5287f739e7fb9fce1988ebe978bb115b395e89e7f761d35ecc2fdd07aae66cdd04efb5a5ca59bc286d0fb270c1c44b9639dcc54b4ba0dcccf765f66fda50fcc2ca3d169afad43536daf464b9b37767df1e4dca02acd66f3fddc4b24c3b2f35cb19c61a40f386d63f8eb2c5ceb34137bd9c33672b95ef821334c0057fcee188a55059519bc1cd01192e894f642cf5975bee9fa854c33757b3f489ab89ad3e9513aa0ec12bed1d5304d3770f534e987da271d70a2b1ed2782c8a9e96af022015055f4bda2ddc169cde6d45947783f503f67857da353553b0fd506c0facfea1a4dca9a2fa41474420fc472e3d3fd4dabf3769a9f59fd46aafbcfd4cfbf4ff0051bb7eb3f53bbea3f517fde7ea5dfbcfd4ff006cfd4ff4cfd4ff0068fd4ff449f2c9f18f03f9e47fc79fe313fc02022d5a8fa4f90ebff8a8692cef1f1229d079902a9092b12c437ddb9675ab67f4c9947c5dd80372bc4830d41566905bdcda33afe0d7b4da4761533e60e193d751053a51e4691d8c1fcb0f7431aaade5f06df4d2e349986f841b603b06961193edbd3d31eac2572d671d40cbf4610b05d8ede6ed9751154032bd896712acbc640f9067de5c56bdd1bf39e4031bf96cc6ce3a3fae3924cf0beece4acf95bbdc61d32c000fe0bc1388cb9cf8a11f0aeb1632fde318f497013b6808351a89fa10e9b4c0863df518c2d1ac2b6e6a8b90001e5225d02f111c06507d6ae2e25e25f5964b25f85ff72fc2e5b2e5cd65c1973e23affe5a05259de7d3b01492c10741feef788e1bcb5aea9bf4b95a8eebef9ed140d8a3a72883901d5ee6a97a3b90b62749e82fdffa8784f524f366091925369746e9e43b55a3c8b89d8b500c0302b00ea73f747f43f7310db21a5a0051153433d501c132763bf7350f9cfd77be328c73a1fc437cbbf59cebfad2a925e06659b88e7ba58045b56f033fde23fdf1317e623bb55c0e676fd9fb9daf67ee01821ea9717fdd3fde27fb647fbe27f668ff007d3fda946834d3e8b8a2d677aafcb9c463895b6db9d5c7fbe9fef4c3f9bc39fefbc7ab9a4d1af44ff0bfb82de1d9c78917fb503bcde7313803132d0a5962c3f1530ab70bacdd3ff4b24ce9b2fb3d8faeeda5ecca23ebed44052eacb0bcff0074a6aeab112e855ae2946d0b7f4abd41298a10fb87012a5baff7a005aa0a5f565390742bf958c76a1457480c3dc366361d02877052e80f787915c32436aba8312c29be461fda47fab07fbb3e0be1a4deb18459ff000fbbfec3906d5c5328e64bd18871c99fb2b274b739292db4670523fd5bc5abbe1bbb15f0917c07183a151de32c505ba9185084e0f25908368fc8a60543f8605655dc200991c8ff00eb368bee5c5acee3fa907f69a9870f3831ec42684e815fce569d21081b770a0a2d2d608d9dde6ec8ef1f95c429c42c2d780ccb08db043c1aa197ff009a08ae1c408e0bbb9da24240b843e8050da682624d5ab1bc1327bc3f05525a742198aab433703010d026566e3a886656146dd7f321d264a9063d61bb0cff001de7d39c634412de52230a3aabd909b79ee1f5d5816b80b8de1f86cb3813efa818852b4f5590a652a06d15e54292176efdaa9c020ac0690c15c5c2f1e8c1c7e545fa171f5b80445ef67d9838fc5ccbdba2336fa108ee92b036900be71f2db394c5d4b9f00b451d34824bd9f75007b45f490ba0a6117de8825e999068d001b000f309af205d4ca55b58a8750df53b9458544c4af4d1ea7a456e5c48660de51bf3827d7a059ae2edcb179835536b8f5896fd5b37735f97ff003542ab4195947eb8f243f2a9de191cbe768e845376b18ee2b06e5a818de1b175957eb102812b8bd057759dc0e87b0e752b9e5b8e94a11508cde6cacb89c580802862d6f4d3a85c63add816af82a6a90b2140c58032f10d0c46f92e5c73d25150081a536a5daf78e8ac1af38955ccce95a4d36c5d2d7788680b33951685e5d37095ba5b95a0ed9a62366c90d3690c70f58ab555ca565fe92dbaa1562b44b79a7d600d9484256c25e4d7107389645765739cbeb083aa06d6164f7a18a95ca951d4f6bface0bcc4b4100bce1dcc1e1c5b42d8c562bce2e819f806533782bb7685d2561c6c14ab73c4a0436b3242e9c9011a0a4bb9c99ab04dc7cca5df36dad5e577333fe1a3260db95c46d4eb95702562a268a87b05d3bc46e245c781d9da9520223653c3d2368d09b30a5d91e6336539c29a542f12ab8b68f300d3a9cc28e5b7953345f9c72a0c5483628e71de5becb1698705b2a2fbb02c5b33f42d06482e1b31dd446a957e7da69ccffe657af2d7820cc50542a40cd12decdb12a8e78a25555e576cd1b137415449586cc166632ab738b89ea419ccc6133b7da37001a348d6664fb4337b039dca2b740eae627139412d9b7d20acf3a2cc4a1ec5e2295b6d9a1d00ad23b67c22e40012c39c410a33257bdb94f4c475d82e401561ba1ee4188b68002b5dbbac6253caa8101a4d2e627fb094b281ade30a823091173b51b5e98869da9206c2d59e6bb8f678b25e0616dbc37e91b6c14236f7875332576a5703a008f966714074cbf799e34690e0dceb5985d9d76366f459b13504128da05a6dcf1d63b9590760d8ab86a8f588882b0803497d209968fc5d34a54bc98962155d96d9d45df96202ab028434b0aa6245ce408eb796604283617b0b4eb94f00d7aca5dfe712bd60e15bb30638ecef84f156311d7a39519c267158ddc3b99c3d12d9a0c31864c948b1b133f960b6cb9bdd66d5a618568450104c12a18c72a1482300ea4bc2058f6667bcd8edff00cb68fc60eaccfaadb30470c975d83a83651ed56c1abf4f133f584cd1446cd2b6e6af965c0e238dfb2cf6819540d5417c5f31191549dd4260cd74e91bfb422b5d29cd662e0677478ae919b981a61a3672bb37ab223c899244f9dc5ad8d251e8cc0c04460055d99d4a899e75b4b9d151b311374e1e4d46a6b2e35571e8e346e826ce4e62c8154d2abcee5bcfc4b33bce1c766392b6ae025eb3dd826d014ac6fcc6216ee6b9cd2945f33aa257d63c3515585e16166265f9b1b23d058ef0a9160691ecdcc55aaaaf808b664baaef1f4bd5a5551b6f5125b2d684ab4f40732af0085c86bcbca2a0b615cb679ba4b82278aea5646deba9707606dea2dcc339434887ad693a414b3b13470badecbee0f298c0ca8c03930277235d1dea9a6184a23b626896e3f32a53885510de17b37024a140b099285c219fb4be362a411dd176748fecd7c2f554bf5eba9d71128b81af2ce6a12c5db46aad3551ac9933e5e49730eb8bbbbff031bd466d87acaaf4284d50a55c11df4a067c23f33e45f99f30fcc19bb67b573bff00b33267a7bc5e5498b162c88c1546e8b833575611656d94d1b91ddcdb18479141a530b36d01451ca6a656fb3d06e8212bc42ae57d25ccf101402006a05e3eaae7b45496cb5b6cea1c6fd18e83f493c1ed93d2cccbcf0fa707c7cf9a7fb783fd9fe90adf467fa9573405a155c56ee4dab6cf49ae72971622a6e14588c96a2ebb97015795afd09427d65dbc98948fa0663e88ca60935e3897d2a169a0b6a5ad4bbb31d95ac91726d144700ac12bf81b145afa47fcbcdb662244e82a1506e112552e10183b012bf141a4e6e11163c6c84040f68440d52c0d691462cd928e18ef4aada1705bab6e2c34769ea41296163ff79e55b08cb06dd6603734744bafba4a412b21c91f5b1437c938bc2f41eb967da5879b54b9d71766c12143687a91c4f69e183140407f5cc2fbea86aa3eeca720ea6c507211db9b65dddf8667af149b2bde52cdeb0ae104093742760f39078a7e137a2d102317efca0bb97e744f0d02a4445aff004d81146b396c1487f35c8fd87bc2d6dca040616a3ac3dc5cbf48a9682e635a534143e49f79f14fccf8e7e67c13f33e69f99f24fcc7e49f79d18956a255318e3fa79b17a3247a884292df10e1186d19b73e151de2c5973717d2774a4da5557302607c0b14bafba4fb9fc0b12814da057a19c6a14555a6a37762bd73ef2e73c0b200d865eb9863b84e0caef7bbccc4a3ab6eba5cf69e1aaee2bf24fe532a61e5997e336b8fd0d230e362bdcfbb2d0756e9a2fbd40dff00e73177195f6e535f1d94a0bf5957ab9245f9bb0f15fd3d804eefaf6cf80e9fcb64e85abc119d8183d3c58438f073b1f1952a5a1d1b7cd86e54a95299513eb2b312244f024656aebf62466a27ac4891989f88d544892a24495e90310c60418c08f805e5bb1ef3735ae90d9fc4772945e3479fea314843167dcb9761b885ededc3a3e187ad179a95348043a207e082650c7621705d1f647d98f0f342f251f73c338b71f93777a2913a2b6ed4d8827a697fc898f9ee31eefdafe5534d9734e9c1e28783220b8731194ca6578744da9e5a3daa067c012bc198f06f5cc72cd11a8c62c8ebf708f8371188c4ebe1e72c8d74f02448989af0080b2a6bf07c0e57bd7940f0ff000ddc5aead122cc2e25d293b8b367b52994996f9568a3a36359c24a3fda4c4c1f86528c3bf287a933f8b84bb3967ec207f2c42c0df7731f8895fb779865b2f2d6b74cbfaf82a4301f28be5adf2e902908d41fd9edfa90b0f3ff00474b4c61df07f936726075e046d6d557bbff003dac3cccf12246660606da00de6558a3e8cff09857f8a7f95e04ff001a32bfca9fe34e4f698ff5cc7fae63fd6317fd98ff007982c844428d46567112318ca8d78a3c449519af00981063ff004af6c0577e07fe438d71b55d232af67c5f3e62c35d6dfadfd70f48b4a3cdd38391aebe5b13f0829baf6def1ac1f0748652049f480bc68008e8b1b4bdcc1c8e6e6713ad17aa1c0e508d09764ef9de950d11fd7c9ba3b83bd4510df6cbfac5202ada791a2c554fd3b14e2f38fd00fe4c9a022a5e13c74b63140f8a07de704cff0070ce912262fc57ed35324cd78f1b66d11a78ed1bb49b7a5e8c4fe963fe4c7fc18ff931ff00363fe2c3fc58ff00931ae359b6b235f15a366df1bfe6c1fea64a7e99b367fa59bfd2c7fc38d5b8d78636df0edd0bc3bf73cc6ee6b649e5fa613a43b297fb99d03d1f0c3bd4e5a096f31b8cac4ffe208253923dce237d4adc37af5f6fd37d5d9c8e9cb7420fa10fd3f0aa3e84ba72ec7f2f7ffdef7fff007def7fe3e7f979fe5e7f97ff0081fef8feab0febfe16ec4fb70edcfb53ed787bf328f8d47c8a3e4507fbb1def563bbeac1d5f5e39feb60e491c93397d14e5bdb0226c07d5decc205c4001407ff009cffc40045110001030203020a06060806030000000002000112030405101122401320213031325051617114415281a1d106233342c1f0155360627291b1c224343570e1f1438292ffda0008010201013f00ff0073f45151515151def45a2d168b45a765c5454545454547b6df9fd14545454545477b1e722a3c69292929292d45494d4d49494949494949494949494949493f3823d883cd88a8a8ad951514fbcbf382fd883c7742fb4a481e5b5ea552b704286d8487ac9e9450d1224e9d3e4e7bb327e745fb2a2843690821b7978a7011d9400608691110c96a3ed2ae1b4249c093812d09417de8a8f1479f64fdafaed2138a0b92156f5c95d56fad1f3417652475a5b29e8532da55aa46222bd2493d725c3127a8bef2971479f64fcf0bf63c54644a042a910c648c551aa22ab98918ad76538ed2990ae16480e4324efbc327e7c5fb19f64508c45557f6501a73965a6d2e1629d6d277545f607892524fc4babca5694f84ae4c22b09c72db1323f46d7674e9f1ff00a57b7d42ce9156b82d0593fd28110e1bd1aaf07ed47e3d3d0ad2ea95d511af44b517575f486852ae56d440aa1b74b0b6ba79bab2c7e95c57f44a8054ea7a989b4d7cb2b9baa56d48ab572d059063f735c785b6b3320efe46d7c996178cd0c41c800484c7a449b476588639e8b76d681488c9c65c9a746ba22fa501409bd2e81d317f5bb727c133b3b487a3214fb80bf6288c91f593a00d92c8dd70a487acb5252a89cd51190eca3088f337985db5e1815c84a3d1ddfcba1d7d1b111c4afc47da1fee556805568d41676e9e54eeccc445d0be868470f721ea9193b792c1ef28e1b7b756d7af022372677e46267f1589dc06237f6d42cb6b83391137433776be3962f4bd3716b6b2a9d4667376eff536516d65a72aac621f488088b4faafee75f496fed8ac8ed8498ea1f230b72beab0cb62b6b3a540fa4459be190a7dc47b01f3920aa42a647b28dbda4e684648e9ecae08575538ada559ca2ad2423b4aa165151e3fd1cff52bff00e21feecb12ac78ad42c3accb61bed0ff00b5bc7bd51a216f4869d36d04596016b4b1702c46f466444fa33f2b0b7733742c76cc30870c42c761e4cc42dd04cfe196226f6d8f5b562ea98b87bf97e6caeed695d522a35baafeefe8870ea1618ddb53b6d59884b5e577f578abfb3a1778f852ae2c43c17aff0089d5d7d16c3e055280f066dd042eeda2fa317f56fb0f0ad5fadcade7a3e4c9f7117ec077cc5b6a24ae7aaa912379640449d88b6b39292889127740f2143cce17851dadddcdc9133b547676f76bf358d59dd5d5b701687077e97f05678762f674868502a6c2de04b0f0be197a690bf7475fc553c1aff0faa6585987064fac4f5e47f0d136097979582ae2663107d58475d35f1d72c570ca588d0e02b7b9fd6cfdea950c7e80f06274cdbbca4cfefd158e0f5bd2fd3ef4e5534d1b4e4116f05886177a7880df5998b3b0476b5ef77f52ab8763374dc1dc5c088bf4c4797e2acece959d01b6a3d51c853ee42fbfbe66e444ab09080f821188e61d5553aaa393e429c50844508a7024e39477364fb98befcea39197b284c8494b2742525322a7b5918237c9e222a484c909feeae1463b29cc539ee8c9f7417df5f370423112920eaa8a34028d098a31d94e85d75908a7d92cb58f594b7564fba0efa79454d394908c72340714f5175952724fb590a14e2bf751c8908c54b7414fba8bef8685d0be52422a2beee6e281e22a2a390e4e287296e828b7617dedd45473743b393ada15d64231e20a115b29d1eca142fcd58d87a54b6b4d13612328955664385017fe564f8687eb5bf3ef4d8687eb5bf3ef4d8687eb5bf3ef418389756ab2bdc34ad458a5ae429f738a8a8ef86f949494b27e388e5243b4858a4b52190a73908928a8f35841469d52f2fc5199114890ba0623ea8ae02a787ff4df35500c3ac3a203588562ab66045df9327e7e2a2a3be478879c78eea3c61746428da43ce617f6357ddf8a756d6fc210cbd6fa20b2238c8f939393c1df4f24f86944aa097272f7f432a8034c6bd3fba3d1e7afc907595d1eb6203e3f3c85173515151ec5351e288c93e4f947891c9f28f3986fd955f2f9a756cf311112d0c5f56d7d69adb101ea8f7777a9f56456b711faf7116f1d3e0aeae08ca13936be5ef40aedbfc1879fcf214fcc3764b8a8e51ce5c471ce2a3947271921ca3cd613f655fcbe69d3d9c4f82972b74f868a959116d09727bfbf4e8552c5c038522f878e9d2a8d9155eafe7d4b48910aba2958879fcf214fcd4bb1df28a8e51ca5c48e52e2ba14ea594727e3617f635fc9bf1c82b55a9f5bc9afafc7cfd48ea570eae8da777ab47f9aa8e64118b7cb5e5f24c75004642cecc9cc8c888ba5d5d7f910f3f9e429f9c929760496b9493a8f11dd49464a3c5774e854b39292873582fd8d71ef66fc53810a0aa42314fc29fdde94255c7eea7aa45f9f7a11578c4366025dff003c85173d252dee5c61e2be4e2a714e684490a9292964ea2a393ada92d0b9ac3af42da521e9d3f1552feccca440ff009f7a6bac3e3d42fcfbd0e2d6c231162f87cd7e9aa1ecbff26f9a7b9c3fd82fcfbd7a5d9094841ff3ef57f7c15e9088ebc9ff00390a7dc64a49d0ba1dec78d1514e1251c9c248422b825050515151514211ca2a2a2a2a2a2a2a2b4515a28a8ad168b45a2d168a28b749671e7e4a5cc8f653eef252cae6a900110ab3afc35262e3ba9297383d94fbd80880c454b89252e7c5bb29c7b3dbb1e594b37ff61c737ecb7fd9b7eca1ec68e51de0f14ba975ff00a2ad74e367c30f4e8dfcd5b6277352a8011723bb7a995f5f57a173196cac56fead2aa2345fd4a9b145a5d3ba0f3b1ca2a2a2a2a39c77c7e7e1291777cd55af2b10a7e2ff000ffb56a11b901f1158fd2da0a9ee56b2b9ba09787c1bb31fb1ae71c11d9a03af8baa43895ced4a2dfcbfe55a0935219149fbf2c369f0a663fbaff82a4246434bc55568e2423e2df82c7aaed053f7ab1950bb112f2fe7ba0f66bf1df993c5ad86a70525734bd0ef06a4765df5fcf92c406ad7b90a12d8254280d0a6d4c7a1b2c0bfcc97f0fe2cacedb4bf21f65ddfe4aaff00a9ff00eccae9fd22fa3e3a2c5c217321f5e8ea914c18bbff00601f987e2d6b83a0722fb37f82fd2d69edfc1d7e96b4f6fe0eb103b3b9da13d0bc9fe4adebd22a5e8d726ce3eae9d5be0aceea952fabae6cec3d0fcbaff454ea8d5190f4654e85207908b326a40c52d3953db529f0916d535b511790836be4aa5bd2abf682ce80184623b90f1e4a4a4a4a4a4a5c79733252e7a4a4a5cc3bf6349494949494949494949494949494949494949494949494949494949494949494949494949494949494949494949494949494bf67bfffc4003d110001030104040b06050403000000000002000112030410112205132032212330314142505160718114405261d1f0153353a1c11680c2e1259192ffda0008010301013f00fee5a3b11db8a8a8a8a8a8a8a8ac0945454546fc2ec160b0582c3b54794928a9783076dee3c851e94213cc8ed24282a890e64f584509490de2124e373f81476a4a49cd3988ad727aa069ea08092d7aa158490d51426285d09c53bcb323796cbf2efdaf15d550927a02aa598551b30c0bc91d8057b18a1988ead59ec639897b28a1b30ad48a1a4bab151f747ed21d992909271cc8538aa23949619902d5892d4c508e6f797f707ec2152d87cc80538a1142b1caa0846e8a7df2d88a8a1d81022dd5528906f20023288af66eac9b1440e2f124141dda45c0c8e8388cb9dae0022788ad408ef132a9448153a32194b05ecd8ee933ec37688a8a8dcf95021550e457526122434c628c875774508c954ca5990d591722354877557fcb042e4375ab7d540231121ee549a14c88ba6ea4f0a445d3cd76299b88f5567079cba19547913976a0df14e12518a151b80e249eb12c494aea039d5a6244a90dcfc857fcb0b80755c6173f4277c5d5737a5c58f02a27ad909dd4b35121404e2f215323a45240643432f7a0b49f5b855a0040e237b76880e5bf1caacd988bc9541242314e9c45090de376314232460225953f2352a48447b951311291223a44522c51c3aa9ea818f19ceb5c00d1a6d753a8e05214ef40bbd91d518c079905408449354a43984519b9bc8ae7ed207b850888ef2a4e2465f34e722bdf7906f2174f99028a742e9df32375ad5252f0300c93dc23f1270121437ba71cd703a01b84488ae311474cbe24f40bac8291210db8f6f80e54f70ba77cc9f7ae0de46853812a5bc8138a190a77439854946570ed46e7edeb3ca257c508ac657023150b8c505ceb30a1cb706558c90ec8a927e55fb4ace8c0538a8a71146eb1252be49f79494af74242bab7089765bfbdd238ac488a49de5e685d4903f591e62caa285652518a77d874eb32154444c90865ca8c23c9690d20f648c4258e2bf1a38b10d277f5ff004bf19abfa0ff007e8bf183fd27fbf45f8c1fe93fdfa27d275632d57eff00e91e9b20dea4ff007e8ac1a4c6d644223861da94961d69270f854138dc3c93a771d5a71128920ca69dd6b2428c73723a71cb5b4047a71fe152a4203115146e21bc4b5f4fe7ff0097fa2a4627ba58aa819568aa034adb5447bbdcb158ac7b0006574a24a49dee8a96d494ae71927021422a93674f7c790d30dc7d0f37fe10ab55a60251e86c51db442510efe1f9b363e687490c844878783fedd523232a153ac5cfe587d554dd562a51d2154bbdb95c562b1ec5a573ec3ba8dc370a7d995d49e2576229f91d2a2255e84be7fc215691811110e204d83e1d0bda6c05bc5dfdfd2d83a6b4d9a5c40913fcb1fdd596808089422f879fa235633c748551f97d3b501d0bdcfb62f73ba95d2534e84a3749490ba775252dad395615ecfe6ffc214d6de2f591e07e6f9e2aa5b444a243c3e9dd8f3aa56d13a9ab11fdfe58f32ad6d1a5bdf7d2b190892b08c74855f2fa72b1ec71ba49ee95d1e49d0def7623c8697095a6870f363fe373d1a41c5f0e1d1f2f2e9414681ef62f8f7f4e2df4548006a4a4ff005c383cd3853322893e2e84040444799958dbfe4aaf97d2e7e570ec51d98a8a92deda96de32597623b3a75c46bd022e8c7fc501890c938091496b2cc05193707cd39d98badfba10114eeac06256eaa43ddf4b9f97c147b087606f84900c5198edc94ae115962a603d54e52d896ce96d1a76c208961863dfd387d150d1b6ea14f56351befd13d93497ea0fdfa23d016b3a9ac221fdfe8bfa7ad38ef0fdfa2f63d29faa3f7e882c16e8c6a5467fbf25a3b46959aa954226e1ff005f4f74c2f8f604949494d0d524e72b84e2a49cd494b6249ce57caf9292c7b0b0be5e1ac146ea21328aaf4e071f0d39116f6d47b647c2d1fedfdeb9fc49ea7172415aa110aad5084d57ac42f953785629cf8a11403c60ab5373120ce63e123b4fc2875a6a9eedd45a445e4873654ff9cad4fcc2a965a9e117af4e51463039742ad22311e8401118dd66df54c38d45f9e8f3d55696c0d33e2de0d33212f92d7d3f896be9fc4ab40fadc280c63122548c47291212c6e1166583280e32506ee44025bcb0f7e8fbcc6e8f87f0587897ffd9, 720, 340, NULL);
INSERT INTO `imagens` (`img_cod`, `img_oco`, `img_inst`, `img_inv`, `img_model`, `img_nome`, `img_tipo`, `img_bin`, `img_largura`, `img_altura`, `img_size`) VALUES
(2, NULL, NULL, NULL, 2, 'desktop-optiplex-3070-micro-mlk-pdp-gallery-504x350.png', 'image/png', 0x89504e470d0a1a0a0000000d494844520000011300000190080200000002ef1399000000097048597300000ec400000ec401952b0e1b0000200049444154789cecbd67709ce79d27f88437bf1dd0dd68347266cea4442a5012254b56b08265d9637b9c766ec6de2aef7acab335735bf361f7a6e66a66ee3eeed5966feabe793de59bf1791d34635bc996682b5014c5041220114864a01b9dd31b9e741f1ea0d900414aa232d03f76a19a8db7df84e7f7fef3ff0f8510a081061a788f401ff70934d0c0a7120de634d0c0ada0c19c061ab8153498d34003b78206731a68e056d0604e030ddc0a1acc69a0815b4183390d34702b6830a781066e050de634d0c0ada0c19c061ab8153498d34003b78206731a68e056d0604e030ddc0a1acc69a0815b81f2719fc0a71137aa68821fe95934f0b1a221731a68e056d0604e030ddc0a1acc69a0815b4183390d34702b6830a781066e050de634d0c0ada0e1957e9fa8f75037bcd29b089b56e6080004007ccd4b082604bbfef3d5df85752f245f42404208e7cb5b0a21de4f233b46192144be775df796f7d3c08707b8593b158aba9f000020ef83fc09e135e901210400d5dfa5fadfaef99c51c638539455925c7001008008d6be2b7fde689f00004208a55408615996fcc4711c5dd7ebb75ff395063e626c5ae6d483836bccb9b6b2259657799dd4817572bafe732100c20000e03abea6690080fab50daf93eeebee537000a0a89d8053f54c4b5ffbcdbaef5ebfdb063e1a3498b38cf5658e807269be1be6702eb8e01861840167d7f6c9c535666a9ab2ee77ebf7c9194018302a1cd709042c0080ebf886a9ad73ce7ced771bf8c8b00199c328c30a966f104684108cb0fce45def4130ceea5739004070200410629524110250ca7cdf678ce9ba5ea95452a9140020168b2512310081eb504d532004105ef3201022aa952a6594ad7c97108f324a09951f8e8c5ceeececbcfbe89daabaeab439031036a8f289c006670e4410210400f03c4fda0984304699e73b74199c334008715dd7f7fd6ab54c28f17d9f5151751cbaf2b9effb9ee7b9aeeb79deca5a279451d77539e3943146693e9fb703b6ebb8a572a939d6bc73e7cecece4ece792a95f27ddf755de942a0947a9ee738cef27f19e54cca8e651944086b8e3597ca25cff3fee44fbef5a52f3d030028e44b8140002b0ddbe693820dc81cceb9644bedcdd5ab574f9d3af5fa6b271867f2b9ee791ea38c50c22853544df06bae30210465547001210675763c84cbf72a100850ba2c1f6a3a9e104270a1a84a3018c458191dbd7cf1e24542c8d62d5bfbfafbc40aa4c74c5114455128a5d27900000090d754444dd32a958a6999c4278b8b8bfbf6ed7bfa0b4f3ff6e823be4f354d91a6d435d746834a1f13363e73cae5f2b3cf3efbc31ffe301808afde10813a936665f1738c30c61822487d2e3f1142689a56736731c66a2bbede632684f07ddf344d4ae8d085a1b1b13101787fdfc0d1a3476bcc29140a841084906998841270cddb26a41c638cc903b5b4b4e472394a6930182484c462b1ef7def7b6d6d6d89d618008d30d2c70ffc377ff3371ff7397cf0a8f101428891fa831ffcdfaeebe9a689142c5f847121900090036e5826e54c33f4aae344a371887126978b469b1927c1a61080c0b24cca68c5a9f8c4d70d9d71c601777d37da1c2d940a8492502898ce664cd3105038ae63987a36974d67d308e37053786a7acaf5dcb1f1d1e1918bed9dede1a630c4d00e5886a973c0b3f9ece4f4e4ebaf9f584a67355dcf178ad1e61856158cb1e33a1c80b6f6f662b98414fcaffff6afd333d3ba69c75b5a11460002010184800900e0727c8a320111a48c61543386f84af0aa21a73e486cfc1c0208a5b18344cd992590aa5c735551426cdbce66b3baaefbbeaf28b8adb56d6161feca95f16432a96adab6ad5b3b3b3be3f138672c9dc948b54dd7f5a9c9c9783cee13323333d3d9d959751cc1390000610c110200082118a5854261f2ca446fffc0934f3e6918864fc8ccf4f45b274f4663b12d5bb67477753585c3ba668e8e5e9e9898d8b67d7b4b4b8baaaa1313134eb51a0e87cbe532e7dc324dbdbdfdecb97327df7aebd0a143dffae637b7efd88200e0ab7ddf2a864c00cff3d4954050031f12362073ea050e00006180158c1166ec9a1b18c16b3e2bd7754be5724b4b0b67ac54aa5eb9726572f22a84f0befbee397acf3d8b8b8bafbff6daecec2c00a0bfbf7fe7ce9dc562319bcba98a6207029431d3345dc7a18c71ce8510104205e365759131ca1865ecd8fd0f1c3c7830d6dc7cf2cd37af4e4e4e4c4c544af9743a7de5ca95fdfbf7efddb3c734031d1deda954eae48913d14878f79e3dd25387b1e6fb14210500a460dc1c8b9ba6357975ea7b7ffee7fbf7edfbfad7bf7e60ff6e795552e9aeb89e69eaa665aeb9272bdef6e51bf3e1dcf8cd850dc89c1ba1961a030060fc9aa160d9b610221a891c3f7efccc9973baae777474f4f6f6fde4273f515474faf4b96f7deb5b8cb1423e7feaedb7c7c7c78fdc7147341229954ab1582c93c9082112adad994c06ade407208c218482732038a3f4a9a79e3a7cf8f0d5ab57ffdf1fff38994ce6f279ea3b56205cad5430a56fbcf1c6d4e4e4edb7df3138b8251c6e725c776969299fcb69aa6adb36e75c55544a48b5eaf8c48f4563aeeb2284fbfbfa32d9ecdffdfddfb72612dffbf33fdfb2a50f422004b04d9d30e1fbae6dd6c883aecb1e6ae003c086654e7d4c535ae79a7eed494c7c567b6f9a3600e0873ffca77c3e7ffffd0fe4f3b9743aed791e84d0750925c4348c7038dcd3d3e338ce5b274fbefefaebc78e1d334c33954a8542a14aa592cfe52821d28b8000f03c8f1202008008ebba6e99e6f3cf3f7fe9d2a5c9ab57354da3be0f915a2d1701c408214ac8dcfcfcfc2f7f99684decdbbbeff6db6e5755656e6ea152ad608410429aa625938be17093611a4b4b4b08a36020b8b4b464d9b66ddb8bc9e477bffbdda3478f7ef98ffe68fb8e2d940308a1611a1ef175b5a691a246a6ce078e8d1f54131c082eff5d7ba97550b0f2cb5ffcd2f3bc9d3b77cc2fcc8f8f8f73ce1da79acde5745d8d44a3966d134a354d8bc7e38f7dee73c562f1f8f1e3e17058d2b25aad228c4dcb8210c215bb5c088130d675ddb2edf34343bffffdefaf5eb9229d6f60d91052b0a2a0e5d41ece28d1753d168b7a9e57a9547ddf6f0a87354dab562b9c33455529a3957239140aa98aea795e5b7ba7659ad2e7d6ddddfdfaebafffaffff93ffff7fffe8ff97cae5c2ee7b2d93ada34f0a160e333a706c639e37cc53fcc6b0e83575e79d975dd818101cff38ac5624f4f6f341a1342388e8310d0751d42a8699ae779f95c0e21b47ffffe7c3e7fe5ca95969616cff34cd34408d5529baf4fc4ecede93974e8507777371002228456f24139635c08ac28966d7fe98ffee8e9cf7f3e12897a9e77eefcb970381c894419e782434a85a95b4020db0e150a2521a0a619d94ca6527115ac2e2e247ddf1f1c1c8c3435fdcb3ffff3d7bffef59ffdec7f82867ef6e1631331473246f28752462923841042c6c6c60606067ce2178ba56824e2fb7eb1580400b88ec339304db3b9b9d9f3bc783cdeddd3430939b07fffc0c0c04b2fbea860aca9aaa669c562b1263de4b1a4ffcdf3bc6aa552759c43070f1ebbfffe071e7c3060dbaaa230e263450100504276ecd8f1bdfff81ff7eddf9fcde68e1f3ffeecb3cf22086ddb5a5a5af27d7f4594410461a5520e85421863d77531567cdfaf54aad1688c12924c267ddfdfb67d7b28d8f4a31ffde84ffff4db7ffff7ffc7c778ab370336a09d535bbc60a5048701c18180e25a0e32e75cd3d4e6e6e69ffdece75bb60ce47269004028640bc114052a8ae1790e0040081008046ccb0a85429cf3743a1d8d44f2f9fca14387666666868787b76cdd4a8a45d33028639aa649e608ce0dd3040008212042a74e9d4a26933b76ece8eaea8a45a3b3b3b3e7ce9faf96cb8150e8a1871e3a78f060369379f1c59f4d4e4d010042a1d05d77dd5da95654556194adc45e39e35c5335ce188210290aa1beaaaa0000d77515a82aaaca38ab142b1080965802003074eedc1f7de5ab8f3efad8134f3cde1c8dd46e0ee500c3b595140ddc023620736e82da72a18c608ee7e6e66420bf0645556bef09a59c71d7717cdf87109aa6a9a92ae35cd3344a484b4b4bb952e18c494f345a09e0c03ae1233f5f5c58589c9f9f9d9dedebedddb57b7720180c0483aeebeedfbf5fc178646464686868f4f2180060d7ae5dbb77efa18c52422865f2dc6af907efed52055235e5c73ffef10b2fbcf0c8238f7cf18b5fb44ddd23545715ced7eeaac1a25bc0e6628ea8133baaa28e8d8eadd940c1b87e635d43beae874221599849284508f9be8f111a1818b878e102654c700e11aa7d4d3a096a9f2b18db8180effbb96c76616e6e7c7c7ce7ce9de170b8bbabcbf3bcd1c9c93367cea492f3db77ee3b7cfb6121f8c4c4c4d66d5bdfc5a5d4d46cb8daa8b9963a90cbe542a11063f4a73ffde9f3cf3fffc52f7ef1d1471fbdee8ec0e57d34f01eb189ec9c1a8410aaa2eaba9ecd665445ada71344a8f6aa562a4c0088901d0838ae4b0981109a86a1699aa669e17018d4f9be115e5d0eb0121545181b864109f109d10d63cbd6ad2d2d2dbaae7b9e373737a7eb7a3c1eb7834d99743a995c649c271209052b8aaa2a0a5615f5fa93bf1e5c087e9d4412020603214d332815a669608c7ef0831f7cfffbdfffcdf32f0281804040c065da34704bd88032a7fe61c084d47638e702630021f43c4f5555843163d471dd485393100242aca80a422a10086104214410eaba0921000271068480b61dc218e50b055d57a59f5ab20b612c4922388710aa8aa2ebbaaeeb585184109490cc5212403cd0d777ff030fecd8be7d746cecf4e9d34b4b4b2d2d2d3dddddf7dc7befde42e1f5d74e3cffdc735ddddddb77ec088542000084b010bc3e83fbfa2b959441a0a6282e5f3ae7140020042c152baaaa22a456ab5e5b6b7b2693fbbbbffb875fffebaf1f7ffcf1871ff90c6780320a21040c281837ca7ede133620736e02b41218451032c631422b560ac60821bcbc76304208e19327df1a1d1d731c0742d8ded6ce18f53c665b36e78451ea791e4248d5344a88d4d020429c31c6399559cf8400200821e1a6e8671e7c70c78e1d10c2e3c78f5fbc78716a7a9a12323b3b3b3d3d3d3838383838f8c4134f4c4f4f9d3e7dfaa5175ffcf297bf42282194d095bce99b771d10621d17b4108233110c06abd58a536586a1551dc7f3bcbededef9f9f9fff67ffdb79ffdfce75ffdca57eeb8e3b0616a8430211a2adb7bc32662ce9aee028c5184301742c58aa200491ef92b455515acfc8ffff1434a996d5bf1783c1e8ffbbecf18354c43104a19ab542aaaaa5aa699f33c4d516a328151eac355b51bf73ff0c08e1d3bd2e9f45b274f5ebc789171aeaa2af13ce2fbc964329d4e5fbd7265cf9efddddddd478fda2397467cdfe79c8bebecf8eb55b235b8765081801002b052a964592684b05c2971c60cd32c168b808be658f3e2c2c2dffeeddf1e3c78f06b5ffbda81837baa15d7b28df77d8f3711361173c072deb4cc2e439c338491e0a2eeb18e84e0082a1821ac60d3b4c2e1b0a66908a172b9a2eb3ac68a94303599a3a8aa4c8793b28b0b21bd6d08210021100022649ae6b973e7468687a7a6a7b94c621002ab2a239ee09050323b3b9b4e679b9b9b7b7bfb06fa07208250c09a9d73cb0554428860304828f15c1700100a8528639ee7052d3b9d492b586949b40c8f0cffe55ffde5edb71dfafcd39fbfe38ec31fdc9ddef8d844ba6db5528168592f2b954a8160301808160a0588a0aeeb8542c1759d502824d52d9978160c0601003ef185e0b2a01a219c4ea703c1e0958989aeaeae783cee54ab8ee3c84360840cc3b06cdb755d4555b1aa1a86313539f9d6c99313131394104ea9e094118f3386962b1d20108210ea795e4b4b8b6d5bcbcd0938c70a4608314a89efa36bf536ab3c8460c543c0841000b0e586718c430e00f23cc21957b0a2a986e7114a98aa68ae4f54cd1008571c0fabaa15085cbc74f9effee1fffcdfffee1fde7ceb14e5c0a7cc23b4eafab54330019800bceecdbaaf4d854d24734ccbe28c618c354dc34829974af1787c6e7e4ed7f54c3addd7d75b2e572e8f8e7676766aaaa6eb7a30189c5f986f8e35b72612a552d9755dc33032d94c5353533e9f9f9a9e7efc8927a6a7a72ddbb62dab52adca4e5132f6225736678c511a8fc7354d332d6b666686112209c32945187321204286693efac8e7eeb8e38ec5c585e1e1e1c56432d1d21208060100d56ad5340c55d31084efa8adadc13b46690417005e8b149d3871e2d4a9b7b66eddf6b5affdf19e3d7b1405f89401003405e3953dd1d50d4c3633361173148c65a49f51aa285ab158ececec9c9cbc2af5ae542a65db81de9e1e8470b952f689efba6e2060972be56ab5a2ebbaaa698c515dd7234d4d3ffad18feebbef3ed330161716745d679cfbbeaf60cc380700c848bf1042702625555f7f7f6f5fdfcccccc8913277cdf279e279d0a86617474747cfef39f8f449bdf78e38db9f9b993274e1cbee30e8c1504d716badfd0cfb6dcfa43f05b50ed040242c83d94cbe5402070e6cc9973e7cedd77df7ddff8c637ba3bdb2907e5aa6b590600a05a750dc3b87604998b0064ae8600007000c1a6516336117308a53251ba52adda1612420402765f7fff6bafbe76d75d77952be54ab92c575e2814c2084108554dc30861aca8aa5a2a951046ad89c42bafbc522c16ef397a74e8c205e97d965f21be2ff3e2ea8483e09c0f0f0fa752a9aeaeaede9e9e4422313e3e7ef5ca95743acd197beca9a76ebfedb6ab9393172f8e9c1f1a9a9f9ded1b18d8b6756bd5716456b565595c08e2fbef55e0dc029ac211c7addab6050078fef9e77ff5ab7f7bf4d1c7bef5ad6f7577b67b840200029641379b4e76636c22e62084c44a22261028180c168bc59eeeeee9aed9d75f3fb17bf7eed6d60ed9849652aa2a88515e2c946ddb26c475dd6a3018340d63746c6c62e2ea37bff927a9547a617e31dc14d2344d3a09544d03be0f64113597a118a4ebfac4f8d8f4d4543a9ddeb973674b22313030100c06ab95cab163c702c1e0e9d3a7872e5cb834721963e5c1cf7e1642d8d414f17de23aee079414836a1d08e4fea4d70e01c0a11042b654440000dff75555f75ce2799e65da0080d75e7dfdb5575fffdce38f3dfef8e3dddd5d15c7b34d1d00c0012084aaeab5c503379f4f7b1331c7755dd334b1a258a649a9304d73766eb6b3a3f38e3bee00008c8c8c0c0c0c449a9a30c6427055d338e7b2315a2c16edebebd534edcd37df3c77eefc9f7dfbcf14ac2c2c2eb4b424b0021dc76194722102810058ee19b2d255074208a115083ad5eaf4d4d5e9e9e99696962d5bb7b6b7b5f5f6f45cb97af5ca952b43e7cf134a8f1d3bd6ddddb3b4b484104aa7d3b2aec1a93a9669dbb68d15855282f187fbc7c28ac2284518874221cff36a9fffea57fff6d24b2f3ef4d067bffef5af0353979e035ddfecf53f1bb3f74d0d020021c0af7ffdab72b98c11460801214ccba29452c63455f37d1f0278e4c811d773a7a7a772f97ca5526e696941081b86d1da9a0804024288cb972f3ffbecb38aa27cfb3bdf698e35bffccacb0ac6c16048562a9896a569da72bd0dc6aaaa2693c96c362b388f46a38452dff70517aaaef7f7f7777575699a96cfe7653b28dff70921b95c1e21b475dbd6e462d2b22c2138a5a45028d876c0300cdff7a5737cbdeb5bfe29ea3f58065c6f63000007500028c4b279b20c84a04f88ef799ee74184ea7ac47910c2e1e1e1dffdee773ea11d1d1d9170f026326693489f0dd86f4da2d6d78273f11ffec37717161683c1b0ecac198fc7d3e92c82301289cecdcfd956a05a75122d2d8aaa8e8d8da552c9e462d227beaeebd5aaa3aa2a84b0b9397aecd8b1fefebe643279e1e2c5f6b6f652a9041114825142c2e1702e9fd7755d7666d375fddcb9736363638cd2c1c1c1b1d1cb00805dbbf71c3b76acb3b3736a7afaf4e9d30bf3f34d91c8962d5b5a1389aae31c3ffe87c9ab577b7a7ab76ddbdadbdb974aa5ca9572b9548ac55a745d2f974ab1e6e6351e0299550400901a973484eae3a762252d6d65fbda8492e5ede5c6757ba33263881052bf2a344dc9e7739aa659965d28143a3b3b3ffff9cf3ff9e49386b1bed8d9241e820dc89c7a2396732084f88bbff8fec4c484ae5deb43e0fb0c2b58533545c18470c7a9228443a1503412f1895f2a958bc5e2d2d292aa28b1e6e6d6d644341621be3f3737373333d3d2d252db0f444070ce3847107a9ea7a8aacc07bd3034343e3eeeb96e5b4747a1503876ecd891c387cb95ca850b172e5eb83033332353757afbfab66ddd1a0e872391e6f1f1f1a1a1f3994cf6f1c73fd7d41429140ac9e4a2615889446ba9548a462384d0da71ebc92009c0eb3acad76d50db4c3265b5b36ea54056fad60497db73b03a5fa1bea383848c26ffe55ffdd56db7ddd614b22807aeebeabaae62483950ea3bd6df78d2c9a71d1b96395211f13dca18fb4fffe92fa6a7a70dfd5a0b32cf23182b8a8211c2a669cb5eb78c51d7710dd3884663d16854d3540861b95cc9e7f3e9748a73a6695a2412cd6433b5fd2c5bd832170e21ceb982b1aeeb972e5f1e1b1df53cafbba767ffbe7d5bb66ee58cbdfada6bb2c941a552219e6bda01694e0cf4f71f3a74d8b62d84f0db6f9f6a6d6dd375bd5aad38ae6b99762412cd66329168b4fe1adf3f736a0d81257304e72b6382d667cef5ef0921bdbdbd4f3df5d4534f3d8e21f0292b95ca914818d63dba44dd736c3d6df3538c0dee211042c8114eeaea8e1676208056d228676666745d0f04029aaa092e7c9f2c2e2e66d2e962b168d9b64caf1682f9c4f77d527300c89df395470f845055554208170242285bbc034121842d89c4f8f8f8c8c8c8e54b9710c6cbdd0c15d5751c84b182f1d8e8a585c554a2a5a5a9a9a9a7a757d775c628a5328b077329d310aaef7af5fe201bc0d7ba7eaefbe85c95715ebb5e9977bebc170652c9a57ffcc7ffe7173ffff937bff58d7befbd271209730edec3d0884f333638735455658c62ac98a6e17bb4fe575c08c13800a0afaf4ff6d144184baac8d1032d89966ad50100449a9a545d9189d55234d5ef8671beec95561442084608c9340545e10cda96756168e8d2e5cbb94c0a00180c840b85021014225d51554a884769281c29160a18a1a347efa9562bc56251a623302acb4397eb82ca954aeda8f5d2e643005a4da7e58e6d1042999527ef9eaa2a956a55c17862e2eafff65fffe6b6db0f3df5d453b7df7e5bc0dc14ed45372073a49e2657952c1ee09c2d2e263b3bbbe5881a4208a48c324a3c4a28755d5f08c1192b97cb8c51c10556145dd733992ce78c5296cbe5ca95a294363255945f538a969fc7521031ce21848aa2cccccc30e26155775d37d1daba73e7ceab57cdf9d999423e0f0080485515c5f77dac28d477ab8ef3f0238f3efcf0c353d3d3b3b3b3333333030303aaaa08614204150573ce2bd5ea8dae97af52ccd6686b2b04836b8d9ceb272eaea873100021233ccbbf850200b43cb3112af26121042084228c2863baae0783f6891327df78e3cd7befb9e76b7ffc95ddbb77ab2a2ee44baaaaca14ec8d67146c40e6d4c3f38861e896653346c7c7c76b852ecb7e27812084f95c4e5af6aaaa789ee7fb0400205bcc484799a6a90110902c628cca6a50891a73e072950f56144570beb4b4542e975555354dd3308c8ef6f6bedede4b972f5fb972a5542a11cf95ee04ea7b9d5d3dffee4ffe44c1eaaf7ef5eb42a13034747efb8e1d8661104ae4c930c6158c354d735de7da71eb6c9b8f1210c2da3111469cf16030c8395b5a5a923d194fbcf9e6f1577ef7f0c30f3ff3cc33070eec131c302a3cdf310c63837908362c73e47c0e5d571100baae874221cf25d2ae4018438021848aa222845555a194799ec7180d06825c084dd30cc3f03c4f569372c62cbb65594be18cb1ba524d708d39b2e59af4adc9e69d9c7342e9ebafbfdedfd7b76dfbf643870eeddebdfbe2c58bc3c3c3327efad5af7dfdc08103333333172f8c4c4f4fcdccccd87660c7f61db66d2d2c2c1242ebe7c6d54a3ed72d65fb1021d0f26197af1a01012000080a55d733d98ccc101742944a25cbb69b8281679f7df6f7c77f7ffffdf73ffd85a7f7efdf6b29969c7df2919ef6878c0dcb1c0000101041902b94f2f9bca669b61daab57ef67d0621146239190742a4eb3a4626e39c31ca3927be5f2e95544d330d43b52ccf77881cdde693fac189f53247519472b96c18462c16d3340dae149ce673b98bd56a269bede9e9696b6bdbb163472c1a2d572a7bf7ec0987c36fbef9e6f0f0f0d52b9384d0dd7b76777575d9b6e5b86ea95c1242689a8a209419a51fdc7d59b7d334ba81abe086c058618c06ec00651400c038c78a522a952a02f4f5f5799ef7f35ffcfccc9933dff9f7dff9dce71e5d33af7b0360a35d0fa865ef0a0000f07c6e5b010010100863b0b494721d3fd1da6a1816a3bcea388cd16834b6b4b4641a86c779a55c96dd3384ae9b968510f23c8f32e6798ee7796d6dadbeef571d475335004024d2944c2db62612966d4f5ebd6a5ad65d77ddf5ca2baf94cb650821a71440480989c662c562717e7e7e7a6a4ad3b4fd070ef4f6f6b6b6b5551de7ecd9b3172f5e2c95cb83035b77efdead69dacccc4c2c1a23be6f1846b158d4548d718e112284d4161f8408202eb8900f02beba83f6ca3690f3155623c858dd9852c8975d67cb8e32f939e7fcda366baca6faf7f2b85c08d9d48a332a84a00c080e0100aaa243c172d90200a0291ccd6433fff44ffff4f8e38f7df07fe68f1b1b9039f5a8d5c950c6cae54a6f6fdfb6addb272626df7aeb6d4dd3dadbdb3dcf1b1a1aeaeeee4eb4b64622916834b2b4945e5858d0342d9d4ebbae8b112a67b3baae86c3e14aa57af7d1bb33e9f4c8c8a5db6ebfad522e2b2ace65b30303038661140a05d775f7eed93337370721d40d83505aa95673d9ac8c7b9a9675f4e8d1d6442297cf7b9e27388f44a3ed1d1d535353a55249061363b1a81ce323ab0c7ce24304b1a2d4f24a3f28ac1ef028f5cf0d65877cd8d8b0cc91e62844504ec0f57d3f1209dd7efb6d178686b76ddf562a5576edda353a7a391e8f7ff5ab5f79f9772f076cdb32cd73e7ce1f3870e0eebbeffee94f7f1a8d469b9b63d5aa53ad56211453539384d0f1f1f1a670b8b3b373f4f2a8eb3a6dedadf30b0bad6d6d000055514e9e3cd9dfdfef1322fb42218c5b5a5a72d9ac4f486f5fdf3d478f767575e5f3f9c9a9a9a9c9c9446b6b7777f7d1a347fbfbfb4fbef9d673cf3d97482476efd92d1b1ef0d5859f60f560c60fe416d5ef87bf0be6d4db5708c28fd6d8fac46143196deb820bc13967941e3972c7f4f4f4bffce4273333330f3cf04032990c879bf6efdb373131615a1644d0b2ed8e8e8e9a1d716e00002000494441543367cefce637bf3978f0e08103fb2144ededed4f3cf1b8a2e07ca170f8f0ed0bf3f300809ede1e004030185455b5ababcbf3bce9e969d3b2060606fa7a7bcbe5722e97330c03633c3b3b0b113a7af4e81f7ff5abdb77ec383f34f4cffff22f172f5e9c999979ebcd375e79e595e9a9a9bededea79ffec2dd47efe69cbffa87578bc562d571841018214dd5a457ddf77d710def77d1ae27703e2c6c3c7fb4c4869539f5904d331863beefdf79e79d9cf172a98410b24c3b9dcececdcd87c3e16834b6303fff87575fd575fdb6db6e53142560db9aa65eba7429180cc85a37cff30e1dbaad5c299f397366e7ce9dbaaebffefaabfbf7ed1bb974c9a9563dcf8b46220b8b8b1821cbb28410c473110c3ff6d863bb76ed1a1d1d3d77ee5c3693619456aa55c1a91508653399e79f7ffecc993377de79f7de3d7b5a1389a10b175cd755550542289bc72b1042b83681400efe5d7e7fa34c990f284e5a0b0dad75855f27a296d329000000702183a758da3f1b0f1b9c39cb555c18634579f9e5dfedd8beeb8e3bee9a9e9a9e9a9e3e72e4c8f3cfbd5828e43b3ada1cc7b9343202001818182897cba3a3a399743adc140600b8aefbcb5ffcb2abbba3b9b9f9f2e5d1403038363a363333a36085329a4aa5ce0f0d158b4521c4f8f83800209d4eb7b7b7dbb6edfb3e56b5442281113a7ffefcc50b1726a7a6641db5a2aa866957cb6555d71184b97cfec5175feae8686f6e6e1e1c1c441062ac28584110cafa02d93be15ab2f3fba3c4b544cf1581f3a1c6851a32e7d309c81112aaa2689a06003f7bf66c34161f1e1efecc030fbdfcf2ef86878723d1c8f9a1a1de9e9e72a5925c5c0c37856d3b50ad56d399f4c2e2a2ebbaf178dc308df1f1f18181816ad53971e2442814eaeaea1a1b1b5535ada9a9a95c2a31c6e2f1783a9d360c231c0eab8ac2194318ab8a522a979796965e7dedb565a1b132179e310600901d760427c4238ee3a89a168fc7676767755d40083fec52b68f3a2eb4b1b0d1990300903207638cb16158c56271cfeeddb3b3b384908e8e76ac2896a5a73369c678a2b59510c218430851c26ccb0a87c3b95c5653b5ad5bb72d2e2e00009a63cd3ef119a389442b5670b954b06c3b93c9a4d3e94422313b3bdb9a48604529572a8c389a1696ada5f7eddb974ea7a7a7a7755de742b0957eed8273acaa8aa6dd73efb123878f789e77e6cc9962b1180a855455515545065539e7beefd7572fbf1fd4099c8f271161636083334751b0ebfa9ee700c005c78c53d3305cd785102b580500304a0140ba6652469c6ad50e0454554da592fd7dfdf942a1522e5b966d18462a9592bd3f3dcf8308ca31d7dc679ee7e9ba6e1a866118f97cde32cd72a5a2699aa6aa00aa841099b579e4f0e1aae30c0f0f8f0c0f974a255dd7095d8e1ecad6b8c140686c6c6c746cecf4dba7fbfa7abb7bba2921994c965261db1621c434cd7a25ed46cb1dd675ccb951a5406d6c28c6987356eb08553fbb7bfd9d23b82a8824d00a03e507cbae0b799a32bf09e39bf5f5fd5463833307acab670b54732ad67eab285851b04c2189c7e3d95c8e511a08061184996c565591695a9cb38aeb4851e0791ea5ac2912c1182753a9b876c3bafcc9a929c77563b1d8debd7bb76ed93274e1c2958909d775ed40e0b1a79feeedeb73aad533a7cf0d0f0fe772595dd70f1c38a069da422e8f30b256464c5b96e93aee077f771ab8556c7ce6dca4fb643da918e308428080effb4d4d4d333333b1580c0050ae5430c6b66de7f37908612c162584e67259cbb21389d67c3e138fc72921996cb63e13b41e8b0b0b32cfba582c86c3e1db0e1d6a4d24b2b95c7f7fffe0e0e0c2fcfc891327c6c7af20840707070706065a5a12c562d127bef221db390dbc1f6cd2bfcd754140b0ac6a50aa2898318611ba78f142477b47b8294c290500343535799eb7b0b8d81c6b669cb7b7b7b5b4b4f8c4350ca3b3b33397cf5fdbf98a07591e452611c7e3f1f98585f1f1f164321989440edf7e3b5694e79f7ffeedb7df861076b477eedebda729d234363a669a1600002324b8a83a8e74f155ab4e6334fb270a9b9439f5a8359ea594e8ba6e18e6dcdc5c5f5fefc14307e7e71718a57a449f9f9f8308469a9a5a1389743a1d8bc60000994cd6755d46a96cdf0100a8b58ca98d77279452c62cdbae54aba954aa3916dbbe6d5bd571ce0f0dc98cec1ddbb74f4e4d150a854c36138b4555554118c91a04000084180020777e63bb05d47ffe8e456f378af9ac7a9a2cb799e76bb6bcf9392c67732f4772a439f4e186593f466cfc1c0289ba0c790456ba98d74f3b1342408864bdb4e7798aa2fef55fff3542e8ecb9b3857ca1a5a525d2d4a4286ab95c4108fbbe2fbd05d96cb6542a699a26bdcc126b6294b6654d4d4ea6d3e943870ec9ee84b3b3b373b3b38b0b0bdbb76f3f7acf3d47efbe3b12890e9d1f3a7efcb81d0804ec80e0a2582c12422dcb668c57abd577237036ea1afd646253c89c9b072e560283020080102284040276b158fc2fffe5bf562ae56ddbb66b9a562814344dc318722602013b97cf17f205d98a4d76c7751dc7344de96baed53248b52d9bcb3df4d0433bb66f07004c4f4f9f1f1a9a9999a996cb10a14ab5dad1d1d1dbd3d3d73f78faf4e9e1e1e1977ff772fccb7145c1104239504dc64365e9f5cd3dc80de67c94d814cc01d7561507b056aa75fd365cd7cd52a9d4d292989b9b1b1e1e6e6b6b0b87c39c73555530c64208ca18e35c5554cff36cdbeaefef57304ea552762070a3433ff3cc339d1d1dc964726262e2d2e5cbf95c0e80e5b9d59357af4e4f4fcfcdcd6ddbba7dcfeedd3ddddd67ce9c999d9dede9ee0e8542e552c9711cd330148c1505cbb0e93b5de0c782cd1851dde0cc41cbaa3fbbee37f28fbd2c1f7c4218e7baaefb3e55b0e63a5e6767772cda8c306694569d8a6d5b84f8be4f43a1808ce1789eb7b0b0283b954108755daf4f2dabae74db304d1342787e68686a6a6a6c74540861d9b6e7798c524e89ac9599999999999eebe8e8e8eee9deba759b61188bc9a4ebbaa669c9f908a665552a55fc3e6a2ad7f0aa5e08df448e49bb857302c0b5ca9dfaddac6c2618adeb6ab25aafe410f0b55681006b3b847cfab0c19953c32af317b0da5f8b0b8120340c53f6e5505555d775c771529393966dab8a022152140c2190d5a3d56ac5b2ecda0e977b9cdff4793f3d3575e9f2e56c260384c0aa5aad548060815093e338aaa2b8ae4b7d0f00ec799e6d59a665e6b239cbb63455ab562befb8f3dad5ad69d9f1416706d498b60e73de2336884ab9299873a3c58720a48c31c16405a5e082f8ae9ca9ded9d94e28a59472ce3152cb95b282b1acb6afdfc3da146621e08a5b4956b3010012adad55c7b14c73319904001886e1ba6eb954c28ae213a26a1af1bc7d070e7ce5cb5fce6673726c7587d60e212a168bcdb16bb33b218280dddcced98c5ad3c7854dc11c008010b5b1366b2339b2061300609886a2a8aeeb964a654288aaaa945255554d4b070028aaaa2a2a637475975a2e564ad0e00db4a96aa572e8e04100c05ba74e9d3f774e66b2618c196310c2a670f84b5ffad28e9dbb5f79e595a1f343b3b3b3dbb76f4368d9a6927d4884e010c21b399a6b0267f9bf1fbcc069601d6c16e6809ae459c51f0621e08ca92a621c304ebd8ac338374dbda929140a85b2d90c00800ba6698a104c00542a15ae856ede5d79f3e9d3a7171617b76fdb76e0c081cecece542a75e9d2a572b100117ee8b39fbdf7befb6666667ef2939f2417935353934d4d91ad5bb701008ac5a2aeeb1022dff7df31a3ec66d77bdd7f6b9536a091eef93eb01999b366bc7bb9520a0603aa8a4ba59210a2a9a9495555d77597d24946a9aeebbaa65342aa8ec328352d6bd91a5ea18decb47693e32ea51696528be9747a707030d1d2d2d7db6b18c6d2d2d2fdf7dfdfdcdc2c2bdec6c7af948bc5dd7bf644a2d170385c281408250ac642708c94fa4e1d37baae0fcdc269607d6c22e6ac0bd999a9ea5414450906ed6030502a952f5c181e1f1ff77d120a05dbdadb7b7b7a755dd734c5755d4331de79a7aba1682600209bc9fc7e7636100aeddab5abbbab6bd7ae5d4288175e78616868c8f3bcfebe812d47ef5155a55caef8c497a317659b4264608431e7fc1dfb957d68cd721b58071b9c397cc5c2595372bcdcdf0342c618c60a001c63acebfaf9f343972e8df83e1918e88f44a2b3b3b3972f5d5e989fdfbf7f7f341aa394789e87d1bbba698273a9196a9a562d97194210a1818181cece4e00c0f8f878381cb62d2b12892c2e2e168b450040535324994a11df57b0621826b8e6c1839cb39b306725bdbfc19c8f0e1b9c39ef063ef1037620140ecccece9e3d7d76d7eedd878f1c999f9b2b572a0f3ef859d7718e1f3ffee69ba71e7df451cf258661c806684208e97cd3755d30a6602c3b56dbb6cd383757aa0328218410004434167bf2c927dbdbdbf3b9dc5ba74e2593c9783cbe7ddbb6fefefec564f2fcb9a1dffcfadfda3bbb0e1e3c689a56a552259410420dc3e08c552b95783cceeaccaa75bd85d74d7eafb78ec43bba83573f5cd6b7acaecf6d9358a5afae36ff90f874c66bde091b9c39e2dae80a816f309ea2291cae54aaa592f8ed4b2fed3f78b0bbabebe5975f5e989fe7429c387162c7f6ed771f3dfab39ffe7f2323235b06074dcb2a954a84104ac8c0c0402e9f8f46a3d96c76696949d6d2a88a22f3716a8b8c78ce3df7dd7ff75d77a99af6d6c99323972ecdcece2a18cfcecea6d3e98181814422f1f0c30f5f1e1d7debe4c97ffbd77ffddce71eb72c331c0efbbe5fad5683c180aeeb6865647c039f106cc8c7c17b83ac5e5e5a5a320c63eb962da363639357c664cd330060726a8a517acf7dc7b2998ce3bad96c961052ad56ed40002b8ae338954a4526b0adbb7308e1bffb5ffeecb64387f285c273cf3df7c61b6f4c4f4d41083db78a109a9d9dfddd6f7f3b343474e5cad5b6d6d6affef11ff7f6f6b9ae2be3b3fc965c6a0d7c34d8e032e7dd40d77508e1d0d050774f8fa2aad94c0629ba64828271b9583c7beedcc1830753a954341a9d9e9a0a87c3baae6fdbba757e61c1a956ab95ca810307aa894436972384104ad798558cd2f34343e3e3e35393938aaa0ace14ac0b5527cbf39fe9c58b17dbdbf2737301c3340e1e3c0800a084944a25ce9965598c71cff338bb3e81a8818f139b8339b514cff5723d2184c5629152aaa96ab1584cb4b6667339eabb00628f122b105c5a5a62942a18bb8e138fc709a596656145715d5708a16a9a22db6d60cc28159cf3959c1c000044e8f4e9d393535395721908aaaa16e79c32c62885086145a1042284e6e6e62ccb7ef2c92753a9146354d534a9647a9ea7691ac2f8fac298ebe3336bc780aefe4a5dd329b8ae2fe146753bbcce465abdcdfa227193d4df6d1e6d0ddd28453a954a5996198d4420429669a6d369ea3b10291042a4a84eb5dad7db6b0702854241d775c7755dc711425c1a196194aa9ad6d3dd9d4ea7676666e4701e88105c6da977f7f4ecdab5abbbbb5b376ca752e69408216437f495023271f8c891ef7ef7bb8140405595b9b939ceb861180000c698aaaaaaa2b086ccf98461f33067c557b01a008070388cb18230be72e50aa1341a89d8c1268890e08c330611dab77fff6bafbe6a18c6ce9d3b171717354d53553593cd4208e52cf8c5c5453996072b0ac6587ade6ac7ad542afdfdfdb71f3e7cf8c891705344d50db0e28ce29486c3e16f7ffbdb5f78fa0b73f3736fbf7deaf9e79fb70301c33010c2b2b5344208a24f530719515736f8719fcb8788cda1addd14966557ab953beeb8e39f7ffc4f43e7cf1f3b76ac542a51c632e9743c1edfbb6f5fb55a9d9e9efef677be333a36d6dada2a07890200ca958aa2aac954aa5028c4623184902c44832bd122b9ff4b23239572391e8ff7f6f4000016e6e7a7a6a719f101804f3ff3cceeddbbb399ccef7ffffbf3e7cf65b3b96030b87bd72e426836971542a8aa4209a194c9f1581fdf4d6a602d361873d6e474a2ba9f60f587524d020008c771b0029d6af5e8bdc72e5cb8f03f7ff6b37d7bf7f6f5f7cfcece6e191cfccd73cf4d5ebdfa8d6f7cc3b2acb1d1f15028e4791ea33c600701e0b95c0e001e08589ee7608c314655c7b12dab96062a384f2593a954aab5ad6dfbb66d7d7d7d9d9d9d4d910800e0aebbee82105ebd72e5ecd9b3c9e4523a9ddeb973676767a76426a34cd775c638c3726cdc7bf3b30921565ff8fad501efa71eae3e862356d44e0000401c00c0655f620019604c00086b6703eb7e7e8ab1c198731dc4bb996cc1194300805834ba77efde542a75f1e2c5575f7badbfbfffc5175e181c1cfcfef7bfcf381f1e1ef63c4f761d58f936521505ac8cc3e037504ea42760717e3eb9b8d8dad69648243a3b3b63b1d8ccccccd2d2d2850b17f2d94c6fdf96db6f3f1c0c06a7a7a75a5a5adedb25bed3ccd0d5ee814662db07838dce9c3a5c1f17af5b4fcbf3cd9a9b9b0381c0c0c00000a0542aedd9b3a7bfbf7f716161746cac291c6eefe858989fd76edc94b06ecfd79c51c160b0582c020811c6929cc5623193c930c682c1603010701d279bcde4725984512814fa20ae744db6d1bbaa00fda0209f202b27f0a9972d37c22662cecd210326c562d1324d5dd763cdcd0ac68ee39c3d7bb65aad7676763a8e333f37170e87455dc71cc6682dc905df2049a15ca9000002c1e033cf3cb36bd7aed3a74fcfcfcfe7b2d9a648a4bbbbfbf091238ee39c78e3e4b973e75b5a5aba7bba6b5f5c3de5e6662bfee602a77e87efe65634f06eb0499883d6bcb9266dc472b0820bc108d1342d5f28c88e84c562311e8fdb96c5394f26930ac69148140020e7634a608c85409c5321b810a8de6527380780c9a9860f7ce63377df7df7fcdcdc8b2fbee838cee54b974ae5b2aeebf21003030377de79673a939e9e9a3ef9e69bb1688c50523bc3ba49f4ab58746b15a06b72dbde9568ba81d810d7e5d16d2a3d709330070080d675c12384657b4104804c46b66ddbb66d8450229128140af942c1324dd3341184847042497dd7734d5385109c0339ea5d66657321386300080020c2f82b5ffd6a6767e7d4d4d4e4e4e4c8f070269b050070c69c4a796262626666a6582c7677f7f6f5f659a679e6cc594289ccbba957ba6e2273ae0f80d67feb265377de8f7ba081cdc39cf52104e79431ce5555b54cb3582cca6826e7bc5028040201ce98f43e3bae2b8d2188613d79d6058410400421d4545555d5a1f3e7472e5d9aba7a05226c5a1684b0522e43848510d572e1fcd9b3b333f36d6dad7dfdfd77dd75172544aefe0f2386f37189858d1737dceccc01001886512a972b950a67ccf33cd3b25445f13c0f2324d30504e7e5524951554dd30100beef23bcd2fc96102184d4d6e4a02819d2916fb0a2a8aa7a616828954acdcdcd418411c6d54a4551552084104c20845583112f9bcd388e138944dbdbdbb2b95c4d3e08216480e8ddc887faac9c3585a237daf8c3c68dfc8d1b001bef5970434088e44bfeb76693541d0763cc3987104ad756b158342dcbb2ed50286407021021993f363737a7aa0a849851e13a3e46c8711c0563ce84e71208b110d0300c391b4708417dbfea38a665251289d6b636d9bd0d00a0600c800010ab8ac2880b20beebae3bbef9adafefdcb5bd58cc2fcccf3346e5605d212844022221c49ab62175460ee4cb2fb0e6f5de70a3d83f67bc8635e917d7b6a9f39a402e201748002496dfe38de8606bc81c100a85666767dbdbdb938b8b2d894424184c2593a36363aaaa324a5bdbda7a7a7a02b65d2c1607070721828a4f01c00000845408b1e4891d08c84c3429a36a3b8710c6a2513b1018dcb245365e2b954aaee32045e58c79ae1b8bb73ef9e493838383e3e3e3274e9c48a55283835b554de38cd7a4c7fb71097cbcd8c0a65483392097cb757474643399682c0600f8f5af7f5dc8e7b7efd891cd648410e7ce9d9b9a9cbcf3ce3b23d168369b715c37146c52551521c619c308218404c618219f10ce18678c718e308610ca55f3ea6baff5f5f676f7f4747575d981402a959a9999c965b3a6651d3b766cd7ae5df95ceeb9e79e9b999991156fcdb166998b0000c08ac218e78c63acdc5a079c063e246c02e6dc2045ba06c33038e7a665398ef3db975e0a87c38f3ef698aa28e6be7daaa2a452a9e3c78fbff0c20bf7dd771fc64a67676766298b31e29c33e623844dc3705cd7755d99227dbd2693cb66b3e9a5f98585fdfbf777747448b9d4d9d9b96fefde969696a5a5a50b434397474789ef777474f4f7f50583414209745db032bd50080e11048db4b54f12363073ea08231058adedd42fee6aa5925c5cdcb163c74bbffd6d3c1e7fe491471616175ffdc31f8a85bc615ac78e1dbbe7de7b5f7ef9e552a9d4d5d59b4ea77543ad54cbb2e3b38251365b4018c831ee0000745d3c34140a952b95542af5c20b2fc4624dadad6d3d3dddb1584cd38c374f9e7cfbd4299f90febebeee9e1e5dd73963720c89e7791042c1a1f4a70bbeca565835f786aff25c5fef1bb8de9fb6460fbc35881bc485e02ae379c3d27db37808d62c118470edd5d2d2d2d6de3e353dbdb8b070f49e7b4ebdfdf62bafbc522c14ac409032f6d26f7f6b1a466f4fcfc2e262a55aa9562bb21f402814eaede9ede868d7751d412838af15e7d417ea2008e5742a467c46bc783cded7d71b0804a6a7a7262727755d6f6969e18c954a25000084305f2808213042e8ddf9d36ef9566c600be4a3c1069639d770fd2a59c953030080c564321a8d2693c9debebe6030383535150a85f2f97cb55cc0aac1199b9b9b3b70e0c04bbffdade779d168ac52295ba6699a162144ce12f589b7b4b42438679c334ae54f4e290082328630565435180c7ef6b39fddba75706666666c6c2c995c0c87223dbdbd478e1cd9ba6ddbd8d8d8e9d3a79b9a9afafbfb396792d292a29285cb17f201f5e6fc0868b3e199b9299803e49aab53a3a46625611a86aeeb3333333d3d3d94d2442271756242d134ac5b7264cdc2e2626f5f5f2c1a8d4563a9548a52168f878410e3e3e38cd16ddbb70bc1928b8b0863b4d21eadfed04ea574ecfecfdc7ef83025e4dcb9b357af4e4e4f4f55ab0e6353f97cbe7f60a0bdbd3d1c0e5fb870617161e1f585e4134f3c2185d6879466b6e1d7f447830dc69cb5b51f10825a3f8dda7a16826b9ac65786ea6045595a5a6a6f6b134210dfcf663258558510941020388048d7758c90effb108940c0ac3ac8715ddbb277edda8530b83472b1582c52c67445812b0242d334acaa8c10c1f9539fffc2de7dfba6a6aebcfdf6db4b4b4b994c9673264f6962fcd2ecececc183071555dfbfef60be2777f9f2683e5fb26d5b55358414dff7651b6bdff76f3cf0b0a672af294f7a67dc2857edbdb26b25b30e020098b46d56e6a330c01910b8568c711d3ea506c30663ce0db12a834b88fa40a1ec2ae8795e3a9ddeb7776f34162be473e1a648a95c86500987c33b77eebc3c3a6a07020ac68bc9a465da2e000000c925d775a504abd90f5c08d775192110215dd70dd33c71e2c4d0d0b94c26831064842045118cc6e2f14c26cd8538f9d65b013b2849d2d1d1a1aa6aa552711c475114d3586ec66b1a86b7dc2ba7814f043ea5847f6f909c61d20ee1bc3ee00d00585a5a0ad8f69ebd7b8bc5e2c4c4c4edb7ddd6ded955c86738630ac689444255d58b172ff6f6f68642a1e5c61a943a55a7542e954a25dff711c6d22db6bc7fce19e70008d999606464e4d4a9538bf3f30841ce055214598f90cd660017c4f318f10a85c2d9336742a150229128954a941279dab5f3e42bc9c8f275a358fe27079fe473fb40b01964ceb24b5ad40576ea159f502894cbe7e3f1785757d7e5d15142e9e1c387c30f3d945c5cb46c9b12f28b9fff5c8e95fec5cf7f8e1545d5742104e74c300100c78a22db775408a9e5a72818038838638cd25028d4d1deae28702999c2aa8a10525595528210668c87c2e16221bb7bf7eecf3cf860b9543a7f7ea85028757777ebba5e2a955cd7958574aeebbe9f69870d7ce0d80ccc01f525062be6bb000048cb01419849a76ddb3e7acf3de3e3e36363635393935851e44a4da7d34f3df5d48103077efce31f6b9ad6dad6562c16118242402180e09033e633060090a342755d1742c87eb69c319f906030d8d5d5355019b870f1fcd2d252a552ae968b0002d908aa542afde99ffdfbeeeedef1f1f1ab5727c7c7c73b3bbbc1ca8c4e2120a31c08a4690621eb6b6b6b2a11ae8fe4ac79f6af8ac3bc0b278458296102ab6b72d66901c76b771b0021ae336d3694a5b3499803c00a67ae4f3df63cafb3b3339d4e13427a7b7a7a7b7a28633333339cb16030b86dfbf6682472faf4e970380c0028140a374afebfa63f2d6b6b72fe347ae38d3706fafbbb7b7a0e1eb8ad542e4c4d4f8e0c0f2baa4a3d72efb1fbefbdf798ebbabffecd6f16e6e76767e7745d1f1c1cf43caf5c2e03003455a38cf9c47fc711209f4408b4718ba9370b7364eef0fad5cebeef0782415dd755454967320080806defdab5cbb6ac502874e5ead5d75e7d35180c0682c14ab91c0a851cc759ff18b2450d635ca67e720e11929d412f5cb890ce643a3b3b43a1406f4faf659a996cf6a1073f1b8944c7c6c6c6c7c6c6c6263ccf6b6f6f6b6d6d6b6e8ea65249cf7730429a8e0100108af5c66b37f071623330e79a92b0ae6357b61a344d331a8b398ec3282d954ae9749a32562814fa7a7bb76edb562c161dc749b4b6e6b259995fb326271a00203943198310324a859cb68b90e7798aaa36353511424e9f7ebbb939dadbd7b76bd72edf27afbcf2cad8d8442e93deb16b6f67672782309bcd65321921846918c42f32c6755d57145c1f806ae093800dc69cfa80c65af546baa511848c73b49a41966501008ac5a2d4e2b0a2588a02210c87c38c73991aa3ebfa4d54350080aa69c4f739635851647b4ec181e7125d370100aeeb4e5ebddada96d8b56b4fd5a92c2c2e7a2e010018860611cee53289966655d354155996592e7342a84c60d3344df287d49167d5649cf71c7ba9cb314375df7d1752adfe58f58f21b6a1dd68ebe253a83dbf3f48e7d71ac7f4ba58d7f32b07eb4a8173fd92852bd5a0f51f6a9ae6fb646e6eeeeea3471f79e411cbb273d9dcf8f878b55a0d0683fbf6ed7df89187148c7fff873fa45229c334e5ec6b698cc9f9d50842de189ef309c3069339f5e075cf050e00af5fd072d1df6431d6c29a6bc6f10a216e3e4ff77a542ad5073ef3405757476767e7e9d3a7ce9c39e3f94e3e975f985f1c1818e8edede39cefd9bb37d6dc3c3c3cacaaea430f3e08008048702128f311121009c6fc4df898fb24630333a786fad4815558c9ca59470193b60aa8697e371af876dd0e6b7b132bd3489f79e60b5bb66c1d1eb9303434343272b1522a59018b0486636f000020004944415431ca081d1e1e1e1e1ebef3ce3b43c1a6fefefe6d5bb7befcf2cb3e21eaf2d437566b82432943682df33fe980b752d4fd69c16660ce2ac80806ac2fdeb941be568d2d374acb5f4339991e0aa4294529845070aa692ae3fccd936f2e2e2c0c8f5ce49c408c5cd74748e58049a6bdfeeaabbdfd5b9a9a9a2821f7dc7bafebba8eeb7a9e671846c00e41086f3ee7b02e9eb37e2467cd99d7e789af9e3dba3e3385e0b548cdcd27cbcb64355197b7b61a689d779f5a6c22e6bcd7d4e335da5dcd9376136d8d0b81210400a8aa8a30e6006145191b1d1bb93422bb6e844311427dd775ff7ff6de343aaeeb3a133dd39d6a1e50851920c119144991224549a4246b76e451566c395eb19dd7b193ce73dc4efed82bfd7e79e5c5895f6cb7d2edf4ea4c2bc97b51d28e622b89e351b62c8bd44889144990c44000240a63a1e6e14e677a3f6ea1581809cab24416f82d2ead52a1ead6ad5b67df7df6dedffeb6602ec48410450881887269eca23f187ef8e187ab958a65dbdea011c1799d1b8a305ad4cd7643f89ca6461318ff5bc1e295b7b288e172080804045288d5c695ad08c3676cdfb62dd99a9482952b15cb3285e0002029a51082538731ba6fff6def7bf45182b1aeeb8542414aa92a0ac29871eea5e908de40f7b81b02377f0f000040124020000042420e91800800410047deb010203980e25acae19452c1b9148233d6d9d1a91b7a3a9d6e6b4d9c1d18f0e6b5010ca4949c3abe40e8c1071fe8df754b2693397de6ccf9f3e7dbdbda644b0b5114cad83b3abf098a95341b9a3956f945d0e496e32d046fa0275c54c4b9f21849c01c1b715b218418feaa40550e051301c555a42b396302a8beb004d0321dbf61085a93535bfa591823296b0dd508218c050042b0175f7ca1b5ad6df3a64d81406f34161b191e9e485dc29860acdc76dba1a3478e6042de38797260602097cd72210edd7e7bb552c9170a66b5ea0f848410084221f8a2da8b68dc49d6e316010000b5728dac4b1734b28da49410a23aa30c354e0296e2ca55a93fbf987bb64496ba7ecc452f6efcbb10dedd08e066dbde34b9e5ac030848a4124523026264710e2022aa0fa90c7386b944aaaa13852115080121b46d5b5ddfc6a91e26cdcdcd657339dbb61389445b5bdba1db6f0f4742aeeb1e3a787b34169b9e9939373030363e2ea5eceeeedeb479f38a075947f5e9caeca75fa0d77ac14ee05b3cc2c609c06e5a0e9008228c01c39c31893056155d211811855a52b81029440bd8ae44588dc47c8072ab5abea6e32baaca391f1d1d9d9b9d9d9b9d8510b6b5b7b6b7b761425e3f7162fcd2a57c2e4714a5bfbfbfb5b5f5d2f8782291788b5f64699270e9fe72a1bd6fe55cd96a39c6b58da1e9fb7056c306b29cc680a1212b2d10424002cb754cd3bc3c97a548e548834084156a95b3ae408a3f5ca530e00f76b62514c0c9356e3b028140a552c108158b454cc87bdffbde4aa598cde6289da78c59a6e9baeed6ad5b5be2f152a91408066b67b83acd470a09005c9a38ae7f9f776f1d6f2813da4096d388c6dfd8b26d0ca45fd746c7c7529369407c80038010f54bc91950fd668557aa4e28d6ded1de3993ba4454b23c6886107adab8b0819be3d17c8ac5a2e05c0b069ff8f087b76ddb76e6f4e942b13c3b3b9b482442a1d0830f3d94cd645e7ef9e5e191911ddbb71b3e5f9ddcb9d0fb29845c9a27586d8d5e117786b0fe927a55a7614777b5bddf2ac943b1ccc334fa1cef5d703d7796c663dc989d081bc87216d1cf16ff5a18630139e552518d402456b5a874ad4229a763dd761c29259008130363dd344d5dbdb68184dee4a983070f160a85d74f9cb83c31914aa52ae5f2e8e8e89e3d7b7c3e5f381c3e7af7dd9e9a94cfefefecec5c47e9b331e86f986ebbcab7ae9bcd4dbc5dd84096b31a1094984008b0439994321a0e0b5e2e558a0ac042000961a0ad03e961550b0a0efcbabff176be1e7cf0831fecddb4e9d2f8f8ccecece0850bf94201230424171c9e7ef3cdb1d1d1ddbb77c75b5a0e1c38d0dada3a30304029f59a1416540f6b9287578e28c08a27b0a696e775663637a69f6944935b8e5810a359a442b0d4ff408410008231a6695a4bbc85bac2291349b12b65a8b5f3de473ee88f25c7862e54aa655dd70160424a2f3f5bcfd2e285cc6f23c3a0d6858af199d3a7874746d2e9b4b84244205208a2aa55d37ce595571289445757973f10b8e5965b18a5f54dd18abb35ef8fab89fd2e79f29d379bc68f83cd1bfc345992fdda50eb14258851669956201cb22c8b71eaf729b66b39d29100960a1557f139d840861f626456ca000029a5178d2c28a6d71607a314218430367c3e4e5d885030189cb87cf9cdd3a7a7272784100821c128732d2918440823e40da84acfcd5e181c5414251008544d93738e105a2b49b0c81810902bfd0300d4ee0babd255e52a781b2e2e00000097312ee53515916f1434b9cff10af6cb578317cb7a1447083152906951c77130c685427ee2d238003c1289961c2020b100024c982e372805927be28760199fb2d6f9230463ac9e14765d37d2d5150e87abd5aa9492334654cd7b97dfe72b954a1eaf74fbce5df7dd779f1062e0ecd972b9ec0f0408210863ec1922421823c6f8c2975a815870fd4cb75d9e4278b7cee4978a26b79cb5e115e54ba5522412060011acc61386a629e148b0a773472e93ae505b702024948830c101e09aa6a0c5c9a3ba67f07a2419631eef06402885b06d3b9fcb1d3972444a79f6cc9973e7ce31d7014002882bd56a2c1ecfe7728fbeef7d7bf7ec999e99397dfa742e9b6d6969218478deac2ead76fd18c6db82c51ef386c486b61c0f18114234ce4a96eb5089225232c7362b25c629e31430ce20c19a8614a220ac1b0a6d98b7bee450de42674248af9b5a4a466936977be38d371289c4d66ddbdadadbcf9d3b373b33238540086deaedfd8d4f7f1a0070fcc5170b85c2c4e5cb8ee3ecbee516849059ad5618e38c33ce18e39cf135366f4d6657370436a2e52c49e38643216a534537b0a2154b65014130e4bf78710802009408d00d87f38aed50ce80a48562c61f6a81101245c108c9855636ef689ed8da1285a7542ad5d1deeef7f952a6d9d6de7ef4c89199d9d90b172eecdfbfffde7bef1d1e1a7aedc48952a9343335d9d1d5ddd5d5158fc54aa5924b29e7dc1be52b04679cd5e9d2520a0056e08f81c55ba3458f1b767702aca39ed3f0de253c8315ea390b698fda9f1a0cdc9b168a967dda0dea671ab1112d670904aff57222889943e3f1789088ccf40484980100000244611049080010500a2e280068b98c8e58a5c3d4e7f3b5b5b78742a162a130313181310e04020f3ef86032997ce63bdf49a7d393a9545b47c7e13bef8a84c3a552c9755dca98b7eb5388a21085288a4294660d186e503481f1af0508417d12d46aafe18c4b2111c0906020a4ebba8e63610830904002009140aa044840000043804a2e208408636f29a38531ee8d900b56e4914405e7c542617e7e1e21d4d6da1af0fb73b9dccf9e7b0e13522a95144d8b44229aa629aa9a4ea719e7520804e13a5bb86fe25dc146f739500220858000408e11060803893022aaa242880005404255f149a801a92249bc7b0d5ae0da805534dc1aa1284a2693f1f9fd3b76eedcb17d7ba55a1d1e1acae672dddddd04e37beebdb75aa9fcecb9e7860607fbfbfb37f7f5618430214451344d639c71ce38e3de9cf777e28adcc4fab0812c67f114905ab60a49a06aaae55a9270db2d022914623814731708c800004010c796213d804010020d48450a28916c2ce37b93a8b9eb7a151b4f43dd0384d0aa96bb6ebdf5b6830705e7131313636363131313dedc847d7bf74663319fdfffe0c30fe773b93367cf0e0d0f3f70fffdfe404055d5743a6d187e8c09c20842b8a4a059b758d1209426c555caa3cbaec9dbb3035c502d597af0869240b3d5743690e5ac0801814d5d210444405109e082324a296702200c0044002395108c54052958aa106288a06c90b9e14250c6a410ba6108ce11c69e724d1d1f7be2d782c160369b1dbc706168789833e652ea69eb9c3c7932168f6fd9b2251c0e0783c1a3478e0c0c0c28aaea388e6ddbc41b0d2fa5141221dca8bc7113ef3a9a3cce415e117da5506429bcbabbaa06fc015f2040548d090e2403901324a5b08574b96042f0ab1f0a00e13587220411c2844ca452a74e9d3a77ee5cb552a19e18951086cf8730ae94cbafbdfaeaf8d898a669b66d6fdbb68dbaae171a29aa4a30f1a6fe7849b69bb87ed0e43ea791b7865759f0aaaa3a0e979c318701d79d9e992ecfcdba8c5129816400308205121408ca01af7349eafb1c8c90a2281042d7dbad892b9288dedee9ec9933972e5fae94cb400a5f20e8388ee01c1162dbb6608e949acfef1f1b1fbf3832f4c0438f78e3a97d86411445159e34c2db4987b989b70b4d6e398d58b2feeaaec3755dbfdf9fcb67acaae90b852184a663f76cea2d5532690b0ae112407d3a22580000112108212f9a705d57511470654aa6149c3732d9bc1d9dcfef6f69699152dab66d99a637e34021c4755dace801bfbf542ae986f17ffcf66fbbae7b7660209fcf2b8aa2aaaa59ad0ac131c01042c19788f15e9b6ae1a29a4c433d6771cde7ea334357e4314929bde3d5fe7445b70d4229a1f476b7cd16e934b9e52ce2adadf4cb41093863d471092686ae43c5a7aac41f0a0623d1aa53068e031ccb754a9a11108201289082a94b012610426ff62d17c2354dc6b9376d0a36cee791524ae9338cfdfbf75ba679e9f2e5d1d151eaba5270c7718064e158ac542a3dfcf0c37bf6eeb52d6b706828333f1f8dc55455159c7b92519e20c84db773bda1c92d673dd07595310a25905ce4cad9402054aa94f317d2868f08ca80140a96aa220912420226045e9071f156b3478e91527a33de30421e87a0be671b1a1edebc69534b4bcba6dede402090cd66d3e9b459ad62c52018ffd6673fdbded1f1d24b2f0d0e0ea65229ced823dbb641842a954a5d34f426ae436c74cb9110b88c52c7d13445d30c9e2fb724934441632383f9420e00028c7034a4fa7dc0d025b084cb78d8af700e38e78c31af5e599fe70e0080107a2624a5f44aa133d3d3e974baa7a7a7bfbf7fe78e1d73e9b4c792debf7ffff61d3b8ac5e2fffea77fca643273b3b38964b2bbbb3b140a398ec319f3720937717d6203594ea3563a58bc958fc46282b16ab50a84d0348d09c104d754c3b11c1cd6a6c74f972d2aec6a24ac03a4515acb0178410e58d8fda3854d9a6ddb00002f430d210c0483955229954a4d4f4d4563b14422118dc5f6ecdd1b8d448e1f3b76f1e2c5aa690ace0fde7e7b2291989b9de542388ec38550178ebf06845cd4fed2b8a7bb2621d275a291a5b64825d86b5995b553aabd40480e0407820300e5d20ef61b1d1bc872560321249bcf050dbfaea8fe5038934ddbb609a4a08e8008f3f4ec6b3ffd3128e442dbb776fb762c4cba5e341dc4436312acf1afa6692242bcb1d501bfbfb7b7170090cb66c7c6c684109810ce586b6b6b4b3c7ead6bfd3aa7483765435b1d372d0750ceb8104270d7754dcbbaf0e69b0070ac6b61ace9ba9e77a9655671bc656b47673c182ea1e9f51cd36bf6f4d4715b5b5b67a6260144bff2e8a3bb77ef9e9b9d1d1d1d9d9c9c6cefe8505575d7ce9db97c7e7878f8e4c993ddddddbaaeaff3b4af73b3697a6c74cb9110604551a5d4346dd7ae5df1d6366c68c4d07a3b3a549b077c3ea9694ad8ef00909bcf4c0c5dcccde7da3ada96cd2b5f0a84104448702e84989b9d3972f73d070f1e24180f9c3dfbc61b6f00001cc7c9e5f33bb66f0f85429d3e5f3c1e3f7be6ccc993275bdbdada3b3ac042d27ca1b94d78d49b2bd672b3c8f36ea3292d67e5727b63dbb3b7f4000012002138214aa95809fa4286cfa707fdf3f9dcc8c86850426ada16b381a63800140b655ab1fb7ab738cc142bedd9bd18c05be63575690801008fbeff03bb76eecc64b3a74f9f1e1f1ba38c4108abe53280f0fc850be974babbbb5bd3b47beebd777272f2c4891396656142ea5cec3a1a9d8c68acb7363ecff98aaf5fdab7b3207ebb1acf6df53e9f86b292a8b539d5d5511686f6d40bc10023457020b8804ab3d1559bd272ae0da665f9345dc1aae33ae31747b15faf3a2ee2222811110caa9223e04248b00a8962db365cc735abaf308450241239f5e69ba3a3a3c562b16a9acc75b1a2289a2684705d777272726a7abaa7a7c7b66d4551eebfff7edbb631f686b9c32bedd48b350f96687c5eb7b86a8bc78d8b26b71c086b89af357e3c441000c0300cc178c52c17f355231c33029aea305572dd87b2f92ce5cc88b400bf2e2564c0beeae77a3d361e69ed8d37de98999ef6065c4bc101809c52c530d0c2303608e1a5b18bd54a65dbb66db66d534a354d139c4384bc9dda7ae6015f57a8b7a0524a19658c3142d4266b926872cb59274cd3f4e90a81684bdf268a10f205cae52aa898419d24a27e45c18317476c3d003141e8daae9894b2b5b5d5b66d2165a55404001a7ebfe338b4a68f539ba2d3d6d175fba143d158ecf2a54be572d993718300afaddf79fdc3b66dc7711cc70100f8fcea555f7f03a1c92c6745c7d238a11a00001004422ed0d6a0d075dd1566b55a686f6d8d47c3f9aa99ad947bfbb650cb0c2a303b3eca2ce7debbde5366fcdce51901a40a205e6929534a39e700803a9f002c041e070e1c2897cbb333330367cf388e130e874ba59247355008b9ff8107fa77ed765d7afacce9f1b171c6f8b6eddb38e38ac2a58008114d3530229c37a479e10a71c8dba848b87c8e77ed7984c0d552e752725027c52259b52be96c66cb96cd6bbfeb86439359ceb5432246392244353042d0a719c830b8650b284627c6229ade198db5b724cb553b9dc9b982697e03d82b93625455e58ca9aa2a168b7d0e0f0f6fdfbe5d4ad9d7d7d7d3dbfbfcf3cf974a250000a374efbe7db7dd761b21646060602295ca6632e9b999fb1f7838180ca4d369d7a5aaa2a31a35015dd3ecb4ab513657607cae6b2248638660e15d72c16497fb46a2285c08ca9ce68b749adc72d0c28fbd46538d695a86a630460b85bc94801365de3133b9ac6556e62e5f3643e1b678229bcbe62c8763e054850f4320d1f2c4344648628c308642d4b40430c684643399179e7ffed0e1c35353536deded0f3ef0c0d8d8583697bbf7de7be3b158d5344f9f3e7df9526a6e7626100add75e4ee6432e9ed7010465c082e8410a23169b622bc78e86db8646f0720849e0eb0cf305cd7a5ae0b2190627d630e6e1034b9e5888564b158dd78344d330c8d336059aeebce5719af42a618be70382c036ec5b42e5b530080582ca663e9501751b1623d870b2138179c0b2905af4d6cf74405144d7be38d37122d2d85420121b469f3e69ede5e5dd74fbcfefaf4d454d5348144bb76ef8e4563c562c134ab954ad575dd5028e4ba5c0821a5e0cbd2d06b043febf11ebf242cf908a228966d53cad05585aa6e3434d14de06a100b2d6e4bf2541042cb7420c4863f48545d51482c188e04fc854c261a8de88108870410ad6a9ac54c96d956a3d9c865b8c2c15978c693255015656e76325f287863405dd71d1a1c1442544db3582cb6b4c47b7b7a104686e1c398400875dd609c7bfb200891a7edb6527a7a5d587a8ea2f6aff19aac866bfaa03aed15424829154278740ad65c0e0734bdcf91b23ebf69d5c4b494520a2e800210360c9d08cd95cc76cd60d00f2132fcc1a03fa428a45c2e69c2357c0673bcc9506b2d0488105890b72de4f3000041c8638f3fd1d1de9ec9665d4a7393936dadad8aaa1e38702093c90c0d0ee7f2f9de9e1e216520e0771c87718604d4751ff072bb9cafe1731ab76aefa2c3590ec7713c111f213868aeb474935bceeaa88f92050a2158d7912b4cc74ea76721018eb45dc620511c5b2a42974cea86aae938145619b590c475b3592df8a8896f08c119337cbe4d9b363df8e083c140e0d49b6f4e4e4ee673b9a9a9a94be3e39b366feeeaeaeaecec0c8522e7cf9f3f75ea543018ecdbdca7280400c08540087b141e846ea4e636046b7e59701e8944c2e1306e3aedb80d6b390b776e001cc709fa34c7a5d393d3a9cbe3084b48844082687e29145d8b508b572bf91d3bb7b6774473f93441bed58e59bfdf37f2d6eebde79e6ddbb767b3d9975e7c7162622293c90000204294b18b172f160a85ce8e8eb6b6cef7bce73da9546a687030954ab5b6b5aaaaeaba2e67ccdbf978fa1eab7c919ac3595f0bb4b8a61cdd5bc395eb807130180c87c3ab8940dcb8d80896e305f4e28a2a9894b566010800000a26aeeb0a2e33995c201c71a965d945a22ab66969ba56c8569062006000628443d199d914317c570a2b0d6ec04b7f314a0d9fcf23a7012989a284239181b367078786cae5b2539b9d5823b6314ae7e7e767a7a7b66e2b2793c96020d8d3d3dbd5d555ae94a590d4757d86dfb39cda1baf9cff3aaa370bf11884000220857c6bba53ebe97d58b281f41ea8aa2aa5e48c19862e9a2ea4de0896b332eaf7610c918289ab22a2eaa562bea7bbbd5441b97c5e4ae0000aa03fdade6355ab006b940b5d59b5105ef31242b8aeebbaae479f5155f5d4a953857c3e9bcb79593ecf6c5445619c7bb2ee9ca18b2323e3e397bababa76eedc313f3f2f0497527aa29e5715a95adbe1bc2b78d74fe01d40f35b0e422bae3c0180f40af1420821558410215848916c4dfa7db054c85301a4143014d97bf82edbac025ae4820b2af1355eb370385ca95408c68e6deb86e1388e14c2711c9fdfefbaae63db00424c94f7bdefd170383c3d3d5328e475dd8010beed1a6b10a2eb6e60e80d8be6b71c0f6be4d61cc7010001a1330124220080aa59a51c6045e11c4a8eb4400c6bfe52da62c2b25c4731022b1ec773388410555555554518734abdb24c2291701c677868686a7ada6382124531ab5529a53f18dcb17dfbbdf7de4788f2d24b2f4d4d4df9fd3e841146c85db780c775e57036083684e5b8aedbb89e20840d7624827e3f5634db415cca682436379f2d178ac180ce15c33431b045a6600be602a95061738838b8222add1803b894628c6b92b95e9c03a1e0fccce9d31d9d9dbd3d3dfbf7ef8fc662f95c6e6a7a1a41a8aa6a2c1e7fdfa38f4663b1f3e7064f9e3c699ad572b972cf3d77634c6cdb66944a2189a2288c3546f9351ae84a8c81c54c19b9e44fcbf9a3d7fa182ceb455d7c62cb4e490820241012365da0b3212c07d456dbca8951d77590008c291c409fcf1082abaa9a8c274d81a68b88da01400cbf2f620357121b20bcda125015c5eb0ba8c53942208c154599999dcd64328542a1bbbb7bcb962dc59616292542e8963d7b366fda24a57cf6d96753a9a95c361b8dc66eb9e59650284429b36ddba30f304a29a56b74595fe70d08cdea039bdf7256ec9d6c7c8880e0d4e100ab8a425dd7f0ab40c1dc75f20587da1ac061a618a694558705b82bbd19a0d7024fc5737a7a3a93c9241289cececeeeeeeef68e8eb6d6d6575f7b6de2f265c6396762d3e6cdc9641200a0a8aaebba94510000c6c8e3ad2184f8d5a96bd7dd1af5fc9e14b2c90804a0d93ce85b02c60a4258c3c8a76bd9f9795dd72126e3972799eb02ea02c1046014702a18c444d7fdab1dc7a5d453c7f5e21c08a1e09c526adbb6149c736e5996ebba8944c2f0f966a6a74f9d3a0500302d2b9749ebba71ebbe5bfd3e7fa55cf6e89e9e4ca1a7ee29a5c0d79a2db89a52c23b86ebd09edf1634bfcfa90d299068f16da2fe7322caa58a8994949a3920dc40282801a5220d2c0a2406d0c5a22a01c15802005c46154296271ba4949aa631c6300082f35a64252544c8f0f91cdb8210de73f7ddb7de7aab274a68d9763c1e179c1f3e7c78e2f2e54b9753c78f1febeeee8e44a208424dd384949c31c13926445554af39acf6594bd2d0578ca471dabb90604940b2b44160ad6bb6ee1a0ef0586a9e6f69ac6e357b126f0358ceda9008480800428022c000905c082a412d9e9100708e2513a4d61eb3f68ea92e568830f6169f14a290cb6ddeb2f5a1871e6a89c74fbcfefaa5f1f16c2e97cb6611c67d9b376feeebdbb377efa6cd5b4ebc76e2e41baf2792ad87efb883288adfe727980829d7c75aa935c83476bc5d27b8e9736e78ac9c2f92b2b19314132438e782634ca48440428020c408138209e6400ac1eb522f60a579bab5e3208430e68233ce1f7bfcf14dbdbd535353afbcf2caeccc4ca954b22dcb7bd9c59161ca586b6b2bc1ca3df7dc5d28165f7bf5d56aa50221721cc7755dc3b8bacce7f58cb7c6ecbe21d0e496b36896c1aaaf118dca9d1e0ddfd39d01b0a6fb0a716d32391342ae83825527680a211442ce9c3d3b393939373757ad5619a59aaed7fb6d52a9543a9ddeddbf275f28082e6eb9650f42584ac938a38c1a0080eb3e7bb6369a75dbd6e496b31a603d430d8194525574db72381718a3603058364b8cba10abb59d3b428ee34004258286cf80107a1144a3c3810b3377a110524adbb6a5100022bfcff7d24b2fcda5d39e421aa3d423a101008014585109c694d237de783d180cf6f4f4b47774388ee3330c8fe2594f0c30c671838ef3b2d2e735dcdad7d535bdcaa11a158017bda626d5ddd0b9242400004388015acf94bb1b0e4d9e5bf3fa73aeaaba54774a08614fae052a8a94124001a01010408c25425248c1d77507ad377871213abbba766cdfee35181345f1f40910c65851bde20fa3540a7ee0c08103076e2b168be974ba52a962848281a0eb522925c68ba6f6dec4f58026f739abdeeceaf9288930265ea73fc608625436abb66debba6e9b8e0410200409c088608424104c320034b07a84e301130211128c71c642a11046e8eea347e7e7e707ce9e0510eabaee380e4048300a113e78e8d0dd47efb16cfbdcb973966951d775a92bb8a08c2a447b7b2fc83b0c018084cdd647eda1c92d673d801072c1b910082108a1e35a0e735555752d974b04a0c400428c5c0ce0d5b643f50d4c7d6725a51c1b1d6d6b6f8708b5b5b76b9a367ee952a954228a421db3bb67f391a347bbbbbbcf9f1b9c9898989d9d994fa7efbbff7ec3f0150a79cb32fdbe00849031e1ba6ee36eed26de7534b9e54008a4e48a82299552f286e7af247b1dea72ca02860631367cc867f842a1507bb27d6e263d797916281a11ccaa14750c59c542a0a6cab9fcb3ea66e3ba2ec25870eef5e34f4d4d8d8d8deddcb52b9148b4b5b7275b5ba7a6a62e5cb8f0fe0f3ed6dbd3830979e9a597ce9e19608cebbadeddd3934cb6168b8572b9e2f5840200bc6efef57cdfc5bc35b1e44f6259a66bb5d75f19d8b83ed41a9620ba721c048197e3bf963ad20d8426b79cf58032e6f3191031c7712a8e1b8dd37c3e979bcf10800194a052e2b615f4878b99b406653c1a660e5b8d02d7581c04b2366cc9b6ed682c36323272f9f2e5ad5bb7020a43b8630000200049444154005455fdf8134f183edfa953a72e5dbeec388ea669adad9148240a00f09a7316cd7ebb89eb0f4dbe01583d18f1ba448544422e742f52465deac6e3f196685c3066554c481400a4e42c14f46129b8631732f3d7aa2f0e21cc67b3ccb5cd4ae5dcb97301bf1f21343b3777f6cc19c7718ac56236936949247a376d4218b9d4e55c08292182f85a3b81ae3f080864938ea0bae17f9bb78c5abd454a4cb044d0755d8490745d5dd7555575cd3242aa4a30f51b04c8c27c5ac728198fcf96b340c83ab1650d3d1d00249035560e658c53f791f7beb7bfbfbf502c4e4c4c8c8f8d7574766a9ab66fefdef14b972e9c3b93cbe6b66ce9d375ddd3f8c30831e169edae99cd83025c670593e512084de9363790e53492a6a5840bd401e4505b735d4df785a3518bf2743acd29c58a01a82ba52becea8b2f3c0f72f97077e291835b247520be92205ed2f60321f492ce5208afc6e2851604e3dffeaddff5f9fda74e9dba78f1a237777a6a7aba7fd7aed6b6b6dbe2f1ea8e5d172f5e7cf9e5972391682c1a430ba3e12973108452728ff9e97d9090d22b4301003ce3bcf2bd569987031a4a31abc5366bf7e1345cba85d368602235a56dac8d0d64394b50e39541100c06b99465b35a2e571d879e3f7b1670176244302008ba40004981dfd7d5de2a19752cd3a7faf88211aea7c677dbc1830f3ff4502a95fac94f7faa10323b33e3154355557de3f5d7bb7b7abababa0c23b069f3e64422313636ce3803352169006e4002c1924aab5830e8260b0c3690e534f654c2867e119bba9c711de36432b96dc74e5551db5b132df168c0a76afea8abc64820a6a83e68e6077efe1d6e5b3072756b41180380008418a1ce8e8e63c78fcf4c4f4f4e4e5aa6e99d492018ac562a4455531363a989cb3bfbf774777743087b7a7a18a5370503ae7f6c20cb590d504820a46668f178fcd603078bc52206b05231a96dc9a255746605f16b86bf9a9d1e3977a16fd3e6827d152750dbb5110200c0845c181cf4a4090d9f0f00401405415829972184cc75b162000006cf9f1f1e1aeeddd4dbdddd4d294318d585131084eca6155d7fd8089683004040a286e577e58e8e24f0299a231ce6b89aa6bdf0b3e75555735d8771a62202007025a45c0a80023a09c6dbf226900835d0ab1759516dad232484c0187b5c359fcfe7a9a5790e87734e19f3a61d42423042aeeb46e3d1fdfbf7b7c4e3a954cab4ac6030e8f31bde082a8fc2c3970524f5569c7aba628da69aba44f01a9769c9cc9cfa4674b5800736969816668682851dec9a9bcc25e77943eee33682e55c055082783496cdcd3ba50ac60ae742d7f542211f89461cc731108c1a3a218a10c2f30382bb60f5e859708e31e60b9a1b524a4551fafbfb3bdadb4f9f39532e9731428010d7757d7e7fb55c64006ddfb9f3eea3473d7a41a158741d07004030f60689aaaaeac97db8aefb8e5f9b15bee00acf5f5b7b7993f8cf8d683972b18214e73c9bcd86c221cbb45a5a127e7f209b4defd8b17d7070a467f3268590d9b9b9743aad699aaaaa08218ce18a96e30906000070c3d01bc1f9d4d49459ad767476de71c71dd56af5f8f1e3de489f6aa5d2dad671e4e8d19d3b764c4c4cbcf9e69ba9546a7e7efe8e3bee401833c6f8350a1efcb2b124890737361ba8c92da7de9f23a4c4abe6c184a62b9393933b77ececebdb323a3a1a6f690987c3fbf6eed534ad52adfa0ca3b3b353d3b44aa5924ea763b1f0a2375f2df7353e3a9a8fc51cc78944a39d1d1d0f3df8e0e5898991919123478eecdfbfdf719c9f3ef7dcc8c8482e330720d9b66d5b575757a55acd66b3b66d47233184b090f27a70382b3f7f9d99f73b8626b79c15012104a03e1a401a869e4ea7dbdbda00008ee32493ada9d44434122b57cad33333baae6feeebb36d7b667a9aba6e229160cca96fe5d79332d60da390cb1672b9f6cecee9e9e94020108b461f7ce0811d3b779e3a75caf3338ee36cdfb9bbb5b5b55028787662dbb66ddb94b98661600410947517548b739685376b146456ab48aed187b3e2f30b21960060d55ad00d97467f6b6872cba9f99c65d32d1b313b3b934c262b95aaaaaaf97ca1582c0603c1c9c9c981b3039168249148cccfcf673399b9741a63d4d9d1592a3b8b3fa241c86239107229f5058266a592cfe554556d6b6df5f9fd5c88e77efa5388d0dcdc9c6ddb5bb76eedece8302d8b525aad5428a50a21c160b076e4777b5fd468751bd6c92c41935b4e23eaeb4f0a8fb4565b0ae170d8b66dc367cccccccea7b3baa15fbc980300b4b6b5228473b9fce4e4a4aa92582c8230ca1773d7caf60f8542c542010070d791235d5d5db665cdcecde5f379a2283ec33870e0c0ccf4f4f0d050b95ceeecec4c2693aaaa32cea9aa6ec0c2fc0d8426b79c354afcf52481d7b76c99563018741c2a856c6f6bf3b61c966571c6fcfe00c6c01ba2463006d7483629e4f39bfbfa1e7cf0419fcf3739393978e1422693999b9de9eee965e1706767e7c143875a128993274fcececcb477741c3e7c9833562e974ba552b2b5f517fafe6f07ea0ea791dd2357d7e9de206842cb4100542d47d33482000740080a6ba30759fd25105d29ef388e8310d60d85338631669c0bdb06002024150511a2783dd4820b8960a3c341100200ebd6c9389752aaaa2a84d0b45a2fa76ddb8f3cf248efa64db66d9f7ce38de9999972b95c29970190d33333d33333b97c7eebd6adf178fca1871e1a1e1aba78f1e2d8d8584b4b4b3812810879a52108616d200f006071b0b104eb9166bf262db525a8fb6db87a7cb5582471f9a0ab26c9c835a1e5700954554508300100003e9f1f636fccebc26f06c1122295105c080e21ac8fe97b0b300cc3d3e6741c87ba2ea714002085f0f9fda9546a7272727c7cdc719c9ac82dc4827384f1dcdcdcfcfc7c5b6beb8e9d3bb76ddf1e6f690904021042dbb218639c791c36a869dabb955e6b7438cb23ae0dbba56c42cb0100600c399708412941b158b42c8b318e50e36f5c531e441042883126104129a4841049e929ce40586b8d8475c2018408e1c5f7d42b2d6e96654929359f8f288a5228289a8611f2070223c3c333b3b3b96c564a89308610624200009c522e188058d1f5542a353b37d7d3dddddada0a00609452c61084086321841402bddb498215b17eb3b91ecffe1743135a0e868009e0384ec0a70b08a414e170786666ba512eb3be45170038b60d11ac391c0139e7de3285482208ebe47cc1c5c234a895dd528d8ac61882d0b66dea38425138639aa60921a4e08828525c91afc58ac2a90ba4649c1b3e5fad9253a96432195dd7114202424dd31cc7614278cee7ddc292fe85fa93eb79e32fe78cde7d34a1e500000802019f0e00304dbbb3b373dfbebd994c269fcfd75f20456dcb0e218410d7b99500204f750d002024f72ca7f616292184884300c48a258b4030485d9751ea526a56ab00308434dd3022d1e8fe48a45aadcecece4e4e4e72ea0200105138638aa673cedbdbdaee7fe0816020307ee9523693e18bc3248510ce9869598ab2b2de6763df8e5c3dcea9affef5d45e961ce74a5aff6a319290b2d1c148c1bdcbb6f6bb6e4434a1e5d42496250000280aa19455aba610a2a3a3fdca6b1a1a7c1da7361bcdf33962616b24016f14b290427aaec95ba2cb3f57d33446292684526a9966d534354d23180f0d0eb67774b4b7b579e49d42a190cf6605737423e052fa81f7bfffc081036fbcf1c6c99327cbe5f2a5f1f143b7df1e08043c3550c6180000616ce83abbda1490771dcbedf0a6cfb96120a5940bea4e524a4521d3d33303030352cac671004240b420268811f26e8a10428c9110dc539c91122db21c29204410420057b61cd77539e79efbf2840d2ae53282b052adbaae9bcfe57c7e7f7f7fbf59ad8e8e8e4e4e4df5f4f6de73f7dd4451bef7fdef6733994c26635a56efa64d2d2d2d82736f0a08f646c34b8930be8a1afcbb8d46e75c7f7281bad084c5d366b39c254000e8ba9ec964344d6b08318094805fa9fd837ab660c1e70870ed3ea7c68f260400e0380e670c61aca8aaeaba8944c27b72727292609c4824f6efdfbf7bf7ee93274f8e5fba54c8e74be5b2cfe7ebdfbc5955d56020904ea72bd52ac1d88b73a41094ae7b68e8bb810dc2b86944b3598e27fabca0d904b9049cb370386c59160000632484248460ac785c66a228b66dfbbc84321352ca62b150281410c28cb35028c028cd64b3baae6fd9b2c56ff8f38502464848a9280a84d0b22cc33008c6a552c91f0878b5170ca1a2aa404ac11800001322a4eceaea3a77eedce4e4647f7fbfaeebe9747a6676767e7e7e6e6e8e33e60d6cb36ddb1bbca3a8aa4208e3dc6becc1082de7bf2cb75e0421ff0556f06a3192f7719e2f5d7bf755cb5fc3a547000bc31feaaea709e29e66b31cb00a6f404a691846a5521642fa7c462e57f4346ed2e9743c1e2f954aa552c9b66d00d0debdfb0e1c38d0d9d9d9da96701ca7542a99d5eab973e75e7ef9e5cb972e8542a1de4d9b745d9f9c9c8410c663b17ca150729ccecece4aa5b2da2909218606071389c4631ffeb04be9abafbeaa691a84b0a3a323994c4e4c4c0c5d385fc8e777edda4530f6ea3698903ac513e1f50dd1591d2ba6076ee21741135ace6ae09cfb7c7e4dd3a6a6a63a3aba0af93c00a0abab2b954a59a6d9ded1f1810f7ce003efffd08e1ddb73b9fce8e828c6800ba1aa6a2814fae4a73ee538cef3cf3ffff4d34ffffbbfff7bdfe6cdb1781c42582816fd3e5f2c1a9d9f9f370c63c5cfad96cbc562f1aebbeeeaeeee1e1a1c9c9a9ea6940e0c0cb4b6b6f6f5f50502815dbb76f5f5f59d3f7ffed8f1e31dededa1500800a0288ab831b995b524fec260b97aa0d3047ea6111bc8722ccb340c5fb95c4e2693b6657121dae2f1d74f9ce0427cfa539ffae297bed49a88fefdfffbadaffe3f5fcd66328562717a2a0500d0753d180c6eddbaf5ce3bef3c72f4e833dffed6b33f79febf7ce10bb333339d9d9d5ee2a16a9af559038b085d1022080fdc76dbc30f3f3c72f1e2f3cf3f5f2a95d2e974b55c4684cc4c4d653299aeaeae8e8e0e5dd70fdf7efbe4e4e4c8c8c8d6ad5b31211863dce06a56aca8ac1f371dcedb8ea6b51c6ff50a0144edbe271445f59a350100a552a977d3a6632fbcd0d9d5f5f5afffb7fbefbbef9967fef54fbefa27f95c2e1289160af9682cb669f3e63af1e4673ffbd977ffe33fb6f4f51dbdfbeeffebbffed7d75e7df5d73ef18913afbdb67bf7ee6c2ea7aaaaaa286c21b1e6bd05d49a0cd0810307068786ce9e39932f148ac522a734140e574d1340485d37954a158bc5d6d6d6d66432914878e437ce98e3389665f97d3eaf59a1f1abaddd87b3c62b97e317a9662effdc85577ade65e1b16c32675343d35ace7208213897c16060666636996c3b7ffe7c4767e70f7ff8c36824f699cf7ce6fbdfff412291e8eaeaa2946ddabcd9322db35a050baba16fcb1655553399ccdffccddf3cfbe31fffe9d7bef6cc33dff9dddffdfcb7bffded7dfbf6e5723985d4aea4370b514a59d7953e76fcf8d4d494699a9e2171084bc51c440a9022100a574ac55c66deb2aca1a1a16432b967cf9e4ab94c1405a3453373d66e315a8ef537b1ddc45b4373de0f9603424408d6342d9bcdf5f6f654ca65cbb27ef8c31f1242eebbefbee79f7fbeb5adb5ababcb75a9105c210ae7ccab3c6a9ae6f3fb09218cd2582c76e4aebb5cd77dfc231f79fae97ff9fad7bffef8e38f9f3d732610080829eb02eaa2b6b3aa6df109c6adc9a4a6695eda3a1c0e634587086145b52c0b110500e038ceae9d3befbcf3ce62b158a956bd62cef5c955bb3aa00050d495bbaf9ff9f26f2f3690cfe15c702e82c1e0dc5cfad2a5897f7de699cecef6db6e3b949ecb6cdfb19d519acd6523e1b0e338d95cd6d07500142e84ebbaccb2208484102ca5e0bcb5adada3b3f3939ffce45ffff55f7ff5ab5f1d1e1a3a7ffefce6be3eb04ad74a4767a7e338dddddde7cf9f4fa7d3a5520900a0aa2a1782b90e00a2bdb3e7befbeeebe9ee1e1c1acae772524a5551ea8344c12aee628d12ca4d87f30ee0c6bcabad1b10020431a31c421c0e472dcb310cffc8c8e8e73ef7b97befb9eb431f7aac90cfefdcb94d0896cd653002a655a5cc3574950b5635cd72b9ac1b462010e09cebbaae691ac238e0f7e7b2d95b6eb9e5f39ffffcabafbcf2777ffff7a150a8522e7b0c68dbb65555a58c21a2104591520e0f0f178bc5583cbe73d7ae1d3b776a9a4614850b81115234fd8187defbb18f7d8c10f2ccbffeeb8bc78fa752a97038ac1b06e71c414819d30d4370ee36544297e81fc806347e772944fddf8a17472c0b8a563cce355f7309a0f444eeea4f2da4d7c1e2e76f6434c7b758172e8d8fb7c4e333d3d3b7dc72cbef7de10b7ff5377f7fe6f4e9646b6b2e9f771c279148785b294aa9e1f3791ce76824625b96659ac964726e76b6522edb96e5384e30184c2693f158eccb5ffe726f77fbaf7de213a3a3a394528490a793d6f8b913972fcfcecc9c397ddad31b3878e85028149252f6f4f47cf6339f3970e0c02bafbcf2da6bafcdcfcf9b968509d9b2654b22915008e14230c63cf6409d035ac76aabfca67b7967b051766b10c2583c0e111a1a1efebffff00ffd81c0dffdeddf22840cc30887c38ee314f2f9d6b6b6542ae5f1097c7ebf9771268a2284989c9c8cc5e38aa22084aa950a262493c944a2d1a1e1e1bffcebbffbf8134ffcf8c73fce65b3c9d656ceb9584c30c3846473b9f94c86288a6559f1586ccb962da150a8bfbf7f747474f0c285d9b939dbb6e3b158b2bbbbbdad8d32665b16e35c2184232484609c2384c4dbca5b13bfb06f59e3d8008085dcdaf29ed026c106f23918a1423edfdbd3f3e1c71efbc7a79e1a1b1fefebeb2b97cb857c5ed7f5583c9ec964bcf183c542414ae911611cc7492693de589b423eef998d42482010f0fb7cf158eccffffccfbbbabaee7bcf7baaa629bc25be6c3408670c423878e1c2850b1732998cdfe7b36dfbc46baf8d8d8d8d8e8e0a21babbbbf7dd7a6b3412c9e672945297528ff6e6510df84273e85571d3e1bc63d8409663db76b158bcf3ce3b2391c88f7ffc9360203433934ea5a6a667668687864aa592273aa3aaaacfefcf6432e3636301bf1f4138333d5dad5432994c28146a6d6b63945e181c9c9b9d0d85424451cc6af5e73ffff9ed870f7bec4c8f24ea6daebc8481f7bfe17078fb8e1dbffd5bbfb56bd7ae52a9e4380ec25855d543b7dfded6d67669ece2f0f0b0e7e8fc7e3fc6584869db3617c2a3782f696396ab609d97a271964eadda25c495c79caf16237921d63a85e68017d52c843d4d86e6fb46ab221c0e178ac543b7df3e3f3f3f343cecbab4bba7fbf18f3cfec94f7ef2c8d1a3e9743a97cdbaaeeb38cef9f3e777eddaf5c52f7d696c6c4cd7f57ca170d791233bb66f9f999d1d1b1b238af2f8473e62f87cf3f3f3b1586c766eee8563c78e1e39d2ded6e651ce2084b5c527a59452d77597d23beeb8e37d8f3e3a3d3373e1c205d3b2ce9e39333636160a853c82c291bbef2d954acf3fffbcebbaaeeb7a9112634c4a891042185f2b81e0aaeaec8b5ebcca2caa9b58034d6e39f514b1943297cf138c6fddb7af582c160b45d3ac7efc89279efcb3273ffec413dffce637ffe5e9a77b376dba7ce9d2b973e77ee3d39f7efae9ffad695a3a9dcee672baae3ff9e4931ffde847cd6ad5b2acaeaeaefff517fff39ebbef9e9c9c5408d1346d7a7a1a61bc75dbb61a231b214f3c4070ce85e8ebebfbd217bfb87bf7eee32fbe78eedcb94b972f5fbc78d1b62a737373030303939393c562311289ecdebdbbbdad6d6262229bcd7a42ec3ec3f0a6522384de468de95fb6d92c78b326b7c08d92210000608476ecdc2984183c772e10f0972b65d3b24686473efbd9cfa6d3e97ffbb77f7bf2c927ef3e7af42b7ff447bff785cf7de0438fffe0073fb870e1c273cf3df7fbbffffb53535383434300002904466874f452b9528944a3b97c3e994c5ebe7cb95c2eb7d57d4e2dd411402229e5adb7defae24b2fa55229c771a62753585105e700128cb147d02e160a9cb1682cb67dc78ea9a929ef54a5945e29b6bee55b4b3c6e31d66f0037bdcd5b46f35b0e4452480e80705d9751daded171e2f5d7b9608a822dab8a3028572a94b14fffc66ffce33ffee30bc78e314ab7efd85da956a7a6a6b299cc37bef18d5ff9955f492412aeeb624218e75c8860306899a6e05cd775c771186366b5ea3df6f4a95455553483ba6e30183c71e2c4d4e42417c2ac56b1a272c688a2b0852d9955ad58a63937371708063b3a3a828180a1ebd95c8e338609f1bc0d5c6922cdf23aa95cacc376d5fae91a7151e39fd6f316282458182ac485c084082111024c48cbb656fb941b1a4dbe5b6b849700705d97603c33334330eee9e9e19c2793c962b1685b160060f7ee9d834343b7ecd973fcd8b1fff8ee7777efde7dfffdf73ffdf43f49292dcb3274dd1b14a5695a3018d4751d00e0388e9718000078a54f4a695d27cdab0b29aa6a56abaaaa72ea4208996b1255e5d4e18cf90241843190a2ababab6ff3e67024323d33c3185354952fa813ae478f7789d9dcc42f1b4d6e39f5afe7ed79cc6a95511a0806a3d12817c2b6ed423e3f71f9b214e2773fff794dd33ef2d8afc663b1a79e7aea8563c7fecb17bef0bffee22fbef6b5affdd6677fe7d2f8783c169b48a5a667661084994c2693c95c181c9c9c9cd4753d9148208c6ddbc60b2969ba9044a694fa0ce3d65b6fdd77ebad914804228c308648659462455354d5719c6834fafe0f7ee87d8f3e1a0c06bd59a28aa2689ae60de1c15e8660cdd4d93acda63137f08b7305ae7232cd9e1f6ffedd5a1d94314f4c30120e2b8a323f3f0f21bcebc85d5ff9ca575a5a5a8e1c3dfad5af7ef53fbef7bdb303037ffaa77f7af0e0c1d74f9c70293d74e850a150f8e297bef4d18f7e74f7eedd5c889191916030f8b9cf7dee634f3ce1baee934f3e699a66381c2e954a8c732184aaaa359f8310e33c5f289896158bc5a291482291181818005278d18ee0fcf6c3871f7ef8e1f9f9f99f3ef75c2a952a954abb76edf2ca47359dc4858a1059508d5ab2346f7a9b77051bc87242a1503a9d1e38776efbb66d8661040281e3c78ef90c23994c42849e78e289f1f1f1db6ebbad90cfffe67ffa4f5ffffad7b76cd9f2c94f7e32100c6eeaedfdd18f7ee4f7f91289843748e799ef7c27140a25120921e5fcfcfcd6ad5b2184a3a3a35e64ef75a4794b5f08313232d2d2d2e2330cd3b2da3b3a22d1e8ecccccc591e12d5bb7ddffc003a160f0f8b163e7cf9f2f140a94b16834dad9d949292d168b9e800e1782390ec158ae1e6fac2823b876dfce0a24b76bf4128b4846abd82d040049809ad1fd6c20cbf15cc1cb2fbffce0830fc6a25146e9b1e3c7bff7fdef03006cdb0e8542a150c8300cc330fc81c01ffcc11f4463b1ceaeae6c264319fb1ffffdbf7b757daf89fa85175e28954a08e3f6b6b652a9f4c8238fe4b2d999e9699fdf0f17c4a804e770215b303f3f3f3b33d3dddd2d84d0753d100c3ef0d0c3fdfdfde7cf9f9f9b9d4da7d3996cb6b3a3a3a3b3d3344d5dd729a59452c771745df71674632574a9cfb946f5cd15cde66db8be1b0c4d1ee734a258282493c99191114ae9c143874aa552381cded4dbdbddddbd67cf9e9678bc251e2f140aa669aaaa7ae0c0016f8ec0962d5b5cd70d4722914864735f5fb552f11986aaaa6deded9b7a7b33994c4747477f7fff8f7ef4a342a110f0fb39634288face4a21c4634f238c5313e39393938c52bfdf1ff0fb7ff2939f4c4f4f7b33dbba3a3b77ecdca9284ab95cf69ae438e772a1e7072c1e1cbd36aeea3ade49b391000808c47acffd46c206b21c8471381c7efdc489175f7cf1539ffa9417937841b36559fe4080711ef0fb3d8af4e8e8a82792363535a5ebba611818212fa95d2e977d7ebfaeeb08e372a5f2e0030f1c3e7ce8fb3ff88190d2f0f90000b66d23083d1a0b44480a6155ab0a21db77ee7eecc31fdeb479b36d5963e3e32d2d2dc160b0a3b3b3a5a525954a0d0f0d398e138b464dcbe28ca98a52ef33f5029ef5506cae75c7f54b351b219b59fc6003598e37758328ca534f3db57ddbb60f7ce0038383837ebf9f602c38374d933356ae54aad5aa65db5e0147d3b4682ca6288a6559424ac77128a59aa6492973d96ca9546a6d6dfddce73ef7cc77fe756060a0bdadcdb62c45551b97a3571bf507830f3ef4d0c73ef631d3b266a6a7a7a6a747474747464620845d5d5ddb77ecd8be63c7ccececc8c8483697f3f4a32963524a5a9f0ebf7828e78acbf197972b5b118b5ee3b917af1f16029751098100d20bd514a288eb5a9ff4ad6003c53944512a95cae1c3877ffce31fffcbb7bffdc77ffcc73ff8fef7e76667e32d2dde6827d3b25ae271c771aa958a6ddb08635dd72184b66d23843c6942eabae572391a8beddab5ebdfffeddffef08ffe68735fdfeffdfeef87c3e1251f57d707bdf3ce3bf7ecddabaaeab3cf3e3b353959a956abd52a8270767adab6edaece4ec3e7ebecec0c0683e7ce9dcb66b3f95c4e5155bfcf972f14eae2376fbbb7790720a504f07a3cb1b7051bc8e760840821954a25994cfed99ffd1984f01bdff8c685c1c199e969c77108c68aa264b2599752a2288944a2adadcd6b53f3fb7c9eb6ba2749138dc542a1d077bffbdd8ffceaaffec11f7cf12b5ff9caf4d4d41ada68dbb66fcf65b3cf3efbecc99327b3b99c659a9c73c7b60100855cf6fc850b857c3e3d37974c261f79e41155553dae8358c8477b07593bceb96e57a780403469a8b3817c8e69598140209d4eefddb3e7273ffde9affffaaf7fefbbcffcc33ffcc3273efef17dfbf7ab00388e138944a494a552a99e145608111853d7e542108cc3e13065ec27cf3efbc8238f7ceb5bfff4d24baf7ef39bdf4c2693d168d493dd58be885f79e595d1d151e6babe40c0324de9c9e2008988229823181d19190100647339c7716ebbed362965b552a9562a8490150fe8616d96cd4dfcb2b1b17c0e672c140a158bc5fefefee3c78e7dead3bff9c10f7ef09f9f7e3a9bc99c3a752a994c324a3df5b35834eaf7f90cc340183b8ea3695a3c1e278ae2119c7fed139ff8def7bffbb3e79eff3f7fe777ba3a3ba5108410080984440a082181102ffc17dbb61d0e8743e1b059ad428488a20442210020c6182205008809c184944aa5fbeebbcf34cd72b96cd936583d7c5f5b5aa0feaf11a2119e9409e782f345af59e5dfaa68e8e159b499940848040186004b01a48457dd6ade88d8403e4755556f7e936ddb5e5eeb9ffff99fcb95cad34f7f6be7ae5d7ff2277ff28f4f3d158946b76edd5a2c16bddd9157b90f8542b95ceef2c444b5528944a35ffef2973ff399cffcf087cf7ef6b39fc50875777787239172b9ac2a3a58c9037477777bb49ad1d1510000a5b4522eadf6491600002000494441542342a8636345051873c63ef4a10ff5f7f79f1d1848cfcd31cee3f1b8a1eba66501cf7e56e2ad35df5abcb1b0812cc79b85c6288dc762174746ba7b7a8ede7df7cf7ffef383076fffc637bef1d4fff7b7bff99bbff9ad6f7debe73fff792693894622e572d9a55421c4f0f9a4105d5d5d1f79ecb1273efef1d6d6d6af7ded6b7ffd577f8511eadbb26d667a3a140a29445ded73a7a6a6babbbb5be2719fcf572c16bd949a4288c3b9a669fdfdfd771c3e8c307ef6273f999a9a9a994aedd9b7bfde525a975c5b3edaf68640ddbc9b6f043c6cbe5b57e33e0601303533fbf8e3bfca39d734a35c2e2384344dd3342d9bc90000c2e1f0d8f8b8e0fc91471ef9edfffc9f7b7b7af285422a953a75ea543693f1eafdaaaa1eb9ebae5dfdfd939393c75e78e12ffef22f272727db5a5b03c1207519c6040020046f9ce93737373b35352da588c5e3d54a8928caa6dedeb6f6762f7197cbe72f5fba944c267fe5d14763d1e8e0d0d099d3a74dcb2a168be170f83def794fb158cce772a665e9bace288508356adfac2112bd1ae3a63181b19a12c86a0dd26271427cc9692c7f7e097c7eff4b2f1dd7348ddc90b6bf2a9ad0e72000ccaa6d183a44400aa0624d57748b598c3108a1a1eb9810b36a87c35129a5e3b8b7eedb777962e23fbef7bd975f7ef9963d7b8e1e3dba6fdfbe8f3cf6983f1000007869e8a1e18bdffef633c78e1f1f1f1b6b6fefe8eeee2598080e3026dea2a94f7df3ce6121709052d46a3203674f974aa5583c1e098721843d3d3d870e1e4ca552674e9fce170af3f3f398907d7bf76242bc500442a8280ae79c710e8550970d095d5bc7708de7d783b7f17e2aa58410379dcb6946cb0100f8fc3a00c075996db9e572d9b22cce39421023c48510942a0a915232c6b910e9743af2ffb3f79edf715df7b9f03efbecd3a6174c476f240056b04814c526db926525511c3bb9f15af76ddf6efea2f77ecfca5a37cd598e13cb71aefdaa4b9444b18104090cdaf45e4f3fbbbc1f36014185b2142b9100f2595a5cc0e8cc993383f3ccdefbb79fdff384c3f178dcb6edebd7afbff3f6db3ebf7f7c7c9cebdc785481a19bba6e0402fec9c929c77128a1183cea23d8bbc964e98b276cdcd9030058a956abb5daf4f47436930100bcfbeebba552a95aab298a92cde5d2a99488d0f6d6563299c484604230c69aaa02000441409284bfdbb16d4f1a0e21732cd3d17c0a004096912c23dd50455184105201a8aaea614c29c59460421865508422428ee310cb9224696e6ece735dcbb69bcd263f1bf7580b04fde17090322640be2f4e77c794dfffdd6c99a600a100612c1a7de9a59774c3a8542a8ee3c8b23c3a3a0a45b1dd6e379b4d82712e979b9c9afacffd74fe6bb16f9df3ed5ec8378f43c81c555500009e4790280a10104cb860d9c51e6f17238440282200644dd6341f63d8f53ccff3b85c00892242c8a7693c651a21244b12d71318baee61ac6a2a250c1342c957127d0910aaaa7ae5ca95f9f9797d38ac6f6c74bbdd62b1188d46171717979696fafdfec6c6466167c7b66dcde71b191941a28844110b828731bfb03d0ddb1e0edf02f560e11032872fd42549a4040800341a8da13eecb43b9adf170a852cdb460845a38f120e1b8d8624234551244962943a8e43289524495555d330544d63949a964508190c06aaaa06fc7e6ea94e77f7493e796106250949b2ccad08441161cfc5d83b7264e107dfff816ddb376fdededaccb7da6dcb341545a9562afd7e3f9bc98c8e8e9e3c71627474746b6b6b676b6be1e851c698b7db8f8d44f13369879fe1cce3aa028f5bcd7fede77e85aac0fe9f0561ffd5b2a7f939070f7c86b0bc7cf27ffebfffb3dd6edfb9b7b2b3b3f3daaf7e552a16001000102445259800818aa2c818c3aefbe889102249f25c178aa22008c4730080a224010088e72119edbb511e150604410000326e6401050000f66c012284a47367cfedec6ce7f3f94ea75badecf883e14030c87b198c617fc3b286ba9ecd64144599999989c7e3dcf20642c8be341ef4098c83fe4ee1503307024681e7d1e5e5e5bffddbbf7dfffdf745081545199f98f40742dc36006342882bcb32841013e2b92e37dc1021741cc7b66daef9f7f935494282003dcf1345f8996f7d4110008382201aa64930912404a128cb12ef967be79d372ddbae948a00807024c6473009210f6320888cd26ea7d3ed7402c1e0e8e8a8cfe7731c87773f5042c4cf4dd20e02f68f6fec697ece81840001425010e0871f7e58afd7a7a7a7c7c6c644841cdbabd5aa3c405796350142cff330213ebf1f42883d6f6059b22c67b2d958340a45d1712ccb322dcb668c61ecedd507c0be883f9f2fc0775d34cdc7537229259e87354deb74bbaae6b32dd3b66d7e611ec68c525ebde6d639b22cc7a251dbb6b9dd2177b51677f740d91725f37c97b1f7e5f21fe8d33e1038e4cc0100001108002005398eb3b1b1d1eff542a15038120904fddd6e37bfb14509898f8ca45329599665195996b9b5bd9d48242e5ffebee338f55aad542a890885c3619fe6eff67ad8c39b5b5bc473b2a3e3b1581863c28bce776edf191f1f5f5a5a9265b9dbed743a5d42b028a2543a9d4aa7f3f93cdfdc44a2883d8f512229aae7ba489254557dfee2c58585855ebf7ffbd6ad56ab353232c2189365d9b66d4dd328a53c6f87bf21fa450e1e9fc737d5b5f655cec359fde9af92dda733c61801e0b3fb51071d4f0073f6211808acaeaeaeafad2d1d3b168946fd7effd8d858a3d1d8d8d89065797676766363ddeff7fdf4a73f4d26939b9bdbad56ab522e777b3d5e73cb64b3d3d3d3bd6ef7f4e9d3c542a1dd6a8523c1783cdeeff7067dfdcfffe227a22851422bd5cafada7ab7db711cc7e7f39be630954e1f3f7ebc5eafd76bb5c2ce360fa5c29ea7aaeafc9123c78e1d9365f9c38f3edadedaaad5eba74e9de201f15c6c0a1e2f5dfb2e83d31b0a02df0ffeb62fe79bc713c41c5996fbfd3ea534100a398ed3a8d765594692343d3505002897cb77efde3d7264eed4a953187b6fbdf5d670a0b73b9d5eb70b1806006220542b1582f1e8e8e8c8c888cfe7dbdcd8585d5911a034373f7ff9f2655555770a85f5f5f546a3e1791ef63c46a9690ef3eb7ddd30e6e7e72184478e1ecd64b3bd5eefe1eaeaecdcdcf11327c6c7c76bb5dafbefbf5f29972ddbc69e37128f134a0d5d6794722f0442a9f269ef9bef34f8c2865fad2040c8f6eb920e0d9e20e6b8ae9b49a71faead99a6393935d5eff7ebb55a2c1edfdcdae2e4894422cf3c73be582c7ef8e1078ee334ebad47f14902e21e348ee3148bc562b198ce6416171767676783a1d0e4e4e4d4e464ad5ebf7de7ced6d6963ee803202059e60e048cba40901a8d46bbdd9e181fe7263b01bfffd2952bb3b3b383c1e0e6cd9b3b3b3bb56a55f3f9c6c7c67c7ebf8810761ccbb6a1208810524228a502845f3142e73b054af7a694bbe6b987054f1073248486c3a14fd37c9a36180cfc3e5f2e972b97cbfd7e7f7474746666663018fce637bfe974dac3e1d0324c5eb60600788e635b1644484448845044a85aa99886b1b8b8e8d3b466b3d9e974b6b7b6eab51a000022e951dd0c008810c580efa2dab69d5f5ff70502f3f3f38aa2a8aababebe5ead54b6777688676772e3e3e3e35c872a4992a1eb841059d3b8e2c675ddfde581cf2f24bef0fd3eeef1afa20afd2a6acec79e9f1e90b1f10fc313c41c0fe370248209a184b8aecbb5d2478e1e5d5c5c5c59592997cbc160d0e7d3104aa652e966b3d96a753cd70500488a823d8f624c058121e4baee850b176666664aa512144508a16559894482cf0687c3a1631b103d923643840000a63e088422a150e8d4a95382200c87c342a1c0188bc662aaaa6e6e6d753b9d782c0605815f1e3f2d2fe089107203c403335bdb877d658ca763ce01c1de7726ff9b31c6c2e170abd5b26d5b55d5e160a069dae2e2e2f8c4c4ad5b1ff7fbbd66b37ee7d647c9746679f914634c144555f575dadde1704809805022d49364c5eff3fff95ffc4455d5c2ce4eafdfe729ed8aa22c2f2f8f8e8ef20e855aadc6ef7e7e018220a89a7f6161617171311c0ebff1c61b8542211c0ec763314110a2b1d8a950a85c2ee7f379599627262709a510c2bd799a244950143fdf1a7010897498706899f3790c06834824c2e76ca74e9e3c76fc78afdbfdc77ffc4708d9c67a1e220491dc6a353efce8a3643299cd8ca692e94ea75fad564aa51260341c899e3973f6d4a9939d6efbd6ad5bc562d1b6ed5ea70300f054f5f6ad5bc9643291482c2c2c2493c97c3eaf0f879c3cf3f3f3d7ae5e8510ae3e78f0cb5ffe92cfdc0683c1cef6f6c8c848269bcda4d33ebfdf1f0854abd5d5d5d5b1b1314110a028628c79f0a82008df60f2d4537c233884cc79cc2d061963a66966b2d90b172ef8fdeaeddb37f3f93cc65eabd586bb5bf58aa2f4babd6ea7e3b93812898fc4139a4f13459448244e9f3eadaaeafdfbf7d7d71feabade68344484040879edb8512f379bcd7024323d3595c96462b1d8bd9515cde75b5e5e9e9a9cdcd8dcbc7dfbb6e338dd4e67ef8204080783018f45080402131313232323f97cde324d9707c423c4a50cf07321a18f7bef5f65efe5717ab3af82afbb761276abd2076a17f72be11032e771e03e9de3e3e38542617dfd81ae1bdd765bf569fb8fb16d5bd37cb66de5d7d644490d87a2d96c667a7a2a994c556bd5c24e617b7b0b13cf340c00c09ed90d92244a454ac87038dcdade6eb55ab22c4f4f4f4f4c4e4622116e9cdb6ab53e73dba9aa6a992692a45eaf6759d670380c0683e3e3e3783763d475ddcf4ba49fe23b8243fb87f9c48965779d4329751c87bba40b82a0aaaaa428b669c05d0b01c62823c0d44d8890200ac4b316972ee472b962a170ebd6ad7024ec61cff3b065eaaaa6a99ad6eb34205229c6140020088051248a7c54b970e182aeeb1f7ef081cfef773d6f381c3a8ec32816e0271fb8a9f715d5ef61ec398e659a22420b0b0b94905ebfcf6d3ebf7c403828eb9c3d99d221c3a165cee7c1dd6e1f3c7890cd6667666618638b8b8b1f7df4e170a8f30304010211000052a9542814ba7cf92a00a05eabf5fb7dd31c6a3e2d9d4a6532a956abb5b3bdddeb740010239188a1ebdc761008301c0e3ffbecb3139393c562d1d0f560280400c86632d168b4d7eb6d6c6cecdf9391149febba3ebfdf348c13274f9e3b7bd6719cdb77ee0c87c350280421fc4c07f5a1bcff0e2e0e2d733e33b1e66dfde170b8d7ebf17427c65832993c76ec64a35edfdcdae259378aac104acf9f7b667171b1542edcbc79736363c3f33063ac56afa753a9d9d9d94422c1cb74abf7ef77da6dc048281c1d0e8757ae5c397dfa3426e4830f3e68341ac56211bb76243632128f6773b9a5a5a580dfdf6c360b3b1b10a9147b8c2124498220fcd55ffd552814ba7efd7aa7dbcde7f3b3b3b38aa270c52700803b78b8ae2b7d3a796a0f8fdb7b795c1bc21fd27bf375cfc97f7da4f93c5c4b9d43cb9ccf0363ecb96e3c166bd4ab9ee7d9b66d1a462a959a9b9f1f1919e1eab573172f9e3b7b5644e8b55fffba5c2ef0db9710cc1843481c0c7bf7eedf9d989846a2383a3a1a0987efdfbf3f180cb2b9dc89e3c793c9e4eaeaeae6d6161fa65455459abfdfeb0d0603d3b22ccb0a47223ebf3f140ab5daed76bb0d00f8de0b2f2c2f2f170a857ff8877f5014a552ad32c6b8193cefb1e3934c09214d55bd03a82138c478829843291d0e8798907024964824b88153a150180c7400402a95f9c18b3f9425f9c38f3e5e7bb8caa36c6cdb0694889204a1e479d8b13a0040c3301545e1eab589c9c9a9c9c9919111dd30fef76f7f4b29ddd8d8e099d5b6650141d07c3ecbd02be572b3d9cca4d3e148249148f07f5f7ef9e57abdfeabd75e1b0e069d6e97523a333d1d0c06239108b725a094c2dd1603288ae02973be4b78829823cb723010e8763afe40c0711cec79e31313bd5eaf5aab9d3a79aadd69dfbd73b7dfef4128d66b5500040028800244a20005cf710060004024cb86a11bc3be24a1582c0a00b06d7b3d9fdfd9d929168b70575de6380e448827e700018a08798ed36834eaf5ba3339198fc5262626de7eebad52a954afd71ddb1c9f981a1919d17cbe66b34908f15c977786aaaa4a30c69ee77dcef8e669d0dab78b4328627d0c2863d8b40c7fc0e77936b78f7afbadb7b2b9dc4f7ff25345517c9ad66ab5201443a1d0b9679e8d8d8c889224ec0548891000419424de72f3cc858bcf3f7fc9e7f3abaadaedf5b0e705fcfea5a5a5470e0408091052ec0200040877fb3aa96d597ffae31f4f4d4e7a18178bc57ebf9f4aa7a7a6a705882ad52a658c122221e4baaee6f3f13655cf75f919f697163ee32bcdf6e1716ffeab1cf33808fb00f7fdf775cf73c8f0048d3984509f4f9624c9719c52a9a46ada850b17969797efdf7fb0b9b559d82948128ac5e39a4f8b45a3c153a72a9552a552360c9d100ca800a000004048fae94f7faaaaaae7b9b55aad582c9a86118dc572b91c00e0dab56b3b85c2eabd150000b75a972409634c0879eee2a573e7cf77bbdde170d86ab5068341229190100a854267ce9ead55abb76ede4c2693b1781cee82a7eaeee5f07c064f4b6ddf2e9e20e6c8b20c00e8763b3e9fffd4a9536363630080bffbbbbfd3757d301cda96e5b862bfd7eef53ae9743a954cceccccf8fdbe42a1d06e7728c58140f0f8f163cf3efbeca0afafe7f36b6b6bc3e1d0180e80004dcb32743d9bcb0100e2f1f8c2d2b14ebbdd683408c604e3e9e9e91fffd99fe9babebebe9ecfe75dd7dddedc9414c5348c42a170fcf8f168341af0fb2391c8ea8307fd7e7f7a7afa51e600a54fbfdabfb3788298639ac660303875eaf4b3cf3e6bdbee3befbe6be83ad7bf30c64484248408c6dd766b381c76bbdd743a393d3d1d8dc6f2f97c32993c7be61c656c6d6de3ee9d3b9d6e571f0c000010498aa2d896d5e9769b8dc6ecdc5c28144a2593a3a3a33b3b3b96693e7fe9d2e8e868a9547afffdf70d5d6fd4eb3e6ebaeb3854920441f8e0fdf7c7c6c727262733d96c34165b7bf8d0dd85e7ba9aa63d0abb86f0e9c2e63b852788390849aaaa8d8cc41f3c58ddd929b4db2dc33089e7697e9f6ddbc4b321544504054124c4add72bb54a657bbb904ea717169652a9d4e6e6f6fdfbf7fbfdee50d72184a224118c29219669020008c69adfbfb1b1110c0663f1386f1d9d3a7b9652fa4f3fff392684372000c01cc7018220c93200c0739c50385c2c144aa5d2e4d41412c5999919ec7904635555d13eb5b520087b93b32f99a7fd67f8a77dddf3ef5f3c432640062100f0d04d2d9f28e6205dd779e2a72ccb084994924028a40f7a004041140100c4f3001400a500008894a5a5a54824b2bdb5b5be96f707029ae6735d6f3018608cc16e14e1de4dc33d032cdb16219c9e9f370ce3fefdfb8cb15028f4f18d0f0588448402a1b065599acf6719862849d178bcdfef03801915fbfd3eef12e546a4d8f33c8c25f489b7dbd385cd770a879c391000ded7c218a394c462d14ea76bdbf6ecececc2c242bd5ebb73e72e4432c51842913106040aa1188ec62291d89fbefa635db7aab52a84928888a248d1482818f20702fe76bbd3eff72971f74b1578c6ceb3cf3e3b3935b5baba5a2e9709c6f19111dbb65ff9e35777b6b757eede3130668cd984000008c6dd761b00204adaf1e3c7cf9e3933180cca954aa35edfcbcf2194f2ce9cc745777c67f16834835f66b678a071c899b31f8ee30402c1adad4d8c89e6d34408a3d1d8f9f3e72a956ab15834751d000604108fc79797979797cf160be5fbf71f94cb9556bbc1a74f53d3d3b1586c666626994c96cb955aadea38d6def92f5dbe7cf2e449dbb67ff7dbdf76ba5d7d38ec74bb8d46e3c8d1a3f57a3d954e8742219ea7ab6a9a65f4019000a099dcd8850b17a62627b777766eddbc59add592c9a4aa69a228124ae9e3a3729ee2dbc5e167ceeea800352d60594e2818c1848802f23c5c2a5532e974369b4926935b5b9ba542f1a51fbe7cfaf4e95abdfaaffffaab4ebbdbedf50c5d078c0822743d676b2bdf6a8633d96c2412999d9b4e6792db5b5b9d6e77627cfcca952b9148e4dd77df2d97cb1ec6b56a95bfea7038bc71e3c6483c9e482492c9e4993367cae572b552b1040930ef953ffef1c2c2c2d6d6d63ffff33f77ba5dc7714cc3585858e03e6f8410c06b0384f07fbff00d7eddb5cd7f06f83286ee7387fa544df0305a4b1f7ee6ec01631c0a85b8863f97cbe986b1b3bdddedf5441130c6c6c6c65e78e18548247ae3c6c777efdef6fb03e54a51146549468408941200a8e7e15ebf3b1c0e1389443a93110421140a1d3f7162627c5c378c77df7bafd7eb9986c1173c7b80109a96b5b5bdddedf5b86647966509a1679e79a6d7ef7ffcf1c7954aa55028104ac3e1f0e8e8a8aaaadcb2832b127863e9c132f87c12f0a43087c74773ad00a1b45aab0583c1dce8e8cece8ea629636363187babab0ffafdbeebba8d468be29a2849183b803241840000b6dbd08c3da75828747bbde9e9e9c9a92928082bf7ee552b957abdee380ef70cd87fa363d7b518239eebba6eb3d99c181f1f9f981045713d9fcfe7f3c562117b5e7c64249bcdca92e4380edf0522941e68b67073fa43ac517952980300e8f77ac964d2b4ac4020108fc54aa51200e0d8b163232331c6d8f6f63637430b06039a4f3374bdb0bd25291a42a2eb7ac4730110018394309fdf3f323272e1c205cff36eddbca9aa6a2a9d86a238313959a9544cd3048c0061ff07cb044140b2a228ca850b1754552d168b9452d7757d9a96cd641e510e426e216dd9b6e3388490bd26eaa7eb9cef209e20e67818f7fb7dee7abefae0bea66957af5e4548acd7eb0f1e3cacd5aa94b29999994ea7ebf7f973d95c381c5b5f5bb30c0b0882e60f598609009465f4c31ffe707262a2dde96c6c6c50c68ac5e2603038bab0803d2f954ad5aad5cdad2d82316004000108505135d7754f9f3e7de5ca15d775efdcbdab0f87a665a552a94020108dc5128944b95279f8e0818810779ff2f9fdba610882607a1e6fe5ff92f7f575f76dbeca73bf766f0fa3606f9c015cdfcd4f24002a00ca0005e07095d99e20e64c4d4e42516cb65a82207ceffb2f6432e9c160f0e1871fe8ba51ab556dd31044b4b2b2120c0672b99c2c4b89444255d56ea7d36c36fbfd2114a5e5e5e56bd7ae19c6e0adb7df5e5b5ba38478185b86311c0efbfdfef8f8783812191b1f0f8542d55aad522a02c002c1a0a2283ffde94f7d9af6d18d1bdd4ec7b2ac6aad661a46a3d1884422b95c2e9148f8fcfe5ab5da6cb5eaf5fadcdc1cd710fcde0cdda7f816f10431a7dbebd56ab5d3a74e5dbd7a75a80fde7befbd4aa53a180c28f56ccb020040280890f53a6dd77562b1f8e4e4cc483c2908a2e378478e2e9e3b7b1642f1e6ad9bb76f7d8c2469381c32c628f62092f66a00a15028954ac562319fdfcfc308a6a7a6ce9d3fbfb6b6b6b9b9699966b3d5eaeddadf108c3bedb6e3389d767b6c6c2c93cd6a3e5fa954a28f546b4438682eecbbe0e31b0300308132813201b003bc64fb623c41cc41084d4c4c2412891b376e6c6ee57bbd9eebbab66970113444a22421d775559f661aba65d9cd461b2165646464666626954a371a8d870fd7b6b7b700a0ad568bebdc6c42b89699781e765d4aa9a1ebf57a3d954a4d4f4fc763b19999995ffef2979eebd6ea757d300082c0fb7678218151a20ffafa60a01b46626424128dcecece2251144591f7263cd5aa7d67f1c43047a08e63058381eded0dbf3f904ca6fafd3e630c002808d01f081886ee389e2000cfc30284084950144f2f9f0c87c33bdbdb9d6e1b4268180300a88731630cbbb61c0801c688e7a99a46309664d9324d0b004dd3d2a9946e180f1e3e7cf0f0a1ebbadd4ec7d0750080aaaa8ee3f078513e0743b24230360c8312a26a5ac0efef74bb5c0b87449160ecb9ae841025e43fe001f07b8fdf8f3fe4fc8f1e85fbe448820000a08c7a9ec718110fdd8d76e8ded0e3218ae270a8773a5dae253b79f294a6a9efbdf79e695a96653142559fe6ba36c15e381249a5b2972e3dafc85aa55ae5f1839148646272726e6e6e6b7b7b7373d3736ccb34912c63d7b12d4b80d0735d49967ff0831f9c3e7d7ae5eedd62b1e8f3f96cdb1e1d1dcda4d3d55a6d677bdbb62c001810a02ccb8ee388928c3d4f5194542af5fca54b9224addcbddbebf5344d531485ec86ec0af0b3f98a4ff1ade309624e3018c4d85b5d5dadd56ab3b3f3a1508831e1dcb96787c3fe9d3bb70100b669012868bec0f7bef7e2f4f4f4c6c646bdbe9acfe71bb52a80a2cfe74fa55289442297cb4d4e4c6c6c6c6c6d6f534a79f41aa3de33179ebf72e54ab3d9fc977ff917d3303add6ebbd59a9c9a2a97cbd3d3d30b0b0be170b85eaff7fb7dcbd0b91d07f15c5f20f8277ff227636363b56af5cd37df741c271008c8b22c080267ac881084f0206defec0b06658240054a0fc8857f2d3c41cce974dab1581c2151149580dfdfeb761bf5fae4d494a268a74f9d69b55a5bdbdb4b4b4b972e3d2749d2bffffbbff77abd46a36e19a6a2f920849665964a255d1fc66289603098ce6442a1d0c6c6866e18d95ceefbdfff7e6264e4a38f3e2a954a9669160b050088aa05b637377d81806ddba9546a646424994c168bc54ab93c180c7c7effd9b367cf9f3f3f180cfefaafff9adbc155cbe5e72f5f668c1986813d8f502a412842e8612c7e69b6fb53fc17e309628e24c9c3e1505114842411a17426e338ceeafdfbc9645214654d0bfce4cffe3c1e8f954ae5dbb76fb75badc1b00728010060ecf14c188cbd56ab8531a1d4138428a1787c626262622297cb19bafe8f3fffb9a1ebad568b512a4a126388e7e9dab6edbaae6ddbbd5e2f994caaaa9a1b1d3d12082c2f2ff7fbfd77df79e7e1da9a2449966531c626a6a652a954bbd5da93f05896254b126f3de08f7c497eced7ddb779dc317fd0f9c1273f0b0c0802130e63a2ce13c41c08052e09030070918b619a9148a4582c9f3a7dda719c876b0ffbfd3ec1b858dce1f325062044822421c7f9c47aa6db6e76dbad502472f4e882a268a669deba752b9fcf1bbaaef27ccffd66d0824031a68076db4eafdbed763ad95c2e1e8f87c3e18d8d8df5f5754a48afd79310ca64b3b95cae56ad62cfb36c9bb7a94251e4a1d982e73d1d73be5338fccc610c500130c64cd3521485f7b405fcfe4aa58eb137353dfdc2f7be57ab56770a0542483a9500004892685a56a7d3745d9762eab04f393609223a71e2e4c2c28265996b6b1b5c0e9749a72dcbdad8d81004414208efe99a19f30502a6ae8b92148b46e7e6e6349f8f072d02000441304c9331160c06038180691848923c8ca1204892e479de537a7c6771f899b3075996296508499665e5f3f96c6e6c717131120eaeadafdfbf7f0d240f6a00002000494441541f7b9e6ddbb1783c954a1d397ab4dbe92024e8baa1eb3a218431fa482a2fd01ffff8cf329974b7db2b972bfd7edf719c58341a8bc773b95c34166bd4eba57279ff6a9e7bafcdcfcf3f77e1823f10585959e1bd6b3ebf3f180c7271da07d7af0f0603feea1042499645dbb62d8b17129028ca92f43442e73b8527883994924020d06ed603a1c873172f44223143d77ff5da9b96650e0603dbb605019a96d1edb646464652a9d4d4d4ac6559e572b9d16860d781223a7beeec952b979acde6f5eb1f6d6e6e1aba2e08826d19bd5e8f878d86c3614dd3d299cc9ddbb7f9220700108b462f5dbe9c4ea59acde66bbffe35c158370cd33018f526a66693c964c0ef3f76fc78b7d3d929146ad56a2693c13cda9a31248abcaae661fc1931ce275dd65f61edf175f175d736c2e35eea3056d5389e20e608025c5f5f3b7ef2f473cf3d2749e8cd37df2a168b7ebfaf5ead89928490c4552f8661ba6ea5dbed4d4e4ca5d2e95834fa706d4dd3fc2f5cbbe60f04de7de7ddeded0d9e4648282518030009c6ad76bbd96c66b2d9643299c9642e5dbe7cefde3d43d74f9c3c79e1c28562b178fdfaf552a9a41b866ddb04634110347fa8dd6e773b9d682c96cd6472a3a3e170b85aabf13b95675a5142e063fcd69ee2dbc521670edd15ed32c62409f90381b1b1b1d5d5d5d5d5fbbaae5b86d1ed4224cb187bc463000aa2881863aeeb79dee0eecacae6d6563010189f98989898dad8d8585959f13cdce9b6186304634629d8dda6a4d843b252299729a58d46435194742a357bf162381279fdf5d76bd52a778e765d97789e00a1e6f399bace37da87c3a1849024cbd14824180c624278f8148470cf7ee0c06ce63c3138a09ac2ff0814452198f47add76bba5aa6a3a9df1074380328c3d5555154d05f4d12c8852825d5796e5f1f1f1e3274e00005e7ffd77d55a6d249168779a5010b0eb328ac1ae11ae8890aaf900002242f55aadd36ecfcccc58b6fdeebbef5ebf7e3d9fcf371a0d9e7b05769dd34c5de7c707824100407efdc1fafa7abfdf0f85429665398eb37f7af614df411cf231673f7afdbea228954a55f369478e2c3a8ee3f7056cdb2e96765cd7a394408408c1108ac160706c6cecf4e9d3a150687373b3522905837ed7b57d9af6bd175e585d5de5213c5cebc9e3d76dcb84480af8fd57af5e4d6732dcff361a89d8b67df2c4896eafd769b7cb950a766d00a0aa695c86c318d3070300682299b976ed1aa1f4debd7b866170535c3e4ff33c4f92241eefc3dfc8a375ce63b677f6f007e9d31ee3c3f6d8f3ef3f641fdf2103025f053dcdcf39b82098a492c98d8d0d531fb8b617080643a1503812715ccb75dde15037751d22e4f3f9ce9e3d77faf4a97c3ebfb272afd369379b4dcb30a2f191d1d1d172a578ecf8f14aa552abd51a8d06a314631708a2e60fcccfcf7fef85171863efbfff7ea55addd9da142539128964b3d9602090387a34994a157676fafdbe6ddb48962549b28ca128297ffaa77f9a4ea55aedf6ca9d3bd8f354557d5a44fbeee3f033676fcaa3aa2a008031aaf9037bb9b69148e4e8d1a57abdeeba4553374f9c38f5f20f7fe838ce1b6fbc512c1686c38165998c31242b83c16065e52eefd90c04fc0b0bf3f178e4c1837542e9d4f4f4f9f3e7b399ccaddbb757575745080dd344b2825db7d36ef3ed9a48249249a7354dab562aa552c9b64cec793f7cf995f923473aedf6871f7d542814ba9d8e631bcf5fbee6388e659a789fd90d14848348272a000800130edb80039e04e6ec0142d8e9747d3e3fa534e0f7cbb26c9966a55ceef57aa2289e3973666a6a0a00f0de7befadadaf534aebf53a60445214cf7509c1820021141bb5ea60309898980c8542a2884e9d3c393a3a9a48240408fff557bf725db7d168f0e01000009f8f755a0dcbb27add2ef6bc70383c36361689461bf5fad56bd754552d140ad7af5f775dd7344d7f20101f1949241283c1c0f33c773733e7cbbba9bfe338ac85c143ce1c080017ea7a9e679a662412310c5d51947ebf1f0e4747c612efbdf75e46561323a95ab56e1a56b3d9648cd5aa0dc630a00c40c1731d7f206899260004218952689b463e9f07002c2f2f7b1e0100dcb97b77677bbbd7eb398e031885481211628c298acfb62c8814dbb22c6338180c22d168c0efcf64b38b8b8b8661fc7fbffb5dabdd16455192a4e9a9299e3ce5380e57494308a920f0ce50eeaab3ffaded758c3ece87edabe071b7f5a7da511fb3e6d95fc0d8af55fb14cf3111e44337dc00000e3d73f6231e8f791e164544081d9f9828164a1b1b9b67cf9e3b71e278ad56c7040f06837038222291313618f47463e03816c5c4d075409928498e6df3c9dff8f8f8d9b3677abdbe3e34f2f97c241a8dc5e39acf57281404014108f97d6f19030020a1d8170899ba0e45319bc964b259d7751faead2151f40702aeebd66bb55038ac280ab79be246ec3cc994ff7ca0bfb60ff4c57f090e3f73e06e5f7cbbddf1f97ce170b8522a7cf0c107278e1f3f7bee4c3c162b16cbf7efdf6fb73b9d4e7b617131e00f4ccf4c398ed368d4f2f93c40008a22c19478c41708b9aefbb39ffd25004055d5957bf74cc32e954a8b8b8ba15028180ce672b99deded6aadc618239e0d8098c9e5eaf5ba691863e3e32fffe847a954eac68d1b0f565705410806838aa2c4e3f1583cbeb6b6b6bdb3934aa5344de35ed2dc8a008807db30860a8009e050f6e71cc2fde9fd2b69b8fbc8fff81f7f75e7ce5d4992de7ef3cd4028f4dffee22f354dabd66a776edf6eb5dbdd4e4f1411c11e149124c1f92347248402413fc65ea1b05d2e976559154534373777e9d2f3c3a15e2c16d7d7d76cdb1ef4750f634a483a93191b1b53555510847ebfbfbebe6e1a060000308264f5273ff9c9dcdcdceaeaea8d1b377abd9e6d59bc8df4d8f1e3a15088518a24299fcfd7ebf580df7feefcf9c16030180c3cd7e5ba1b008084d0fed9dad7ae1aefff7cbea683eed77d2dca3e993d524a2509ddbc792b1e0d7fe1130f2e0eff98b38746a3110a854e2d2f9f38711c8ae21b6fbed9eb760783c150d7a1283040208214bb2e009b9b799f4f4ba552b95c6e7e7e41104408c50b172e8c8e8e6e6c6c5cbffea1699a8661208478cf822008f55aadd1681c3b762ce0f78742a13367cee4f379cbb2ce9e3d7be2f8f162b1f88b5ffca2542af1a219a31800c818bb7be78e3f10c86632e148e4c4f1e3cd74fae6ad5b7bf1868f627328e54a9cafab4ffbda9e697f406fcfe35e0b3220b043189e039e28e60402816eb7b3b8b8d86e773efce037ba61f07dc6fda314445092906ddbb66db75aad76bb234988677bd46af5bffffbbfb72cd3b13d2e5bb64c137cfa8eb977ef5e2291884422d8f372b9dcfcfcfcc4f8f86f7ff7bb66b3d96eb52cdb4608415164104a0871d99b311cae0f87e96cb6dfeb2149ba70e102bf3b45088920b89e47299510e2c6b97b2f74f8660a070e879c398f9cbf18608ca9aa0a40a4d56adbb695c966bb9d4ea150d07c3ec7f924f699d78b88e72a9ae679ecc891f94020b8bebefebffed7dfe772b9803f582a5578399b1f2cec9b4109824030e6f1a03c80edf6ad5befbdf71ef63cdd304ccbc2aee3b910300a0070296594085094144584b056a9f4fdfe99e969cb3431c68ee3f08c6bf0b930f7a7f88ee09033673f74430ff803cd66935232333d9749a7474747575656f6270f504a3c8f01202493c9575f7d555194959515c771229188200850142f5ebc582c160b8502254496656f5fd83af11c88e48b172f9e3c71a2542e3f7cf8d073dd6c36eb384ed4759bcd66b552d91f342d292a638c52ea398e3f18bc76ed5a30185c5d5dedb4db00005996b9fd8d4d0863cc7d4aa1ef180e21733e2f62650c080c688a0f8952a954110441420a84301c899c3b7fbed96caeacac50ec022000c054bfffa53f79696262a256abddbf7fbfb0b34328f5dc9aa228d95c4e8470726222140a954aa576b30900102589cbcc96cf9c3b73f62c25e4feeaeafada1a6fc2314c33954a8d8e8e8642a158345aabd7dbad169224b41b2c252174e5ca9593274e18a679f3e6cd72a9e4f3fb1389846d59aeebea86214208be7266db1fb2b6f9436680fb57329ff62400007cca0d67f7b12fce153d403884cc791c2863c3e150922409219fdfafeb7abfd7b34c331c0e5fbe74e9e1da5ab55c3cb57cf6472fbf6c59d6af5e7b8d3b3ff18993e7baaeeb6e6f6d71275b55559796966cdbdededa6ad46b9a3ff0c77ff447c160b052a96c6c6c743b9ddd5d51d2ed08ad56cb34cd743a1d89465555f5fb7cad76dbd4870090e327cf3cf7dc7348146fddbab5b1b1d1ebf574c3989c9af2fb7c9669f25b90f7027ddb1fde537c164f10734cd3cc65b35bdbdbba6188a2140c8487fa5011c472a5128fc51289c44b2fbda4aaeaed3b77de7df7dd782c56a95609c680515192a128528c6dcb703dcf30cd6824120e871545898f8c5c7cfef94c3a6d5ad68d8f3f6e341a3c7c4a4408302ac047f6376b0f1f0e87c3919191482432eef385422142e9b1a5a54030d86834d6d7d60a85c2a0dff505424b4b4b8944c2b66d0f63082112c503eb2e7dc8f1043147519466b349308e46a3b22c8b101282b7777602015f381c362debc68d1b822074daed6ebbd5ed74f8560c1f70a028225916211404c1b22c00806e189aa6cdcdcd5142de7ffffdadeded7ebf4f31565415ecead66459e62e6ab66d57cbe556ab25cb723c1693246961715192e577de79a75c2e03001863b37347389126262630c60463515184471eb30c7e46ed72406a6b9451be96fbb62fe49bc713c41c5dd7c7c6c69462d1b22cd775dbad96e7e1f3e7cecfcdcf140a8576a76399e6f8c40412459fdfef795ea55c766c0b00aaa87ed77531c60442460910a0a2284b4b4ba150e8fefdfbf57a3d1c0ec7a2d180df5fa95609a50030c897318c31c6f87c8f01e039d6e8e8e8c2c242b7d3c9e7f3d8f37c7ebfa2289d562395cefafc7e2e09258460cfc384883c1e9452007922cdd7dbd9dc8f4fed547e4331d7fb5f57f8d43570865300006400329ea773d8e4d24f107382c1a06ddb8c31531f3e7cf07061e1e8e2e2a228a23bb76fb73b1d5dd70d5df7308e46a3b96cb6dbeb21512c95cb96a13f52fb0b02a3d81f0cffe0073f181b1bb36dfbdeca8ae338fa70681a463697936539100c76daed7aadcc18830831c600a3dcf73d93cbbdf8e28b9148646d6dadd168104afd3e9f84d0d2d252a914dedadc1c0c8733d3d38aa24808f120d1fd961d1400b86fcc3928ea69c64119600c1cae16d727823902048220789ec77d67a2f191ab575e181b1babd5aa376ebc675a46b7d3c184108c87ba3e1c0e29a5e170381a894463b166b3592c1619258aaa9d397366e9d8314dd3de7df7ddf5b535c6d86030e0853211a15028343a3a1a8fc7554de3766ab665f1d8b61fbdf2cadcdc5cbd5effedfffedfcd6653370c6e95383a3a9a4aa727c6c763d1e8f6cececaca8ae6f3251209008024cbf0e0df6a8f22db8447310787094f0473187d345d715df7d4c993e79f79461f1abffef5afb93ccc34fa485628a59acf671a46bfdfefb45ad9d1d14422110804128984e7bae170f8fc33cf288ab2b5b979ebd62d1121d3b208212242945297d27abdce1b0478da542e9bddded9190c069313132fbef8e250d7df78e30dde83ddebf5b8504d80b0d168e886118fc562f1f8f163c76af53aafb021518482802409ec7e6d1f684f8283b22afb5a3884ccf9fc6a94098001a8a96adb34d399ccc3070feedf7fa8ebba61e8108aa224138c19633c6090601c8dc7ab954abbd58ac5e32284d95c6e7171b1d7eb7dfcf1c7aeeb72171b4ac823b700510400d896054571737333168d5aa6a9284a28145a5e5e9e9b9dbd77efde47376e20511c0c877b261e8410caa3aa18731cc7b6edb1b1b16824b2b0b0904824ba9d0e008047ee30c67852d5e3deefd7556d7e5d7c5acdf998b5d67e5e3f22b9080095918c108f30d95be8ecfff700e31032673f762da30063ccb2ed68345ad8d9618c65b29956b3699a86a2288e6bf9fc7ecbb214457100c09e371c0e01009890b1b1b17038bcb3b3f3f65b6f693e1fc1b85a2e8523d1c160c02801408008f105371445248a8e6dd66b76a7db3d75ea942ccbed566b6b7373381cb65bad4030e87d5a072040c4a88b3de039b66ddb956a35140acdceced66b35d7f3be64dd7f5016397b5b9c8c7d333589ef140e3973f6e6387bb31dde6e2908e2d4f4f44822512e9570dfe5bb2ea661f0f435c6d8fc9123a74e9de2a11d8220288aa2284a32999c9d9dbd73f7ae2ccb8e6d0240215488e70100a024398e2329daf9f3e78f1d3b96cfe72b950a6fdbe605346edcb1ffdaa02832a80a8240289525e9f4e9d3d95cae522e371a0d11215114f93573c5f47fe587f60d8209803e1a910eea5b781c0e3973f64396654248b952916539142400806432c5180b8502e5725944c8180e2cd384a2f8ca8f7e343e3e3ed4f5dffce637e5729931660cfb8150646c6c0c00b0bcbcdced74ca954ab3d98482c085245010e68f1cb97ce992eb799b9b9ba552c9d0f55ebf3f3232a2284a3a9319191909359b9b5b5b7bd7b39bfc0e978e1d7be58ffe8831f6faebafe7f3f9482422410800f842c5e7c119701e81d705bfedabf8e6f104318752cae3071dc7191b9de8763bbd5e6f7c7c3c91886b9ac6f33f9e7df6d9a9e9e94c3afd8b5ffca2d3edf2833dc7162032743d9fcf67d269426928149a9a9c0cf8fde54a05222997cdcecccc2c2f2f7ff8d147a552c9a7690f57ef03010200f4e130140a71a576269b8d44a3e572b9d36e3bb60d111a1f9fba7af56a269d7eebedb76fddbae5b92e656c7e7e1e7b9e69599eeb020044840441e084f9c26adbd7edb1f92a8f7fea73fb0a9d70fb5f571010008fb46ad8c5b22c3fcdcf39d880100602815028e4ba6e30188022b42dbb542af9fc9a2449a150e8a5975e0a8542d73ff8e09ffee99f027e7fabd5e2f7aee60f388e4331868250afd775c3f0fb7ce94c2693cdc6e2f1402090cd64a2b1d8dffccddfa4d2e97ebfbfb59147b2c265d1d8750cd3dcd9de96643997cb8d8d8dc992e4f7f93c8ccf9c39138b469bcde6ebafbfde6834f84566d2e948383c1c0ef9d48e51ca001020e473b60337e080435a5803879e398f6609021020ec763a3e4d63944a08b55aed5028e48aae65598c91c5c5c56aadf6fefbef73b5986d59bd4e479424bec0705d5796241b3b8e6d010162423aad56bbd3191b1bf3fb7c82206cefecfcf297bff4f9fd776edd8208f11a37c518000691443c9b785055d5f5f5f55ab59a4c269124cd1f39120c063fba71a350287083f65834aaaa2a1445555575c3a0bb853b2e41d054157c6b53b57d73ad4ff97a7eb1b1e741afa17f451cc209e8e3100a8500005c4c393636d66c36b736379796965e7df555c7715cd75535cdeff34141989a9e0e85c3c4b319630284c4f36ccb42b20600008c524232b9dccb2fbf7cf2c409dd306ad5ea70388cc5e386ae4b8a220802766df848a629400821520010fabd2e8430994ccecccc20512cececbcf9e69bd8f30000435d97242993cd466331cb343d8c5dd7a5944251dc534943080fd08073a0ab1a5f11877ccc0100f0f5a96d1b1ec6aaaa2249b22cebd6ed8f474747af5ebb9c4824de78e38d56abd5ed7631c6f1783c140a850381543259a9564ba59269180030242bd8f37c81a06ddb57af5e5d5c58304cf3c68d1bc3e1508430100c2693c9b1b13143d71b8d46a95412211414c5736c8231af5fc713c9cb972f4f4d4e3e78f8909b7e44231100c0dcdc5ca3d128140a0f1f3cc864b3fe408007cb31c6745d7f14bac8d8e7fdd67e2f7eef34891fb047c84f2fa220f8cc0ae7d15a65ff57ed27b5e6cfe4e74000a080fa83eee858b6d3e9c0c328f73efcccd9832ccbdc88301a8d5ebe7c39994cb65aad5fbff69a6ddb5c7ae3388ea1eb23232342361b12c56c262321d46ab56cdbd60d038ae2f8f8f8f7bff73d00c0ea8307376edc300c439224ee7193c96683c1602e9b85a218080657efdf571405228951ea0b049797974f1c3f8e09f9b77ffbb76eaf873daf51af87239170381c8bc7d3a95432995c5b5b7b70ff5e32951e0c06aeeb4a088542a1c160402945a2287d85ccb63f64bbf39b05211442288ab261580080c160904c26bfed8bfa86f1243147928ac5e2f8f8f8c5e79e83a2f8e69b6feeececa45229beb54fb10b008408b53b9de170882469726222954e8f4f4cacaeae86c3e1e72e5ecc65b3f97cfed6eddbdd4e87c7b2138c458488e7f47a3dee83130c0472b95c241c5e7df0c0e9768f1c3d7afedcb96030b8b9b979fbce9d6ea7c3071c5f206098a66e18224250102cdb3e75f2a46ddbefbdf7de9e3ae18036b4514a18630889b22cd56bf54c26e5f3f9beed8bfae671f8fdd6f86cedfffcbfff9ff7debd1e8dc5464646eab5dae6d616c6581ff40528328a1fd510449112c2f7581455756c2b128b2bb29ccbe58e1c3d6adbf6bd7bf7eab55abfd742b20f89222f7f719f4e9e450500989c9ae2953ac3304e9f3e1d8b468bc5e2caca4aa55a65fb22746449723d8f620c11525535994c261209cff31cc7999a9a6ab7db3c8194cfd3c0e7fdd63ef757fbfc80f3152bd15fb87c828208be68b6b6db41003e2b72da5777a694104c544d05807a9e170cf9df79fb9d682c2ccbf2175ecf01c51334e6c44746daad96e3389490542a65e8baa1eb8c3151520057f2630c119225956fe30442e18989895c2ed7eff7df79fbed682c262134180c7c8188a9eb98af822134745d5114c7b180200246b636370100972e5f360ce3c68d1bc160309fcff73a6d2040b4eb580000e0c152bcfdc632cd9dedededcd7c22999e9c9ae2deed8c31dbb6a5dd8078288a8fedcff90afd365ff8dc2f293970b7c147cf62fbbb83769ff29968854ffd4a2920847a7e9f1f41d8aeb7a12088e0609b957e1e4f10736ab51a2faf6142344d8bc762c964b2d3ed562b95bd0e1c08a16d19be402891485cbd7a55519472b95c2e971545c19ea7f97c57ae5cb9bbb24230765d976fb300461dc7e1b441b27ae2f8f1e5e5e576a743306e773a8ee3a4d3e9c9c9c9cd8d8d41bfbfbf359a1202451142883d4fd5b48b172f0683c19b376f0a82c0cd12c2e1305f447dbe4ef5872c69be8acbc7e32a63bbc710c0f65cdbbf60ac0bf8fd3c0c82b8dedcfc9ca228ffe1abfdcee209624e341a15215c5959c1844422916432c9a5318cb176bb6d5916609860c117089d3d7bf6ec9933956af5d6ad5b957259370c4a4834168b034009397eec58b7d72b168b9d5613220908103026294a241cfed12bafa8aada6834de7fff7dd33008a59313138944a2dfef1f3b76cc30cd7bf7eeb1dd6469465d4909124a33d9eca54b97027effd6f6762814eaf7fb8cd23d6bf66fbfbcfb683ce1e30ffdf4835f7c3c42905026222195cefeecbfff2c1409127cd8449f879c398f127605c01823bb2bef4422914c26fbfd7ea55cd6346de1e8d176a7532c16dbedf6c993279f7bee39cbb25e7ffdf562b1685a168f6e6794d6aad57ebf3f128f53c6b87d473716ab54abc670180a872f5fb9b2b0b0b0b1b1f1f1c71f37eaf5a1ae4b08e983defd555342686e6e8e502a49d2c2c2c2603068b55ac6b02f405951940b172e2c2e2e6e6d6fbf79e346a3d118eafaa9932709a5aeebee2944798bce7fe5e7f67b3a17be34050b63bcb5bd99cde4ae5dbb363b3bfbb3bffc19a5945072c8266c879c39fb218aa20821df27c965b3b22431c60cd3dcd8d8501465e1e8d1642a150c043efef8e3edad2dd7751f558765d9735d1e406d9966d971fafd7e32991c1d1d1547460000e9e5e5f9b93955557ff5afffca97f5bd7edf732c886449d108218e6dddbb776f62721289622a9dd634cde7f3954ba5f3cf3cb3b4b4d4eff77ff5da6ba552c9735dc7717c7effe8e8e86030a8371ab22cf72d0b8922f94669b3b76f437747bf47bf1202459197223eedc48bf9b692eb7afb3923082212454231af64504a6cdb5614657676f6e2c5ffebb9e79e4ba592a1807fa8f719cd1eb2f20038f4cc610c3006a800286586ae6b3e9fa228aaaa124a7d7e3f63ac5c2e2712094c48a3d168773a008066b3d96ab5bcdd2298e75892a23d72e3a0941232180c06fd76b3d9f40702bce9ba52addebc79d3b6ed7eafc72d3ef65f03dfd529168b8944c22b952cd38c44a367ce9c999c9878e79d77d61e3e84a2080521140a0582c168244219e3d61f7b4b7ffed2ffd9f6518aa278185b968509d95b99304a81003c0f33463126fb09605996aaaa84b8a669504aa7a6a69f7df6d993274f2c2d2d8d8c8c707da063990000cae8211b70c0a1670eff7a85004028f0a2f3a0df0320e2f7fb6bd52aa1746161616a72b2d168349b4dcbb6a120c4a2519fa60d87c356bb2d4b92e300ec795014b98b34638c6237148e1f3f7122934e178ac53b77ef2a8a1289442ae5b2881076a9aaaab665ec5d83a22896312494d6aa55eeb94e29ad54ab0fd7d602810014c57eaf974c2667e7e6fabddee6d6563a93a1bb00ff55eb9cbdf2b78890883eb92b040811123dcfc398f08165ef7ff11a7a32993cb674e2e2f3cf9d3b77369148689a2608509625d7755dd783126202a380789449f0500d3b879c39fbc13d65c6c6271a8dc6f5ebd7979696ce9e390300d8d8d8d8dcdc6cb5dbfc806c2e978dc76ddb9665b952ad32c614452194ee2573bcf2c7af86c36111c27c3e9fcfe77d9aa686c37e9f2f1a89e88651d8d9d10d63ffeb5aa6294a0af1acfff697ffc7c2d1a36fbef5d6cef63692a4d1d1d16ea733363616f0fb4bc52dc334e7e7e612232394104a08a3f433b3a96f4a22f085b5354110204260772eb7f77e0100aaaa52ca28a5108aaefb49bf1017465c7cfef923f3f3228284605951fc3e7fb7dbf13c0100402941a22842813206083d641ac92788398ee37818170b0588d0abafbe9a49a7d7d6d7b7b7b65aedb661187c3e665a16d78985c3e1a5a5a5583cbebdb5351c0e1545b12d6b6a66e6c5175ff469daf5ebd7d7d7d73121baaeb75bad56bb1d8fc5d2994c381c9e9d9d1dea7a3e9f67947a1803c044499e9f9fffc94f7eb2b3bdfd8f3fff79bfd7ebf7fb86698642a16824120c0492c9646e74f4debd7b376fde4ca5d378b73d5b9524cbb2b8d59f2449fb9bb1bf6ebfcd17b2853106d927226728081ef628004844c4f5349f264b32a5b45aadc9b22c49c8f3b02008f178ecc2850b67cf9e3b77ee2c84a2a669922441081dc7310db3d7ed45a21100002594108a2451808226ab4f7b420f30144519eafad56bd716171775c3b8bbb2b2bdb5c5375e3cd7058c5a9e07006b341add5e2f1008701167269d7eb8b6d6eff75f7cf1c5999999adeded77de7e5bd3340fe35ea7254a8a20089669964cb3dbeba553a9f8c8c8c4c4848450a954229466d2e91fbdf20af6bcdffdf6b7ebebebfe40a0d5cac52bee000014e0494441546e33c6b0eb765af5e1706898663299648ccdcfcd6142565757f72a697cb6f6c998f30dd509bef03c7c5f5742127fd150284408190c06966585c361c3d005413a7dfaf4c5e72f9e3e757a7c7cccef0f78d8e3031426d8d66d51843ebf2f140ae9ba8e9008a18890e8b9ae20481430f8943907171ec623f1b887f1dbefbcd36834068381a9f7818090242149221833ea69fe1025c4c358d775c7715aad96dfe71b1b1f7ff1c5172dd3fcf77ffff7876b6b8aa274ba5de27900400821efaed1fefff6aeacb98deb4adfa56faf0048800409101a5113510b65521295d8a42c478aaa6c6792a7cc43324fa9a9c96fc8fc9cfc8c4c2a0f33e5aaf1444eec8aed5424c7942873514412e202a0d1ebdde6e1026093202812529c08e8ef01d56cdcdec0f3f559ee39e7dab6eac2e1ba6ebe50989898304db3582ccecece2e3f7efcc73ffed1f73cc6f98b6a1513c269e864477dcfa391bff53c705df7c2f4b466594118bef5d65b8273b55428000048a4d6a152ce5af2713a0480f035304a45edd50663ac5eafab0959dbb12f5ebcb8b8b8f8ce3b6fcfcccc105d175c208ce238aed7ebd96c56e5a4118d70ce3817118b0cc3505a480801919492334e01003a1ea8f9d021628e86f1defebe1d861a212323232a399a33c61953e4a191083c4ff5375206d2b973e754138ffffaf5af95b76399a6e7fb0821a8eb2c8e19a5aa2b9a5ac330a04114453bbbbbbaae238454e04191ad5eaf032921421ac69c699e5b278645630900f09acd870f1f6a84e447474be5b28ae17dfbf9847e10b496c566947176f13b179796966edcb8717d61be303646341245118d63a2eb3ad13967c562514a4969ac820758c38490ce02418cd1380e2ddb46086998a43ae70d06e3349b75aad56a26e3140ac5a972b9e9798f1f3faeeded300aa49463c5a25ad7d634cd5c2ef72f3ffa914e48b55a25841886a111e218c6f9f3e7bf79fa74637dcd72329c3184b1fa944200000124e7cf9fbf7fffbeeffb8f979737b7b6d4fa565eb3592744c338a6340a3d00b0e564c3200000105d67949aa6337f7d3e9bc9aeafaf7dfdf5935c2e679ab6aa0615424008a32882b015d8954226e755125998e0f0ba340000a002dc046145484aa9611235c7aa131d6b585da2d96c7a4dcfc938a323a3737373ef7dffbdd9d9d92b97af0000e238064c3011630835a2030954bb1fd50b0a01a86b5a3b602e8004aa6f3dc09a41329452cbb659cc08217ff75c88d78b21624e18868e63bbaebbf5fcf985ef48b514eefcfcfccececef2f232a7f1deeeae4648b158fcdedb6f5fbe7c796f77f7d3cf3e5b595989a288513a3131512a97b7b7b7550ac29ffffc6795b72685b03299268d0be3c57ffdc94f262727fff2f5d7fff7f1c79eef8f8e8c6c6e6d8d150a97af5c3977eedc577ff94b4c29316c8c50e0fb1a212c8e68144d964a4b4bef168bc5e7cf374dd3f27c5f08cef82b095a7246484a09914408e9baae112d083cdbb6354da394baaecb28030058b6f5e1871f5eba7ce9ce9d3b33333363636361108661481955733bc9e078721b4104da1663a7cd1542aa3b2150bdaf06b24474c0ab0cd44c2842e0e73ffff7870f1f7a5eb35aad8e8c8cd876766b7373349f1f1f1b330c036bdadaeaeafadaea8d855bb76fdfd630feddef7ef7cdeaaa63db9b5b5b9c46c4b068e403a85dba74696272923196cd66abd5ea9fbef802408830fee0fdf7afcece3e79f2646d7575677757adedae96139d9898c8e572c5625123248aa2df3f78a0e634a5e09a6edcbf7ffff6eddbcbcbcb9f7cf2c9fede9ee7fb57afcc4a2919e38c51df0f3867cadb3ea2737ad4721e3c7d1cc758d3745dd7300efda055f3837114079c71d5581442383b3b7bf7deddefdefaee95ab572ccbca643252c820082084a6695ab6a5fa36a2c4f4ee312c82ada927058cb1ba1ca5d4b2ac52a9347865a143c49c070f1e5cbc78f1e38fff37f4bdc5dbdfe79c6facaf9b9665dbb610c2308c6bd7ae39b6bdbeb1f1d9679f653399f5b555953e6d3b4e14452c8e547280ed3853e532c238e3388cf34aa5522a9518a55f2f2f6f6d6e365cb7b6bf8f358d530a1152e16c4dd78bc562c671ce4f4f8761b8b5b9b9b5bd7d7d7efedab56b711c7ff1e5971b1b1bca78c39ab6b8b8d86cfa8d46230cc2288a12cc81521c88e94b99a3c670c618e719dbe68c534a39e75c502965b9549e9999b977efdedcfc5cb158241a71328e2ace5359b00000c52ec776406f9d03d1c19a1fedc20bd4e109a5d434cd72b93c783a6788ac35d33237379f030046f285300c6dcb2a95cb6b6b6b6a22dcb2ace7cf9fefedee56abd5fdddeafeee0b4d37591c4184545e1626baaeeb81e74551f4e4f1f2c464298ee3423e4f29add7ebbff9cd6f2084aaa24649092604004019b31c270c82cdbfaedb9911b7d9344dd334cd77de7efbed77def9ed6f7fbbb2b2625b56bd56cbe57253958a6a0a1745110042020e91842d0d0310808aba5d9333476748612b58cc0dc38086c1196bba4d2e38a38ce8fac2c2c2ad5bb7eeddbb3733334370bbfe07422881a1112e048ba8101c6b9a63da23996cc48ece23b569200000b8556f7790d69db4cdd4b72a1c3760e41922e6304a4747f3186baa3fc6caca8aaeebf7eede9d2c955656565403c1f2d4d464a934313151abd59e6dac39d991300c591c18a61385614043d3ca84810b8076fbf6edfd5a6df59b6fb6b6b773b9dc850b1776777628a55118022040a27e33f01a86e94421575e47a552097c7f776fef57bffad5c4c444369bdddadccc170a53e5b294b2bab353a994a328108275879bc54183e6e38d1fd16ea4adb2693863611836ea759de8376fde7cf7dd776fddba75f3e6758411d1c8910303cf2744d3755d3388cac4a18c72ce246a3101c15684ac6da1410040d20c4bfa396a0fe75c6d0f186dc05031476b4fc3bfd8aec6119bbe70616e6ece719cafbefaeac993278d460300d0745da2eb857c3e5f2820845a4b85024419031066b2f9300c7f70ff83b9b9b92008624a11c62c0c474646eaf5ba6ae2b15dadaaf5ad3ad735ad4c4c29d2c89df7defbe70b17f66bb5e5e5e546a351a954bc66d334cdc952a9d1a86d5737a7a62a6363f9c3772d0ec26810b65b9ca1c37ae620f7b9052118e7aa58756666666e7efebddbef5ebb766d62620263cc394518e944278478cd46e72c93a522a334a67114058e6dab041c21b80010c13ebd1465b9616dd0d23dc1c033e740d800c865730db7e1b98d8952e9ce9dbb53e5f2f3cdcd8f3efac8f7fd388e358ca72a95dd9d1d2793d9dcdad275fd9fce9f1f1f1f7ff6ecd9ceeeae5217e7ce9d53dd3f569e3efdfcf3cfabd52a8450d7f54f3ffdb4323595c9642ae7ce6573b920089e3c79d2b987300c6fdcbcf9de9d3baaa2e1cb3ffdc9755dcb34396396656533990bd3d31bcfd6d6d6d66bb5fae4e484b2d63ae1a9e3707ca7660421654c4ac9381742fcf0873fbc76eddae2d2d2cccc8c4974292542c8712c3f90008098c6611826d7836abaaeea8d681806e3bc6d9821048e2a8da4cee9de8fd0816196dc1e300c387310000801014018867b7bbbaedbbcf5bdef2d2c2cc471fc3f1ffdf7d395154274ce65717c7c349f87104e552a52ca388ea328dadbdb9b9c98b878f122c2d8b2acc5c5c562b1b8b5b9f9e0c183288a3cdf8710724a034a01001bebeb4dcfcbe572e3636353e5b2aeeb6babab6acfcf7ef63329e5f2e3c75f3d7a54abd79b8dfd4c2e3f363e8e200c82a0e9795eb35928140b85a26abc363d5d8f228a9146343d8e99145002092124c4540b3168182b575e2344cdcc0ace9b9ee77b9e65dbb357affee8c73f5e5858b87e7daef523208810060030c6ea5e5dcdb7400c3435cd9f58ef41f5ae960020002184adec4fa028a48624d982410f6bad03150aa7941272c8381c000c786c0d0110338e10fec52ffee3f7bfff43369bd1344269bcbabae6fb9e72fd21c0a66561ac92ac5aed3538a500c27ca1303e36663bcef4f9f3996cf6d1a3475f7cfe3950c2a1267312bf9ef28633994c219f7732195dd72727272b95cad6e6e6d3a74f9ffdf5af2a2dbf3439992f1428a54a34fd206094624dcb66b308a120084aa592effbb5fdfda6e7a9ec1e2925d63415e75509dd0863d7757dcf6bf5a0729c4aa5b2b0b0a0ba2866b35908a16eb45e8b1d8f5d15fe2495008647f589620292a0b35fa2e3fd995edb1dcea8a8b4aeebb66d0f1e73065ce7244129f58300c1300cc3a9a972a9541e1b1b0300a86e7a420815c0556612a3b4e979aaf54c1cc70f1f3ef483c0b1edf9ebd719632a9f5131a7439eadcd4de5e10461c838d730169c0741f0e8d123dff314430cc3705d5751a2d16898a6c9288da2480a3e329a1fcde775422cd3e49c135dd7e3d8f37d0080aeeba669aaf66b9431cff7abd52ad134279319cde7e7e7e7979696161717a7a7a755eb36d33447f3f946a376f0f0500000303a2abe480a701059060000751598644e17bb4ede1e600b2d89c1d7396acf4f7ffa6f2b2b2b8c51ce05c648d348369b0500349bcd5c6e144188354dc3d8300c55c4c6191bcde76bfbfb2f5ebc68341a7e1070c6264ba54aa5a2a6713863fc70e599e3388c311ac78c73d775b7b7b76bfbfb0000cbb627272733994c1cc7d96cd6f3bc288ac6c7c7358ca5944dcf53a697e03ca6340c82eded6dac6944d3b0a6a9fe552aa954551fc471ecfbfee8e8e895cb97bf7ff7ee8d1b376eddbaa513a26edb344dce7918048d46235f18553726a504b0d51204422465a2225aadbd9e0800a0047310820000d1cbcf498cefdeaffe8ce338d5396f18d40b8103802108c3f8adb7dedad8d8300c43d3b0e7f92a684b2975dd4618862a5591321a0621e7ac1da092aaaccdb2ad91912c63b45edfdfdb7ba1fa12aa6f010018238c358490ef7b8410427475b6300cb1862cdb3274e3c58b6ddf77755d7ff1625bcde73c7bb61ec73151eda134a2eb3a800200a1116cd90642584ac958c479dc6c363046cafb320c636aaab4b4b4f8e1871f5ebf7e239f1fe55c1c3cb11441e001003482c78b85ce4f218404b035612aa5804a87281b4cf6f0f2935e0d383ae604b60070c817d2759d1082cfd811fb8dc0c0ea1cf5586118e9ba4e30fce40f9ffef297fff9f4e953c6a861184248ad9ddbeb79bea6618c3500809aaad7755dd388e7354dd3340c0342e4ba2ec20823d47967639c283986b0e385b7ee41f09613af11d99e5d310c238e638c11502b8be83ae7aa689a732e3adda408d13299ac94b25eaf57ab55bfe93ad95ca93479fdfa8d8585850f3e78ffead5d9200882c0d7753d93c9369b6efba2b29d6283e0d138f251abacc51079b460bbcda883314ae79cc6cfe9ece94c860a210821a6690e9efd36e0cc01000821118241107ef9e5970f1f3eacd56aca8aa8d56a611828028461c8181542361a0dc628635c059d28a5beef379b4d08614bc485701b0d21da3dd3a4546d94859094c608a99576915ac6c3300ca5130a853c633c8aa24cc6618cd76ab5f1f1b1a4664bea1f8820a3d4759baeeb9aa679f5ead57bf7ee2e2d2dcdcdcd638c0921427084701cc78e638761d8616c270080103e2aa9f02843504b9f74efefdfcfe9de9332e74d4292399d87abd5f6f7f6f6c7c6c63219278aa2288a4647f300807abd66db4e10048c31428865595114a99a135dd7a3289252681a51e16055bc0521a4348ea288524629edecf77dafa343c230545c526dd382204408aa4e5408612178bd5ec7588ba2a813e28ba22808427566c678b95cba7cf9cafdfbf72f5dbe941f1d550a4ae9ab8e820200281681d623b733d9ba7d74a8fc99ae3858979fd3daff0acc39f4bf4899f3a643158122843a79ef07dfc903b9493ab2421eca076ba7d3ab986bcb944ff67d6d7b088786258d7e040f045a4a29e4010192fdcdc23044086958c31a965232ca28a58c339cb0068ffae2080200a4901041f5090ed78a767b299d1fa1131ed4b4973bbda72140f23c2a3c3d78e10130c011826ea0f66a9b6dd3ab458c646558f23d72c4fa175d8995e0b0c427c71fce8c0420c1a8ce9e64efb224a3000042080185a4524ac9389352e2c30658b7c702008018763e417beeb2f3ecc9f14957a493b2937cae5e0c39393670f2fe01c3103147691bf5c9183bd3b1ed35308ef68c4deaa5ee3696c9f15c727058aa823038e1582eda456910aacacd5ef7d62ba90ca21e6f8184ca55dbddcc390d4e63bf0db0453344cc81891c5e42c8c13f3561ad25dfe5c79ca12b3e9b4452cf242db724bbbaa5bcf3e24fee69276e4a2925c208218411eed663c9331c73b73d9873ccc823e6eb61ddd2eb5aa7d13f2973de78e8ba1eb7936b54eee34b0fe98489c161db5d74750c6cf579816ab0040010d2d221104200906c35d6e5428acea5933e92ea3bd3be3dd14a12c3400597110212f0b6f77270ddb6bcf662c8cbada95e5967bdacd6247ab122e98f617292b67ca3312ccc0187a5e434ef5425eec9fdb09d5dd2119a6438eb583fb85320a9b448b73fa3bec5f85065d8094f71fa88702f9c3033d3513ea78f9eb5ced96f19c29b8b61618ef270c059644209bae2cf11dfa0330024c89308391cf2b98f78e4275c3d29b5a7f1bfbbf97f1a293f8d7f92e2a5180ae628213e8d5d9e44c7dfe81cd8fd864e163c1eeb19cb7607404dd38e087a77bce134cc39fd539c867b295bfac6b03027191e006df9ebf65892dfaa0149d571e4db8e1e5348c6eb920aaa63c59d10f9ed96e02497cecaf96ebc8a9e39344f7a6204a5bff3bfa1180ee688e375ce4bbd1de5fa77b693dfc2765e16686ba7a4ff731ae939ab849dc60b7a95f3a738138682396a2ebf9b39bda243494fa6dbbd39560a8f88f569a4b63fbbebd59933c091e26f1343c11c855efe74f73c499239dd6aa497149eecbb778f39f9de7a1d757ae6f4b2b2ce3a0b9ce2580c78de5a273ea6aa717a8d01afc3b6392b5bba99d64b131e1a7962fcf7347ec85971d678dd90608874cec9bae2341ae3f4e73ffd9893edc66f07fdc5e8861c43c11cf5bf4fc6c14e7eafbf7afcea55c67c9bf847bb9f370843c11c85a426f97b31a797ad75a4a2e184a35e92599732e1dbc280fb391da8bacb331df2badaefbfae2afcb3b22265d1df14c3a273ba935f52a478150c0b73c0e11cded3e0640b2ac59063889873e6882d7ff99014438b61f173148e143f1ec97a3e16dfbe8dd7eb8a67fd4fa5d6e9df1443a4734062f2e4d81cb0633332ff71e4ef1fe74e528061630ee8c1871352d152a43816c365ada548f1ba307445b02952bc16a4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21fa4cc4991a21ffc3fd098c1513f0c6ee80000000049454e44ae426082, 275, 400, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `instituicao`
--

CREATE TABLE `instituicao` (
  `inst_cod` int(4) NOT NULL,
  `inst_nome` varchar(30) NOT NULL DEFAULT '',
  `inst_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de Instituições Lasalistas';

--
-- Despejando dados para a tabela `instituicao`
--

INSERT INTO `instituicao` (`inst_cod`, `inst_nome`, `inst_status`) VALUES
(1, '01-MATRIZ', 1),
(2, '02 - UNIDADE FILIAL 01', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE `itens` (
  `item_cod` int(4) NOT NULL,
  `item_nome` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de componentes individuais';

--
-- Despejando dados para a tabela `itens`
--

INSERT INTO `itens` (`item_cod`, `item_nome`) VALUES
(5, 'CD-ROM'),
(8, 'DVD'),
(9, 'Gravador'),
(1, 'HD'),
(7, 'Memória'),
(6, 'Modem'),
(3, 'Placa de rede'),
(4, 'Placa de som'),
(2, 'Placa de vídeo'),
(10, 'Placa mãe'),
(11, 'Processador'),
(12, 'SSD');

-- --------------------------------------------------------

--
-- Estrutura para tabela `licencas`
--

CREATE TABLE `licencas` (
  `lic_cod` int(4) NOT NULL,
  `lic_desc` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de tipos de licenças de softwares';

--
-- Despejando dados para a tabela `licencas`
--

INSERT INTO `licencas` (`lic_cod`, `lic_desc`) VALUES
(1, 'Open Source / livre'),
(2, 'Freeware'),
(3, 'Shareware'),
(4, 'Adware'),
(5, 'Contrato'),
(6, 'Comercial'),
(7, 'OEM');

-- --------------------------------------------------------

--
-- Estrutura para tabela `localizacao`
--

CREATE TABLE `localizacao` (
  `loc_id` int(11) NOT NULL,
  `local` char(200) DEFAULT NULL,
  `loc_reitoria` int(4) DEFAULT '0',
  `loc_prior` int(4) DEFAULT NULL,
  `loc_dominio` int(4) DEFAULT NULL,
  `loc_predio` int(4) DEFAULT NULL,
  `loc_status` int(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `localizacao`
--

INSERT INTO `localizacao` (`loc_id`, `local`, `loc_reitoria`, `loc_prior`, `loc_dominio`, `loc_predio`, `loc_status`) VALUES
(1, 'Contabilidade', 1, 3, 1, 1, 1),
(2, 'RH', 1, 3, 1, 1, 1),
(3, 'Contas a Pagar', 1, 3, 1, 1, 1),
(4, 'Diretoria', 1, 2, 1, 2, 1),
(5, 'Estoque', 1, 4, 1, 3, 1),
(6, 'Centro de Informática', 1, 3, 1, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `lock_oco`
--

CREATE TABLE `lock_oco` (
  `lck_id` int(4) NOT NULL,
  `lck_uid` int(4) NOT NULL,
  `lck_oco` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de Lock para chamados em edição';

-- --------------------------------------------------------

--
-- Estrutura para tabela `mailconfig`
--

CREATE TABLE `mailconfig` (
  `mail_cod` int(4) NOT NULL,
  `mail_issmtp` int(1) NOT NULL DEFAULT '1',
  `mail_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'mail.smtp.com',
  `mail_port` int(5) NOT NULL DEFAULT '587',
  `mail_secure` varchar(10) NOT NULL DEFAULT 'tls',
  `mail_isauth` int(1) NOT NULL DEFAULT '0',
  `mail_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail_from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ocomon@yourdomain.com',
  `mail_ishtml` int(1) NOT NULL DEFAULT '1',
  `mail_from_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'SISTEMA_OCOMON'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de configuracao para envio de e-mails';

--
-- Despejando dados para a tabela `mailconfig`
--

INSERT INTO `mailconfig` (`mail_cod`, `mail_issmtp`, `mail_host`, `mail_port`, `mail_secure`, `mail_isauth`, `mail_user`, `mail_pass`, `mail_from`, `mail_ishtml`, `mail_from_name`) VALUES
(1, 1, 'mail.smtp.com', 587, 'tls', 0, NULL, NULL, 'mail@yourdomain.com', 1, 'SISTEMA_OCOMON');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mail_hist`
--

CREATE TABLE `mail_hist` (
  `mhist_cod` int(6) NOT NULL,
  `mhist_oco` int(6) NOT NULL,
  `mhist_listname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mhist_address` text NOT NULL,
  `mhist_address_cc` text,
  `mhist_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mhist_body` text NOT NULL,
  `mhist_date` datetime NOT NULL,
  `mhist_technician` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de histórico de emails enviados';

-- --------------------------------------------------------

--
-- Estrutura para tabela `mail_list`
--

CREATE TABLE `mail_list` (
  `ml_cod` int(4) NOT NULL,
  `ml_sigla` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ml_desc` text NOT NULL,
  `ml_addr_to` text NOT NULL,
  `ml_addr_cc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de listas de distribuicao';

--
-- Despejando dados para a tabela `mail_list`
--

INSERT INTO `mail_list` (`ml_cod`, `ml_sigla`, `ml_desc`, `ml_addr_to`, `ml_addr_cc`) VALUES
(1, 'LST-SUPERVISORES', 'Informação sobre ocorrência', 'email@supervisores.com', 'email@supervisores.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mail_templates`
--

CREATE TABLE `mail_templates` (
  `tpl_cod` int(4) NOT NULL,
  `tpl_sigla` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tpl_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tpl_msg_html` text NOT NULL,
  `tpl_msg_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de templates de e-mails';

--
-- Despejando dados para a tabela `mail_templates`
--

INSERT INTO `mail_templates` (`tpl_cod`, `tpl_sigla`, `tpl_subject`, `tpl_msg_html`, `tpl_msg_text`) VALUES
(1, '001 - Solicitação de Avaliação', 'Não esqueça de Avaliar o atendimento', 'Caro %usuario%, \r\n\r\nSua solicitação foi concluída em nosso sistema. Gostaríamos de ter seu retorno sobre a qualidade do nosso atendimento.', 'Caro %usuario%, \r\n\r\nSua solicitação foi concluída em nosso sistema. Gostaríamos de ter seu retorno sobre a qualidade do nosso atendimento.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcas_comp`
--

CREATE TABLE `marcas_comp` (
  `marc_cod` int(4) UNSIGNED NOT NULL,
  `marc_nome` varchar(30) NOT NULL DEFAULT '0',
  `marc_tipo` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela das marcas de computadores';

--
-- Despejando dados para a tabela `marcas_comp`
--

INSERT INTO `marcas_comp` (`marc_cod`, `marc_nome`, `marc_tipo`) VALUES
(1, 'Aspire 5 - A515-52G-50NT', 2),
(2, 'Optiplex 3070 Micro', 1),
(3, 'HP - Pavilion - 24-xa111la', 1),
(4, 'Epson EcoTank L3150', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `materiais`
--

CREATE TABLE `materiais` (
  `mat_cod` int(4) NOT NULL,
  `mat_nome` varchar(100) NOT NULL DEFAULT '',
  `mat_qtd` int(11) NOT NULL DEFAULT '0',
  `mat_caixa` varchar(30) DEFAULT '',
  `mat_data` datetime DEFAULT NULL,
  `mat_obs` varchar(200) NOT NULL DEFAULT '',
  `mat_modelo_equip` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de materiais do Helpdesk';

--
-- Despejando dados para a tabela `materiais`
--

INSERT INTO `materiais` (`mat_cod`, `mat_nome`, `mat_qtd`, `mat_caixa`, `mat_data`, `mat_obs`, `mat_modelo_equip`) VALUES
(1, 'Manual do Usuário', 2, 'Caixa 5A', '2020-07-05 05:17:18', 'Manual de operação do notebook Acer Aspire 5', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelos_itens`
--

CREATE TABLE `modelos_itens` (
  `mdit_cod` int(4) NOT NULL,
  `mdit_fabricante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mdit_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mdit_desc_capacidade` float DEFAULT NULL,
  `mdit_tipo` int(4) NOT NULL DEFAULT '0',
  `mdit_cod_old` int(4) DEFAULT NULL,
  `mdit_sufixo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de modelos de componentes';

--
-- Despejando dados para a tabela `modelos_itens`
--

INSERT INTO `modelos_itens` (`mdit_cod`, `mdit_fabricante`, `mdit_desc`, `mdit_desc_capacidade`, `mdit_tipo`, `mdit_cod_old`, `mdit_sufixo`) VALUES
(1, 'Default', 'SATA', 2.5, 1, 2, 'TB'),
(2, 'Intel', 'i5-8265u', 2, 11, NULL, 'GHz'),
(3, 'Kingstom', 'DDR4', 8, 7, NULL, 'GB'),
(4, 'Nvídia', 'GeForce MX130', 2, 2, NULL, 'GB VRAM'),
(5, 'Kingstom', 'Genérico', 256, 12, NULL, 'GB'),
(6, 'Intel', 'i7 3517U', 3, 11, NULL, 'GHz'),
(7, 'Kingstom', 'GeForce® GT 635M', 2, 2, NULL, 'GB VRAM'),
(8, 'Kingstom', 'SATA 2', 2.8, 1, NULL, 'TB'),
(9, 'TP-Link', 'TL-WN881ND', 1000, 3, NULL, 'Mbps'),
(10, 'Seagate', 'Barracuda', 5, 1, NULL, 'TB'),
(11, 'Intel', 'i7-8565U', 1.8, 11, NULL, 'GHz'),
(12, 'Kingstom', 'DDR4, 2400MHz', 8, 7, NULL, 'GB'),
(13, 'Intel', 'i5-9500T', 2.2, 11, NULL, 'GHz');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modulos`
--

CREATE TABLE `modulos` (
  `modu_cod` int(4) NOT NULL,
  `modu_nome` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de mÃ³dulos do sistema';

--
-- Despejando dados para a tabela `modulos`
--

INSERT INTO `modulos` (`modu_cod`, `modu_nome`) VALUES
(2, 'inventário'),
(1, 'ocorrências');

-- --------------------------------------------------------

--
-- Estrutura para tabela `moldes`
--

CREATE TABLE `moldes` (
  `mold_cod` int(4) NOT NULL,
  `mold_inv` int(6) DEFAULT NULL,
  `mold_sn` varchar(30) DEFAULT NULL,
  `mold_marca` int(4) NOT NULL DEFAULT '0',
  `mold_mb` int(4) DEFAULT NULL,
  `mold_proc` int(4) DEFAULT NULL,
  `mold_memo` int(4) DEFAULT NULL,
  `mold_video` int(4) DEFAULT NULL,
  `mold_som` int(4) DEFAULT NULL,
  `mold_rede` int(4) DEFAULT NULL,
  `mold_modelohd` int(4) DEFAULT NULL,
  `mold_modem` int(4) DEFAULT NULL,
  `mold_cdrom` int(4) DEFAULT NULL,
  `mold_dvd` int(4) DEFAULT NULL,
  `mold_grav` int(4) DEFAULT NULL,
  `mold_nome` varchar(10) DEFAULT NULL,
  `mold_local` int(4) DEFAULT NULL,
  `mold_fornecedor` int(4) DEFAULT NULL,
  `mold_nf` varchar(30) DEFAULT NULL,
  `mold_coment` varchar(200) DEFAULT NULL,
  `mold_data` datetime DEFAULT NULL,
  `mold_valor` float DEFAULT NULL,
  `mold_data_compra` datetime DEFAULT NULL,
  `mold_inst` int(4) DEFAULT NULL,
  `mold_ccusto` int(4) DEFAULT NULL,
  `mold_tipo_equip` int(4) NOT NULL DEFAULT '0',
  `mold_tipo_imp` int(4) DEFAULT NULL,
  `mold_resolucao` int(4) DEFAULT NULL,
  `mold_polegada` int(4) DEFAULT NULL,
  `mold_fab` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de padrões de configurações';

--
-- Despejando dados para a tabela `moldes`
--

INSERT INTO `moldes` (`mold_cod`, `mold_inv`, `mold_sn`, `mold_marca`, `mold_mb`, `mold_proc`, `mold_memo`, `mold_video`, `mold_som`, `mold_rede`, `mold_modelohd`, `mold_modem`, `mold_cdrom`, `mold_dvd`, `mold_grav`, `mold_nome`, `mold_local`, `mold_fornecedor`, `mold_nf`, `mold_coment`, `mold_data`, `mold_valor`, `mold_data_compra`, `mold_inst`, `mold_ccusto`, `mold_tipo_equip`, `mold_tipo_imp`, `mold_resolucao`, `mold_polegada`, `mold_fab`) VALUES
(1, NULL, NULL, 1, NULL, 2, 3, 4, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-05 16:47:04', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `msgconfig`
--

CREATE TABLE `msgconfig` (
  `msg_cod` int(4) NOT NULL,
  `msg_event` varchar(40) NOT NULL DEFAULT 'evento',
  `msg_fromname` varchar(40) NOT NULL DEFAULT 'from',
  `msg_replyto` varchar(40) NOT NULL DEFAULT 'ocomon@yourdomain.com',
  `msg_subject` varchar(40) NOT NULL DEFAULT 'subject',
  `msg_body` text,
  `msg_altbody` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de configuracao das mensagens de e-mail';

--
-- Despejando dados para a tabela `msgconfig`
--

INSERT INTO `msgconfig` (`msg_cod`, `msg_event`, `msg_fromname`, `msg_replyto`, `msg_subject`, `msg_body`, `msg_altbody`) VALUES
(1, 'abertura-para-usuario', 'Sistema Ocomon', 'reply-to', 'CHAMADO ABERTO NO SISTEMA', 'Caro %usuario%,<br />Seu chamado foi aberto com sucesso no sistema de atendimento.<br />O n&uacute;mero do chamado &eacute; %numero%<br />Aguarde o atendimento pela equipe de suporte.<br />%site%', 'Caro %usuario%,\r\nSeu chamado foi aberto com sucesso no sistema de atendimento.\r\nO número do chamado é %numero%\r\nAguarde o atendimento pela equipe de suporte.\r\n%site%'),
(2, 'abertura-para-area', 'Sistema Ocomon', 'reply-to', 'CHAMADO ABERTO PARA %area%', 'Sistema Ocomon<br />Foi aberto um novo chamado t&eacute;cnico para ser atendido pela &aacute;rea %area%.<br />O n&uacute;mero do chamado &eacute; %numero%<br />Descri&ccedil;&atilde;o: %descricao%<br />Contato: %contato%<br />Setor: %setor%<br />Ramal: %ramal%<br />Chamado aberto pelo operador: %operador%<br />%site%', 'Sistema Ocomon\r\nFoi aberto um novo chamado técnico para ser atendido pela área %area%.\r\nO número do chamado é %numero%\r\nDescrição: %descricao%\r\nContato: %contato%\r\nSetor: %setor%\r\nRamal: %ramal%\r\nChamado aberto pelo operador: %operador%\r\n%site%'),
(3, 'encerra-para-area', 'SISTEMA OCOMON', 'reply-to', 'OCOMON - CHAMADO ENCERRADO', 'Sistema Ocomon<br />O chamado %numero% foi fechado pelo operador %operador%<br />Descri&ccedil;&atilde;o t&eacute;cnica: %descricao%<br />Solu&ccedil;&atilde;o: %solucao%', 'Sistema Ocomon\r\nO chamado %numero% foi fechado pelo operador %operador%\r\nDescrição técnica: %descricao%\r\nSolução: %solucao%'),
(4, 'encerra-para-usuario', 'SISTEMA OCOMON', 'reply-to', 'OCOMON -CHAMADO ENCERRADO NO SISTEMA', 'Caro %contato%<br />Seu chamado foi encerrado no sistema de atendimento.<br />N&uacute;mero do chamado: %numero%<br />Para maiores informa&ccedil;&otilde;es acesso o sistema com seu nome de usu&aacute;rio e senha no endere&ccedil;o abaixo:<br />%site%', 'Caro %contato%\r\nSeu chamado foi encerrado no sistema de atendimento.\r\nNúmero do chamado: %numero%\r\nPara maiores informações acesso o sistema com seu nome de usuário e senha no endereço abaixo:\r\n%site%'),
(5, 'edita-para-area', 'SISTEMA OCOMON', 'reply-to', 'CHAMADO EDITADO PARA %area%', '<span style=\"color: rgb(0, 0, 0);\">Sistema Ocomon</span><br />Foram adicionadas informa&ccedil;&otilde;es ao chamado %numero% para a &aacute;rea %area%<br />Descri&ccedil;&atilde;o: %descricao%<br />Altera&ccedil;&atilde;o mais recente: %assentamento%<br />Contato: %contato%<br />Ramal: %ramal%<br />Ocorr&ecirc;ncia editada pelo operador: %operador%<br />%site%', 'Sistema Ocomon\r\nForam adicionadas informações ao chamado %numero% para a área %area%\r\nDescrição: %descricao%\r\nAlteração mais recente: %assentamento%\r\nContato: %contato%\r\nRamal: %ramal%\r\nOcorrência editada pelo operador: %operador%\r\n%site%'),
(6, 'edita-para-usuario', 'SISTEMA OCOMON', 'reply-to', 'OCOMON - ALTERAÇÕES NO SEU CHAMADO', 'Caro %contato%,<br />O chamado %numero% foi editado no sistema de atendimento.<br />Altera&ccedil;&atilde;o mais recente: %assentamento%<br />Para maiores informa&ccedil;&otilde;es acesse o sistema com seu usu&aacute;rio e senha no endere&ccedil;o abaixo:<br />%site%', 'Caro %contato%,\r\nO chamado %numero% foi editado no sistema de atendimento.\r\nAlteração mais recente: %assentamento%\r\nPara maiores informações acesse o sistema com seu usuário e senha no endereço abaixo:\r\n%site%'),
(7, 'edita-para-operador', 'SISTEMA OCOMON', 'reply-to', 'CHAMADO PARA %operador%', 'Caro %operador%,<br />O chamado %numero% foi editado e est&aacute; direcionado a voc&ecirc;.<br />Descri&ccedil;&atilde;o: %descricao%<br />Altera&ccedil;&atilde;o mais recente: %assentamento%<br />Contato: %contato%&nbsp;&nbsp; <br />Ramal: %ramal%<br />Ocorr&ecirc;ncia editada pelo operador: %editor%<br />%site%', 'Caro %operador%,\r\nO chamado %numero% foi editado e está direcionado a você.\r\nDescrição: %descricao%\r\nAlteração mais recente: %assentamento%\r\nContato: %contato%\r\nRamal: %ramal%\r\nOcorrência editada pelo operador: %editor%\r\n%site%'),
(8, 'cadastro-usuario', 'SISTEMA OCOMON', 'reply-to', 'OCOMON - CONFIRMAÇÃO DE CADASTRO', 'Prezado %usuario%,<br />Sua solicita&ccedil;&atilde;o para cria&ccedil;&atilde;o do login &quot;%login%&quot; foi bem sucedida!<br />Para confirmar sua inscri&ccedil;&atilde;o clique no link abaixo:<br />%linkconfirma%', 'Prezado %usuario%,\r\nSua solicitação para criação do login &quot;%login%&quot; foi bem sucedida!\r\nPara confirmar sua inscrição clique no link abaixo:\r\n%linkconfirma%'),
(9, 'cadastro-usuario-from-admin', 'SISTEMA OCOMON', 'reply-to', 'OCOMON - CONFIRMAÇÃO DE CADASTRO', 'Prezado %usuario%<br />Seu cadastro foi efetuado com sucesso no sistema de chamados do Helpdesk<br />Seu login &eacute;: %login%<br />Para abrir chamados acesse o site %site%<br />Atenciosamente Helpdesk Unilasalle', 'Prezado %usuario%\r\nSeu cadastro foi efetuado com sucesso no sistema de chamados do Helpdesk\r\nSeu login é: %login%\r\nPara abrir chamados acesse o site %site%\r\nAtenciosamente Helpdesk Unilasalle'),
(10, 'mail-about-warranty', 'SISTEMA OCOMON', 'ocomon@yourdomain.com', 'OCOMON - VENCIMENTO DE GARANTIA', 'Aten&ccedil;&atilde;o: <br />Existem equipamentos com o prazo de garantia prestes a expirar.<br /><br />Tipo de equipamento: %tipo%<br />N&uacute;mero de s&eacute;rie: %serial%<br />Partnumber: %partnumber%<br />Modelo: %modelo%<br />Departamento: %local%<br />Fornecedor: %fornecedor%<br />Nota fiscal: %notafiscal%<br />Vencimento: %vencimento%', 'Atenção:\r\nExistem equipamentos com o prazo de garantia prestes a expirar.\r\n\r\nTipo de equipamento: %tipo%\r\nNúmero de série: %serial%\r\nPartnumber: %partnumber%\r\nModelo: %modelo%\r\nDepartamento: %local%\r\nFornecedor: %fornecedor%\r\nNota fiscal: %notafiscal%\r\nVencimento: %vencimento%'),
(11, 'abertura-para-operador', 'SISTEMA OCOMON', 'ocomon@yourdomain.com', 'CHAMADO ABERTO PARA VOCÊ', '<span style=\"font-weight: bold;\">SISTEMA OCOMON %versao%</span><br />Caro %operador%,<br />O chamado <span style=\"font-weight: bold;\">%numero%</span> foi aberto e direcionado a voc&ecirc;.<br /><span style=\"font-weight: bold;\">Descri&ccedil;&atilde;o: </span>%descricao%<br /><span style=\"font-weight: bold;\">Contato: </span>%contato%<br /><span style=\"font-weight: bold;\">Ramal:</span> %ramal%<br />Ocorr&ecirc;ncia aberta pelo operador: %aberto_por%<br />%site%', 'SISTEMA OCOMON %versao%\r\nCaro %operador%,\r\nO chamado %numero% foi aberto e direcionado a você.\r\nDescrição: %descricao%\r\nContato: %contato%\r\nRamal: %ramal%\r\nOcorrência aberta pelo operador: %aberto_por%\r\n%site%');

-- --------------------------------------------------------

--
-- Estrutura para tabela `nivel`
--

CREATE TABLE `nivel` (
  `nivel_cod` int(4) NOT NULL,
  `nivel_nome` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de níveis de acesso ao invmon';

--
-- Despejando dados para a tabela `nivel`
--

INSERT INTO `nivel` (`nivel_cod`, `nivel_nome`) VALUES
(1, 'Administrador'),
(2, 'Operador'),
(3, 'Somente Abertura'),
(5, 'Desabilitado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ocodeps`
--

CREATE TABLE `ocodeps` (
  `dep_pai` int(6) NOT NULL,
  `dep_filho` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela para controle de sub-chamados';

--
-- Despejando dados para a tabela `ocodeps`
--

INSERT INTO `ocodeps` (`dep_pai`, `dep_filho`) VALUES
(4, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `numero` int(11) NOT NULL,
  `problema` int(11) NOT NULL DEFAULT '0',
  `descricao` text NOT NULL,
  `equipamento` int(6) DEFAULT NULL,
  `sistema` int(11) NOT NULL DEFAULT '0',
  `contato` varchar(100) NOT NULL DEFAULT '',
  `telefone` varchar(40) DEFAULT NULL,
  `local` int(11) NOT NULL DEFAULT '0',
  `operador` int(4) NOT NULL DEFAULT '0',
  `data_abertura` datetime DEFAULT NULL,
  `data_fechamento` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `data_atendimento` datetime DEFAULT NULL,
  `instituicao` int(4) DEFAULT NULL,
  `aberto_por` int(4) NOT NULL DEFAULT '0',
  `oco_scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `oco_real_open_date` datetime DEFAULT NULL,
  `oco_script_sol` int(4) DEFAULT NULL,
  `date_first_queued` datetime DEFAULT NULL,
  `oco_prior` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `ocorrencias`
--

INSERT INTO `ocorrencias` (`numero`, `problema`, `descricao`, `equipamento`, `sistema`, `contato`, `telefone`, `local`, `operador`, `data_abertura`, `data_fechamento`, `status`, `data_atendimento`, `instituicao`, `aberto_por`, `oco_scheduled`, `oco_real_open_date`, `oco_script_sol`, `date_first_queued`, `oco_prior`) VALUES
(1, 2, 'Olá, gostaria que fosse instalado o software Telegram em meu notebook.', 1, 1, 'Emerson Almeida', '5189439388', 3, 3, '2020-07-06 17:24:36', '2020-07-06 17:27:16', 4, '2020-07-06 17:25:16', 1, 2, 0, '2020-07-06 17:24:36', NULL, '2020-07-06 17:24:36', 1),
(2, 1, 'Liberar a porta 22 para acesso SSH ao servidor web.', NULL, 3, 'Alexandre Farias', '51996735980', 6, 4, '2020-07-06 17:29:48', '2020-07-06 17:43:07', 4, '2020-07-06 17:42:31', -1, 3, 0, '2020-07-06 17:29:48', NULL, '2020-07-06 17:29:48', 1),
(3, 1, 'Minha impressora não está funcionando', 2, 1, 'Rivadoir Almeida', '9999999', 3, 3, '2020-07-06 00:00:00', '2020-07-06 17:40:47', 4, '2020-07-06 17:38:29', 1, 2, 0, '2020-07-06 17:37:41', NULL, '2020-07-06 17:37:41', 1),
(4, 1, 'Meu computador não está ligando.', NULL, 1, 'Moises Mathias', '51996735980', 1, 3, '2020-07-06 17:47:11', NULL, 2, '2020-07-06 20:34:48', -1, 5, 0, '2020-07-06 17:47:11', NULL, '2020-07-06 17:47:11', 1),
(5, 6, 'O equipamento não está ligando. Pode ser problema na fonte de alimentação.', 3, 4, 'Moises Mathias', '51996735980', 1, 3, '2020-07-06 20:36:12', NULL, 1, NULL, 1, 3, 0, '2020-07-06 20:36:12', NULL, '2020-07-06 20:36:12', 1),
(6, 4, 'Aplicar atualização de segurança no servidor web.', NULL, 3, 'Geraldo Santana', '51996735980', 1, 1, '2020-07-06 20:42:40', NULL, 1, NULL, NULL, 1, 0, '2020-07-06 20:42:40', NULL, '2020-07-06 20:42:40', 1),
(7, 8, 'Bloquear os acessos do usuário cvilella.castro. ', NULL, 3, 'Cesar Menezes', '51996735980', 2, 1, '2020-07-08 14:23:39', NULL, 1, NULL, NULL, 1, 0, '2020-07-08 14:23:39', NULL, '2020-07-08 14:23:39', 4),
(8, 11, 'Usuário solicita treinamento para utilização do ERP institucional.', NULL, 1, 'Joice Ramos', '345356767', 1, 3, '2020-07-08 14:40:57', NULL, 1, NULL, NULL, 3, 0, '2020-07-08 14:40:57', NULL, '2020-07-08 14:40:57', 1),
(9, 12, 'Usuário não está conseguindo se autenticar na intranet.', 1, 3, 'Joice Ramos', '9999999', 3, 3, '2020-07-08 14:45:40', NULL, 1, NULL, 1, 3, 0, '2020-07-08 14:45:40', NULL, '2020-07-08 14:45:40', 1),
(10, 5, 'Elaborar o manual para descrever todo o funcionamento do sistema de deployment utilizado pelo departamento de Redes e Servidores.', NULL, 3, 'Ricardo Mosart', '345393844', 6, 1, '2020-07-08 14:48:12', NULL, 2, '2020-07-08 14:48:41', NULL, 1, 0, '2020-07-08 14:48:12', NULL, '2020-07-08 14:48:12', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `perm_cod` int(4) NOT NULL,
  `perm_area` int(4) NOT NULL DEFAULT '0',
  `perm_modulo` int(4) NOT NULL DEFAULT '0',
  `perm_flag` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela para permissoes das áreas';

--
-- Despejando dados para a tabela `permissoes`
--

INSERT INTO `permissoes` (`perm_cod`, `perm_area`, `perm_modulo`, `perm_flag`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 1, 1),
(4, 3, 1, 1),
(5, 3, 2, 1),
(6, 4, 1, 1),
(7, 4, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `polegada`
--

CREATE TABLE `polegada` (
  `pole_cod` int(4) NOT NULL,
  `pole_nome` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de polegadas de monitores de vídeo';

--
-- Despejando dados para a tabela `polegada`
--

INSERT INTO `polegada` (`pole_cod`, `pole_nome`) VALUES
(1, '14 polegadas'),
(2, '15 polegadas'),
(3, '17 polegadas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `predios`
--

CREATE TABLE `predios` (
  `pred_cod` int(4) NOT NULL,
  `pred_desc` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de predios - vinculada a tabela de localizaÃ§Ãµes';

--
-- Despejando dados para a tabela `predios`
--

INSERT INTO `predios` (`pred_cod`, `pred_desc`) VALUES
(1, 'Prédio 1'),
(2, 'Prédio 2'),
(3, 'Prédio 3');

-- --------------------------------------------------------

--
-- Estrutura para tabela `prioridades`
--

CREATE TABLE `prioridades` (
  `prior_cod` int(4) NOT NULL,
  `prior_nivel` varchar(15) NOT NULL DEFAULT '',
  `prior_sla` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de prioridades para resposta de chamados';

--
-- Despejando dados para a tabela `prioridades`
--

INSERT INTO `prioridades` (`prior_cod`, `prior_nivel`, `prior_sla`) VALUES
(2, 'NíVEL 1', 18),
(3, 'NíVEL 2', 19),
(4, 'NíVEL 3', 20),
(5, 'NíVEL 4', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `prior_atend`
--

CREATE TABLE `prior_atend` (
  `pr_cod` int(2) NOT NULL,
  `pr_nivel` int(2) NOT NULL,
  `pr_default` tinyint(1) NOT NULL DEFAULT '0',
  `pr_desc` varchar(50) NOT NULL DEFAULT '#CCCCCC',
  `pr_color` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de prioridades para atendimento dos chamados';

--
-- Despejando dados para a tabela `prior_atend`
--

INSERT INTO `prior_atend` (`pr_cod`, `pr_nivel`, `pr_default`, `pr_desc`, `pr_color`) VALUES
(1, 1, 1, 'Baixa', '#33FF66'),
(2, 2, 0, 'Media', '#FFFF00'),
(3, 3, 0, 'Alta', '#FF0000'),
(4, 4, 0, 'Urgente', '#CC0000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `prior_nivel`
--

CREATE TABLE `prior_nivel` (
  `prn_cod` int(2) NOT NULL,
  `prn_level` int(2) NOT NULL,
  `prn_used` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Niveis sequenciais para ordem de atendimento';

--
-- Despejando dados para a tabela `prior_nivel`
--

INSERT INTO `prior_nivel` (`prn_cod`, `prn_level`, `prn_used`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `problemas`
--

CREATE TABLE `problemas` (
  `prob_id` int(11) NOT NULL,
  `problema` varchar(100) NOT NULL DEFAULT '',
  `prob_area` int(4) DEFAULT NULL,
  `prob_sla` int(4) DEFAULT NULL,
  `prob_tipo_1` int(4) DEFAULT NULL,
  `prob_tipo_2` int(4) DEFAULT NULL,
  `prob_tipo_3` int(4) DEFAULT NULL,
  `prob_alimenta_banco_solucao` int(1) NOT NULL DEFAULT '1' COMMENT 'Flag para gravar a solucao ou nao',
  `prob_descricao` text COMMENT 'Descricao do tipo de problema'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `problemas`
--

INSERT INTO `problemas` (`prob_id`, `problema`, `prob_area`, `prob_sla`, `prob_tipo_1`, `prob_tipo_2`, `prob_tipo_3`, `prob_alimenta_banco_solucao`, `prob_descricao`) VALUES
(1, 'Diversos', -1, 7, 5, 5, 6, 1, 'Solicitações diversas - Configure no painel de administração em Admin::Ocorrências::Problemas'),
(2, 'Instalação de Software', -1, 7, 3, 2, 1, 1, 'Demandas diversas sobre solicitações de instalação de Softwares.'),
(3, 'Instalação de Hardware', -1, 8, 1, 1, 1, 1, 'Demandas diversas relacionadas a troca de componentes de hardware.'),
(4, 'Aplicação de Patch', 3, 7, 2, 2, 3, 1, 'Atualizações de segurança em servidor'),
(5, 'Documentação de Processos', 3, 14, 4, 5, 5, 1, 'Demandas internas para documentação de processos relacionados a administração de servidores'),
(6, 'Manutenção de Hardware', -1, 14, 1, 1, 1, 1, ''),
(7, 'Cadastro de Usuário', 3, 4, 4, 5, 3, 1, 'Demandas relacionadas ao cadastro de usuários na rede da empresa.'),
(8, 'Bloqueio de Conta', 3, 4, 4, 5, 3, 1, 'Demandas relacionadas ao bloqueio de contas de acesso.'),
(9, 'Instalação de Sistema Operacional', 1, 8, 1, 2, 1, 1, 'Demandas relacionadas à necessidade de reinstalação de sistema Operacional em desktops'),
(10, 'Instalação de Sistema Operacional', 3, 9, 1, 2, 3, 1, 'Demandas de reinstalação de sistema operacional de servidores.'),
(11, 'Treinamento', -1, 14, 3, 3, 4, 1, 'Demandas relacionadas à treinamentos diversos para os usuários do sistema.'),
(12, 'Contas::Acessos', 3, 5, 1, 5, 3, 1, 'Demandas diversas relacionadas a contas de acesso.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `prob_tipo_1`
--

CREATE TABLE `prob_tipo_1` (
  `probt1_cod` int(4) NOT NULL,
  `probt1_desc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `prob_tipo_1`
--

INSERT INTO `prob_tipo_1` (`probt1_cod`, `probt1_desc`) VALUES
(1, 'Manutenção corretiva'),
(2, 'Manutenção preventiva'),
(3, 'Demandas de usuários'),
(4, 'Demandas periódicas'),
(5, 'Outros');

-- --------------------------------------------------------

--
-- Estrutura para tabela `prob_tipo_2`
--

CREATE TABLE `prob_tipo_2` (
  `probt2_cod` int(4) NOT NULL,
  `probt2_desc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `prob_tipo_2`
--

INSERT INTO `prob_tipo_2` (`probt2_cod`, `probt2_desc`) VALUES
(1, 'Hardware'),
(2, 'Software'),
(3, 'Serviços'),
(4, 'Mau uso'),
(5, 'Outros'),
(6, 'Não aplicável');

-- --------------------------------------------------------

--
-- Estrutura para tabela `prob_tipo_3`
--

CREATE TABLE `prob_tipo_3` (
  `probt3_cod` int(4) NOT NULL,
  `probt3_desc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `prob_tipo_3`
--

INSERT INTO `prob_tipo_3` (`probt3_cod`, `probt3_desc`) VALUES
(1, 'Desktop'),
(2, 'Mobile'),
(3, 'Servidor'),
(4, 'Treinamento'),
(5, 'Gerencial'),
(6, 'Não aplicável');

-- --------------------------------------------------------

--
-- Estrutura para tabela `prob_x_script`
--

CREATE TABLE `prob_x_script` (
  `prscpt_id` int(4) NOT NULL,
  `prscpt_prob_id` int(4) NOT NULL,
  `prscpt_scpt_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Scripts por problemas';

--
-- Despejando dados para a tabela `prob_x_script`
--

INSERT INTO `prob_x_script` (`prscpt_id`, `prscpt_prob_id`, `prscpt_scpt_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `reitorias`
--

CREATE TABLE `reitorias` (
  `reit_cod` int(4) NOT NULL,
  `reit_nome` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de reitorias';

--
-- Despejando dados para a tabela `reitorias`
--

INSERT INTO `reitorias` (`reit_cod`, `reit_nome`) VALUES
(1, 'DEFAULT');

-- --------------------------------------------------------

--
-- Estrutura para tabela `resolucao`
--

CREATE TABLE `resolucao` (
  `resol_cod` int(4) NOT NULL,
  `resol_nome` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de resoluções para scanners';

--
-- Despejando dados para a tabela `resolucao`
--

INSERT INTO `resolucao` (`resol_cod`, `resol_nome`) VALUES
(1, '9600 DPI');

-- --------------------------------------------------------

--
-- Estrutura para tabela `scripts`
--

CREATE TABLE `scripts` (
  `scpt_id` int(4) NOT NULL,
  `scpt_nome` varchar(35) NOT NULL,
  `scpt_desc` varchar(100) NOT NULL,
  `scpt_script` text NOT NULL,
  `scpt_enduser` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de scripts para solucoes';

--
-- Despejando dados para a tabela `scripts`
--

INSERT INTO `scripts` (`scpt_id`, `scpt_nome`, `scpt_desc`, `scpt_script`, `scpt_enduser`) VALUES
(1, '001 - Instalação Telegram', 'Processo de instalação do aplicativo Telegram.', '<h3>Como usar o Telegram no PC</h3>\r\n\r\n<p>Voc&ecirc; pode usar o Telegram no PC de duas formas: atrav&eacute;s do site dedicado Telegram Web, ou pelos aplicativos para desktop, dispon&iacute;veis para Windows, macOS e Linux.</p>\r\n\r\n<p>Veja a seguir como usar cada um deles.</p>\r\n\r\n<p><strong>1. Como usar o Telegram Web</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Telegram Web / como usar o telegram no pc\" src=\"https://tecnoblog.net/wp-content/uploads/2019/06/telegram-web-700x478.jpg\" style=\"height:478px; width:700px\" /></p>\r\n\r\n<p>O Telegram Web &eacute; o modo mais simples de usar o mensageiro instant&acirc;neo no PC, pois n&atilde;o exige instala&ccedil;&atilde;o de nenhum tipo. Veja como &eacute; f&aacute;cil:</p>\r\n\r\n<ol>\r\n	<li>Acesse o site do Telegram Web;</li>\r\n	<li>Clique em &ldquo;Pa&iacute;s&rdquo; e escolha o pa&iacute;s;</li>\r\n	<li>Em &ldquo;C&oacute;digo&rdquo;, defina o c&oacute;digo do n&uacute;mero de seu telefone celular;</li>\r\n	<li>Em &ldquo;N&uacute;mero do telefone&rdquo;, digite o n&uacute;mero do telefone celular ligado &agrave; sua conta de usu&aacute;rio e clique em &ldquo;Pr&oacute;ximo&rdquo;;</li>\r\n	<li>Uma mensagem com um c&oacute;digo de cinco d&iacute;gitos ser&aacute; enviado ao seu celular;</li>\r\n	<li>Na tela seguinte, digite o c&oacute;digo que voc&ecirc; recebeu e o Telegram Web ser&aacute; aberto.</li>\r\n</ol>\r\n\r\n<p>Simples assim.</p>\r\n\r\n<p><strong>2. Como usar o Telegram para desktop</strong></p>\r\n\r\n<p>Os aplicativos para desktop s&atilde;o ferramentas mais est&aacute;veis e confi&aacute;veis, para quem n&atilde;o deseja depender de navegadores para usar o Telegram (ainda mais certos browsers comil&otilde;es). O Telegram Desktop est&aacute; dispon&iacute;vel para Windows, macOS e Linux.</p>\r\n\r\n<p>&Eacute; bem f&aacute;cil de instalar.</p>\r\n\r\n<p>No Windows:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Windows / Telegram Desktop / como usar o telegram no pc\" src=\"https://tecnoblog.net/wp-content/uploads/2019/06/telegram-desktop-windows-700x442.jpg\" style=\"height:442px; width:700px\" /></p>\r\n\r\n<ol>\r\n	<li><a href=\"https://telegram.org/dl/desktop/win\" rel=\"nofollow noopener noreferrer\">Baixe e instale</a>&nbsp;o instalador do Telegram Desktop;</li>\r\n	<li>Abra o Telegram Desktop;</li>\r\n	<li>A partir daqui, o m&eacute;todo de configura&ccedil;&atilde;o &eacute; o mesmo do Telegram Web (a partir do item 2).</li>\r\n</ol>\r\n\r\n<p>E pronto.</p>\r\n\r\n<p>No macOS:</p>\r\n\r\n<ol>\r\n	<li><a href=\"https://telegram.org/dl/desktop/mac\" rel=\"nofollow noopener noreferrer\">Baixe o&nbsp;</a><a href=\"https://telegram.org/dl/desktop/mac\" rel=\"nofollow noopener noreferrer\">arquivo</a>&nbsp;de instala&ccedil;&atilde;o do Telegram Desktop;</li>\r\n	<li>Abra o arquivo e arraste o &iacute;cone do Telegram para a pasta &ldquo;Aplicativos&rdquo;;</li>\r\n	<li>Abra o Telegram Desktop;</li>\r\n	<li>A partir daqui, o m&eacute;todo de configura&ccedil;&atilde;o &eacute; o mesmo do Telegram Web (a partir do item 2).</li>\r\n</ol>\r\n\r\n<p>Simples assim.</p>\r\n\r\n<p>Voc&ecirc; pode tamb&eacute;m instalar o Telegram Desktop para macOS&nbsp;<a href=\"https://itunes.apple.com/br/app/telegram/id747648890?mt=12\" rel=\"nofollow noopener noreferrer\">atrav&eacute;s da Mac App Store</a>.</p>\r\n\r\n<p>No Linux:</p>\r\n\r\n<ol>\r\n	<li>Abra o Terminal;</li>\r\n	<li>Digite o comando &ldquo;wget -O- https://telegram.org/dl/desktop/linux | sudo tar xJ -C /opt/&rdquo; (sem as aspas) e aperte &ldquo;Enter&rdquo;.<br />\r\n	Este comando vai instalar os reposit&oacute;rios oficiais do Telegram no Linux;</li>\r\n	<li>Digite o comando &ldquo;sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop&rdquo; (sem as aspas) e aperte &ldquo;Enter&rdquo;;</li>\r\n	<li>Para executar o Telegram pelo Terminal, digite &ldquo;telegram-desktop&rdquo; (sem as aspas) e aperte &ldquo;Enter&rdquo;.</li>\r\n	<li>A partir daqui, o m&eacute;todo de configura&ccedil;&atilde;o &eacute; o mesmo do Telegram Web (a partir do item 2).</li>\r\n</ol>\r\n\r\n<p>E pronto.</p>\r\n', 0),
(2, '002 - Instalação do VLC', 'Processo de instalação do VLC PLayer no Linux', '<h2>Instalando o VLC Player no Linux</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Para instalar o VLC Player no Linux, existem&nbsp; v&aacute;rios m&eacute;todos dispon&iacute;veis, entre eles, via Snap que serve para qualquer distro Linux. Se a sua distro n&atilde;o tem o snap habilitado, d&ecirc; uma olhadinha <a href=\"https://snapcraft.io/docs/installing-snapd\" rel=\"noreferrer noopener\" target=\"_blank\">aqui</a> e veja como habilitar. Depois de habilitado o snap, voc&ecirc; vai rodar o seguinte comando:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code>sudo snap install vlc</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ser&aacute; pedido a sua senha, &eacute; s&oacute; colocar e esperar o processo de instala&ccedil;&atilde;o ser conclu&iacute;do.&nbsp;</p>\r\n\r\n<p>Voc&ecirc; tamb&eacute;m pode instalar o VLC pela loja de aplicativos, basta procurar por &ldquo;vlc&rdquo; e escolher a op&ccedil;&atilde;o que for a via Snap.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"https://diolinux.com.br/wp-content/uploads/2020/07/2020-06-30_03-23-1024x584.png\" /></p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Depois &eacute; s&oacute; escolher qual vers&atilde;o ser&aacute; instalada e clicar em &ldquo;instalar&rdquo;. Ser&aacute; pedido a sua senha, &eacute; s&oacute; colocar e esperar o processo de instala&ccedil;&atilde;o ser conclu&iacute;do.&nbsp;</p>\r\n\r\n<p>Se voc&ecirc; estiver utilizando o Ubuntu ou alguma distro que se baseia nele, e preferir usar o pacote da distribui&ccedil;&atilde;o, basta utilizar o comando <strong>sudo apt install vlc</strong>. Mas, segundo o pessoal de desenvolvimento do VLC Player, voc&ecirc; vai ficar &ldquo;preso&rdquo; na vers&atilde;o empacotada pela distro.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `script_solution`
--

CREATE TABLE `script_solution` (
  `script_cod` int(4) NOT NULL,
  `script_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de scripts de solucoes';

--
-- Despejando dados para a tabela `script_solution`
--

INSERT INTO `script_solution` (`script_cod`, `script_desc`) VALUES
(1, 'Aplicado o patch 8294MT.'),
(2, 'Atualização de sistema.'),
(3, 'Reinstalação de sistema.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sistemas`
--

CREATE TABLE `sistemas` (
  `sis_id` int(11) NOT NULL,
  `sistema` varchar(100) DEFAULT NULL,
  `sis_status` int(4) NOT NULL DEFAULT '1',
  `sis_email` varchar(35) DEFAULT NULL,
  `sis_atende` int(1) NOT NULL DEFAULT '1',
  `sis_screen` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `sistemas`
--

INSERT INTO `sistemas` (`sis_id`, `sistema`, `sis_status`, `sis_email`, `sis_atende`, `sis_screen`) VALUES
(1, 'SUPORTE N1', 1, 'email@da.area.ou.alias', 1, 2),
(2, 'USUÁRIOS', 1, 'email@da.area.ou.alias', 0, 3),
(3, 'REDES E SERVIDORES', 1, 'email@da.area.ou.alias', 1, 2),
(4, 'MANUTENÇÃO DE HARDWARE', 1, 'email@da.area.ou.alias', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `situacao`
--

CREATE TABLE `situacao` (
  `situac_cod` int(4) NOT NULL,
  `situac_nome` varchar(20) NOT NULL DEFAULT '',
  `situac_desc` varchar(200) DEFAULT NULL,
  `situac_destaque` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de situação de computadores quanto ao seu funcionamento';

--
-- Despejando dados para a tabela `situacao`
--

INSERT INTO `situacao` (`situac_cod`, `situac_nome`, `situac_desc`, `situac_destaque`) VALUES
(1, 'Operacional', 'Equipamento sem problemas de funcionamento', 0),
(2, 'Não Operacional', 'Equipamento utilizado apenas para testes de hardware e não funcionando', 0),
(3, 'Em manutenção', 'Equipamento aguardando peça para manutenção', 0),
(4, 'Furtado', 'Equipamentos furtados da empresa.', 0),
(5, 'Trocado', 'Equipamento trocado por outro em função da sua garantia.', 0),
(6, 'Aguardando orçamento', 'Aguardando orçamento para conserto', 0),
(7, 'Sucateado', 'Equipamento não possui condições para conserto', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sla_out`
--

CREATE TABLE `sla_out` (
  `out_numero` int(5) NOT NULL COMMENT 'ocorrencias',
  `out_sla` int(1) NOT NULL DEFAULT '0' COMMENT 'se o sla estourou'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela temporaria para controle do sla';

--
-- Despejando dados para a tabela `sla_out`
--

INSERT INTO `sla_out` (`out_numero`, `out_sla`) VALUES
(4, 1),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sla_solucao`
--

CREATE TABLE `sla_solucao` (
  `slas_cod` int(4) NOT NULL,
  `slas_tempo` int(6) NOT NULL DEFAULT '0',
  `slas_desc` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de SLAs de tempo de solução';

--
-- Despejando dados para a tabela `sla_solucao`
--

INSERT INTO `sla_solucao` (`slas_cod`, `slas_tempo`, `slas_desc`) VALUES
(1, 15, '15 minutos'),
(2, 30, '30 minutos'),
(3, 45, '45 minutos'),
(4, 60, '1 hora'),
(5, 120, '2 horas'),
(6, 180, '3 horas'),
(7, 240, '4 horas'),
(8, 480, '8 horas'),
(9, 720, '12 horas'),
(10, 1440, '24 horas'),
(11, 2880, '2 dias'),
(12, 4320, '3 dias'),
(13, 5760, '4 dias'),
(14, 10080, '1 semana'),
(15, 20160, '2 semanas'),
(16, 30240, '3 semanas'),
(17, 43200, '1 mês'),
(18, 5, '5 minutos'),
(19, 10, '10 minutos'),
(20, 20, '20 minutos'),
(21, 25, '25 minutos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `softwares`
--

CREATE TABLE `softwares` (
  `soft_cod` int(4) NOT NULL,
  `soft_fab` int(4) NOT NULL DEFAULT '0',
  `soft_desc` varchar(30) NOT NULL DEFAULT '',
  `soft_versao` varchar(10) NOT NULL DEFAULT '',
  `soft_cat` int(4) NOT NULL DEFAULT '0',
  `soft_tipo_lic` int(4) NOT NULL DEFAULT '0',
  `soft_qtd_lic` int(4) DEFAULT NULL,
  `soft_forn` int(4) DEFAULT NULL,
  `soft_nf` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela Softwares do sistema';

--
-- Despejando dados para a tabela `softwares`
--

INSERT INTO `softwares` (`soft_cod`, `soft_fab`, `soft_desc`, `soft_versao`, `soft_cat`, `soft_tipo_lic`, `soft_qtd_lic`, `soft_forn`, `soft_nf`) VALUES
(1, 1, 'Default', '1.0', 10, 1, 1, 1, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `solucoes`
--

CREATE TABLE `solucoes` (
  `numero` int(11) NOT NULL DEFAULT '0',
  `problema` text NOT NULL,
  `solucao` text NOT NULL,
  `data` datetime DEFAULT NULL,
  `responsavel` int(4) NOT NULL DEFAULT '0',
  `responsavelbkp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `solucoes`
--

INSERT INTO `solucoes` (`numero`, `problema`, `solucao`, `data`, `responsavel`, `responsavelbkp`) VALUES
(1, 'Solicitação de instalação de Software : Telegram', 'Software instalado conforme solicitado.', '2020-07-06 17:27:16', 3, NULL),
(2, 'Solicitação de liberação de porta.', 'Porta liberada no servidor web.', '2020-07-06 17:43:07', 4, NULL),
(3, 'A impressora estava com papel trancado no rolamento;', 'Foi aberta a tampa principal do equipamento e realizada a retirada do papel. Testes ok.', '2020-07-06 17:40:47', 3, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `status`
--

CREATE TABLE `status` (
  `stat_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT '',
  `stat_cat` int(4) DEFAULT NULL,
  `stat_painel` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `status`
--

INSERT INTO `status` (`stat_id`, `status`, `stat_cat`, `stat_painel`) VALUES
(1, 'Aguardando atendimento', 2, 2),
(2, 'Em atendimento', 2, 1),
(3, 'Em estudo', 2, 1),
(4, 'Encerrada', 4, 3),
(7, 'Agendado com usuário', 1, 2),
(12, 'Cancelado', 4, 3),
(15, 'Todos', 4, 2),
(16, 'Aguardando feedback do usuário', 1, 2),
(19, 'IndisponÍvel para atendimento', 1, 2),
(21, 'Encaminhado para operador', 2, 1),
(22, 'Interrompido para atender outro chamado', 2, 1),
(25, 'Aguardando retorno do fornecedor', 3, 1),
(26, 'Com Backup', 4, 2),
(27, 'Reservado para Operador', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `status_categ`
--

CREATE TABLE `status_categ` (
  `stc_cod` int(4) NOT NULL,
  `stc_desc` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de Categorias de Status para Chamados';

--
-- Despejando dados para a tabela `status_categ`
--

INSERT INTO `status_categ` (`stc_cod`, `stc_desc`) VALUES
(1, 'AO USUÁRIO'),
(2, 'À ÀREA TÉCNICA'),
(3, 'À SERVIÇOS DE TERCEIROS'),
(4, 'INDEPENDENTE');

-- --------------------------------------------------------

--
-- Estrutura para tabela `styles`
--

CREATE TABLE `styles` (
  `tm_id` int(2) NOT NULL,
  `tm_color_destaca` varchar(15) NOT NULL DEFAULT '#CCCCCC',
  `tm_color_marca` varchar(15) NOT NULL DEFAULT '#FFFFCC',
  `tm_color_lin_par` varchar(15) NOT NULL DEFAULT '#E3E1E1',
  `tm_color_lin_impar` varchar(15) NOT NULL DEFAULT '#F6F6F6',
  `tm_color_body` varchar(15) NOT NULL DEFAULT '#F6F6F6',
  `tm_color_td` varchar(15) NOT NULL DEFAULT '#DBDBDB',
  `tm_borda_width` int(2) NOT NULL DEFAULT '2',
  `tm_borda_color` varchar(10) NOT NULL DEFAULT '#F6F6F6',
  `tm_tr_header` varchar(11) NOT NULL DEFAULT 'IMG_DEFAULT',
  `tm_color_topo` varchar(11) NOT NULL DEFAULT 'IMG_DEFAULT',
  `tm_color_topo_font` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `tm_color_barra` varchar(11) NOT NULL DEFAULT 'IMG_DEFAULT',
  `tm_color_menu` varchar(11) NOT NULL DEFAULT 'IMG_DEFAULT',
  `tm_color_barra_font` varchar(7) NOT NULL DEFAULT '#675E66',
  `tm_color_barra_hover` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `tm_barra_fundo_destaque` varchar(7) NOT NULL DEFAULT '#666666',
  `tm_barra_fonte_destaque` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `tm_color_font_tr_header` varchar(7) NOT NULL DEFAULT '#000000',
  `tm_color_borda_header_centro` varchar(7) NOT NULL DEFAULT '#999999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `styles`
--

INSERT INTO `styles` (`tm_id`, `tm_color_destaca`, `tm_color_marca`, `tm_color_lin_par`, `tm_color_lin_impar`, `tm_color_body`, `tm_color_td`, `tm_borda_width`, `tm_borda_color`, `tm_tr_header`, `tm_color_topo`, `tm_color_topo_font`, `tm_color_barra`, `tm_color_menu`, `tm_color_barra_font`, `tm_color_barra_hover`, `tm_barra_fundo_destaque`, `tm_barra_fonte_destaque`, `tm_color_font_tr_header`, `tm_color_borda_header_centro`) VALUES
(1, '#CCCCCC', '#FFFFCC', '#E3E1E1', '#F6F6F6', '#F6F6F6', '#DBDBDB', 2, '#F6F6F6', 'IMG_DEFAULT', 'IMG_DEFAULT', '#FFFFFF', 'IMG_DEFAULT', 'IMG_DEFAULT', '#675E66', '#FFFFFF', '#666666', '#FFFFFF', '#000000', '#999999');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sw_padrao`
--

CREATE TABLE `sw_padrao` (
  `swp_cod` int(4) NOT NULL,
  `swp_sw_cod` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de softwares padrao para cada equipamento';

-- --------------------------------------------------------

--
-- Estrutura para tabela `temas`
--

CREATE TABLE `temas` (
  `tm_id` int(2) NOT NULL,
  `tm_nome` varchar(15) NOT NULL DEFAULT 'DEFAULT',
  `tm_color_destaca` varchar(10) NOT NULL DEFAULT '#CCCCCC',
  `tm_color_marca` varchar(10) NOT NULL DEFAULT '#FFFFCC',
  `tm_color_lin_par` varchar(10) NOT NULL DEFAULT '#E3E1E1',
  `tm_color_lin_impar` varchar(10) NOT NULL DEFAULT '#F6F6F6',
  `tm_color_body` varchar(10) NOT NULL DEFAULT '#F6F6F6',
  `tm_color_td` varchar(10) NOT NULL DEFAULT '#DBDBDB',
  `tm_borda_width` int(2) NOT NULL DEFAULT '2',
  `tm_borda_color` varchar(10) NOT NULL DEFAULT '#F6F6F6',
  `tm_tr_header` varchar(11) NOT NULL DEFAULT 'IMG_DEFAULT',
  `tm_color_topo` varchar(11) NOT NULL DEFAULT 'IMG_DEFAULT',
  `tm_color_topo_font` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `tm_color_barra` varchar(11) NOT NULL DEFAULT 'IMG_DEFAULT',
  `tm_color_menu` varchar(11) NOT NULL DEFAULT 'IMG_DEFAULT',
  `tm_color_barra_font` varchar(7) NOT NULL DEFAULT '#675E66',
  `tm_color_barra_hover` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `tm_barra_fundo_destaque` varchar(7) NOT NULL DEFAULT '#666666',
  `tm_barra_fonte_destaque` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `tm_color_font_tr_header` varchar(7) NOT NULL DEFAULT '#000000',
  `tm_color_borda_header_centro` varchar(7) NOT NULL DEFAULT '#999999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `temas`
--

INSERT INTO `temas` (`tm_id`, `tm_nome`, `tm_color_destaca`, `tm_color_marca`, `tm_color_lin_par`, `tm_color_lin_impar`, `tm_color_body`, `tm_color_td`, `tm_borda_width`, `tm_borda_color`, `tm_tr_header`, `tm_color_topo`, `tm_color_topo_font`, `tm_color_barra`, `tm_color_menu`, `tm_color_barra_font`, `tm_color_barra_hover`, `tm_barra_fundo_destaque`, `tm_barra_fonte_destaque`, `tm_color_font_tr_header`, `tm_color_borda_header_centro`) VALUES
(1, 'GREEN', '#D0DBCE', '#D0DBCE', '#FFFFFF', '#FFFFFF', '#EEEFE9', '#D0DBCE', 1, '#427041', '#427041', '#3B6B39', '#FFFFFF', '#E3E3E3', '#EEEFE9', '#000000', '#FFFFFF', '#427041', '#FFFFFF', '#FFFFFF', '#427041'),
(2, 'OLD_TIMES', '#99CCFF', '#99CCFF', '#CDE5FF', '#FFFFFF', '#CDE5FF', '#92AECC', 0, '#FFFFFF', '#92AECC', '#92AECC', '#FFFFFF', '#CDE5FF', '#CDE5FF', '#0000EE', '#8F6C7F', '#CDE5FF', '#8F6C7F', '#000000', '#92AECC'),
(3, 'GMAIL', '#FFFFCC', '#E8EEF7', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#E0ECFF', 1, '#BBBBBB', '#C3D9FF', '#DFECF5', '#0000CC', '#C3D9FF', '#FFFFFF', '#0000CC', '#000000', '#FFFFFF', '#000000', '#000000', '#C3D9FF'),
(4, 'CLASSICO', '#D5D5D5', '#FFCC99', '#EAE6D0', '#F8F8F1', '#F6F6F6', '#ECECDB', 0, '#F6F6F6', '#DDDCC5', '#5e515b', '#FFFFFF', '#999999', 'IMG_DEFAULT', '#FFFFFF', '#FFFFFF', '#666666', '#FFFFFF', '#000000', '#DDDCC5'),
(5, 'DEFAULT', '#CCCCCC', '#FFFFCC', '#E3E1E1', '#F6F6F6', '#F6F6F6', '#DBDBDB', 2, '#F6F6F6', 'IMG_DEFAULT', 'IMG_DEFAULT', '#FFFFFF', 'IMG_DEFAULT', 'IMG_DEFAULT', '#675E66', '#FFFFFF', '#666666', '#FFFFFF', '#000000', '#999999'),
(6, 'black_edition', '#CCCCCC', '#FFFFCC', '#E3E1E1', '#F6F6F6', '#FFFFFF', '#999999', 2, '#FFFFFF', '#999999', '#000000', '#FFFFFF', '#000000', 'IMG_DEFAULT', '#FFFFFF', '#000000', '#FFFFFF', '#000000', '#000000', '#FF0000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tempo_garantia`
--

CREATE TABLE `tempo_garantia` (
  `tempo_cod` int(4) NOT NULL,
  `tempo_meses` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de tempos de duração das garantias';

--
-- Despejando dados para a tabela `tempo_garantia`
--

INSERT INTO `tempo_garantia` (`tempo_cod`, `tempo_meses`) VALUES
(4, 6),
(1, 12),
(5, 18),
(2, 24),
(3, 36);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tempo_status`
--

CREATE TABLE `tempo_status` (
  `ts_cod` int(6) NOT NULL,
  `ts_ocorrencia` int(5) NOT NULL DEFAULT '0',
  `ts_status` int(4) NOT NULL DEFAULT '0',
  `ts_tempo` int(10) NOT NULL DEFAULT '0',
  `ts_data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela para armazenar o tempo dos chamados em cada status';

--
-- Despejando dados para a tabela `tempo_status`
--

INSERT INTO `tempo_status` (`ts_cod`, `ts_ocorrencia`, `ts_status`, `ts_tempo`, `ts_data`) VALUES
(1, 1, 1, 40, '2020-07-06 17:25:16'),
(2, 1, 2, 120, '2020-07-06 17:27:16'),
(3, 2, 1, 763, '2020-07-06 17:42:31'),
(4, 3, 1, 48, '2020-07-06 17:38:29'),
(5, 3, 2, 138, '2020-07-06 17:40:47'),
(6, 2, 2, 36, '2020-07-06 17:43:07'),
(7, 4, 1, 10057, '2020-07-06 20:34:48'),
(8, 4, 2, 0, '2020-07-06 20:34:48'),
(9, 5, 1, 0, '2020-07-06 20:36:12'),
(10, 6, 1, 0, '2020-07-06 20:42:40'),
(11, 7, 1, 0, '2020-07-08 14:23:39'),
(12, 8, 1, 0, '2020-07-08 14:40:57'),
(13, 9, 1, 0, '2020-07-08 14:45:40'),
(14, 10, 1, 29, '2020-07-08 14:48:41'),
(15, 10, 2, 0, '2020-07-08 14:48:41');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_equip`
--

CREATE TABLE `tipo_equip` (
  `tipo_cod` int(11) NOT NULL,
  `tipo_nome` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de Tipos de Equipamentos de informática';

--
-- Despejando dados para a tabela `tipo_equip`
--

INSERT INTO `tipo_equip` (`tipo_cod`, `tipo_nome`) VALUES
(1, 'Computador PC'),
(2, 'Notebook'),
(3, 'Impressora'),
(4, 'Scanner'),
(5, 'Monitor'),
(6, 'Zip Drive'),
(7, 'Switch'),
(8, 'HUB'),
(9, 'Gravador externo de CD'),
(10, 'Placa externa de captura'),
(11, 'No Break'),
(12, 'Servidor SCSI'),
(13, 'Smartphone');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_garantia`
--

CREATE TABLE `tipo_garantia` (
  `tipo_garant_cod` int(4) NOT NULL,
  `tipo_garant_nome` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de tipos de garantias de equipamentos';

--
-- Despejando dados para a tabela `tipo_garantia`
--

INSERT INTO `tipo_garantia` (`tipo_garant_cod`, `tipo_garant_nome`) VALUES
(1, 'Balcão'),
(2, 'On site');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_imp`
--

CREATE TABLE `tipo_imp` (
  `tipo_imp_cod` int(11) NOT NULL,
  `tipo_imp_nome` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de tipos de impressoras';

--
-- Despejando dados para a tabela `tipo_imp`
--

INSERT INTO `tipo_imp` (`tipo_imp_cod`, `tipo_imp_nome`) VALUES
(1, 'Matricial'),
(2, 'Jato de tinta'),
(3, 'Laser'),
(4, 'Multifuncional'),
(5, 'Copiadora'),
(6, 'Matricial cupom não fiscal');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_item`
--

CREATE TABLE `tipo_item` (
  `tipo_it_cod` int(4) NOT NULL,
  `tipo_it_desc` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipos de itens - hw ou sw';

--
-- Despejando dados para a tabela `tipo_item`
--

INSERT INTO `tipo_item` (`tipo_it_cod`, `tipo_it_desc`) VALUES
(1, 'HARDWARE'),
(2, 'SOFTWARE'),
(3, 'HARDWARE E SOFTWARE');

-- --------------------------------------------------------

--
-- Estrutura para tabela `uprefs`
--

CREATE TABLE `uprefs` (
  `upref_uid` int(4) NOT NULL,
  `upref_lang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de preferencias diversas dos usuarios';

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `user_id` int(4) NOT NULL,
  `login` varchar(100) NOT NULL DEFAULT '',
  `nome` varchar(200) NOT NULL DEFAULT '',
  `password` varchar(200) NOT NULL DEFAULT '',
  `data_inc` date DEFAULT NULL,
  `data_admis` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nivel` char(2) DEFAULT NULL,
  `AREA` char(3) DEFAULT 'ALL',
  `user_admin` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de operadores do sistema';

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`user_id`, `login`, `nome`, `password`, `data_inc`, `data_admis`, `email`, `fone`, `nivel`, `AREA`, `user_admin`) VALUES
(1, 'admin', 'Administrador do Sistema', '21232f297a57a5a743894a0e4a801fc3', '2020-07-03', '2020-07-03', 'admin@yourdomain.com', '123456', '1', '1', 0),
(2, 'abertura', 'Abertura - Senha - Abertura', 'fd5abf2b83170bb12e23189272b66cc6', '2020-07-04', '2020-07-04', 'email@do.usuario.com', '9999999', '3', '2', 0),
(3, 'operador', 'Operador Nível 1 - Senha operador', '06d4f07c943a4da1c8bfe591abbc3579', '2020-07-04', '2020-07-04', 'email@do.operador.com', '9999999', '2', '1', 0),
(4, 'operador2', 'Operador Nível 2 - Senha operador', '06d4f07c943a4da1c8bfe591abbc3579', '2020-07-04', '2020-07-04', 'email@do.operador.com', '9999999', '2', '3', 1),
(5, 'abertura2', 'Abertura - Senha - abertura', 'fd5abf2b83170bb12e23189272b66cc6', '2020-07-06', '2020-07-06', 'email@do.usuario.com', '5388937758', '3', '2', 0),
(6, 'abertura3', 'Abertura 3 - Senha abertura', 'fd5abf2b83170bb12e23189272b66cc6', '2020-07-06', '2020-07-06', 'email@do.usuario.com', '5388937754', '3', '2', 0),
(7, 'manutencao.hw', 'Manutenção HW - senha manutencao', '33701996cdff62bb8efae4ca844b7e13', '2020-07-06', '2020-07-06', 'email@da.area.ou.alias', '938493484', '2', '4', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios_areas`
--

CREATE TABLE `usuarios_areas` (
  `uarea_cod` int(4) NOT NULL,
  `uarea_uid` int(4) NOT NULL DEFAULT '0',
  `uarea_sid` varchar(4) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de areas que o usuario pertence';

--
-- Despejando dados para a tabela `usuarios_areas`
--

INSERT INTO `usuarios_areas` (`uarea_cod`, `uarea_uid`, `uarea_sid`) VALUES
(6, 1, '1'),
(5, 1, '3'),
(4, 1, '4'),
(2, 3, '4'),
(3, 4, '4');

-- --------------------------------------------------------

--
-- Estrutura para tabela `uthemes`
--

CREATE TABLE `uthemes` (
  `uth_id` int(4) NOT NULL,
  `uth_uid` int(4) NOT NULL,
  `uth_thid` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de Temas por usuario';

-- --------------------------------------------------------

--
-- Estrutura para tabela `utmp_usuarios`
--

CREATE TABLE `utmp_usuarios` (
  `utmp_cod` int(4) NOT NULL,
  `utmp_login` varchar(100) NOT NULL,
  `utmp_nome` varchar(40) NOT NULL DEFAULT '',
  `utmp_email` varchar(40) NOT NULL DEFAULT '',
  `utmp_passwd` varchar(40) NOT NULL DEFAULT '',
  `utmp_rand` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de transição para cadastro de usuários';

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `areaxarea_abrechamado`
--
ALTER TABLE `areaxarea_abrechamado`
  ADD PRIMARY KEY (`area`,`area_abrechamado`),
  ADD KEY `fk_area_abrechamado` (`area_abrechamado`);

--
-- Índices de tabela `assentamentos`
--
ALTER TABLE `assentamentos`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `ocorrencia` (`ocorrencia`),
  ADD KEY `tipo_assentamento` (`tipo_assentamento`);

--
-- Índices de tabela `assistencia`
--
ALTER TABLE `assistencia`
  ADD PRIMARY KEY (`assist_cod`);

--
-- Índices de tabela `avisos`
--
ALTER TABLE `avisos`
  ADD PRIMARY KEY (`aviso_id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cat_cod`);

--
-- Índices de tabela `categoriaxproblema_sistemas`
--
ALTER TABLE `categoriaxproblema_sistemas`
  ADD PRIMARY KEY (`prob_id`),
  ADD KEY `ctps_id` (`ctps_id`,`prob_id`);

--
-- Índices de tabela `cat_problema_sistemas`
--
ALTER TABLE `cat_problema_sistemas`
  ADD PRIMARY KEY (`ctps_id`);

--
-- Índices de tabela `ccusto`
--
ALTER TABLE `ccusto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codccusto` (`codccusto`);

--
-- Índices de tabela `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`conf_cod`),
  ADD KEY `conf_formatBar` (`conf_formatBar`),
  ADD KEY `conf_prob_tipo_1` (`conf_prob_tipo_1`,`conf_prob_tipo_2`,`conf_prob_tipo_3`);

--
-- Índices de tabela `configusercall`
--
ALTER TABLE `configusercall`
  ADD PRIMARY KEY (`conf_cod`),
  ADD KEY `conf_opentoarea` (`conf_opentoarea`),
  ADD KEY `conf_nivel` (`conf_custom_areas`),
  ADD KEY `conf_ownarea` (`conf_ownarea`);

--
-- Índices de tabela `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`contact_id`),
  ADD UNIQUE KEY `contact_login` (`contact_login`,`contact_email`);

--
-- Índices de tabela `doc_time`
--
ALTER TABLE `doc_time`
  ADD PRIMARY KEY (`doc_id`),
  ADD KEY `doc_user` (`doc_user`),
  ADD KEY `doc_oco` (`doc_oco`);

--
-- Índices de tabela `dominios`
--
ALTER TABLE `dominios`
  ADD PRIMARY KEY (`dom_cod`);

--
-- Índices de tabela `email_warranty`
--
ALTER TABLE `email_warranty`
  ADD PRIMARY KEY (`ew_id`),
  ADD KEY `ew_piece_id` (`ew_piece_id`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`empr_id`);

--
-- Índices de tabela `equipamentos`
--
ALTER TABLE `equipamentos`
  ADD PRIMARY KEY (`comp_inv`,`comp_inst`),
  ADD KEY `comp_cod` (`comp_cod`),
  ADD KEY `comp_inv` (`comp_inv`),
  ADD KEY `comp_assist` (`comp_assist`);

--
-- Índices de tabela `equipxpieces`
--
ALTER TABLE `equipxpieces`
  ADD PRIMARY KEY (`eqp_id`),
  ADD KEY `eqp_equip_inv` (`eqp_equip_inv`,`eqp_equip_inst`,`eqp_piece_id`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`estoq_cod`),
  ADD KEY `estoq_tipo` (`estoq_tipo`,`estoq_desc`),
  ADD KEY `estoq_local` (`estoq_local`),
  ADD KEY `estoq_tag_inv` (`estoq_tag_inv`,`estoq_tag_inst`),
  ADD KEY `estoq_partnumber` (`estoq_partnumber`);

--
-- Índices de tabela `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`fab_cod`),
  ADD KEY `fab_cod` (`fab_cod`),
  ADD KEY `fab_tipo` (`fab_tipo`);

--
-- Índices de tabela `feriados`
--
ALTER TABLE `feriados`
  ADD PRIMARY KEY (`cod_feriado`),
  ADD KEY `data_feriado` (`data_feriado`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`forn_cod`),
  ADD KEY `forn_cod` (`forn_cod`);

--
-- Índices de tabela `global_tickets`
--
ALTER TABLE `global_tickets`
  ADD PRIMARY KEY (`gt_ticket`),
  ADD KEY `gt_id` (`gt_id`);

--
-- Índices de tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`hist_cod`),
  ADD KEY `hist_inv` (`hist_inv`),
  ADD KEY `hist_inst` (`hist_inst`);

--
-- Índices de tabela `hist_pieces`
--
ALTER TABLE `hist_pieces`
  ADD PRIMARY KEY (`hp_id`),
  ADD KEY `hp_piece_id` (`hp_piece_id`,`hp_piece_local`,`hp_comp_inv`,`hp_comp_inst`),
  ADD KEY `hp_technician` (`hp_technician`);

--
-- Índices de tabela `hw_alter`
--
ALTER TABLE `hw_alter`
  ADD PRIMARY KEY (`hwa_cod`),
  ADD KEY `hwa_inst` (`hwa_inst`,`hwa_inv`,`hwa_item`,`hwa_user`);

--
-- Índices de tabela `hw_sw`
--
ALTER TABLE `hw_sw`
  ADD PRIMARY KEY (`hws_cod`),
  ADD KEY `hws_sw_cod` (`hws_sw_cod`,`hws_hw_cod`),
  ADD KEY `hws_hw_inst` (`hws_hw_inst`);

--
-- Índices de tabela `imagens`
--
ALTER TABLE `imagens`
  ADD PRIMARY KEY (`img_cod`),
  ADD KEY `img_oco` (`img_oco`),
  ADD KEY `img_inv` (`img_inv`,`img_model`),
  ADD KEY `img_inst` (`img_inst`);

--
-- Índices de tabela `instituicao`
--
ALTER TABLE `instituicao`
  ADD PRIMARY KEY (`inst_cod`),
  ADD KEY `inst_cod` (`inst_cod`),
  ADD KEY `inst_status` (`inst_status`);

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`item_cod`),
  ADD KEY `item_nome` (`item_nome`);

--
-- Índices de tabela `licencas`
--
ALTER TABLE `licencas`
  ADD PRIMARY KEY (`lic_cod`);

--
-- Índices de tabela `localizacao`
--
ALTER TABLE `localizacao`
  ADD UNIQUE KEY `loc_id` (`loc_id`),
  ADD KEY `loc_sla` (`loc_prior`),
  ADD KEY `loc_dominio` (`loc_dominio`),
  ADD KEY `loc_predio` (`loc_predio`),
  ADD KEY `loc_status` (`loc_status`),
  ADD KEY `loc_prior` (`loc_prior`);

--
-- Índices de tabela `lock_oco`
--
ALTER TABLE `lock_oco`
  ADD PRIMARY KEY (`lck_id`),
  ADD UNIQUE KEY `lck_oco` (`lck_oco`),
  ADD KEY `lck_uid` (`lck_uid`);

--
-- Índices de tabela `mailconfig`
--
ALTER TABLE `mailconfig`
  ADD PRIMARY KEY (`mail_cod`);

--
-- Índices de tabela `mail_hist`
--
ALTER TABLE `mail_hist`
  ADD PRIMARY KEY (`mhist_cod`),
  ADD KEY `mhist_technician` (`mhist_technician`),
  ADD KEY `mhist_oco` (`mhist_oco`);

--
-- Índices de tabela `mail_list`
--
ALTER TABLE `mail_list`
  ADD PRIMARY KEY (`ml_cod`);

--
-- Índices de tabela `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`tpl_cod`);

--
-- Índices de tabela `marcas_comp`
--
ALTER TABLE `marcas_comp`
  ADD PRIMARY KEY (`marc_cod`),
  ADD KEY `marc_cod` (`marc_cod`),
  ADD KEY `marc_tipo` (`marc_tipo`);

--
-- Índices de tabela `materiais`
--
ALTER TABLE `materiais`
  ADD PRIMARY KEY (`mat_cod`),
  ADD KEY `mat_cod_2` (`mat_cod`),
  ADD KEY `mat_modelo_equip` (`mat_modelo_equip`);

--
-- Índices de tabela `modelos_itens`
--
ALTER TABLE `modelos_itens`
  ADD PRIMARY KEY (`mdit_cod`),
  ADD KEY `mdit_desc` (`mdit_desc`),
  ADD KEY `mdit_tipo` (`mdit_tipo`),
  ADD KEY `cod_old` (`mdit_cod_old`);

--
-- Índices de tabela `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`modu_cod`),
  ADD KEY `modu_nome` (`modu_nome`);

--
-- Índices de tabela `moldes`
--
ALTER TABLE `moldes`
  ADD PRIMARY KEY (`mold_marca`),
  ADD KEY `mold_cod` (`mold_cod`);

--
-- Índices de tabela `msgconfig`
--
ALTER TABLE `msgconfig`
  ADD PRIMARY KEY (`msg_cod`),
  ADD UNIQUE KEY `msg_event` (`msg_event`);

--
-- Índices de tabela `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`nivel_cod`);

--
-- Índices de tabela `ocodeps`
--
ALTER TABLE `ocodeps`
  ADD KEY `dep_filho` (`dep_filho`),
  ADD KEY `dep_pai` (`dep_pai`);

--
-- Índices de tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `data_abertura` (`data_abertura`),
  ADD KEY `data_fechamento` (`data_fechamento`),
  ADD KEY `local` (`local`),
  ADD KEY `aberto_por` (`aberto_por`),
  ADD KEY `oco_scheduled` (`oco_scheduled`),
  ADD KEY `oco_script_sol` (`oco_script_sol`),
  ADD KEY `oco_prior` (`oco_prior`);

--
-- Índices de tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD PRIMARY KEY (`perm_cod`),
  ADD KEY `perm_area` (`perm_area`,`perm_modulo`,`perm_flag`);

--
-- Índices de tabela `polegada`
--
ALTER TABLE `polegada`
  ADD PRIMARY KEY (`pole_cod`),
  ADD KEY `pole_cod` (`pole_cod`);

--
-- Índices de tabela `predios`
--
ALTER TABLE `predios`
  ADD PRIMARY KEY (`pred_cod`);

--
-- Índices de tabela `prioridades`
--
ALTER TABLE `prioridades`
  ADD PRIMARY KEY (`prior_cod`),
  ADD KEY `prior_nivel` (`prior_nivel`,`prior_sla`),
  ADD KEY `prior_sla` (`prior_sla`);

--
-- Índices de tabela `prior_atend`
--
ALTER TABLE `prior_atend`
  ADD PRIMARY KEY (`pr_cod`),
  ADD UNIQUE KEY `pr_nivel` (`pr_nivel`);

--
-- Índices de tabela `prior_nivel`
--
ALTER TABLE `prior_nivel`
  ADD PRIMARY KEY (`prn_cod`),
  ADD KEY `prn_level` (`prn_level`);

--
-- Índices de tabela `problemas`
--
ALTER TABLE `problemas`
  ADD PRIMARY KEY (`prob_id`),
  ADD KEY `prob_id` (`prob_id`),
  ADD KEY `prob_area` (`prob_area`),
  ADD KEY `prob_sla` (`prob_sla`),
  ADD KEY `prob_tipo_1` (`prob_tipo_1`,`prob_tipo_2`),
  ADD KEY `prob_tipo_3` (`prob_tipo_3`);

--
-- Índices de tabela `prob_tipo_1`
--
ALTER TABLE `prob_tipo_1`
  ADD PRIMARY KEY (`probt1_cod`);

--
-- Índices de tabela `prob_tipo_2`
--
ALTER TABLE `prob_tipo_2`
  ADD PRIMARY KEY (`probt2_cod`);

--
-- Índices de tabela `prob_tipo_3`
--
ALTER TABLE `prob_tipo_3`
  ADD PRIMARY KEY (`probt3_cod`);

--
-- Índices de tabela `prob_x_script`
--
ALTER TABLE `prob_x_script`
  ADD PRIMARY KEY (`prscpt_id`),
  ADD KEY `prscpt_prob_id` (`prscpt_prob_id`,`prscpt_scpt_id`);

--
-- Índices de tabela `reitorias`
--
ALTER TABLE `reitorias`
  ADD PRIMARY KEY (`reit_cod`),
  ADD KEY `reit_nome` (`reit_nome`);

--
-- Índices de tabela `resolucao`
--
ALTER TABLE `resolucao`
  ADD PRIMARY KEY (`resol_cod`),
  ADD KEY `resol_cod` (`resol_cod`);

--
-- Índices de tabela `scripts`
--
ALTER TABLE `scripts`
  ADD PRIMARY KEY (`scpt_id`);

--
-- Índices de tabela `script_solution`
--
ALTER TABLE `script_solution`
  ADD PRIMARY KEY (`script_cod`);

--
-- Índices de tabela `sistemas`
--
ALTER TABLE `sistemas`
  ADD PRIMARY KEY (`sis_id`),
  ADD KEY `sis_status` (`sis_status`),
  ADD KEY `sis_screen` (`sis_screen`);

--
-- Índices de tabela `situacao`
--
ALTER TABLE `situacao`
  ADD PRIMARY KEY (`situac_cod`);

--
-- Índices de tabela `sla_out`
--
ALTER TABLE `sla_out`
  ADD KEY `out_numero` (`out_numero`);

--
-- Índices de tabela `sla_solucao`
--
ALTER TABLE `sla_solucao`
  ADD PRIMARY KEY (`slas_cod`),
  ADD KEY `slas_tempo` (`slas_tempo`),
  ADD KEY `slas_tempo_2` (`slas_tempo`);

--
-- Índices de tabela `softwares`
--
ALTER TABLE `softwares`
  ADD PRIMARY KEY (`soft_cod`),
  ADD KEY `soft_fab` (`soft_fab`,`soft_cat`,`soft_tipo_lic`),
  ADD KEY `soft_versao` (`soft_versao`),
  ADD KEY `soft_nf` (`soft_nf`),
  ADD KEY `soft_forn` (`soft_forn`);

--
-- Índices de tabela `solucoes`
--
ALTER TABLE `solucoes`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `numero` (`numero`);

--
-- Índices de tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `stat_cat` (`stat_cat`),
  ADD KEY `stat_painel` (`stat_painel`);

--
-- Índices de tabela `status_categ`
--
ALTER TABLE `status_categ`
  ADD PRIMARY KEY (`stc_cod`);

--
-- Índices de tabela `styles`
--
ALTER TABLE `styles`
  ADD PRIMARY KEY (`tm_id`);

--
-- Índices de tabela `sw_padrao`
--
ALTER TABLE `sw_padrao`
  ADD PRIMARY KEY (`swp_cod`),
  ADD KEY `swp_sw_cod` (`swp_sw_cod`);

--
-- Índices de tabela `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`tm_id`);

--
-- Índices de tabela `tempo_garantia`
--
ALTER TABLE `tempo_garantia`
  ADD PRIMARY KEY (`tempo_cod`),
  ADD KEY `tempo_meses` (`tempo_meses`);

--
-- Índices de tabela `tempo_status`
--
ALTER TABLE `tempo_status`
  ADD PRIMARY KEY (`ts_cod`),
  ADD KEY `ts_ocorrencia` (`ts_ocorrencia`,`ts_status`);

--
-- Índices de tabela `tipo_equip`
--
ALTER TABLE `tipo_equip`
  ADD PRIMARY KEY (`tipo_cod`),
  ADD KEY `tipo_cod` (`tipo_cod`);

--
-- Índices de tabela `tipo_garantia`
--
ALTER TABLE `tipo_garantia`
  ADD PRIMARY KEY (`tipo_garant_cod`);

--
-- Índices de tabela `tipo_imp`
--
ALTER TABLE `tipo_imp`
  ADD PRIMARY KEY (`tipo_imp_cod`),
  ADD KEY `tipo_imp_cod` (`tipo_imp_cod`);

--
-- Índices de tabela `tipo_item`
--
ALTER TABLE `tipo_item`
  ADD PRIMARY KEY (`tipo_it_cod`);

--
-- Índices de tabela `uprefs`
--
ALTER TABLE `uprefs`
  ADD PRIMARY KEY (`upref_uid`),
  ADD KEY `upref_lang` (`upref_lang`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `login` (`login`);

--
-- Índices de tabela `usuarios_areas`
--
ALTER TABLE `usuarios_areas`
  ADD PRIMARY KEY (`uarea_cod`),
  ADD KEY `uarea_uid` (`uarea_uid`,`uarea_sid`);

--
-- Índices de tabela `uthemes`
--
ALTER TABLE `uthemes`
  ADD PRIMARY KEY (`uth_id`),
  ADD KEY `uth_uid` (`uth_uid`,`uth_thid`);

--
-- Índices de tabela `utmp_usuarios`
--
ALTER TABLE `utmp_usuarios`
  ADD PRIMARY KEY (`utmp_cod`),
  ADD UNIQUE KEY `utmp_login` (`utmp_login`,`utmp_email`),
  ADD KEY `utmp_rand` (`utmp_rand`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `assentamentos`
--
ALTER TABLE `assentamentos`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `assistencia`
--
ALTER TABLE `assistencia`
  MODIFY `assist_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `avisos`
--
ALTER TABLE `avisos`
  MODIFY `aviso_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `cat_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `ccusto`
--
ALTER TABLE `ccusto`
  MODIFY `codigo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `config`
--
ALTER TABLE `config`
  MODIFY `conf_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `configusercall`
--
ALTER TABLE `configusercall`
  MODIFY `conf_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `contatos`
--
ALTER TABLE `contatos`
  MODIFY `contact_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `doc_time`
--
ALTER TABLE `doc_time`
  MODIFY `doc_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `dominios`
--
ALTER TABLE `dominios`
  MODIFY `dom_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `email_warranty`
--
ALTER TABLE `email_warranty`
  MODIFY `ew_id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `empr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipamentos`
--
ALTER TABLE `equipamentos`
  MODIFY `comp_cod` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `equipxpieces`
--
ALTER TABLE `equipxpieces`
  MODIFY `eqp_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `estoq_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `fabricantes`
--
ALTER TABLE `fabricantes`
  MODIFY `fab_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `feriados`
--
ALTER TABLE `feriados`
  MODIFY `cod_feriado` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `forn_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `hist_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `hist_pieces`
--
ALTER TABLE `hist_pieces`
  MODIFY `hp_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `hw_alter`
--
ALTER TABLE `hw_alter`
  MODIFY `hwa_cod` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `hw_sw`
--
ALTER TABLE `hw_sw`
  MODIFY `hws_cod` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imagens`
--
ALTER TABLE `imagens`
  MODIFY `img_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `instituicao`
--
ALTER TABLE `instituicao`
  MODIFY `inst_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `item_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `licencas`
--
ALTER TABLE `licencas`
  MODIFY `lic_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `localizacao`
--
ALTER TABLE `localizacao`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `lock_oco`
--
ALTER TABLE `lock_oco`
  MODIFY `lck_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mailconfig`
--
ALTER TABLE `mailconfig`
  MODIFY `mail_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `mail_hist`
--
ALTER TABLE `mail_hist`
  MODIFY `mhist_cod` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mail_list`
--
ALTER TABLE `mail_list`
  MODIFY `ml_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `tpl_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `marcas_comp`
--
ALTER TABLE `marcas_comp`
  MODIFY `marc_cod` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `materiais`
--
ALTER TABLE `materiais`
  MODIFY `mat_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `modelos_itens`
--
ALTER TABLE `modelos_itens`
  MODIFY `mdit_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `modulos`
--
ALTER TABLE `modulos`
  MODIFY `modu_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `moldes`
--
ALTER TABLE `moldes`
  MODIFY `mold_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `msgconfig`
--
ALTER TABLE `msgconfig`
  MODIFY `msg_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `nivel`
--
ALTER TABLE `nivel`
  MODIFY `nivel_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `permissoes`
--
ALTER TABLE `permissoes`
  MODIFY `perm_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `polegada`
--
ALTER TABLE `polegada`
  MODIFY `pole_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `predios`
--
ALTER TABLE `predios`
  MODIFY `pred_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `prioridades`
--
ALTER TABLE `prioridades`
  MODIFY `prior_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `prior_atend`
--
ALTER TABLE `prior_atend`
  MODIFY `pr_cod` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `prior_nivel`
--
ALTER TABLE `prior_nivel`
  MODIFY `prn_cod` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `problemas`
--
ALTER TABLE `problemas`
  MODIFY `prob_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `prob_tipo_1`
--
ALTER TABLE `prob_tipo_1`
  MODIFY `probt1_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `prob_tipo_2`
--
ALTER TABLE `prob_tipo_2`
  MODIFY `probt2_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `prob_tipo_3`
--
ALTER TABLE `prob_tipo_3`
  MODIFY `probt3_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `prob_x_script`
--
ALTER TABLE `prob_x_script`
  MODIFY `prscpt_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `reitorias`
--
ALTER TABLE `reitorias`
  MODIFY `reit_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `resolucao`
--
ALTER TABLE `resolucao`
  MODIFY `resol_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `scripts`
--
ALTER TABLE `scripts`
  MODIFY `scpt_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `script_solution`
--
ALTER TABLE `script_solution`
  MODIFY `script_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sistemas`
--
ALTER TABLE `sistemas`
  MODIFY `sis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `situacao`
--
ALTER TABLE `situacao`
  MODIFY `situac_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `sla_solucao`
--
ALTER TABLE `sla_solucao`
  MODIFY `slas_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `softwares`
--
ALTER TABLE `softwares`
  MODIFY `soft_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `status_categ`
--
ALTER TABLE `status_categ`
  MODIFY `stc_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `styles`
--
ALTER TABLE `styles`
  MODIFY `tm_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sw_padrao`
--
ALTER TABLE `sw_padrao`
  MODIFY `swp_cod` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `temas`
--
ALTER TABLE `temas`
  MODIFY `tm_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tempo_garantia`
--
ALTER TABLE `tempo_garantia`
  MODIFY `tempo_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tempo_status`
--
ALTER TABLE `tempo_status`
  MODIFY `ts_cod` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tipo_equip`
--
ALTER TABLE `tipo_equip`
  MODIFY `tipo_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tipo_garantia`
--
ALTER TABLE `tipo_garantia`
  MODIFY `tipo_garant_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipo_imp`
--
ALTER TABLE `tipo_imp`
  MODIFY `tipo_imp_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tipo_item`
--
ALTER TABLE `tipo_item`
  MODIFY `tipo_it_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios_areas`
--
ALTER TABLE `usuarios_areas`
  MODIFY `uarea_cod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `uthemes`
--
ALTER TABLE `uthemes`
  MODIFY `uth_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `utmp_usuarios`
--
ALTER TABLE `utmp_usuarios`
  MODIFY `utmp_cod` int(4) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
