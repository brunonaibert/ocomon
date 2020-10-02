<?php /*                        Copyright 2020 Flávio Ribeiro

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
 */

ini_set('display_errors', 0);

define("MENU_USUARIO", "<link rel='stylesheet' type='text/css' href='../includes/css/estilos.css.php'>");
define("MENU_ADMIN", "");

// use PHPMailer\PHPMailer\PHPMailer;
// use includes\classes\ConnectPDO;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


function isPHPOlder(){
    if (version_compare(phpversion(), '7.0', '<' )){
        return true;
    }
    return false;
}


if(!isPHPOlder()){
    
    if (!function_exists('mysql_connect()')) {

        function mysql_connect($server,$user,$pass){
            
            return  $GLOBALS["___mysqli_ston"] = mysqli_connect($server,$user,$pass);
        }
    }

    if (!function_exists('mysql_query()')) {

        function mysql_query($query) {
            return mysqli_query($GLOBALS["___mysqli_ston"], $query); 
        }
    }

    if (!function_exists('mysql_select_db()')) {
        
        function mysql_select_db($db, $con) {
            return ((bool)mysqli_query($con, "USE " . $db));
        }
    }

    if (!function_exists('mysql_fetch_array()')){

        function mysql_fetch_array($result){
            return mysqli_fetch_array($result, MYSQLI_ASSOC);
        }
    }

    if (!function_exists('mysql_num_rows()')){
        function mysql_num_rows($result){
            return mysqli_num_rows($result);
        }
    }

    /* function mysql_num_rows($result) {
        return mysqli_num_rows($result);
    } */

    if (!function_exists('mysql_error()')) {
        function mysql_error() {
            return ((is_object($GLOBALS["___mysqli_ston"])) ? mysqli_error($GLOBALS["___mysqli_ston"]) : (($___mysqli_res = mysqli_connect_error()) ? $___mysqli_res : false));
        }
    }

    //Realizar mais testes para confirmar a equivalencia de resultado
    if (!function_exists('mysql_result()')) {
        function mysql_result($res,$row=0,$col=0){ 
            $numrows = mysqli_num_rows($res); 
            if ($numrows && $row <= ($numrows-1) && $row >=0){
                mysqli_data_seek($res,$row);
                $resrow = (is_numeric($col)) ? mysqli_fetch_row($res) : mysqli_fetch_assoc($res);
                if (isset($resrow[$col])){
                    return $resrow[$col];
                }
            }
            return false;
        }
    }


    if (!function_exists('mysql_num_fields()')) {
        function mysql_num_fields($mysql_result){
            return (($___mysqli_tmp = mysqli_num_fields($mysql_result)) ? $___mysqli_tmp : false);
        }
    }	

    if (!function_exists('mysql_fetch_field()')) {
        function mysql_fetch_field($mysql_result, $k = 0){
            return (((($___mysqli_tmp = mysqli_fetch_field_direct($mysql_result, 0)) && is_object($___mysqli_tmp)) ? ( (!is_null($___mysqli_tmp->primary_key = ($___mysqli_tmp->flags & MYSQLI_PRI_KEY_FLAG) ? 1 : 0)) && (!is_null($___mysqli_tmp->multiple_key = ($___mysqli_tmp->flags & MYSQLI_MULTIPLE_KEY_FLAG) ? 1 : 0)) && (!is_null($___mysqli_tmp->unique_key = ($___mysqli_tmp->flags & MYSQLI_UNIQUE_KEY_FLAG) ? 1 : 0)) && (!is_null($___mysqli_tmp->numeric = (int)(($___mysqli_tmp->type <= MYSQLI_TYPE_INT24) || ($___mysqli_tmp->type == MYSQLI_TYPE_YEAR) || ((defined("MYSQLI_TYPE_NEWDECIMAL")) ? ($___mysqli_tmp->type == MYSQLI_TYPE_NEWDECIMAL) : 0)))) && (!is_null($___mysqli_tmp->blob = (int)in_array($___mysqli_tmp->type, array(MYSQLI_TYPE_TINY_BLOB, MYSQLI_TYPE_BLOB, MYSQLI_TYPE_MEDIUM_BLOB, MYSQLI_TYPE_LONG_BLOB)))) && (!is_null($___mysqli_tmp->unsigned = ($___mysqli_tmp->flags & MYSQLI_UNSIGNED_FLAG) ? 1 : 0)) && (!is_null($___mysqli_tmp->zerofill = ($___mysqli_tmp->flags & MYSQLI_ZEROFILL_FLAG) ? 1 : 0)) && (!is_null($___mysqli_type = $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = (($___mysqli_type == MYSQLI_TYPE_STRING) || ($___mysqli_type == MYSQLI_TYPE_VAR_STRING)) ? "type" : "")) &&(!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && in_array($___mysqli_type, array(MYSQLI_TYPE_TINY, MYSQLI_TYPE_SHORT, MYSQLI_TYPE_LONG, MYSQLI_TYPE_LONGLONG, MYSQLI_TYPE_INT24))) ? "int" : $___mysqli_tmp->type)) &&(!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && in_array($___mysqli_type, array(MYSQLI_TYPE_FLOAT, MYSQLI_TYPE_DOUBLE, MYSQLI_TYPE_DECIMAL, ((defined("MYSQLI_TYPE_NEWDECIMAL")) ? constant("MYSQLI_TYPE_NEWDECIMAL") : -1)))) ? "real" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && $___mysqli_type == MYSQLI_TYPE_TIMESTAMP) ? "timestamp" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && $___mysqli_type == MYSQLI_TYPE_YEAR) ? "year" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && (($___mysqli_type == MYSQLI_TYPE_DATE) || ($___mysqli_type == MYSQLI_TYPE_NEWDATE))) ? "date " : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && $___mysqli_type == MYSQLI_TYPE_TIME) ? "time" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && $___mysqli_type == MYSQLI_TYPE_SET) ? "set" : $___mysqli_tmp->type)) &&(!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && $___mysqli_type == MYSQLI_TYPE_ENUM) ? "enum" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && $___mysqli_type == MYSQLI_TYPE_GEOMETRY) ? "geometry" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && $___mysqli_type == MYSQLI_TYPE_DATETIME) ? "datetime" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && (in_array($___mysqli_type, array(MYSQLI_TYPE_TINY_BLOB, MYSQLI_TYPE_BLOB, MYSQLI_TYPE_MEDIUM_BLOB, MYSQLI_TYPE_LONG_BLOB)))) ? "blob" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type && $___mysqli_type == MYSQLI_TYPE_NULL) ? "null" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->type = ("" == $___mysqli_tmp->type) ? "unknown" : $___mysqli_tmp->type)) && (!is_null($___mysqli_tmp->not_null = ($___mysqli_tmp->flags & MYSQLI_NOT_NULL_FLAG) ? 1 : 0)) ) : false ) ? $___mysqli_tmp : false);
        }
    }	



    if (!function_exists('mysql_data_seek()')) {
        function mysql_data_seek($mysql_result, $k = 0){
            return mysqli_data_seek($mysql_result, $k);
        }
    }	

    if (!function_exists('mysql_close()')) {
        function mysql_close(){
            return ((is_null($___mysqli_res = mysqli_close($GLOBALS["___mysqli_ston"]))) ? false : $___mysqli_res); 
        }
    }	

    if (!function_exists('mysql_insert_id()')){
        function mysql_insert_id(){
            return ((is_null($___mysqli_res = mysqli_insert_id($GLOBALS["___mysqli_ston"]))) ? false : $___mysqli_res);
        }
    }

}

