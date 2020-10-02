<?php session_start();
/*ARQUIVO DE ESTILOS DO OCOMON*/

	require_once ('../../includes/config.inc.php');
	require_once ('../../includes/functions/funcoes.inc');

	if (is_file("../../includes/classes/conecta.class.php"))
		require_once ("../../includes/classes/conecta.class.php"); else
		require_once ("../classes/conecta.class.php");

	$conec = new conexao;
	$conec->conecta('MYSQL');

	//$qry = "SELECT * FROM styles";
	//$exec = mysql_query($qry);
	//$row = mysql_fetch_array($exec);

	if (isset($_SESSION['s_uid'])) {
	//if (isset($_COOKIE['cook_oco_uid'])) {

		$qry = "SELECT * FROM temas t, uthemes u  WHERE u.uth_uid = ".$_SESSION['s_uid']." and t.tm_id = u.uth_thid";
		$exec = mysql_query($qry) or die('ERRO NA TENTATIVA DE RECUPERAR AS INFORMAÇÕES DO TEMA!<BR>'.$qry);
		$row = mysql_fetch_array($exec);
		$regs = mysql_num_rows($exec);
		if ($regs==0){ //SE NÃO ENCONTROU TEMA ESPECÍFICO PARA O USUÁRIO
			$qry = "SELECT * FROM styles";
			$exec = mysql_query($qry);
			$row = mysql_fetch_array($exec);
		}
	} else {
		$qry = "SELECT * FROM styles";
		$exec = mysql_query($qry);
		$row = mysql_fetch_array($exec);
	}

	// print "
	// @import url('https://fonts.googleapis.com/css2?family=Questrial&display=swap');
	// ";
	
// print "
// 	@font-face {
// 		font-family: 'Questrial';
// 			url('../../includes/fonts/Questrial-Regular.ttf')  format('truetype'), /* Safari, Android, iOS */
// 	  }
// ";

//reset padding: 0;
print "

* {
	margin: 0;
	box-sizing: border-box;
}
";

print "
	.bold { font-weight: bold; }
	p.center, h1.center, h2.center, h3.center, h4.center, h5.center { text-align: center; }
	table.center { margin:auto; }
	fieldset.center {
		max-width:55%; padding:10px; align:center; margin:auto;
	}
	fieldset { border-radius: 4px; }

	.border { border: 1px solid black; }

	.pointer { cursor: pointer;}
";

//font-family: tahoma;
//tahoma, 'Exo 2', 
print "body
{
	font-family: FreeSans, sans-serif; 
	color:black;
	font-size:11px;
	background-color:".$row['tm_color_body'].";
} ";/*#cde5ff   background-color:#d9d8da;     5E515B    font-size: 11px; */

//MENU LATERAL DO OCOMON
print "body.menu ".
"{";
	if ($row['tm_color_menu'] == "IMG_DEFAULT") {
		print "background-image:url('../../MENU_IMG.png');";
		print "background-repeat: no-repeat ;";
	} else {
		print "background-color:".$row['tm_color_menu'].";";
		//print "background-repeat: repeat ;";
	}
print "}";

//print ".frm_menu {background-color:#F6F6F6;}";
//print ".frm_centro {background-color:#F6F6F6;}"; /* background-color:#d9d8da; */
print ".frm_menu {background-color:".$row['tm_color_body'].";}";
print ".frm_centro {background-color:".$row['tm_color_body'].";}";

/************************************************************/
/*ESTILOS PARA TABELAS*/

print "
.credenciados {
	border-collapse: collapse;
	padding: 8px;
	border: 1px solid #e6e6e6;
}
";


print "table {line-height:1.0em; font-family: FreeSans, sans-serif; font-size: 11px;}";

print "table.topo
{
	width:100%;
	line-height:1.1em;
	font-family: FreeSans, sans-serif;
	font-size: 12px;
	font-weight: bold;
	text-align:left; ";
	if ($row['tm_color_topo'] == "IMG_DEFAULT") {
		print "background-image:url('./main_bar.png');";
		print "background-repeat: repeat ;";
	} else {
		print "background-color:".$row['tm_color_topo'].";";
		//print "background-repeat: repeat ;";
	}
	print "color:".$row['tm_color_topo_font'].";
}"; /*92959c*/

