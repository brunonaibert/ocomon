ALTER TABLE `mailconfig` CHANGE `mail_host` `mail_host` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'mail.smtp.com', CHANGE `mail_user` `mail_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `mail_pass` `mail_pass` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `mail_from` `mail_from` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ocomon@yourdomain.com', CHANGE `mail_from_name` `mail_from_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'SISTEMA_OCOMON';


ALTER TABLE `mail_hist` CHANGE `mhist_listname` `mhist_listname` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `mhist_subject` `mhist_subject` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE `mail_templates` CHANGE `tpl_sigla` `tpl_sigla` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `tpl_subject` `tpl_subject` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE `mail_list` CHANGE `ml_sigla` `ml_sigla` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE `mailconfig` ADD `mail_port` INT(5) NOT NULL DEFAULT '587' AFTER `mail_host`;

ALTER TABLE `mailconfig` ADD `mail_secure` VARCHAR(10) NOT NULL DEFAULT 'tls' AFTER `mail_port`;

ALTER TABLE `usuarios` CHANGE `fone` `fone` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `configusercall` CHANGE `conf_custom_areas` `conf_custom_areas` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL; 

ALTER TABLE `imagens` CHANGE `img_size` `img_size` BIGINT(15) NULL DEFAULT NULL; 

ALTER TABLE `imagens` CHANGE `img_nome` `img_nome` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `modelos_itens` CHANGE `mdit_fabricante` `mdit_fabricante` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '';

ALTER TABLE `modelos_itens` CHANGE `mdit_desc` `mdit_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `modelos_itens` CHANGE `mdit_sufixo` `mdit_sufixo` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `equipxpieces` CHANGE `eqp_piece_modelo_id` `eqp_piece_modelo_id` INT(6) NULL DEFAULT NULL;

ALTER TABLE `estoque` CHANGE `estoq_sn` `estoq_sn` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `estoq_nf` `estoq_nf` VARCHAR(255) NULL DEFAULT NULL, CHANGE `estoq_data_compra` `estoq_data_compra` DATE NULL DEFAULT NULL, CHANGE `estoq_partnumber` `estoq_partnumber` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `equipamentos` CHANGE `comp_sn` `comp_sn` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `comp_nome` `comp_nome` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `comp_nf` `comp_nf` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

