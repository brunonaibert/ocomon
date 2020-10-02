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

include "../../includes/include_geral.inc.php";
include "../../includes/include_geral_II.inc.php";

$_SESSION['s_page_ocomon'] = $_SERVER['PHP_SELF'];

print "<HTML>";
print "<BODY bgcolor='" . BODY_COLOR . "'>";

$auth = new auth;
$auth->testa_user($_SESSION['s_usuario'], $_SESSION['s_nivel'], $_SESSION['s_nivel_desc'], 2);

function ordenaPorColunas($array, $col)
{
    ksort($array);
    $arrayIndexado = array();
    $i = 0;
    foreach ($array as $nome => $link) {
        $arrayIndexado[$i][$nome] = $link;
        $i++;
    }
    $tamanho = count($array); //quantidade de elementos do array
    $partlen = floor($tamanho / $col); //quantidade de elementos por coluna (ajustar o valor do resto da divisao)
    $resto = $tamanho % $col;
    $arrayLinha = array();
    $i = 0;
    $elemento = 1;
    $coluna_size = 0;
    $coluna_index = 0;
    $cont = 0;
    $colunaX = array();

    for ($j = 0; $j < $col; $j++) {
        if ($resto > 0) {
            $colunaX[$j] = $partlen + 1;
            $resto--;
        } else {
            $colunaX[$j] = $partlen;
        }
    }

    foreach ($arrayIndexado as $indice => $array2) {
        foreach ($array2 as $nome => $link) {
            $arrayLinha[$i][$nome] = $link;
            if ($elemento < $colunaX[$cont]) {
                $elemento++;
            } else {
                $elemento = 1;
                $coluna_index++;
                $cont++;
                $i = $coluna_index;
            }
            if ($elemento != 1) {
                $i += $col;
            }
        }
    }
    ksort($arrayLinha);
    return $arrayLinha;
}

$colunas = 3;
$REP = array();

$REP[TRANS('REP_PROB_AREA')] = "relatorio_problemas_areas.php";
$REP[TRANS('TLT_REPORT_LOCAL_MORE_ATTEN')] = "relatorio_setores_areas.php";
$REP[TRANS('TLT_REPORT_GENERAL')] = "relatorio_geral.php";
$REP[TRANS('TLT_REPORT_SLAS')] = "relatorio_slas_2.php";
$REP[TRANS('TLT_REPORT_CALL_FOR_EQUIP')] = "chamados_x_etiqueta.php";
//$REP[TRANS('TLT_REP_MANEGER_HELPDESK')] = "relatorio_gerencial.php";
$REP[TRANS('TTL_REP_ATTEND_FOR_OPERATOR')] = "relatorio_operadores_areas.php";
$REP[TRANS('TTL_REP_ATTEND_FOR_USER')] = "relatorio_usuarios_areas.php";
$REP[TRANS('TTL_REP_QTD_CALL_AREA_PERIOD')] = "relatorio_chamados_area.php";
$REP[TRANS('TTL_REP_CALL_OPEN_USER_FINISH')] = "relatorio_usuario_final.php";
$REP[TRANS('TTL_REP_QTD_CALL_CAT_PROB')] = "relatorio_chamados_categorias.php";

print "<BR><h1>" . TRANS('TLT_REPORTS') . "</h1><BR>";

print "<p><B>" . TRANS('TLT_REPORTS_SOON') . " <a href='consultar.php'>" . TRANS('TLT_HERE') . "</a> " . TRANS('TLT_REPORTS_SOON_2') . ".</B></p><br/>";

print "<TABLE border='0' cellpadding='5' cellspacing='0' align='center' width='100%'>";
print "<TR class='header'><td class='line' colspan='" . $colunas . "'>" . TRANS('GENERAL_REPORTS') . "</TD></tr>";

$ctdTD = 1;
$indCol = 0;
print "<tr>";
$checked = "";
$i = 0;
$j = 0;

$REP2 = array();
$REP2 = ordenaPorColunas($REP, $colunas);


//EXIBICAO COM ORDENACAO DINAMICA
foreach ($REP2 as $indice) {
    foreach ($indice as $key => $value) {

        $class = (isImpar($j) ? 'lin_par' : 'lin_impar');

        if ($ctdTD == 1) {
            print "<tr class='" . $class . "'>";
            $j++;
        }
        print "<td class='line' colspan = '" . (($i+1) == count($REP2) && ((count($REP2)-$j)!= 0 ) ? count($REP2)-$j : '') . "'><a href='" . $value . "'>" . $key . "</a></TD>";

        if ($ctdTD == $colunas) {
            print "</tr>";
            $ctdTD = 1;
        } else {
            $ctdTD++;
        }
        $i++;
    }
}
print "</TR>";
print "</table>";

print "</BODY>";
?>
<script type='text/javascript'>

	function redirect(url){
		window.location.href=url;
	}


	function checa_permissao(URL){
		var admin = '<?php print $_SESSION['s_nivel'];?>';
		var area_admin = '<?php print $_SESSION['s_area_admin']?>';
		if( (admin!=1) && (area_admin!=1) ) {
			window.alert('Acesso Restrito!');
		} else
			redirect(URL);

		return false;
	}

</script>
<?php
print "</HTML>";
?>