print "div.topo
{
	display: flex;
	flex-wrap: wrap;
	align-content: center;
	justify-content: space-between;
	width:100%;
	line-height:1.1em;
	font-family: FreeSans, sans-serif;
	font-size: 12px;
	font-weight: bold;
	text-align:left; ";
	if ($row['tm_color_topo'] == "IMG_DEFAULT") {
		print "background-image:url('./main_bar.png');";
		print "background-repeat: repeat ;";
	} else {
		print "background-color:".$row['tm_color_topo'].";";
		//print "background-repeat: repeat ;";
	}
	print "color:".$row['tm_color_topo_font'].";
	
}"; /*92959c*/


print "#header_elements{
	display: flex;
	flex-wrap: wrap;
	align-content: center;
	margin-right: 40px;
	font-family: FreeSans, sans-serif;
	font-size: 11px;
	
} 

#header_logo {
	display: flex;
	flex-wrap: wrap;
	align-content: center;
	margin-left: 20px;
	padding: 0px, 5px, 0px, 0px;
	
}
";

print "
	
	div.center-100 {
			
		align-content: center;
		padding: 60px 40px 0 0;
		width: 100%;
	}
	div.center {
		
		align-content: center;
		padding: 60px;
		border-collapse: collapse;
		border: 1px solid #9e9a9a;
		border-radius: 5px;
		box-shadow: inset 0 0 3px grey;
		width: 50%;
	}
	
	div.logon-screen {
		
		display: block;
		margin-left: 20px;
		padding: 8px;
		justify-content: right;
	}

";


print "div.topo-options {
	align: right;
	display: flex;
}
";

print "font.topo {color:".$row['tm_color_topo_font'].";}";

print "#geral{position:relative; top:-10px; }";


/*color:#675E66;   #857B84*/ 
// Tahoma
print "table.barra
{
	width:100%;
	line-height:1.1em;
	font-family: FreeSans, sans-serif;
	font-size: 12px;
	font-weight:bold;
	color: ".$row['tm_color_barra_font'].";
	text-align:center; ";
	if ($row['tm_color_barra'] == "IMG_DEFAULT") {
		print "background-image:url('./aqua.png');";
		print "background-repeat: repeat ;";
	} else {
		print "background-color:".$row['tm_color_barra'].";";
		//print "background-repeat: repeat ;";
	}
	print "padding:1px;
	border-spacing:0px;
	border-top-width:1px;
	border-top-color:white;
	border-right-width:1px;
	border-right-color:white;
	border-bottom-width:1px;
	border-bottom-color:white;
	border-left-width:1px;
 	border-left-color:white;
 }";//#675E66

print "div.barra
{
	display: block;
	width:100%;
	line-height:1em;
	font-family: FreeSans, sans-serif;
	font-size: 12px;
	font-weight:bold;
	color: ".$row['tm_color_barra_font'].";
	text-align:left; 
	";

	if ($row['tm_color_barra'] == "IMG_DEFAULT") {
		//print "background-image:url('./aqua.png');";
		//print "background-repeat: repeat ;";
		print "
		background: rgba(244,244,244,1);
		background: -moz-linear-gradient(top, rgba(244,244,244,1) 0%, rgba(246,246,246,1) 47%, rgba(204,204,204,1) 100%);
		background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(244,244,244,1)), color-stop(47%, rgba(246,246,246,1)), color-stop(100%, rgba(204,204,204,1)));
		background: -webkit-linear-gradient(top, rgba(244,244,244,1) 0%, rgba(246,246,246,1) 47%, rgba(204,204,204,1) 100%);
		background: -o-linear-gradient(top, rgba(244,244,244,1) 0%, rgba(246,246,246,1) 47%, rgba(204,204,204,1) 100%);
		background: -ms-linear-gradient(top, rgba(244,244,244,1) 0%, rgba(246,246,246,1) 47%, rgba(204,204,204,1) 100%);
		background: linear-gradient(to bottom, rgba(244,244,244,1) 0%, rgba(246,246,246,1) 47%, rgba(204,204,204,1) 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f4f4f4', endColorstr='#cccccc', GradientType=0 );
		";

	} else {
		print "background-color:".$row['tm_color_barra'].";";
		//print "background-repeat: repeat ;";
	}
	print "padding:5px;
	border-spacing:0px;
	border-top-width:1px;
	border-top-color:white;
	border-right-width:1px;
	border-right-color:white;
	border-bottom-width:1px;
	border-bottom-color:white;
	border-left-width:1px;
	border-left-color:white;
}";//#675E66