if (!function_exists('ereg')) {
    function ereg($pattern, $subject, &$matches = array())
    {
        return preg_match('/' . $pattern . '/', $subject, $matches);
    }
}

if (!function_exists('eregi')) {
    function eregi($pattern, $subject, &$matches = array())
    {
        return preg_match('/' . $pattern . '/i', $subject, $matches);
    }
}

function NVL($VALOR)
{
    if ($VALOR == '') {
        return '&nbsp';
    } else {
        return $VALOR;
    }

}

function NL($colspan = 1)
{ //NEW LINE
    print "<tr><td colspan='" . $colspan . "'>&nbsp;</td></tr>";
}

function valueSeparator($VALUE, $SEP)
{
    $NOTSEP = "";
    if ($SEP == ".") {
        $NOTSEP = ",";
    }

    if ($SEP == ",") {
        $NOTSEP = ".";
    }

    if (strpos($VALUE, $NOTSEP)) {
        $VALUE = str_replace($NOTSEP, $SEP, $VALUE);
    }
    if (!strpos($VALUE, $SEP)) {
        $VALUE .= $SEP . "00";
    }

    return $VALUE;
}

function TRANS($INDEX, $SUGGEST = '', $ASPAS = 1)
{
    $aviso = "";
    //$aviso = "&nbsp;<font color=green>OK</font>";
    $destaca1 = "";
    $destaca2 = "";
    //$destaca1 = "<u>"; $destaca2 = "</u>";
    //$destaca1 = "<font color=green>"; $destaca2 = "</font>";
    if (!isset($_SESSION['s_language'])) {
        $_SESSION['s_language'] = "en.php";
    }

    if (is_file("../../includes/languages/" . $_SESSION['s_language'] . "")) {
        include "../../includes/languages/" . $_SESSION['s_language'] . "";
    } else
    if (is_file("../languages/" . $_SESSION['s_language'] . "")) {
        include "../languages/" . $_SESSION['s_language'] . "";
    } else
    if (is_file("./includes/languages/" . $_SESSION['s_language'] . "")) {
        include "./includes/languages/" . $_SESSION['s_language'] . "";
    } else
    if (is_file("../includes/languages/" . $_SESSION['s_language'] . "")) {
        include "../includes/languages/" . $_SESSION['s_language'] . "";
    } else {

        print "SORRY! WRONG PATH TO THE LANGUAGE FILE!<BR>See ocomon/includes/languages/ to see the available language files!";
        exit;
    }

    if (!isset($TRANS[$INDEX])) {
        if ($ASPAS) {
            return '<font color=red>$TRANS[\'' . $INDEX . '\']="</font>' . $SUGGEST . '<font color=red>";</font>';
        } else {
            return '<font color=red>$TRANS[' . $INDEX . ']="</font>' . $SUGGEST . '<font color=red>";</font>';
        }

    } else {
        return $destaca1 . $TRANS[$INDEX] . $destaca2 . $aviso;
    }

}

function start_session()
{
    static $started = false;
    if (!$started) {
        session_start();
        $started = true;
    }
}

function dump($variavel, $info = "", $cor = 'magenta')
{
    //if ( isLocked() ){
    if (trim($info) != "") {
        echo "<br><font color='" . $cor . "'>" . $info . "</font>";
    }

    if (is_array($variavel)) {
        echo "<pre>";
        print_r($variavel);
        echo "</pre>";
    } else {
        echo "<pre>";
        echo $variavel;
        echo "</pre>";
    }
    //}
}

function normaliza($str)
{
    //$str2 = $str;
    //$str2 = toHtml($str2);
    return toHtml($str);
}

function reIndexArray(&$array)
{
    $tmpArray = array();

    if (is_array($array)) {
        $array = array_unique($array);
        foreach ($array as $value) {
            $tmpArray[] = $value;
        }
        //unset ($array);
        for ($i = 0; $i <= count($array); $i++) {
            array_pop($array);
        }
    }

    $array = $tmpArray;
}

function reIndexArray2(&$array)
{
    $tmpArray = array();

    $array = array_unique($array);
    foreach ($array as $value) {
        if ($value != "") {
            $tmpArray[] = $value;
        }

    }
    //unset ($array);
    for ($i = 0; $i < count($array); $i++) {
        array_pop($array);
    }

    $array = $tmpArray;
}

function conecta($host, $bd, $user, $senha, $sistema)
{
    // $host = servidor do mysql, $bd = nome do banco de dados, $user = usuário do mysql, $senha = senha dp mysql, $sistema = sistema que esta sendo usado
    $conexao = mysql_connect($host, $user, $senha) or die(mysql_error());
    $db = mysql_select_db($bd, $conexao);
    if ($conexao == 0) {
        $retorno = "ERRO DE CONEXÃO - Servidor " . $host . " - Sistema " . $sistema . "<br>";
    } else
    if ($db == 0) {
        $retorno = "ERRO DE CONEXÃO - Banco de dados " . $bd . " - Sistema " . $sistema . "<br>";
    } else {
        $retorno = "ok";
    }
    return $retorno;
}

function desconecta($conexao)
{
    mysql_close($conexao);
}

function senha_system($user, $password, $tabela)
{
    // $user = usuário para login, $senha = senha do usuário, $tabela = nome da tabela de usuários
    $login = md5($password);

    $user = filter_var($user, FILTER_SANITIZE_STRIPPED);
    
    $query = "SELECT * from " . $tabela . " where (login = '" . $user . "' and password = '" . $login . "')";

    $resultado = mysql_query($query) or die(mysql_error());
    if ($resultado == false) {
        $retorno = "ERRO DE LOGIN - Tabela " . $tabela . "<br>";
    } else
    if (mysql_num_rows($resultado) == 0) {
        $retorno = "ERRO DE LOGIN - Usuário " . $user . "<br>";
    } else {
        $retorno = "ok";
    }
    return $retorno;
}

function senha_ldap($user, $password, $tabela)
{
    // $user = usuário para login, $senha = senha do usuário, $tabela = nome da tabela de usuários
    $login = md5($password);
    $query = "SELECT * from $tabela where (login = '$user')";

    $resultado = mysql_query($query) or die(mysql_error());
    if ($resultado == 0) {
        $retorno = "ERRO DE LOGIN - Tabela $tabela<br>";
    } else
    if (mysql_num_rows($resultado) == 0) {
        $retorno = "ERRO DE LOGIN - Usuário $user<br>";
    } else {
        $retorno = "ok";
    }
    return $retorno;
}

function geraLog($filename, $data, $usuario, $pagina, $acao)
{
    $conteudo = "DATA: $data\t";
    $conteudo .= "USUÁRIO: $usuario\t";
    $conteudo .= "PAGINA: $pagina\t";
    $conteudo .= " AÇÃO: $acao\t";
    $conteudo .= "\n";

    if (is_writable($filename)) {

        if (!$handle = fopen($filename, 'a')) {
            $warning = "O arquivo não pode ser aberto (" . $filename . ")!";
            exit;
        }
        if (!fwrite($handle, $conteudo)) {
            $warning = "O arquivo não pode ser escrito (" . $filename . ")!";
            exit;
        }
        $warning = "Sucesso, (" . $conteudo . ") escrito no arquivo (" . $filename . ")!";
        fclose($handle);

    } else {
        $warning = "O arquivo " . $filename . " não tem permissão de escrita!";
    }

    return $warning;
}

###############################################################################

