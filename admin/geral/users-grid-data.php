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

include_once ("../../includes/include_basics_only.php");
/* Database connection end */

// storing  request (ie, get/post) global array to a variable  
// $requestData = $_REQUEST;
$requestData = $_POST;


$columns = array(
	// datatable column index  => database column name
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

// getting total number records without any search
$sql = "SELECT u.*, n.*,s.* 
        \n FROM usuarios u 
        \n LEFT JOIN sistemas as s on u.AREA = s.sis_id 
        \n LEFT JOIN nivel as n on n.nivel_cod = u.nivel 
";
$sqlResult = mysql_query($sql);
$totalData = mysql_num_rows($sqlResult);
$totalFiltered = $totalData;  // when there is no search parameter then total number rows = total number filtered rows.

$sql = "SELECT u.*, n.*,s.* 
		\n FROM usuarios u 
		\n LEFT JOIN sistemas as s on u.AREA = s.sis_id 
		\n LEFT JOIN nivel as n on n.nivel_cod = u.nivel 
";

$sql.=" WHERE 1=1";
if( !empty($requestData['search']['value']) ) {   // if there is a search parameter, $requestData['search']['value'] contains search parameter

    $sql.=" AND ( nome LIKE '".$requestData['search']['value']."%' ";  
	$sql.=" OR login LIKE '".$requestData['search']['value']."%' ";
	$sql.=" OR sistema LIKE '".$requestData['search']['value']."%' ";
	$sql.=" OR nivel_nome LIKE '".$requestData['search']['value']."%' ";
	$sql.=" OR email LIKE '".$requestData['search']['value']."%' )";
}
$sqlResult = mysql_query($sql) or dump($sql);
$totalFiltered = mysql_num_rows($sqlResult);

$sql.=" ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir']."  LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
$sqlResult = mysql_query($sql) or dump($sql);

$data = array();
while ($row = mysql_fetch_array($sqlResult)){
	$nestedData=array(); 

    //PEGARIA TODAS AS COLUNAS - NESSE CASO EU TERIA QUE DEFINI-LAS NO DATATABLES
    // foreach($row as $index=>$value) {
	// 	$nestedData[$index] = $value;
	// }
    
	$nestedData[] = $row['nome'];
    $nestedData[] = $row['login'];
    $nestedData[] = $row['sistema'];
    $nestedData[] = transbool($row['user_admin']);
    $nestedData[] = datab($row['data_inc']);
    $nestedData[] = datab($row['data_admis']);
    $nestedData[] = $row['email'];
    $nestedData[] = NVL($row['fone']);
    $nestedData[] = $row['nivel_nome'];
    $nestedData[] = "<a onClick=\"redirect('usuarios.php?action=alter&cellStyle=true&login=" . $row['user_id'] . "')\"><img height='16' width='16' src='" . ICONS_PATH . "edit.png' title='" . TRANS('HNT_EDIT') . "'></a>";
    $nestedData[] = "<a onClick=\"javascript:confirmaAcao('" . TRANS('ENSURE_DEL') . " " . $row['nome'] . "?','usuarios.php','action=excluir&login=" . $row['user_id'] . "');\"><img height='16' width='16' src='" . ICONS_PATH . "drop.png' title='" . TRANS('HNT_DEL') . "'>";
	
	$data[] = $nestedData;
}


$json_data = array(
    "draw"            => intval( $requestData['draw'] ),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
    "recordsTotal"    => intval( $totalData ),  // total number of records
    "recordsFiltered" => intval( $totalFiltered ), // total number of records after searching, if there is no searching then totalFiltered = totalData
    "data"            => $data   // total data array
    );

echo json_encode($json_data);  // send data as json format

?>