print "table.menutop
{
	background-color:#C7C8C6;
	color:#5E515B;
	padding:1px;
	border-spacing:0px;
	border-top-width:1px;
	border-top-color:white;
	border-right-width:1px;
	border-right-color:white;
	border-bottom-width:1px;
	border-bottom-color:white;
	border-left-width:1px;
 	border-left-color:white;
 }";

 print "table.menu{background-color:#C7C8C6; border:1px; border-collapse:collapse;}";

 print "table.titulo {line-height:1.2em; font-family: FreeSans, sans-serif; font-size: 15px; font-weight: bold;}";

 print "table.header_centro{border-bottom:  solid ".$row['tm_color_borda_header_centro']."; }";



print "table.header
{
	width:100%;
	margin-left:auto;
	margin-right: auto;
	text-align:left;
	border: 1px;
	border-spacing:1;
	background-color:black;
	padding-top:0px
}";

print "table.menu
{
	width:100%;
	margin-left:auto;
	margin-right: auto;
	text-align:left;
	border: 0px;
	border-spacing:0px;
	border-collapse:collapse;
	background-color:white;

}";

print "table.corpo
{
	width:100%;
	margin-left:auto;
	margin-right: auto;
	text-align:left;
	border: 0px;
	border-spacing:1;
	padding-top:10px;
}";

print "table.corpo2
{
	width:100%;
	margin-left:auto;
	margin-right: auto;
	text-align:left;
	border: 0px;
	border-spacing:0px;
	border-collapse:collapse;
	padding-top:10px;
}";

print "table.estat60
{
	width:60%;
	margin-left:auto;
	margin-right: auto;
	text-align:left;
	border: 0px;
	border-spacing:1;
	padding-top:20px;
}";

print "table.estat80
{
	width:80%;
	margin-left:auto;
	margin-right: auto;
	text-align:left;
	border: 0px;
	border-spacing:1;
	padding-top:10px;
}";
/*FIM TABELAS*/
/************************************************************/
/*LINHAS E COLUNAS*/

print "td.barra {padding:5px;} ";
print ".td-barra {
	padding:5px;
} ";

print "td.default {padding:3px;} ";

print "td.wide {padding:8px;} ";

print "td.barraMenu {border-right: thin solid ".$row['tm_color_barra_font'].";}"; //{border-right: thin solid #675E66;}

print "td.marked {color:blue; background-color: #666666}";

//print "td.released {color:#675E66; background-color: '';}";

print "tr.menutop {background-color:#C7C8C6; color:#5E515B;}";

/* background: rgba(204,204,204,1);
		background: -moz-linear-gradient(-45deg, rgba(204,204,204,1) 0%, rgba(204,204,204,1) 39%, rgba(187,185,187,1) 61%, rgba(179,175,179,1) 72%);
		background: -webkit-gradient(left top, right bottom, color-stop(0%, rgba(204,204,204,1)), color-stop(39%, rgba(204,204,204,1)), color-stop(61%, rgba(187,185,187,1)), color-stop(72%, rgba(179,175,179,1)));
		background: -webkit-linear-gradient(-45deg, rgba(204,204,204,1) 0%, rgba(204,204,204,1) 39%, rgba(187,185,187,1) 61%, rgba(179,175,179,1) 72%);
		background: -o-linear-gradient(-45deg, rgba(204,204,204,1) 0%, rgba(204,204,204,1) 39%, rgba(187,185,187,1) 61%, rgba(179,175,179,1) 72%);
		background: -ms-linear-gradient(-45deg, rgba(204,204,204,1) 0%, rgba(204,204,204,1) 39%, rgba(187,185,187,1) 61%, rgba(179,175,179,1) 72%);
		background: linear-gradient(135deg, rgba(204,204,204,1) 0%, rgba(204,204,204,1) 39%, rgba(187,185,187,1) 61%, rgba(179,175,179,1) 72%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cccccc', endColorstr='#b3afb3', GradientType=1 );
		 */