#################################################################################
function cabecalho($logo, $msg1, $msg2, $titulo)
{
    return "
		<table width=80% border='0' cellspacing='1' cellpadding='1' align='center' bgcolor='black' class='center'>
		  <tr bgcolor=#FFFFFF>
		    <td width=30%>
		      <div align=center><font size=3 face=Arial, sans-serif><img src=./$logo></font></div>
		    </td>
		    <td width=40%>
		      <div align=center><font size=3 face=Arial, sans-serif> <b>$msg1</b></font></div>
		    </td>
		    <td width=30%>
		      <div align=center><font size=3 face=Arial, sans-serif><b><font size=2>$msg2</font></b></font></div>
		    </td>
		  </tr>
		  <tr bgcolor=#FFFFFF>
		    <td colspan=3>
		      <div align=center><font size=2 face=Arial, sans-serif><b>$titulo</b></font></div>
		    </td>
		  </tr>
		</table>

	";
}

function testaArea($area, $rowArea, $horarios)
{

    if (array_key_exists($rowArea, $horarios)) { //verifica se o código da área possui carga horária definida no arquivo config.inc.php
        $area = $rowArea; //Recebe o valor da área de atendimento do chamado
    } else {
        $area = 1;
    }
    //Carga horária default definida no arquivo config.inc.php
    return $area;
}

###################################################################################################

//TIPO: tipo de relatório - formatação específica
//SQL: Query no banco de dados
//CAMPOS: Array com o nome dos campos que eu quero imprimir no relatório
//HEADERS: Array com os cabeçalhos de cada coluna do relatório
function gera_relatorio($tipo, $sql, $campos, $headers, $logo, $msg1, $msg2, $msg3)
{
    //Estilo aplicado nos relatórios
    print "<style type=\"text/css\"><!--";
    print "table.relatorio_1 {width:80%; margin-left:auto; margin-right: auto; text-align:left;
					border: 0px; border-spacing:1 ;background-color:white; padding-top:10px;
					page-break-after: auto;}";
    print "td.linha {font-family:arial; font-size:12px; line-height:0.8em;}";
    print "td.linha_par {font-family:arial; font-size:12px; line-height:0.8em; background-color:#EAEAEA}";
    print "td.linha_impar {font-family:arial; font-size:12px; line-height:0.8em;background-color:#C8C8C8}";
    print "td.cabs {font-family:arial; font-size:12px; font-weight:bold; background-color: #A3A352;}";
    print "td.foot {font-family:arial; font-size:12px; font-weight:bold; line-height:0.8em; background-color: #A8A8A8;}";
    //print "{page-break-after: always;}";
    print "--></STYLE>";

    if (count($campos) != count($headers)) { //Verifica se cada campo da tabela possui um header!
        print "O número de campos não fecha com o número de headers!";
        exit;
    } //if campos == headers

    $commit = mysql_query($sql);
    $linhas = mysql_num_rows($commit);
    $k = 0;
    $fields = "";
    $total = "";
    while ($k < mysql_num_fields($commit)) { //quantidade de campos retornados da consulta
        
        if (isPHPOlder()){
            $field = mysql_fetch_field($commit, $k); //Retorna um objeto com informações dos campos
        } else {
            $field = mysqli_fetch_field($commit); //Retorna um objeto com informações dos campos
        }
        
        $fields .= $field->name; //Joga os nomes dos campos para uma string
        $k++;
    } // while

    if ($linhas == 0) {
        print "Nenhuma linha retornada pela consulta";
    } else {
        print cabecalho($logo, $msg1, $msg2, $msg3);

        if ($tipo == 1 || $tipo == 0) { //Tipo definido de relatório //
            print "<TABLE class=\"relatorio_1\" cellpadding=4>";
            print "<tr>";
            for ($i = 0; $i < count($headers); $i++) {
                print "<td class=\"cabs\">" . $headers[$i] . "</td>";
            } //for
            print "</tr>";
            $l = 0; //variável que controla se a linha é par ou impar
            while ($row = mysql_fetch_array($commit)) {
                if ($l % 2) {
                    $par_impar = "_par";
                } else {
                    $par_impar = "_impar";
                } //if - else
                print "<tr>";
                for ($i = 0; $i < count($campos); $i++) { //IMPRIME CAMPO A CAMPO
                    print "<td class=\"linha$par_impar\">";
                    $sep = explode(",", $campos[$i]); //Se algum campo passado tem mais de um argumento é separado
                    for ($j = 0; $j < count($sep); $j++) {
                        $pos = strpos($fields, $sep[$j]); //Verifica na string gerada se o argumento passado existe como um nome de campo
                        if ($pos === false) {
                            print $sep[$j]; //Se o campo não existe é impresso literalmente
                        } else {
                            print $row[$sep[$j]];
                        }
                        //Se o campo existe é impresso seu valor;
                    } //for J//
                    print "</td>";
                } //for i//
                print "</tr>";
                $l++;
            } // while
            //RODAPÉ
            print "<tr>";
            for ($i = 0; $i < count($campos); $i++) { //IMPRIME CAMPO A CAMPO
                if ($i == count($campos) - 1) {
                    $total = $linhas;
                } else
                if ($i == count($campos) - 2) {
                    $total = "TOTAL";
                }
                print "<td class=\"foot\">$total</td>";
            } //for
            print "</tr>";
            print "</table>";
        } else

        if ($tipo == 2) { //Outra formatação para saída do relatório//
            print "<table class=\"relatorio_1\">";
            while ($row = mysql_fetch_array($commit)) {
                //print "<tr>";
                for ($i = 0; $i < count($campos); $i++) { //IMPRIME CAMPO A CAMPO
                    print "<tr>";
                    //print "<td>".$headers[$i]."</td>";
                    print "<td>";
                    $sep = explode(",", $campos[$i]); //Se algum campo passado tem mais de um argumento é separado
                    for ($j = 0; $j < count($sep); $j++) {
                        $pos = strpos($fields, $sep[$j]); //Verifica na string gerada se o argumento passado existe como um nome de campo
                        if ($pos === false) {
                            print $sep[$j]; //Se o campo não existe é impresso literalmente
                        } else {
                            print $row[$sep[$j]]; //Se o campo existe é impresso seu valor;
                        }
                        //print "</td>";
                    } //for J//
                    print "</td>";

                } //for i//
                print "</tr>";
            } //while
            print "</table>";
        } //fim do tipo==2 //
    } //else linhas != 0 //
} //função

function menu_admin()
{
    return "";
}

function veremail($email)
{
    if (!eregi("^[0-9a-z]([-_.]?[0-9a-z])*@[0-9a-z]([-.]?[0-9a-z])*\\.[a-z]{2,3}$", $email)) {
        $passou = "erro";
    } else {
        $passou = "ok";
    }

    return $passou;
}

function mensagem($msg)
{

    return "<TABLE class='msg center' " . //#EFEFE7  "STYLE='{border-bottom:  solid #999999; border-top:  thin solid #999999; border-left:thin  ".
    //"solid #999999; border-right: thin solid #999999; }' ".
    "cellspacing='1' border='0' cellpadding='1' align='center' width='320'>" . //#5E515B
    "<TR>" .
        "<TD align='center'><b>" . $msg . "<b></td>" .
        "</TR>" .
        "</TABLE>";

}

################################################################################

function putComma($vetor)
{
    $chamados = "";
    if (is_array($vetor)) {

        if (count($vetor) >= 1) {

            for ($i = 0; $i < count($vetor); $i++) {
                $chamados .= "$vetor[$i],";
            }
            if (strlen($chamados) > 0) {
                $chamados = substr($chamados, 0, -1);
            }
        } else
        //$chamados = $vetor[0];
        {
            $chamados = $vetor;
        }
    } else {
        $chamados = $vetor;
    }

    return $chamados;
}

###############################################################################

function converte_dma_para_amd($dataform) //converte a data do formato dd/mm/aaaa para aaaa-mm-dd

