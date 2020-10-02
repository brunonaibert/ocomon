<?php 
 /*                        Copyright 2020 Flávio Ribeiro

         This file is part of OCOMON.

         OCOMON is free software; you can redistribute it and/or modify
         it under the terms of the GNU General Public License as published by
         the Free Software Foundation; either version 3 of the License, or
         (at your option) any later version.

         OCOMON is distributed in the hope that it will be useful,
         but WITHOUT ANY WARRANTY; without even the implied warranty of
         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
         GNU General Public License for more details.

         You should have received a copy of the GNU General Public License
         along with Foobar; if not, write to the Free Software
         Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */session_start();


	include ("../../includes/include_geral.inc.php");
	include ("../../includes/include_geral_II.inc.php");

	//$_SESSION['s_page_admin'] = $_SERVER['PHP_SELF'];

	print "<HTML>";
	print "<BODY bgcolor='".BODY_COLOR."'>";

	$auth = new auth;
	$auth->testa_user($_SESSION['s_usuario'],$_SESSION['s_nivel'],$_SESSION['s_nivel_desc'],2);

	$fecha = "";
	if (isset($_GET['popup'])) {
		$fecha = "window.close()";
	} else {
		$fecha = "history.back()";
	}



	print "<BR><B>Administração de Categorias de Softwares</B><BR>";

	print "<FORM method='POST' action='".$_SERVER['PHP_SELF']."' onSubmit=\"return valida()\">";

	if (!isset($_GET['cellStyle'])) {
		$cellStyle = "cellpadding='5' cellspacing='0'";
	} else
		$cellStyle = "cellpadding='0' cellspacing='1'";
	print "<TABLE border='0' align='left' ".$cellStyle."  width='100%' bgcolor='".BODY_COLOR."'>";


        	$query = "SELECT * FROM categorias  ";

		if (isset($_GET['cod'])) {
			$query.= "WHERE cat_cod='".$_GET['cod']."' ";
		}
		$query .=" ORDER BY cat_desc";
		$resultado = mysql_query($query) or die('ERRO NA EXECUÇÃO DA QUERY DE CONSULTA!');
		$registros = mysql_num_rows($resultado);

	if ((!isset($_GET['action'])) && empty($_POST['submit'])) {

		print "<TR><TD bgcolor='".BODY_COLOR."'><a href='".$_SERVER['PHP_SELF']."?action=incluir&cellStyle=true'>Cadastrar Categoria</a></TD></TR>";
		if (mysql_num_rows($resultado) == 0)
		{
			echo mensagem("Não há nenhum registro cadastrado!");
		}
		else
		{
			print "<tr><td class='line'>";
			print "Existe(m) <b>".$registros."</b> Categorias cadastradas.</td>";
			print "</tr>";
			print "<TR class='header'><td class='line'>Categoria</TD>".
				"<td class='line'>Alterar</TD><td class='line'>Excluir</TD></tr>";

			$j=2;
			while ($row = mysql_fetch_array($resultado))
			{
				if ($j % 2)
				{
					$trClass = "lin_par";
				}
				else
				{
					$trClass = "lin_impar";
				}
				$j++;
				print "<tr class=".$trClass." id='linhax".$j."' onMouseOver=\"destaca('linhax".$j."','".$_SESSION['s_colorDestaca']."');\" onMouseOut=\"libera('linhax".$j."','".$_SESSION['s_colorLinPar']."','".$_SESSION['s_colorLinImpar']."');\"  onMouseDown=\"marca('linhax".$j."','".$_SESSION['s_colorMarca']."');\">";

				print "<td class='line'>".$row['cat_desc']."</td>";
				print "<td class='line'><a onClick=\"redirect('".$_SERVER['PHP_SELF']."?action=alter&cod=".$row['cat_cod']."&cellStyle=true')\"><img height='16' width='16' src='".ICONS_PATH."edit.png' title='Editar o registro'></a></td>";
				print "<td class='line'><a onClick=\"confirmaAcao('Tem Certeza que deseja excluir esse registro do sistema?','".$_SERVER['PHP_SELF']."', 'action=excluir&cod=".$row['cat_cod']."')\"><img height='16' width='16' src='".ICONS_PATH."drop.png' title='Excluir o registro'></a></TD>";

				print "</TR>";
			}
		}

	} else
	if ((isset($_GET['action'])  && ($_GET['action'] == "incluir") )&& empty($_POST['submit'])) {

		print "<BR><B>Cadastro de Categorias</B><BR>";
		print "<TR><TD bgcolor='".BODY_COLOR."'><a href='".$_SERVER['PHP_SELF']."'>Listar categorias cadastrados</a></TD></TR>";
		print "<TR>";
		print "<TD width='20%' align='left' bgcolor='".TD_COLOR."'>Descrição:</TD>";
		print "<TD width='80%' align='left' bgcolor='".BODY_COLOR."'><INPUT type='text' name='categoria' class='text' id='idCategoria'></td>";
		print "</TR>";

		print "<TR>";

		print "<TD align='left' width='20%' bgcolor='".BODY_COLOR."'><input type='submit' class='button' value='Cadastrar' name='submit'>";
		print "</TD>";
		print "<TD align='left' width='80%' bgcolor='".BODY_COLOR."'><INPUT type='reset' class='button' value='Cancelar' name='cancelar' onClick=\"javascript:".$fecha."\"></TD>";

		print "</TR>";

	} else

	if ((isset($_GET['action']) && $_GET['action']=="alter") && empty($_POST['submit'])) {

		$row = mysql_fetch_array($resultado);

		print "<BR><B>Edição do registro</B><BR>";

		print "<TR>";
                print "<TD width='20%' align='left' bgcolor='".TD_COLOR."' valign='top'>Categoria:</TD>";
                print "<TD width='80%' align='left' bgcolor='".BODY_COLOR."'><INPUT type='text' class='text' name='categoria' id='idCategoria' value='".$row['cat_desc']."'></td>";
        	print "</TR>";

		print "<TR>";
		print "<BR>";
		print "<TD align='left' width='20%' bgcolor='".BODY_COLOR."'><input type='submit' class='button' value='Alterar' name='submit'>";
		print "<input type='hidden' name='cod' value='".$_GET['cod']."'>";
			print "</TD>";
		print "<TD align='left' width='80%' bgcolor='".BODY_COLOR."'><INPUT type='reset' class='button' value='Cancelar' name='cancelar' onClick=\"javascript:".$fecha."\"></TD>";

		print "</TR>";


	} else

	if (isset($_GET['action']) && $_GET['action'] == "excluir"){

		$total = 0; $texto = "";
		$sql_1 = "SELECT * from softwares where soft_cat='".$_GET['cod']."'";
		$exec_1 = mysql_query($sql_1);
		$total+=mysql_num_rows($exec_1);
		if (mysql_num_rows($exec_1)!=0) $texto.="softwares, ";

		if ($total!=0)
		{
			print "<script>mensagem('Este registro não pode ser excluído, existem pendências nas tabelas: ".$texto." associados a ele!');
				redirect('".$_SERVER['PHP_SELF']."');</script>";
		}
		else
		{
			$query2 = "DELETE FROM categorias WHERE cat_cod='".$_GET['cod']."'";
			$resultado2 = mysql_query($query2);

			if ($resultado2 == 0)
			{
					$aviso = "ERRO NA TENTATIVA DE EXCLUIR O REGISTRO!";
			}
			else
			{
					$aviso = "OK. REGISTRO EXCLUÍDO COM SUCESSO!";
			}
			print "<script>mensagem('".$aviso."'); redirect('".$_SERVER['PHP_SELF']."'); window.opener.location.reload();</script>";

		}


	} else

	if ($_POST['submit'] == "Cadastrar"){

		$erro=false;

		$qryl = "SELECT * FROM categorias WHERE cat_desc='".$_POST['categoria']."'";
		$resultado = mysql_query($qryl);
		$linhas = mysql_num_rows($resultado);

		if ($linhas > 0)
		{
				$aviso = "Já existe um registro com essa descrição cadastrado no sistema!!";
				$erro = true;
		}

		if (!$erro)
		{

			$query = "INSERT INTO categorias (cat_desc) values ('".noHtml($_POST['categoria'])."')";
			$resultado = mysql_query($query);
			if ($resultado == 0)
			{
				$aviso = "ERRO NA TENTATIVA DE INCLUIR O REGISTRO!";
			}
			else
			{
				$aviso = "OK. REGISTRO INCLUÍDO COM SUCESSO!.";
			}
		}

		echo "<script>mensagem('".$aviso."'); redirect('".$_SERVER['PHP_SELF']."'); window.opener.location.reload();</script>";

	} else

	if ($_POST['submit'] == "Alterar"){

		$query2 = "UPDATE categorias SET cat_desc='".noHtml($_POST['categoria'])."'  WHERE cat_cod='".$_POST['cod']."'";
		$resultado2 = mysql_query($query2);

		if ($resultado2 == 0)
		{
			$aviso =  "ERRO NA TENTATIVA DE ALTERAR O REGISTRO!";
		}
		else
		{
			$aviso =  "REGISTRO ALTERADO COM SUCESSO!";
		}

		echo "<script>mensagem('".$aviso."'); redirect('".$_SERVER['PHP_SELF']."');</script>";

	}

	print "</table>";

?>
<script type="text/javascript">
<!--
	function valida(){
		var ok = validaForm('idCategoria','','Categoria',1);

		return ok;
	}

-->
</script>


<?php 
print "</body>";
print "</html>";