if ($row['tm_tr_header'] == "IMG_DEFAULT") {
	print "tr.header, input.header {
		

		background: rgba(204,204,204,1);
		background: -moz-linear-gradient(45deg, rgba(204,204,204,1) 0%, rgba(187,185,187,1) 34%, rgba(204,204,204,1) 58%, rgba(179,175,179,1) 72%, rgba(179,175,179,1) 100%);
		background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(204,204,204,1)), color-stop(34%, rgba(187,185,187,1)), color-stop(58%, rgba(204,204,204,1)), color-stop(72%, rgba(179,175,179,1)), color-stop(100%, rgba(179,175,179,1)));
		background: -webkit-linear-gradient(45deg, rgba(204,204,204,1) 0%, rgba(187,185,187,1) 34%, rgba(204,204,204,1) 58%, rgba(179,175,179,1) 72%, rgba(179,175,179,1) 100%);
		background: -o-linear-gradient(45deg, rgba(204,204,204,1) 0%, rgba(187,185,187,1) 34%, rgba(204,204,204,1) 58%, rgba(179,175,179,1) 72%, rgba(179,175,179,1) 100%);
		background: -ms-linear-gradient(45deg, rgba(204,204,204,1) 0%, rgba(187,185,187,1) 34%, rgba(204,204,204,1) 58%, rgba(179,175,179,1) 72%, rgba(179,175,179,1) 100%);
		background: linear-gradient(45deg, rgba(204,204,204,1) 0%, rgba(187,185,187,1) 34%, rgba(204,204,204,1) 58%, rgba(179,175,179,1) 72%, rgba(179,175,179,1) 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cccccc', endColorstr='#b3afb3', GradientType=1 );

		
		font-weight:bold; color:".$row['tm_color_font_tr_header']."; 
	
	}";

		//background-image:url('./header_bar3.png'); background-repeat: repeat ;
	
	print "
	
	.msg {
		font-weight:bold; color:".$row['tm_color_font_tr_header']."; padding:5px; width:100%;
		border-radius: 5px;
		
		background: rgba(179,175,179,1);
		background: -moz-linear-gradient(-45deg, rgba(179,175,179,1) 0%, rgba(204,204,204,1) 100%);
		background: -webkit-gradient(left top, right bottom, color-stop(0%, rgba(179,175,179,1)), color-stop(100%, rgba(204,204,204,1)));
		background: -webkit-linear-gradient(-45deg, rgba(179,175,179,1) 0%, rgba(204,204,204,1) 100%);
		background: -o-linear-gradient(-45deg, rgba(179,175,179,1) 0%, rgba(204,204,204,1) 100%);
		background: -ms-linear-gradient(-45deg, rgba(179,175,179,1) 0%, rgba(204,204,204,1) 100%);
		background: linear-gradient(135deg, rgba(179,175,179,1) 0%, rgba(204,204,204,1) 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b3afb3', endColorstr='#cccccc', GradientType=1 );

	}";
	// background-image:url('./header_bar3.png'); background-repeat: repeat; 

} else {
		print "tr.header {background-color:".$row['tm_tr_header']."; font-weight:bold; color:".$row['tm_color_font_tr_header'].";}";
		print ".msg {background-color:".$row['tm_tr_header']."; color:".$row['tm_color_font_tr_header']."; padding:5px; width:100%;
			border-radius: 5px;".
					//"border-bottom:  solid #999999; ".
					//"border-top:  thin solid #999999; border-left:thin solid #999999; border-right: thin solid #999999; ".
		"}"; //tm_tr_header
	}