{
    if (empty($dataform)) {
        $data = "";
    } else {

        if (strpos($dataform, " ")) {
            $datatransHora = explode(" ", $dataform);

            $hora = $datatransHora[1];
            $datatrans = $datatransHora[0];
        } else {
            $hora = "00:00:00";
            $datatrans = $dataform;
        }
        if (strpos($datatrans, "-")) {
            $datatransf = explode("-", $datatrans);
        } else {
            $datatransf = explode("/", $datatrans);
        }

        $data = "$datatransf[2]-$datatransf[1]-$datatransf[0]";
    }
    return $data;
}

function converte_datacomhora($dataform) //pega a data do formato aaaa-mm-dd +hora, e transforma p/ dd-mm-aaaa +hora

{
    if (empty($dataform)) {
        $datacompleta = "";
    } else {
        //separando o dia e a hora
        $data_hora = explode(" ", $dataform);
        $data = "$data_hora[0]";
        $hora = "$data_hora[1]";

        //formatando o dia em dd-mm-aaaa
        $datatransf = explode("-", $data);
        $data = "$datatransf[2]/$datatransf[1]/$datatransf[0]";
        $datacompleta = $data . " " . $hora;
    }
    return $datacompleta;
}

################################################################################

function date_difference($data1, $data2)
{

    if ($data1 > $data2) {
        $temp = $data1;
        $data1 = $data2;
        $data2 = $temp;
    }
    $s = strtotime($data2) - strtotime($data1);
    $d = intval($s / 86400);
    $s -= $d * 86400;
    $h = intval($s / 3600);
    $s -= $h * 3600;
    $m = intval($s / 60);
    $s -= $m * 60;

    $v = $d . " dias, " . $h . ":" . $m . ":" . $s;
    return $v;
}

function date_diff2($data1, $data2)
{
    $s = strtotime($data2) - strtotime($data1);
    $d = intval($s / 86400);
    $s -= $d * 86400;
    $h = intval($s / 3600);
    $s -= $h * 3600;
    $m = intval($s / 60);
    $s -= $m * 60;

    $v = $d;
    return $v;
}

function date_diff_dias($data1, $data2)
{
    if (empty($data1) || empty($data2)) {
        $v = "";
    } else {
        $s = strtotime($data2) - strtotime($data1);
        $d = intval($s / 86400);
        $s -= $d * 86400;
        $h = intval($s / 3600);
        $s -= $h * 3600;
        $m = intval($s / 60);
        $s -= $m * 60;

        $v = $d;
    }
    return $v;
}

function segundos_em_horas($segundos)
{

    $h = 0;
    $m = 0;

    while ($segundos >= 60) {
        if ($segundos >= 3600) {
            while ($segundos >= 3600) { //ORDEM DE HORAS
                $segundos -= 3600;
                $h += 1;
            }
        } else
        if ($segundos >= 60) {
            while ($segundos >= 60) { //ORDEM DE MINUTOS
                $segundos -= 60;
                $m += 1;
            }
        }
    }

    if (strlen($h) == 1) {$h = "0" . $h;}
    ; //Coloca um zero antes
    if (strlen($m) == 1) {$m = "0" . $m;}
    ; //Coloca um zero antes
    if (strlen($segundos) == 1) {$segundos = "0" . $segundos;}
    ; //Coloca um zero antes

    $horas = $h . ":" . $m . ":" . $segundos;

    return $horas;
}

