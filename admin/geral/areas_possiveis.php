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

  include_once ("../../includes/include_geral.inc.php");
  include_once ("../../includes/include_geral_II.inc.php");

    if (!isset($_GET['nivel']) || empty($_GET['nivel'])) {
        dump('NÍVEL NÃO SELECIONADO!');
        exit;
    } 

    //dump($_GET['nivel']); exit;

    $sis_atende = (($_GET['nivel'] != 3 && $_GET['nivel'] != 5) ? 1 : 0);

    $usuario = (isset($_GET['usuario']) && !empty($_GET['usuario']) ? $_GET['usuario'] : 0);

    $botao = TRANS('BT_CAD');

    if ($usuario) {
        $sql = "SELECT * FROM usuarios WHERE user_id = ' " . $_GET['usuario'] . " ' ";
        $sqlResult = mysql_query($sql) or die('Usuário não encontrado!');
        $rowUser = mysql_fetch_array($sqlResult);

        $botao = TRANS('BT_ALTER');
    }

    // $password2 = (isset($_GET['password2']) && !empty($_GET['password2']) ? $_GET['password2'] : '');

print "<table width='100%'>";
		print "<TR>";
			print "<TD width='20%' align='left' bgcolor='".TD_COLOR."'>".TRANS('COL_PRIMARY_AREA').":</TD>";
			print "<TD colspan='3' width='80%' align='left' bgcolor='".BODY_COLOR."'>";
			print "<SELECT class='select' name='area' size=1 id='idArea'>";
			print "<option value=-1 selected>".TRANS('SEL_WORK_AREA').":</option>";
			
			if (isset($OPERADOR_AREA) && $OPERADOR_AREA){
				$query = "SELECT * from sistemas WHERE sis_status not in (0) AND sis_id = ".$_SESSION['s_area']." order by sistema ";
			} else
                $query = "SELECT * from sistemas where sis_status not in (0) AND sis_atende = " . $sis_atende . " order by sistema";
                
			$resultado = mysql_query($query);
			$registros = mysql_num_rows($resultado);
			while ($rowarea = mysql_fetch_array($resultado)) {
				print "<option value='".$rowarea['sis_id']."' ". (isset($rowUser) && $rowarea['sis_id'] == $rowUser['AREA'] ? 'selected' : '') .">".$rowarea['sistema']."</option>";
			}
		print "</SELECT>";
		print "<input type='checkbox' name='areaadmin' value=1 " . (isset($rowUser) && $rowUser['user_admin'] == 1 ? 'checked' : '') . " " . ($sis_atende == 0 ? 'disabled' : '') . " >".TRANS('COL_AREA_ADMIN')."";

			print "</TD>";
		print "</TR>";

        
		print "<tr>";
			print "<TD colspan='2' align='center' width='50%' bgcolor='".BODY_COLOR."'><input type='submit'  class='button' value='".$botao."' name='submit'>";
            if ($usuario) {
                print "<input type='hidden' name='login' value='".$usuario."'>";
			    // print "<input type='hidden' name='password2' value='".$password2."'>";
            }
            
			print "</TD>";
            print "<TD colspan='2' align='center' width='50%' bgcolor='".BODY_COLOR."'><INPUT type='reset' class='button' value='".TRANS('BT_CANCEL')."' onClick=\"javascript:history.back();\" name='cancelar'></TD>";
        print "</TR>";		



        if ($sis_atende) {

            if ($usuario) {

                $qry_areas = "select * from usuarios_areas where uarea_uid=" . noHtml($usuario) . "";
                $exec_areas = mysql_query($qry_areas);
                $total_areas = 0;
                while ($row_areas = mysql_fetch_array($exec_areas)) {
                    $uareas[$total_areas] = $row_areas['uarea_sid'];
                    $total_areas++;
                }
        
                $qry = "select * from sistemas WHERE sis_atende = 1 order by sistema";
                $exec = mysql_query($qry);
        
                $checked = array();
                $i = 0;
                print "<tr><td colspan='4'>" . TRANS('COL_SECUNDARY_AREAS') . ":</td></tr>";
                while ($rowa = mysql_fetch_array($exec)) {
                    print "<tr><td colspan='4'>";
                    for ($j = 0; $j < $total_areas; $j++) {
                        //$checked[$i] = "";
                        if ($uareas[$j] == $rowa['sis_id']) {
                            $checked[$i] = "checked";
                        }
                    }
        
                    if (isset($checked[$i])) {
                        $checkedValue = $checked[$i];
                    } else {
                        $checkedValue = "";
                    }
        
                    print "<input type='checkbox' name='grupo[" . $i . "]' value='" . $rowa['sis_id'] . "' " . $checkedValue . ">&nbsp;" . $rowa['sistema'] . "";
                    print "</td></tr>";
                    $i++;
                }

            } else {
                $qry = "select * from sistemas where sis_status not in (0) and sis_atende = 1";
                $exec = mysql_query($qry);
                $i=0;
                print "<tr><td colspan='4'>".TRANS('COL_SECUNDARY_AREAS').":</td></tr>";
                while ($rowa=mysql_fetch_array($exec)){
                    print "<tr><td colspan='4'>";
                    print "<input type='checkbox' name='grupo[".$i."]' value='".$rowa['sis_id']."'>".$rowa['sistema']."";
                    print "</td></tr>";
                    $i++;
                }
            }

        }
		
		print "</table>";


?>