print "tr.padrao {background-color:#ECECDB;}";

print "tr.lin_impar {background-color:".$row['tm_color_lin_impar'].";  padding: 5px;}"; /*  F8F8F1  #E5E5E5     #EAEAEA*/

/*tr.lin_par {background-image:url("./header_bar.gif"); background-repeat: repeat ; padding:5px; } /*#D3D3D3*/
//print "tr.lin_par {background-color:#E3E1E1; background-repeat: repeat ; padding:5px; }"; /*#D3D3D3*/
print "tr.lin_par {background-color:".$row['tm_color_lin_par'].";  padding:5px; }"; /*#D3D3D3*/


print "linha_1 {background-color:".$row['tm_color_lin_impar'].";  padding: 5px;}";
print "linha_2 {background-color:".$row['tm_color_lin_par'].";  padding:5px; }";

print "tr.lin_alerta {background-color:#FF0000; color:yellow;}";

print "tr.lin_alerta_par {background-color:".$row['tm_color_lin_par']."; color:#FF0000; font-style:italic; padding:5px;}";
print "tr.lin_alerta_impar {background-color:".$row['tm_color_lin_impar']."; color:#FF0000; font-style:italic; padding:5px;}";

print "td.cborda {height: 20px; }"; /*border: 1px solid #a4a4a4;*/

print "td.line {border-bottom: solid  ".$row['tm_borda_color']."; 
	border-bottom-width:".$row['tm_borda_width']."px; padding: 8px;
	
}"; //border-top:  thin solid ".$row['conf_color_body'].";


/*FIM LINHAS E COLUNAS*/
/************************************************************/
/*LINKS*/
print "a:link {color: #5E515B; text-decoration: none; cursor:pointer;}";
print "a:visited {color: #5E515B; text-decoration: none; cursor:pointer;}";
print "a:hover {color: #5E515B; cursor:pointer;}"; /*  ffe4ca*/ #5E515B
print "a:active {color: #8a4500; cursor:pointer;}";

print ".href {color: #5E515B; text-decoration: none; cursor:pointer;}";

print ".negrito:hover{color:#ffe4ca; background-color:#ffe4ca; font-weight:bold; }";

print "a.barra:link {color: ".$row['tm_color_barra_hover']."; text-decoration: none; cursor:pointer; }";
print "a.barra:visited {color: ".$row['tm_color_barra_hover']."; text-decoration: none; cursor:pointer; }";
print "a.barra:hover {color: ".$row['tm_color_barra_hover'].";  text-decoration: none; cursor:pointer; }";
print "a.barra:active {color: ".$row['tm_color_barra_hover']."; text-decoration: none; cursor:pointer; }";

print "a.menu:link {color: #5E515B; text-decoration: none;}";
print "a.menu:visited {color: #5E515B; text-decoration: none;}";
print "a.menu:hover {color:#5E515B; }";
print "a.menu:active {color:#999999; }";

print "a.no:link {color: black; text-decoration: none; cursor:pointer;}";
print "a.no:visited {color: black; text-decoration: none; cursor:pointer;}";
print "a.no:hover {color:#5E515B;  text-decoration: none; cursor:pointer;}";
print "a.no:active {color:#8a4500; text-decoration: none; cursor:pointer;}";

print ".botao:hover {color:#5E515B; }";

/*FIM LINKS*/
/************************************************************/
/*FORMULÁRIO*/
$formFieldColor = "#F6F6F6"; //#F1F1F1

print ".select, .text, .select2, .text2, input.text
{
	height:25px;
	line-height: 1.2em;
	
	background-color:".$formFieldColor.";
	font-family:  FreeSans, sans-serif;
	font-size:12px;
	width:200px;
	color: black;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
	vertical-align: middle;
}"; //#F1F1F1

print ".select-multiple
{
	border: 1px solid #a4a4a4;
	border-radius: 4px;
	padding: 0px 25px 5px 5px;
	max-width:200px;
}";

print "
	.js-example-basic-single{ color:black; font-size: 16px;}
";

