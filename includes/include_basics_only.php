<?php 

	include ("../../includes/classes/conecta.class.php");
	include ("../../includes/functions/funcoes.inc");
 	include ("../../includes/config.inc.php");
 	include ("../../includes/languages/".LANGUAGE.""); //TEMPORARIAMENTE
 	include ("../../includes/queries/queries.php");
	$conec = new conexao;
	$conec->conecta('MYSQL');

?>