##UTILIZAR SEMPRE PARA GRAVAR NO BANCO
function FDate($data, $time = true)
{ //Retorna saída no formado AAAA-MM-DD HH:mm:SS

    if (!empty($data)) {
        $ano = 0;
        $mes = 0;
        $dia = 0;
        $hora = 0;
        $minuto = 0;
        $segundo = 0;
        $Time = "00:00:00";

        $DateParts = explode(" ", $data);
        $Date = $DateParts[0];
        if (isset($DateParts[1])) {
            $Time = $DateParts[1];
        }

        //formato brasileiro com hora!!!
        if (ereg("([0-9]{1,2})[\/|-]([0-9]{1,2})[\/|-]([0-9]{4}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $Date . " " . $Time, $sep)) {

            $dia = $sep[1];
            $mes = $sep[2];
            $ano = $sep[3];
            $hora = $sep[4];
            $minuto = $sep[5];
            $segundo = $sep[6];
        } else
        //formato americano com hora
        if (ereg("([0-9]{4})[\/|-]([0-9]{1,2})[\/|-]([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $Date . " " . $Time, $sep)) {
            $dia = $sep[3];
            $mes = $sep[2];
            $ano = $sep[1];
            $hora = $sep[4];
            $minuto = $sep[5];
            $segundo = $sep[6];
        } else {
            print "Invalid date format!!";
        }

        if ($time) {
            $data = $ano . "-" . $mes . "-" . $dia;
        } else {
            $data = $ano . "-" . $mes . "-" . $dia . " " . $hora . ":" . $minuto . ":" . $segundo;
        }

        return $data;
    } else {
        return "0000-00-00 00:00:00";
    }

//...
}

#######################################################
## Exibe a data formatada conforme definido no menu de administração
function formatDate($DATE, $TIMEFORMAT = "")
{
    if ($DATE != "0000-00-00 00:00:00" && !empty($DATE)) {
        //if($DATE != "0000-00-00 00:00:00") {
        if (strtotime($DATE) != -1) {
            //DATE = "2007/05/25"; //Always American format
            $Date = $_SESSION['s_date_format'];

            if ($TIMEFORMAT != "") {
                if (strpos($_SESSION['s_date_format'], " ")) {
                    $DateParts = explode(" ", $_SESSION['s_date_format']);
                    $Date = $DateParts[0];
                    $Time = $DateParts[1];
                }
            }
            //$output = strftime($Date.$TIMEFORMAT, strtotime($DATE));
            $output = strftime($Date, strtotime($DATE));

            return $output;
        } else {
            return "INVALID DATE FORMAT!";
        }

    } else {
        return "";
    }
}

function diff_em_segundos($data1, $data2)
{

    $data1 = FDate($data1);
    $data2 = FDate($data2);

    $s = strtotime($data2) - strtotime($data1);
    $secs = $s;

    $d = intval($s / 86400);
    $s -= $d * 86400;
    $h = intval($s / 3600);
    $s -= $h * 3600;
    $m = intval($s / 60);
    $s -= $m * 60;

    if (strlen($h) == 1) {$h = "0" . $h;}
    ; //Coloca um zero antes
    if (strlen($m) == 1) {$m = "0" . $m;}
    ; //Coloca um zero antes
    if (strlen($s) == 1) {$s = "0" . $s;}
    ; //Coloca um zero antes

    $v = $d . " dias " . $h . ":" . $m . ":" . $s;
    $min = $m;

    $dias = $d;

    $horas = $h;
    $minutos = $m;
    $segundos = $s;

    $dias *= 86400; //Dia de 24 horas
    $horas *= 3600;
    $minutos *= 60;
    $segundos += $dias + $horas + $minutos;

    $h = intval($segundos / 3600);
    $m = intval($segundos / 60);

    return $secs;
}

function datam($dataform) //pega a data informada, e formata dd-mm-aaaa c/ a hora atual

{
    if (empty($dataform)) {
        $data = "";
    } else {
        $data = "";
        $datatrans = array();
        $datatransHora = array();
        //$dataArray = array();

        if (strpos($dataform, " ")) {
            $datatransHora = explode(" ", $dataform);

            $hora = $datatransHora[1];
            $datatrans = $datatransHora[0];
        } else {
            $datatransHora[0] = $dataform;
            $hora = strftime("%H:%M:%S");
        }

        if (strpos($datatransHora[0], "-")) {
            $datatrans = explode("-", $datatransHora[0]);
        } else
        if (strpos($datatransHora[0], "/")) {
            $datatrans = explode("/", $datatransHora[0]);
        }
        $data = $datatrans[2] . "-" . $datatrans[1] . "-" . $datatrans[0];
        $data = $data . " " . $hora;
    }
    return $data;
}

function datam2($dataform)
{
    if (empty($dataform)) {
        $data = "";
    } else {
        $datatrans = explode("-", $dataform);
        $data = "$datatrans[2]/$datatrans[1]/$datatrans[0]";
        $hora = strftime("%H:%M:%S");
        $data = $data . " " . $hora;
    }
    return $data;
}

function inteiro($string)
{

    settype($string, "integer");
    return $string;
}

function horaAhora($valor, $hora)
{

    for ($i = 1; $i <= $valor; $i++) {
        if ($hora >= 23) {
            $hora = -1;
        }
        $hora++;
    }
    return $hora;
}

function datab($dataform)
{
    if (empty($dataform)) {
        $data = "";
    } else {
        $hora = substr($dataform, 11, 17);
        $data = substr($dataform, 0, 10);
        $datatrans = explode("-", $data);
        $data = "$datatrans[2]/$datatrans[1]/$datatrans[0]";
        $data = $data . " " . $hora;
    }
    return $data;
}
function datab2($dataform)
{
    if (empty($dataform)) {
        $data = "";
    } else {
        $hora = substr($dataform, 11, 17);
        $data = substr($dataform, 0, 10);
        $datatrans = explode("-", $data);
        $data = "$datatrans[2]/$datatrans[1]/$datatrans[0]";
    }

    return $data;
}

function dataRED($dataform)
{
    //Formato de Data Reduzido
    $hora = substr($dataform, 11, 17);
    $data = substr($dataform, 0, 10);

    $hora = substr($hora, 0, 5);

    $datatrans = explode("-", $data);
    $anored = substr($datatrans[0], 2, 2);
    $data = "$datatrans[2]/$datatrans[1]/$anored";
    $data = $data . "-" . $hora;

    return $data;
}
#################################################################################

function ajusta($palavra, $num)
{
    $limite = $num;
    $i = strlen($palavra);
    while ($i < $limite) {
        $palavra .= '-';
        $i++;
    }

    return $palavra;

}

################################################################################

function noHtml($string)
{
    return filter_var($string, FILTER_SANITIZE_STRIPPED);
}

function toHtml($string)
{

    $trans_tbl = get_html_translation_table(HTML_ENTITIES);
    $trans_tbl = array_flip($trans_tbl);
    return strtr($string, $trans_tbl);
}

function isIn($pattern, $values)
{

    $found = false;
    if (strpos($values, ",")) {
        $valuesArray = explode(",", $values);

        for ($i = 0; $i < count($valuesArray); $i++) {
            if ($valuesArray[$i] == (int) $pattern) {
                $found = true;
            }

        }

    } else
    if ($values == (int) $pattern) {
        $found = true;
    }

    return $found;
}

function sepComma($value, $array)
{
    if (strpos($value, ",")) {
        $array = explode(",", $value);

    } else {
        $array = $value;
    }

    return (array)$array;
}

function random()
{
    $rand = "";
    for ($i = 0; $i < 10; $i++) {
        $rand .= mt_rand(1, 300);
    }

    return ($rand);
}

function transbool($bool)
{
    if ($bool == 0) {
        $trans = TRANS('NOT');
    } else
    if ($bool == 1) {
        $trans = TRANS('YES');
    } else {
        $trans = $bool;
    }

    return $trans;
}

function transvars($msg, $arrayEnv)
{

    foreach ($arrayEnv as $id => $var) {
        $msg = str_replace($id, $var, $msg);
    }

    return $msg;
}

//NOVA VERSAO DO PHPMAILER - ATUALIZADO PARA O ENVIO DE VOUCHER COMO ANEXO NAS MENSAGENS
function send_mail($event, $e_destino, $mailConf, $msgConf, $envVars, $attach = '')
{

    //$event: Tipo de evento, os eventos são definidos pela situação (abertura, edição ou assentamento)
    //e pelo destino (usuário, operador ou área)
    //$e_destino: e-mail de destino
    //$mailConf: array com as informações de conexão smtp
    //$msgConf: array com as informações de mensagem
    //$envVar: array com as variáveis de ambiente

    if (is_file("./.root_dir")) {

        if (!class_exists(PHPMailer::class)) {
            require __DIR__ . "/../components/PHPMailer-master/src/Exception.php";
            require __DIR__ . "/../components/PHPMailer-master/src/PHPMailer.php";
            require __DIR__ . "/../components/PHPMailer-master/src/SMTP.php";
        }

    } else {

        if (!class_exists(PHPMailer::class)) {
            require __DIR__ . "/../components/PHPMailer-master/src/Exception.php";
            require __DIR__ . "/../components/PHPMailer-master/src/PHPMailer.php";
            require __DIR__ . "/../components/PHPMailer-master/src/SMTP.php";
        }
    }

    $mail = new PHPMailer;
    //Tell PHPMailer to use SMTP
    $mail->isSMTP();
    /*
    if ($mailConf['mail_issmtp']) {
    $mail->IsSMTP();
    } // set mailer to use SMTP
     */

    //Enable SMTP debugging
    // 0 = off (for production use)
    // 1 = client messages
    // 2 = client and server messages
    $mail->SMTPDebug = 0;
    //Set the hostname of the mail server
    //$mail->Host = 'smtp.office365.com';
    $mail->Host = $mailConf['mail_host']; // specify main and backup server
    // use
    // $mail->Host = gethostbyname('smtp.gmail.com');
    // if your network does not support SMTP over IPv6
    //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
    // $mail->Port = 587;
    $mail->Port = $mailConf['mail_port'];
    //Set the encryption system to use - ssl (deprecated) or tls
    // $mail->SMTPSecure = 'tls';
    $mail->SMTPSecure = $mailConf['mail_secure'];
    //Whether to use SMTP authentication
    //$mail->SMTPAuth = true;
    $mail->SMTPAuth = $mailConf['mail_isauth']; // turn on SMTP authentication

    //Username to use for SMTP authentication - use full email address for gmail
    //$mail->Username = "chamados.ocomon@pointercielo.com.br";
    $mail->Username = $mailConf['mail_user']; // SMTP username
    //Password to use for SMTP authentication
    //$mail->Password = "Oc0m0n@37";
    $mail->Password = $mailConf['mail_pass']; // SMTP password
    //Set who the message is to be sent from
    //$mail->setFrom('chamados.ocomon@pointercielo.com.br', 'CHAMADOS POINTER');
    $mail->setFrom($mailConf['mail_from'], $msgConf['msg_fromname']);
    //Set an alternative reply-to address
    //$mail->addReplyTo('flaviorib@gmail.com', 'Flavio Ribeiro');
    //Set who the message is to be sent to
    //$mail->addAddress('flaviorib@gmail.com', 'Flavio Ribeiro');

    $sepTo = explode(",", $e_destino);
    if (is_array($sepTo)) {
        $recipients = count($sepTo);
    } else {
        $recipients = 1;
    }

    for ($i = 0; $i < $recipients; $i++) {
        $mail->addAddress(trim($sepTo[$i]));
    }

    //Set the subject line
    //$mail->Subject = 'MENSAGEM DE TESTE DO PHPMAILER';
    $mail->Subject = utf8_decode(transvars($msgConf['msg_subject'], $envVars));
    //Read an HTML message body from an external file, convert referenced images to embedded,
    //convert HTML into a basic plain-text alternative body

    //$mail->msgHTML(file_get_contents('contents.html'), __DIR__);
    //$mail->msgHTML('MENSAGEM DE TEXTO PARA TESTE');
    $mail->msgHTML(transvars($msgConf['msg_body'], $envVars));
    //Replace the plain text body with one created manually
    //$mail->AltBody = 'This is a plain-text message body';
    $mail->AltBody = nl2br(transvars($msgConf['msg_altbody'], $envVars));
    //Attach an image file
    //$mail->addAttachment('images/phpmailer_mini.png');
    if (!empty($attach)) {
        $mail->addAttachment($attach);
    }

    //send the message, check for errors
    if (!$mail->send()) {
        echo "Mailer Error: " . $mail->ErrorInfo;
    } else {
        //echo "Message sent!";
        //Section 2: IMAP
        //Uncomment these to save your message in the 'Sent Mail' folder.
        #if (save_mail($mail)) {
        #    echo "Message saved!";
        #}
    }
}

function mail_send($mailConf, $to, $cc, $subject, $body, $replyto, $envVars)
{

    //$mailConf: array com as informações de conexão smtp

    if (is_file("./.root_dir")) {

        dump(__DIR__);

        if (!class_exists(PHPMailer::class)) {

            require __DIR__ . "/../components/PHPMailer-master/src/Exception.php";
            require __DIR__ . "/../components/PHPMailer-master/src/PHPMailer.php";
            require __DIR__ . "/../components/PHPMailer-master/src/SMTP.php";
          
        }

    } else {

        dump(__DIR__);
        if (!class_exists(PHPMailer::class)) {
            require __DIR__ . "/../components/PHPMailer-master/src/Exception.php";
            require __DIR__ . "/../components/PHPMailer-master/src/PHPMailer.php";
            require __DIR__ . "/../components/PHPMailer-master/src/SMTP.php";
           
        }
    }

    $mail = new PHPMailer;
    //Tell PHPMailer to use SMTP
    //$mail->isSMTP();
    if ($mailConf['mail_issmtp']) {
        $mail->IsSMTP();
    }

    //Enable SMTP debugging
    // 0 = off (for production use)
    // 1 = client messages
    // 2 = client and server messages
    $mail->SMTPDebug = 2;
    //Set the hostname of the mail server
    //$mail->Host = 'smtp.office365.com';
    $mail->Host = $mailConf['mail_host']; // specify main and backup server
    // use
    // $mail->Host = gethostbyname('smtp.gmail.com');
    // if your network does not support SMTP over IPv6
    //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
    // $mail->Port = 587;
    $mail->Port = $mailConf['mail_port'];
    //Set the encryption system to use - ssl (deprecated) or tls
    // $mail->SMTPSecure = 'tls';
    $mail->SMTPSecure = $mailConf['mail_secure'];
    //Whether to use SMTP authentication
    //$mail->SMTPAuth = true;
    $mail->SMTPAuth = $mailConf['mail_isauth']; // turn on SMTP authentication

    //Username to use for SMTP authentication - use full email address for gmail
    //$mail->Username = "chamados.ocomon@pointercielo.com.br";
    $mail->Username = $mailConf['mail_user']; // SMTP username
    //Password to use for SMTP authentication
    //$mail->Password = "Oc0m0n@37";
    $mail->Password = $mailConf['mail_pass']; // SMTP password
    //Set who the message is to be sent from
    //$mail->setFrom('chamados.ocomon@pointercielo.com.br', 'CHAMADOS POINTER');
    $mail->setFrom($mailConf['mail_from'], $mailConf['mail_from_name']);
    //Set an alternative reply-to address
    //$mail->addReplyTo('flaviorib@gmail.com', 'Flavio Ribeiro');
    //Set who the message is to be sent to
    //$mail->addAddress('flaviorib@gmail.com', 'Flavio Ribeiro');

    $mail->AddReplyTo($replyto, $mailConf['mail_from_name']);

    //$mail->msgHTML(file_get_contents('contents.html'), __DIR__);
    //$mail->msgHTML('MENSAGEM DE TEXTO PARA TESTE');
    // $mail->msgHTML(transvars($msgConf['msg_body'],$envVars));
    $mail->msgHTML(nl2br(transvars($body, $envVars)));

    //Replace the plain text body with one created manually
    //$mail->AltBody = 'This is a plain-text message body';
    // $mail->AltBody = nl2br(transvars($msgConf['msg_altbody'],$envVars));
    $mail->AltBody = nl2br(transvars($body, $envVars));

    //     $mail->AddAddress($to);
    //     if (isset($cc) && $cc!=""){
    //         $mail->AddCC($cc);
    //     }

    $sepTo = explode(",", $to);
    if (is_array($sepTo)) {
        $recipients = count($sepTo);
    } else {
        $recipients = 1;
    }

    for ($i = 0; $i < $recipients; $i++) {
        $mail->AddAddress(trim($sepTo[$i]));
    }

    if (isset($cc) && $cc != "") {

        $sepCC = explode(",", $cc);

        if (is_array($sepCC)) {
            $copies = count($sepCC);
        } else {
            $copies = 1;
        }

        for ($i = 0; $i < $copies; $i++) {
            $mail->AddCC(trim($sepCC[$i]));
        }
    }

    //$mail->Subject = $subject;
    $mail->Subject = utf8_decode(transvars($subject, $envVars));

    ## TO USE ONLY FOR DEVELOPERS WHEN DEBUGING
    // dump ($mailConf['mail_issmtp'],'IsSMTP');
    // dump ($mail->Host,'Host');
    // dump ($mail->SMTPAuth,'SMTPAuth');
    // dump ($mail->Username,'Username');
    // dump ($mail->Password,'Password');
    // dump ($mail->From,'From');
    // dump ($mailConf['mail_ishtml'],'IsHTML');
    // dump ($mail->FromName,'FromName');
    // dump ($to,'AddAddress');
    // dump ($msgConf['msg_replyto'],'AddReplyTo');
    // dump ($mail->Subject,'Subject');
    // dump ($mail->Body,'Body');
    // dump ($mail->AltBody,'AltBody');
    // exit;

    if (!$mail->Send()) {
        echo "A mensagem não pôde ser enviada. <p>";
        echo "Mailer Error: " . $mail->ErrorInfo;
        // exit;
        return;
    }

    return true;
}

function showArray($array)
{
    print "<pre>";
    print_r($array);
    print "</pre>";
    return true;
}

function isImage($type)
{
    if (eregi("^image\/(pjpeg|jpeg|png|gif|x-ms-bmp)$", $type)) {
        return true;
    } else {
        return false;
    }

}

function noSpace($WORD)
{

    $newWord = trim(str_replace(" ", "_", $WORD));
    return $newWord;
}

function upload($img_file, $config, $FILE_TYPES = "%%IMG%")
{
    // Prepara a variável caso o formulário tenha sido postado
    $arquivo = isset($_FILES[$img_file]) ? $_FILES[$img_file] : false;

/*    $config = array();
// Tamano máximo da imagem, em bytes
$config["tamanho"] = 307200; //Aproximadamente 300k
// Largura Máxima, em pixels
$config["largura"] = 800;
// Altura Máxima, em pixels
$config["altura"] = 600;*/

    $saida = "OK";

    if ($arquivo) {
        $erro = array();

        // Verifica o mime-type do arquivo para ver se é de imagem.
        // Caso fosse verificar a extensão do nome de arquivo, o código deveria ser:
        //
        // if(!eregi("\.(jpg|jpeg|bmp|gif|png){1}$", $arquivo["name"])) {
        //      $erro[] = "Arquivo em formato inválido! A imagem deve ser jpg, jpeg, bmp, gif ou png. Envie outro arquivo"; }
        //
        // Mas, o que ocorre é que alguns usuários mal-intencionados, podem pegar um vírus .exe e simplesmente mudar a extensão
        // para alguma das imagens e enviar. Então, não adiantaria em nada verificar a extensão do nome do arquivo.

        $mime = array();

        $TYPE = explode("%", $FILE_TYPES);

        reIndexArray2($TYPE);

        $DOCX = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
        $XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        $PPTX = "application/vnd.openxmlformats-officedocument.presentationml.presentation";
        $PPSX = "application/vnd.openxmlformats-officedocument.presentationml.slideshow";

        $mime['PDF'] = "application\/pdf";
        $mime['TXT'] = "text\/plain";
        $mime['RTF'] = "application\/rtf";
        $mime['HTML'] = "text\/html";
        $mime['IMG'] = "image\/(pjpeg|jpeg|png|gif|x-ms-bmp)";

        $mime['ODF'] = "application\/vnd.oasis.opendocument.(text|spreadsheet|presentation|graphics)";
        $mime['OOO'] = "application\/vnd.sun.xml.(writer|calc|draw|impress)";
        $mime['MSO'] = "application\/(msword|vnd.ms-excel|vnd.ms-powerpoint)";

        $mime['NMSO'] = "application\/vnd.openxmlformats-officedocument.(wordprocessingml.document|spreadsheetml.sheet|presentationml.presentation|presentationml.slideshow)";

        //application/vnd.ms-powerpoint
        //application/vnd.sun.xml.writer; application/vnd.sun.xml.calc; application/vnd.sun.xml.draw; application/vnd.sun.xml.impress

        //if(preg_match('/^(.*)\.(doc|txt|pdf|xls|htm|html|rtf)$/', $arquivo["type"])) //application/pdf
        //if(!eregi("^image\/(pjpeg|jpeg|png|gif|bmp)$", $arquivo["type"])) {

        $typeOK = false;
        $types = "";
        for ($i = 0; $i < count($TYPE); $i++) {
            if (strlen($types) > 0) {
                $types .= ", ";
            }

            //$types.=$TYPE[$i];
            if ($TYPE[$i] == "IMG") {
                $types .= "jpeg, png, gif, bmp";
            } else
            if ($TYPE[$i] == "PDF") {
                $types .= "pdf";
            } else
            if ($TYPE[$i] == "TXT") {
                $types .= "txt";
            } else
            if ($TYPE[$i] == "RTF") {
                $types .= "rtf";
            } else
            if ($TYPE[$i] == "HTML") {
                $types .= "html";
            } else
            if ($TYPE[$i] == "ODF") {
                $types .= "odt, ods, odp, odg";
            } else
            if ($TYPE[$i] == "O00") {
                $types .= "sxw, sxc, sxi, sxd";
            } else
            if ($TYPE[$i] == "MSO") {
                $types .= "doc, xls, ppt";
            } else
            if ($TYPE[$i] == "NMSO") {
                $types .= "docx, xlsx, pptx, ppsx";
            }

            if (preg_match("/^" . $mime[$TYPE[$i]] . "$/i", $arquivo["type"])) {
                $typeOK = true;
            }
        }

        if (!$typeOK) {
            $erro[] = "Arquivo em formato inválido! Os Tipos permitidos são: " . $types;

        } else {
            // Verifica tamanho do arquivo
            if ($arquivo["size"] >= $config["conf_upld_size"]) {
                $kbytes = $config["conf_upld_size"] / 1024;

                $erro[] = "Arquivo em tamanho muito grande! O arquivo deve ser de no máximo " . $kbytes . " Kbytes.";
                // $erro[] = TRANS('FILE_TOO_LARGE')." ".$kbytes." Kbytes.";
            } else

            if (preg_match("/^image\/(pjpeg|jpeg|png|gif|bmp)$/i", $arquivo["type"])) {
                // Para verificar as dimensões da imagem
                $tamanhos = getimagesize($arquivo["tmp_name"]);
                // Verifica largura
                if ($tamanhos[0] > $config["conf_upld_width"]) {
                    $erro[] = TRANS('WIDTH_TOO_LARGE') . " " . $config["conf_upld_width"] . " pixels";
                }
                // Verifica altura
                if ($tamanhos[1] > $config["conf_upld_height"]) {
                    $erro[] = TRANS('HEIGHT_TOO_LARGE') . " " . $config["conf_upld_height"] . " pixels";
                }
            }
        }

        if (sizeof($erro)) {
            $saida = "<b>ALERTA:</b><br />";
            foreach ($erro as $err) {
                $saida .= " - " . $err . "<br>";
            }
        }

        if ($arquivo && !sizeof($erro)) {
            //echo "<BR><BR>UPLOAD REALIZADO COM SUCESSO!";
            $saida = "OK";
        }

    } else {
        print "ERRO NO ARQUIVO!";
    }

    return $saida;

}

function montaArray_old($mysql_result, $mysql_fetch_array)
{
    $k = 0;
    $valores = array();
    while ($k < mysql_num_fields($mysql_result)) { //quantidade de campos retornados da consulta
        $field = mysql_fetch_field($mysql_result, $k); //Retorna um objeto com informações dos campos
        $valores[$field->name] = $mysql_fetch_array[$field->name];
        $k++;
    } // while
    return $valores;
}

function montaArray($mysql_result, $mysql_fetch_array)
{
    $k = 0;
    $valores = array();
    while ($k < mysql_num_fields($mysql_result)) { //quantidade de campos retornados da consulta
        if (isPHPOlder()) {
            $field = mysql_fetch_field($mysql_result, $k); //Retorna um objeto com informações dos campos
        } else 
            $field = mysqli_fetch_field($mysql_result); //Retorna um objeto com informações dos campos
        
            $valores[$field->name] = $mysql_fetch_array[$field->name];
        $k++;
    } // while
    return $valores;
}

function findAllOccurences($Haystack, $needle, $limit = 0)
{
    $Positions = array();
    $currentOffset = 0;
    $count = 0;
    while (($pos = strpos($Haystack, $needle, $offset)) && ($count < $limit || $limit == 0)) {
        $Positions[] = $pos;
        $offset = $pos + strlen($needle);
        $count++;
    }
    return $Positions;
}

//Destaca as entradas '$string' em um texto '$texto' passado
function destaca($string, $texto)
{

    $string .= "|" . noHtml($string) . "|" . toHtml($string);

    //$string = htmlentities($string);

    $pattern = explode("|", $string);
    $pattern = array_unique($pattern);
    $destaque = array();

    reIndexArray($pattern);

    $texto2 = toHtml(strtolower($texto));
    //$texto2 = htmlentities($texto);

    for ($i = 0; $i < count($pattern); $i++) {
        $destaque = "<font STYLE='background-color:yellow'>" . $pattern[$i] . "</font></b>";
        $texto2 = str_replace(strtolower($pattern[$i]), strtolower($destaque), $texto2);
    }

    return $texto2;
}



function valida($CAMPO, $VALOR, $TIPO, $OBRIGATORIO, &$ERR, $MSG = '')
{

    if ($MSG != "") {

    }

    $LISTA = array();
    $LISTA['INTFULL'] = "/^\d*$/"; //INTEIRO QUALQUER
    $LISTA['INTEIRO'] = "/^[1-9]\d*$/"; //NAO INICIADOS POR ZERO
    $LISTA['MAIL'] = "/^[\w!#$%&'*+\/=?^`{|}~-]+(\.[\w!#$%&'*+\/=?^`{|}~-]+)*@(([\w-]+\.)+[A-Za-z]{2,6}|\[\d{1,3}(\.\d{1,3}){3}\])$/";
    $LISTA['DATA'] = "/^((0?[1-9]|[12]\d)\/(0?[1-9]|1[0-2])|30\/(0?[13-9]|1[0-2])|31\/(0?[13578]|1[02]))\/(19|20)?\d{2}$/";
    $LISTA['DATA_'] = "/^((0?[1-9]|[12]\d)\-(0?[1-9]|1[0-2])|30\-(0?[13-9]|1[0-2])|31\-(0?[13578]|1[02]))\-(19|20)?\d{2}$/";
    $LISTA['DATAHORA'] = "/^(((0?[1-9]|[12]\d)\/(0?[1-9]|1[0-2])|30\/(0?[13-9]|1[0-2])|31\/(0?[13578]|1[02]))\/(19|20)?\d{2})[ ]([0-1]\d|2[0-3])+:[0-5]\d:[0-5]\d$/";
    $LISTA['MOEDA'] = "/^\d{1,3}(\.\d{3})*\,\d{2}$/";
    $LISTA['MOEDASIMP'] = "/^\d*\,\d{2}$/";
    $LISTA['ETIQUETA'] = "/^[1-9]\d*(\,\d+)*$/"; //expressão para validar consultas separadas por vírgula;
    $LISTA['ALFA'] = "/^[A-Z]|[a-z]([A-Z]|[a-z])*$/";
    $LISTA['ALFANUM'] = "/^([A-Z]|[a-z]|[0-9])([A-Z]|[a-z]|[0-9])*\.?([A-Z]|[a-z]|[0-9])([A-Z]|[a-z]|[0-9])*$/"; //Valores alfanuméricos aceitando separação com no máximo um ponto.
    $LISTA['ALFAFULL'] = "/^[\w!#$%&'*+\/=?^`{|}~-]+(\.[\w!#$%&'*+\/=?^`{|}~-]+)*$/";
    $LISTA['FONE'] = "/^(([+][\d]{2,2})?([-]|[\s])?[\d]*([-]|[\s])?[\d]+)+([,][\s]([+][\d]{2,2})?([-]|[\s])?[\d]*([-]|[\s])?[\d]+)*$/";
    $LISTA['COR'] = "/^([#]([A-F]|[a-f]|[\d]){6,6})|([I][M][G][_][D][E][F][A][U][L][T])$/";
    $LISTA['USUARIO'] = "/^([0-9a-zA-Z]+([_.-]?[0-9a-zA-Z]+))$/";

    $LISTA['ANO'] = "/^\d{4}$/"; //var regANO = /^\d{4}$/;

    $ERRO = array();
    $ERRO['OBRIGATORIO'] = "O campo " . $CAMPO . " é obrigatório!";
    $ERRO['INTFULL'] = "O campo " . $CAMPO . " deve conter apenas numeros inteiros!";
    $ERRO['INTEIRO'] = "O campo " . $CAMPO . " deve conter apenas numeros inteiros não iniciados por ZERO!";
    $ERRO['MAIL'] = "Formato de e-mail inválido!";
    $ERRO['DATA'] = "Formato de data invalido! dd/mm/aaaa";
    $ERRO['DATA_'] = "Formato de data invalido! dd-mm-aaaa";
    $ERRO['DATAHORA'] = "Formato de data invalido! dd/mm/aaaa H:m:s";
    $ERRO['MOEDA'] = "Formato de moeda inválido!";
    $ERRO['MOEDASIMP'] = "Formato de moeda inválido! XXXXXX,XX";
    $ERRO['ETIQUETA'] = "o Formato do campo " . $CAMPO . " deve ser de valores inteiros não iniciados por Zero e separados por vírgula!";
    $ERRO['ALFA'] = "Esse o campo " . $CAMPO . " só aceita carateres do alfabeto sem espaços!";
    $ERRO['ALFANUM'] = "O campo " . $CAMPO . " só aceita valores alfanuméricos sem espaços ou separados por um ponto(no máximo um)!";
    $ERRO['ALFAFULL'] = "O campo " . $CAMPO . " só aceita valores alfanuméricos sem espaços!";
    $ERRO['FONE'] = "O campo " . $CAMPO . " só aceita valores formatados para telefones (algarismos, traços e espaços) separados por vírgula.";
    $ERRO['COR'] = "O campo " . $CAMPO . " só aceita valores formatados para cores HTML! Ex: #FFCC99";
    $ERRO['USUARIO'] = "O campo " . $CAMPO . " não está no formato aceito.";
    $ERRO['ANO'] = "O campo " . $CAMPO . " não está no formato aceito.";

    if ($LISTA[$TIPO] == '') {
        print "ÍNDICE INVÁLIDO!";
        return false;
    } else
    if ($OBRIGATORIO) {
        if ($VALOR == '') {
            $ERR = ($MSG == "") ? $ERRO['OBRIGATORIO'] : $MSG;
            //$ERR = $ERRO['OBRIGATORIO'];
            return false;
        } else
        if (preg_match($LISTA[$TIPO], $VALOR)) {
            return true;
        } else {
            //$ERR = $ERRO[$TIPO];
            $ERR = ($MSG == "") ? $ERRO[$TIPO] : $MSG;
            return false;
        }

    } else
    if ($VALOR != '') {
        if (preg_match($LISTA[$TIPO], $VALOR)) {
            return true;
        } else {
            //$ERR = $ERRO[$TIPO];
            $ERR = ($MSG == "") ? $ERRO[$TIPO] : $MSG;
            return false;
        }

    } else {
        return true;
    }
}

function getDirFileNames($dir, $ext = 'php|PHP')
{
    // Abre um diretorio conhecido, e faz a leitura de seu conteudo de acordo com a extensão solicitada

    $array = array();
    if (is_dir($dir)) {
        if ($dh = opendir($dir)) {
            while (($file = readdir($dh)) !== false) {
                if ($file != '..' && $file != '.' && $file != '' && $file != 'index.php') {
                    if (eregi("\.(" . $ext . "){1}$", $file)) {
                        $array[] = $file;
                    }

                }
            }
            closedir($dh);
        }
    }
    return $array;
}

function dPgetIniSize($val)
{
    $val = trim($val);
    if (strlen($val <= 1)) {
        return $val;
    }

    $last = $val{strlen($val) - 1};
    switch ($last) {
        case 'k':
        case 'K':
            return (int) $val * 1024;
            break;
        case 'm':
        case 'M':
            return (int) $val * 1048576;
            break;
        default:
            return $val;
    }
}

function isPar($number){ 
    if($number % 2 == 0){ 
        return true;
    } 
    return false;
} 

function isImpar($number){ 
    if($number % 2 == 0){ 
        return false;
    } 
    return true;
} 


/**
 * dbField
 *
 * @param mixed $field
 * @param mixed $type="int"|"text"|"date"
 * 
 * @return [type]
 */
function dbField($field, $type="int") {

    $field = noHtml($field);

    if ($type == "int")
        return $field = ($field == '-1' || $field == 'null' || $field == '' ? 'null' : $field);

    if ($type == "float") {
        $field = str_replace(',','.', $field);
        return $field = ($field == '-1' || $field == 'null' || $field == '' ? 'null' : $field);
    }
        
    if ($type == "text")
        return $field = ($field == '-1' || $field == 'null' || $field == '' ? 'null' : "'$field'");

    if ($type == "date") {
        $field = FDate($field);
        return $field = ($field == '' || $field == '0000-00-00' || $field == '0000-00-00 00:00:00' ? 'null' : "'$field'");
    }
}
