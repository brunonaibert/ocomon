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

include_once "../../includes/include_geral.inc.php";

$nome = array();
$login = array();
$area = array();
$area_admin = array();
$data_ins = array();
$data_admis = array();
$email = array();
$fone = array();
$nivel   = array();
$edit = array();
$remove = array();


$columns = array(
    0 => 'nome',
    1 => 'login',
    2 => 'sistema',
    3 => 'user_admin',
    4 => 'data_inc',
    5 => 'data_admis',
    6 => 'email',
    7 => 'fone',
    8 => 'nivel_nome',
    9 => 'user_id',
    10 => 'user_id'
);

$dataArray = array();

$sql = "SELECT u.*, n.*,s.* 
        \n FROM usuarios u 
        \n LEFT JOIN sistemas as s on u.AREA = s.sis_id 
        \n LEFT JOIN nivel as n on n.nivel_cod = u.nivel 
        \n ORDER BY u.nome
";
$sqlResult = mysql_query($sql);

while ($row = mysql_fetch_array($sqlResult)) {
    $dataArray[] = $row['nome'];
    $dataArray[] = $row['login'];
    $dataArray[] = $row['sistema'];
    $dataArray[] = $row['user_admin'];
    $dataArray[] = $row['data_inc'];
    $dataArray[] = $row['data_admis'];
    $dataArray[] = $row['email'];
    $dataArray[] = $row['fone'];
    $dataArray[] = $row['nivel_nome'];
    $dataArray[] = $row['user_id'];
    $dataArray[] = $row['user_id'];
}



echo json_encode($dataArray);
// dump($dataArray);



?>