print ".select-multiple-lin
{
	border: 1px solid #a4a4a4;
	border-radius: 4px;
	line-height: 1.2em;
	width: 200px;
	
}";

print ".textarea_desc
{
	height:60px;
	background-color:".$formFieldColor.";
	font-family:  FreeSans, sans-serif;
	font-size:11px;
	width:200px;
	color: black;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}"; //#F1F1F1


print ".select_sol
{
	height:25px;
	line-height: 1.2em;
	padding: 0px 10px 5px 5px;
	background-color:".$formFieldColor.";
	font-family:  FreeSans, sans-serif;
	font-size:12px;
	width:570px;
	color: black;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";

print ".select:focus, .text:focus, .select2:focus, .text2:focus, input.text:focus, .text3:focus, .textarea:focus, .textarea-script:focus, ".
	".textarea2:focus, .mini:focus, .mini2:focus, .data:focus, .logon:focus, .help:focus, .select_sol:focus, .textarea_desc:focus 
{
	background-color:white;
}";

print ".checkbox
{
	background-color:white;
	font-family:  FreeSans, sans-serif;
	color: black;
	border: 1px solid #a4a4a4;
}";

print ".text3
{
	height:25px;
	background-color:#F7F7F7;
	font-family: FreeSans, sans-serif;
	font-size:12px;
	width:300px;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";


print ".quadro
{
	height:13px;
	width:13px;
	border: 1px solid #CCCCCC;
	border-radius: 4px;
}";


print "input.disable, select.disable
{
	height:25px;
	background-color:#F3F3F3;
	font-family:  FreeSans, sans-serif;
	font-size:12px;
	width:200px;
	color: black;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";
print ".textareaDisable {height:40px; background-color:#F3F3F3; font-family:  FreeSans, sans-serif; font-size:11px; width:570px; border: 1px solid #a4a4a4; border-radius: 4px;}";

print "td.disable
{
	height:25px;
	background-color:#F3F3F3;
	font-family:  FreeSans, sans-serif;
	font-size:11px;
	width:200px;
	color: black;
	border: 1px solid #a4a4a4;
	
}";
print "td.borda, tr.borda
{
	height:25px;
	background-color:white;
	font-family:  FreeSans, sans-serif;
	font-size:11px;
	width:200px;
	color: black;
	border: 1px solid #a4a4a4;
}";

print "td.bordaprint
{
	height:25px;
	background-color:white;
	font-family:  FreeSans, sans-serif;
	font-size:11px;
	width:200px;
	color: black;
	border-bottom: 1px solid #a4a4a4;
}";
//#F7F7F7
print ".textarea {height:100px; background-color:".$formFieldColor."; font-family:  FreeSans, sans-serif; font-size:12px; width:570px; border: 1px solid #a4a4a4; border-radius: 4px;}";

print ".textarea-script {height:400px; background-color:".$formFieldColor."; font-family:  FreeSans, sans-serif; font-size:12px; width:570px; border: 1px solid #a4a4a4; border-radius: 4px;}";

print ".textarea2 {height:100px; background-color:".$formFieldColor."; font-family:  FreeSans, sans-serif; font-size:12px; width:400px; border: 1px solid #a4a4a4; border-radius: 4px;}";

print ".radio {width: 13px;}";

print ".mini {height:25px; background-color:".$formFieldColor."; font-family:  FreeSans, sans-serif; font-size:12px; width:30px; border: 1px solid #a4a4a4; border-radius: 4px;}";

print ".mini2 {height:25px; background-color:".$formFieldColor."; font-family:  FreeSans, sans-serif; font-size:12px; width:90px; border: 1px solid #a4a4a4; border-radius: 4px;}";

print ".data {height:25px; background-color:".$formFieldColor."; font-family:  FreeSans, sans-serif; font-size:12px; width:90px; border: 1px solid #a4a4a4; border-radius: 4px;}";

/*FIM FORMULÁRIOS*/
/*************************************a:link {color: #5E515B; text-decoration: none; cursor:pointer;}
/*BOTÕES*/

print ".help
{
	height:15px;
	background-color:".$formFieldColor.";
	font-family:  FreeSans, sans-serif;
	font-size:11px;
	width:80px;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";

print ".logon
{
	height:18px;
	background-color:".$formFieldColor.";
	font-family:  FreeSans, sans-serif;
	font-size:11px;
	width:80px;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";
print ".logon:hover
{
	color: black;
	border: 1px solid black;
}";

print ".new-logon
{
	height:30px;
	background-color:".$formFieldColor.";
	font-family:  FreeSans, sans-serif;
	font-size:16px;
	width:150px;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";
print ".new-logon:hover
{
	color: black;
	border: 1px solid black;
}";


print "
.btn {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}

.btn-square {
	border-radius: 4px;
	padding: 5px 5px;
	font-size: 10px;
}

.btn-blue {background-color: #008CBA;} /* Blue */

.btn-square:hover {
	border: 0.5px solid black;
	padding: 4.5px 4.5px;
	cursor: pointer;
}

";


print ".button
{
	height: 20px;
	color: #333333;
	font-size: 12px;
	padding-left: 8px;
	padding-right: 8px;
	background: url('./bg.gif') repeat-x #f0f0f0;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";
print ".button:hover
{
	color: black;
	border: 1px solid black;
}";

print "input.blogin
{
	height: 34px;
	color: #333333;
	font-size: 13px;
	padding-left: 8px;
	padding-right: 8px;
	background: url('./bg.gif') repeat-x #f0f0f0;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";

print "input.blogin:hover
{
	color: black;
	border: 1px solid black;
}";

print "input.new-blogin
{
	height: 54px;
	width: 150px;
	color: #333333;
	font-size: 16px;
	padding: 15 20;
	border-radius: 4px;
	
	background: url('./bg.gif') repeat-x #f0f0f0;
	border: 1px solid #a4a4a4;
}";

print "input.new-blogin:hover
{
	color: black;
	border: 1px solid black;
}";

print ".button-disabled
{
	height: 20px;
	color: #D0D0D0;
	font-size: 12px;
	padding-left: 8px;
	padding-right: 8px;
	background: url('./bg.gif') repeat-x #f0f0f0;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";
/*.minibutton {height:15px; width:40px; font-family: tahoma; font-size:9px;} */
print ".minibutton
{
	height: 15px;
	color: #333333;
	font-size: 9px;
	padding-left: 8px;
	padding-right: 8px;
	background: url('./bg.gif') repeat-x #f0f0f0;
	border: 1px solid #a4a4a4;
	border-radius: 4px;
}";
print ".minibutton:hover
{
	color: black;
	border: 1px solid black;
}";

print ".button_new {height:25px;  background-color:#BDBDBC; color:black; border-radius: 4px;}";

print ".btPadrao {height:25px;  background-color:#ECECDB; color:black; border-radius: 4px;}";

print "table.likebutton
{
	padding-top:  10px;
}";

print "a.likebutton, td.likebutton
{
	border-top: 1px solid #d9d9d9;
	border-left: 1px solid #d9d9d9;
	border-right: 1px solid #000000;
	border-bottom: 1px solid #000000;
	border-radius: 4px;
	background: #EFEFEC;
	text-align: center;
}";

print "a.likebutton
{
	padding: 3px;
	margin-left: 5px;
}";


/*FIM BOTÕES*/
/************************************************************/

print ".divAlerta {background-color: #FAD163; color: #000000;}";

print ".relatorio
{
	font-family:  FreeSans, sans-serif;
	font-size: 13px;
	background-color:white;
}";

print ".parag
{
	margin-left:10%;
	margin-right: 10%;
	text-indent: 1cm;
	text-align:justify;
}";

print ".parag_header
{
	margin-left:10%;
	margin-right: 10%;
}";

print "p.titulo
{
	font-family: tahoma;
	font-size: 15px;
	text-align:center;
	font-weight:bold;
}";

print ".HNT
{
	position:absolute; background: #FFFFFF; width: 300px;
	padding: 8px; border: 1px solid #d9d9d9;
}";

print ".centro {margin:auto}";

print "#login {position:absolute; left:40%; top:176px; width:15%; height:10%; z-index:2;}";

/*#HINT {position:relative;} /*position:absolute; */

print "#topo {margin: 5px; height: 40px;}";

print "#menu {position: absolute; top: 100px; left: 10px; width: 150px; }";

print "#corpo {margin-left: 170px; margin-right: 0px; }";

print ".alerta
{
	position: absolute; top: 30px; left: 30%; width: 50%;  z-index:1;

}";

// print ".loading
// {
// 	position: absolute; top: 150px; left: 50%; width: 50%;  z-index:1;

// }";


print "

	@-webkit-keyframes spinning {
		from {transform: rotate(0deg);}
		to   {transform: rotate(180deg);}
	}
	@keyframes spinning {
		from {transform: rotate(0deg);}
		to   {transform: rotate(180deg);}
	}
	.square {
		width: 50px;
		height: 50px;
		border-width: 5px;
		border-style: solid;
		border-color: #999 #ccc;
		border-radius: 50px;
		-webkit-animation: spinning 0.75s infinite linear;
		animation: spinning 0.75s infinite linear;
	}

	.loading, loading_middle, loading_bottom {
		
		position: fixed;
		
		width: 50px;
		height: 50px;
		top: 200;
		left: 500;
		z-index: 5000;
		
		border-width: 5px;
		border-style: solid;
		border-color: #999 #ccc;
		border-radius: 50px;
		-webkit-animation: spinning 0.75s infinite linear;
		animation: spinning 0.75s infinite linear;
	}

	#loading {
		
		position: fixed;
		
		width: 50px;
		height: 50px;
		top: 200;
		left: 500;
		z-index: 5000;
		
		border-width: 5px;
		border-style: solid;
		border-color: #999 #ccc;
		border-radius: 50px;
		-webkit-animation: spinning 0.75s infinite linear;
		animation: spinning 0.75s infinite linear;
	}
	
	
	
	#square {
		
		position: fixed;
		
		width: 50px;
		height: 50px;
		top: 200;
		left: 500;
		z-index: 5000;
		
		border-width: 5px;
		border-style: solid;
		border-color: #999 #ccc;
		border-radius: 50px;
		-webkit-animation: spinning 0.75s infinite linear;
		animation: spinning 0.75s infinite linear;
	}
";

/*
ESTILOS PARA AS TOOLTIPS
*/
	print "#bubble_tooltip{
		width:300px;
		position:absolute;
		display:none;
	}";
	print "#bubble_tooltip .bubble_top{
		background-image: url('../../includes/css/baloom/bubble_top.png');
		background-repeat:no-repeat;
		height:14px;
	}";
	print "#bubble_tooltip .bubble_middle{
		background-image: url('../../includes/css/baloom/bubble_middle.png');
		background-repeat:repeat-y;
		background-position:bottom left;
		padding-left:7px;
		padding-right:7px;
	}";
	print "#bubble_tooltip .bubble_middle span{
		position:relative;
		top:-8px;
		font-family: Trebuchet MS, Lucida Sans Unicode, Arial, sans-serif;
		font-size:11px;
	}";
	print "#bubble_tooltip .bubble_bottom{
		background-image: url('../../includes/css/baloom/bubble_bottom.png');
		background-repeat:no-repeat;
		background-repeat:no-repeat;
		height:44px;
		position:relative;
		top:-6px;
	}";


//// Calculated from the aspect ration of the content (in case of 16:9 it is 9/16= 0.5625)
//   /* 4x3 Aspect Ratio */
print "
.iframe-container {
	overflow: hidden;
	padding-top: 56.25%;
	position: relative;
  }


.iframe-container-4x3 {
  padding-top: 75%;
}
  .iframe-container iframe {
	 border: 0;
	 height: 80%;
	 left: 0;
	 position: absolute;
	 top: 0;
	 width: 100%;
  }

";
	


/*hack para tratar a camada alfa de imagens png (transparências)*/
if ($_SESSION['s_browser'] =='ie') {
	print "img {behavior: url('pngbehavior.htc');}";
}

/* visible, hidden, collapse */
?>