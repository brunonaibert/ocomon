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
 */

## CRIAR VARIÁVEL PARA DEFINIÇÃO DO PADRÃO DE DATA EX: PADRÃO AMERICANO, PADRÃO BRASILEIRO

class dateOpers
{
    public $data1; //Primeira parâmetro de data
    public $data2; //Segundo parâmetro de data
    public $forma;

    public $dif_sec;
    public $dif_date;
    public $diff;
    public $dDomingo;
    public $dSabado;
    public $tValido;
    public $dFullAll;

    public function formatDate($data)
    { //Retorna saída no formado AAAA-MM-DD HH:mm:SS

        $ano = 0;
        $mes = 0;
        $dia = 0;
        $hora = 0;
        $minuto = 0;
        $segundo = 0;

        //formato brasileiro com hora!!!
        if (preg_match("/([0-9]{1,2})[|-]([0-9]{1,2})[|-]([0-9]{4}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $data, $sep)) {

            $dia = $sep[1];
            $mes = $sep[2];
            $ano = $sep[3];
            $hora = $sep[4];
            $minuto = $sep[5];
            $segundo = $sep[6];
        } else
        //formato americano com hora
        if (preg_match("/([0-9]{4})[|-]([0-9]{1,2})[|-]([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $data, $sep)) {
            $dia = $sep[3];
            $mes = $sep[2];
            $ano = $sep[1];
            $hora = $sep[4];
            $minuto = $sep[5];
            $segundo = $sep[6];
        } else {
            print "Invalid date format!!";
        }

        //$data = strtotime($ano."-".$mes."-".$dia." ".$hora.":".$minuto.":".$segundo);
        $data = $ano . "-" . $mes . "-" . $dia . " " . $hora . ":" . $minuto . ":" . $segundo;
        return $data;
        //...
    }

    public function formatDateEndTime($data)
    { //Retorna saida no formado AAAA-MM-DD 23:59:59

        $ano = 0;
        $mes = 0;
        $dia = 0;
        $hora = 0;
        $minuto = 0;
        $segundo = 0;

        //formato brasileiro com hora!!!
        if (preg_match("/([0-9]{1,2})[|-]([0-9]{1,2})[|-]([0-9]{4}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $data, $sep)) {

            $dia = $sep[1];
            $mes = $sep[2];
            $ano = $sep[3];
            $hora = $sep[4];
            $minuto = $sep[5];
            $segundo = $sep[6];
        } else
        //formato americano com hora
        if (preg_match("/([0-9]{4})[|-]([0-9]{1,2})[|-]([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $data, $sep)) {
            $dia = $sep[3];
            $mes = $sep[2];
            $ano = $sep[1];
            $hora = $sep[4];
            $minuto = $sep[5];
            $segundo = $sep[6];
        } else {
            print "Invalid date format!!";
        }

        //$data = strtotime($ano."-".$mes."-".$dia." ".$hora.":".$minuto.":".$segundo);
        $data = $ano . "-" . $mes . "-" . $dia . " 23:59:59";
        return $data;
        //...
    }

    public function formatDateIniTime($data)
    { //Retorna saida no formado AAAA-MM-DD (sem a hora)

        $ano = 0;
        $mes = 0;
        $dia = 0;
        $hora = 0;
        $minuto = 0;
        $segundo = 0;

        //formato brasileiro com hora!!!
        if (preg_match("/([0-9]{1,2})[|-]([0-9]{1,2})[|-]([0-9]{4}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $data, $sep)) {

            $dia = $sep[1];
            $mes = $sep[2];
            $ano = $sep[3];
            $hora = $sep[4];
            $minuto = $sep[5];
            $segundo = $sep[6];
        } else
        //formato americano com hora
        if (preg_match("/([0-9]{4})[|-]([0-9]{1,2})[|-]([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $data, $sep)) {
            $dia = $sep[3];
            $mes = $sep[2];
            $ano = $sep[1];
            $hora = $sep[4];
            $minuto = $sep[5];
            $segundo = $sep[6];
        } else {
            print "Invalid date format!!";
        }

        //$data = strtotime($ano."-".$mes."-".$dia." ".$hora.":".$minuto.":".$segundo);
        $data = $ano . "-" . $mes . "-" . $dia;
        return $data;
        //...
    }

    public function setData1($data)
    {

        $this->data1 = $this->formatDate($data);
        //....
    }

    public function setData2($data)
    {
        $this->data2 = $this->formatDate($data);
        //....
    }

    public function getData1()
    {
        print $this->data1;
    }

    public function getData2()
    {
        print $this->data2;
    }

    public function secToHour($sec)
    { //Recebe valor formatado em segundos (valor inteiro) e retorna em formato de hora
        $h = intval($sec / 3600);
        $sec -= $h * 3600;
        $m = intval($sec / 60);
        $sec -= $m * 60;

        if (strlen($h) == 1) {$h = "0" . $h;}; //Coloca um zero antes
        if (strlen($m) == 1) {$m = "0" . $m;}; //Coloca um zero antes
        if (strlen($sec) == 1) {$sec = "0" . $sec;}; //Coloca um zero antes

        $v = $h . ":" . $m . ":" . $sec;
        return $v;
    }

    public function secToDay($sec)
    { //Recebe valor formatado em segundos (valor inteiro) e retorna em formato em dias

        $d = intval($sec / 86400);

        $sec -= $d * 86400;

        $h = intval($sec / 3600);

        $sec -= $h * 3600;
        $m = intval($sec / 60);
        $sec -= $m * 60;

        if (strlen($d) == 1) {$d = "0" . $d;}; //Coloca um zero antes
        if (strlen($h) == 1) {$h = "0" . $h;}; //Coloca um zero antes
        if (strlen($m) == 1) {$m = "0" . $m;}; //Coloca um zero antes
        if (strlen($sec) == 1) {$sec = "0" . $sec;}; //Coloca um zero antes

        $v = $d . " dias " . $h . ":" . $m . ":" . $sec;
        return $v;
    }

    public function hourToSec($hour)
    {
        $s = 0;
        //if (preg_match("/([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $hour, $sep)) {
        if (preg_match("/([0-9]{1,}):([0-9]{1,2}):([0-9]{1,2})/", $hour, $sep)) {
            //$sep = explode(":",$hour);
            $s = $sep[3];
            $s += $sep[2] * 60;
            $s += $sep[1] * 3600;
        }
        return $s;
    }

    public function somadata($dias, $datahoje)
    { //Formato americano de data com hora

        // Desmembra Data -------------------------------------------------------------
        //FORMATO VÁLIDO: ANO-MES-DIA
        if (preg_match("/([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $datahoje, $sep)) {
            $dia = $sep[3];
            $mes = $sep[2];
            $ano = $sep[1];
            $time = $sep[4] . ":" . $sep[5] . ":" . $sep[6];

        } else {
            echo "<b>Invalid date format (valid format: aaaa-mm-dd) - $datahoje</b><br>";
        }

        $i = $dias;

        for ($i = 0; $i < $dias; $i++) {

            if ($mes == "01" || $mes == "03" || $mes == "05" || $mes == "07" || $mes == "08" || $mes == "10" || $mes == "12") {
                if ($mes == 12 && $dia == 31) {
                    $mes = 01;
                    $ano++;
                    $dia = 00;
                }
                if ($dia == 31 && $mes != 12) {
                    $mes++;
                    $dia = 00;
                }
            } //fecha if geral

            if ($mes == "04" || $mes == "06" || $mes == "09" || $mes == "11") {
                if ($dia == 30) {
                    $dia = 00;
                    $mes++;
                }
            } //fecha if geral

            if ($mes == "02") {
                if ($ano % 4 == 0 && $ano % 100 != 0) { //ano bissexto
                    if ($dia == 29) {
                        $dia = 00;
                        $mes++;
                    }
                } else {
                    if ($dia == 28) {
                        $dia = 00;
                        $mes++;
                    }
                }
            } //FECHA IF DO MES 2
            $dia++;
        } //fecha o for()

        // Confirma saída de 2 dígitos ------------------------------------------------

        if (strlen($dia) == 1) {$dia = "0" . $dia;}; //Coloca um zero antes
        if (strlen($mes) == 1) {$mes = "0" . $mes;};

        // Monta saída ----------------------------------------------------------------

        $nova_data = $ano . "-" . $mes . "-" . $dia . " " . $time;

        //print $nova_data;
        return $nova_data;
    } //fecha a função data

    public function menosdata($dias, $datahoje)
    { //Formato americano de data com hora

        // Desmembra Data -------------------------------------------------------------
        //FORMATO VÁLIDO: ANO-MES-DIA
        if (preg_match("/([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})/", $datahoje, $sep)) {
            $dia = $sep[3];
            $mes = $sep[2];
            $ano = $sep[1];
            $time = $sep[4] . ":" . $sep[5] . ":" . $sep[6];

        } else {
            //echo "<b>Invalid date format (valid format: aaaa-mm-dd) - $datahoje</b><br>";
        }

        $i = $dias;

        for ($i = 0; $i < $dias; $i++) {

            if ($mes == "01" || $mes == "05" || $mes == "07" || $mes == "10" || $mes == "12") { //
                if ($mes == "01" && $dia == "01") { //MUDA O ANO
                    $mes = 12;
                    $ano--;
                    $dia = 32;
                }
                if ($dia == "01" && $mes != "01") { //MUDA O MÊS
                    $mes--;
                    $dia = 31;
                }
            } //fecha if geral

            if ($mes == "02" || $mes == "04" || $mes == "06" || $mes == "08" || $mes == "09" || $mes == "11") {
                if ($dia == "01") { //MUDA O M?S
                    $dia = 32;
                    $mes--;
                }
            } //fecha if geral

            if ($mes == "03") {
                if ($ano % 4 == 0 && $ano % 100 != 0) { //ano bissexto
                    if ($dia == "01") {
                        $dia = 30;
                        $mes--;
                    }
                } else {
                    if ($dia == "01") {
                        $dia = 29;
                        $mes--;
                    }
                }
            } //FECHA IF DO MES 2
            $dia--;
        } //fecha o for()

        // Confirma saída de 2 dígitos ------------------------------------------------

        if (strlen($dia) == 1) {$dia = "0" . $dia;}; //Coloca um zero antes
        if (strlen($mes) == 1) {$mes = "0" . $mes;};

        // Monta saída ----------------------------------------------------------------

        $nova_data = $ano . "-" . $mes . "-" . $dia . " " . $time;

        //print $nova_data;
        return $nova_data;
    } //fecha a função data

    public function fullDays($data1, $data2)
    {
        $fullDays = false;
        $fisrt_is_minor = false;

        $sep1 = explode(" ", $this->somadata(2, $data1));
        $sep2 = explode(" ", $data2);

        if ($sep1['0'] <= $sep2['0']) {
            $fullDays = true;
        } else {
            $fullDays = false;
        }

        $sep1['1'] = $this->hourToSec($sep1['1']);
        $sep2['1'] = $this->hourToSec($sep2['1']);

        if ($sep1['1'] <= $sep2['1']) {
            $first_is_minor = true;
            //print "<br>O hora de início é menor!<br>";
        } else {
            $first_is_minor = false;
            //print "<br>O hora de início é maior!<br>";
        }

        $this->dFullAll = array("fullDays" => $fullDays, "first_is_minor" => $first_is_minor);
        //return $fullDays;
        return $this->dFullAll;
    }

    public function fullDays_old($data1, $data2)
    {
        $fullDays = false;
        if ($this->somadata(2, $data1) <= $data2) {
            $fullDays = true;
        } else {
            $fullDays = false;
        }

        return $fullDays;
    }

    //Parâmetros em segundos - data1: data mais antiga - data2: data mais recente (SEMPRE NO FORMATO AMERICANO!!!
    public function diff_time($data1, $data2)
    {
        $s = strtotime($data2) - strtotime($data1);
        $secs = $s;
        $emHora = $this->secToHour($secs);
        $sep = explode(":", $emHora);
        $hFull = $sep[0];

        $dFullOK = 0; //criado em 14-05-08

        $d = intval($s / 86400);
        $s -= $d * 86400;
        $h = intval($s / 3600);
        $s -= $h * 3600;
        $m = intval($s / 60);
        $s -= $m * 60;

        if (strlen($h) == 1) {$h = "0" . $h;}; //Coloca um zero antes
        if (strlen($m) == 1) {$m = "0" . $m;}; //Coloca um zero antes
        if (strlen($s) == 1) {$s = "0" . $s;}; //Coloca um zero antes

        $v = $d . " dias " . $h . ":" . $m . ":" . $s;
        $min = $m;

        $dias = $d;

        //ALTERAÇÃO PARA AJUSTAR O TOTAL DE DIAS CHEIOS - 14-15-08
        //if ($this->fullDays($data1,$data2)){

        $this->fullDays($data1, $data2);

        ## CONTROLE PARA IDENTIFICAR DIAS CHEIOS NO INTERVALO
        if ($this->dFullAll['fullDays']) {
            if ($dias > 1) {
                if ($this->dFullAll['first_is_minor']) {
                    $hFull > 24 ? $dFullOK = $dias - 1 : $dFullOK = $dias;
                } else {
                    $dFullOK = $dias;
                }
            } else {
                $dFullOK = $dias;
            }

        } else {
            $dFullOK = 0;
        }

        $horas = $h;
        $minutos = $m;
        $segundos = $s;

        $dias *= 86400; //Dia de 24 horas
        $horas *= 3600;
        $minutos *= 60;
        $segundos += $dias + $horas + $minutos;

        $h = intval($segundos / 3600);
        $m = intval($segundos / 60);

        //Alterado em 14-05-08
        //$this->diff = array("dFull"=>$d, "hFull"=>$hFull, "mFull"=>$m, "sFull"=>$secs, "tHoras"=>$emHora, "tDias"=>$v);
        $this->diff = array("dFullTotal" => $d, "dFull" => $dFullOK, "hFull" => $hFull, "mFull" => $m, "sFull" => $secs, "tHoras" => $emHora, "tDias" => $v);

        return $this->diff;
    }

    public function diasDomingo($data1, $data2)
    { //Retorna a quantidade de Domingos do período

        $this->diff_time($data1, $data2);
        $dias_diff = $this->diff["dFullTotal"];

        //print "<br>Funcao diasDomingo()";
        //print "<br>dias_diff: ".$this->diff["dFullTotal"]."<br><br>";

        $domingo = 0;

        if ($dias_diff >= 1) {
            $temp = $data1;
            //for ($i=1;$i<=$dias_diff; $i++){
            for ($i = 0; $i <= $dias_diff; $i++) {
                $temp = $this->somadata($i, $data1);
                $dias[$i] = date("l", strtotime($temp));
                if ($dias[$i] == "Sunday") {
                    $domingo++;
                }
            }
            //$validos = $dias_diff-$domingo;
        } // else $validos=$dias_diff;

        $this->dDomingo = $domingo;
        return $domingo;
    }

    public function diasSabado($data1, $data2)
    { //Retorna a quantidade de Domingos do período

        $this->diff_time($data1, $data2);
        $dias_diff = $this->diff["dFullTotal"];

        //print "<br>Funcao diasDomingo()";
        //print "<br>dias_diff: ".$this->diff["dFullTotal"]."<br><br>";

        $sabado = 0;

        if ($dias_diff >= 1) {
            $temp = $data1;
            //for ($i=1;$i<=$dias_diff; $i++){
            for ($i = 0; $i <= $dias_diff; $i++) {
                $temp = $this->somadata($i, $data1);
                $dias[$i] = date("l", strtotime($temp));
                if ($dias[$i] == "Saturday") {
                    $sabado++;
                }
            }
            //$validos = $dias_diff-$domingo;
        } // else $validos=$dias_diff;

        $this->dSabado = $sabado;
        return $sabado;
    }

    //Retorna o tempo válido em horas ou segundos entre duas datas descontando finais de semana e feriados.
    //Também desconta os horários fora da carga horária de cada área.

    //Colocar parâmetro para identificar o tempo de intervalo
    //PARAMETROS:
    //    hora_ini: inicio da jornada
    //    hora_fim: final da jornada
    //    meio_dia: intervalo
    //    sabado: total de horas trabalhadas nos sábados
    //    saida: formato da saída da função, se será em horas ou segundos
    public function tempo_valido($data1, $data2, $hora_ini, $hora_fim, $meio_dia, $sabado, $saida)
    {
        set_time_limit(300);
        $noData = false;
        if (empty($data1) || empty($data2)) {
            $noData = true;
        } else {

            $data1 = $this->formatDate($data1);
            $data2 = $this->formatDate($data2);

            //Inverte a ordem das datas se os parâmetros estiverem invertidos!!
            if ($data1 > $data2) {
                $temp = $data1;
                $data1 = $data2;
                $data2 = $temp;
            }

            /*-------------------------------------------------------------------------------------------*/
            $data1_aux = explode("-", date("Y-m-d-H-i-s", strtotime($data1))); //EXTRAINDO OS ELEMENTOS DA DATA
            $data2_aux = explode("-", date("Y-m-d-H-i-s", strtotime($data2)));
            /*-------------------------------------------------------------------------------------------*/

            if ($data1_aux['3'] < $hora_ini) { //ABERTURA COMPARADA A HORA DE INÍCIO
                $data1_aux['3'] = $hora_ini;
                $data1_aux['4'] = "00";
                $data1_aux['5'] = "00";

                $data1 = $data1_aux['0'] . "-" . $data1_aux['1'] . "-" . $data1_aux['2'] . " " . $data1_aux['3'] . ":" . $data1_aux['4'] . ":" . $data1_aux['5'];

            } else {

                if ($hora_fim != "24") {

                    if ($data1_aux['3'] >= $hora_fim) { //ABERTURA COMPARADA A HORA DE FIM
                        $data1_aux['3'] = $hora_fim;
                        $data1_aux['4'] = "00";
                        $data1_aux['5'] = "00";

                        $data1 = $data1_aux['0'] . "-" . $data1_aux['1'] . "-" . $data1_aux['2'] . " " . $data1_aux['3'] . ":" . $data1_aux['4'] . ":" . $data1_aux['5'];
                    }

                } else { //hora_fim == 24

                    if ($data1_aux['3'] >= "23") { //ABERTURA COMPARADA A HORA DE FIM
                        //$data1_aux['3'] = "23";
                        //$data1_aux['4'] = "59";
                        //$data1_aux['5'] = "59";

                        $data1 = $data1_aux['0'] . "-" . $data1_aux['1'] . "-" . $data1_aux['2'] . " " . $data1_aux['3'] . ":" . $data1_aux['4'] . ":" . $data1_aux['5'];
                    }

                }

            }

            if (($data1_aux['3'] >= ($meio_dia - 1)) && ($data1_aux['3'] < $meio_dia) && $meio_dia != 0) { //ABERTURA COMPARADA A HORA MEIO DIA
                $data1_aux['3'] = $meio_dia;
                $data1_aux['4'] = "00";
                $data1_aux['5'] = "00";

                $data1 = $data1_aux['0'] . "-" . $data1_aux['1'] . "-" . $data1_aux['2'] . " " . $data1_aux['3'] . ":" . $data1_aux['4'] . ":" . $data1_aux['5'];
            }

            if ($hora_fim != "24") {

                if ($data2_aux['3'] >= $hora_fim) { //HORA FECHAMENTO COMPARADA A HORA FIM
                    $data2_aux['3'] = $hora_fim;
                    $data2_aux['4'] = "00";
                    $data2_aux['5'] = "00";

                    $data2 = $data2_aux['0'] . "-" . $data2_aux['1'] . "-" . $data2_aux['2'] . " " . $data2_aux['3'] . ":" . $data2_aux['4'] . ":" . $data2_aux['5'];
                }

            } else { //hora_fim == 24

                if ($data2_aux['3'] >= "23") { //HORA FECHAMENTO COMPARADA A HORA FIM
                    //$data1_aux['3'] = "23";
                    //$data1_aux['4'] = "59";
                    //$data1_aux['5'] = "59";

                    $data2 = $data2_aux['0'] . "-" . $data2_aux['1'] . "-" . $data2_aux['2'] . " " . $data2_aux['3'] . ":" . $data2_aux['4'] . ":" . $data2_aux['5'];
                }

            }

            if ($data2_aux['3'] < $hora_ini) { //HORA FECHAMENTO COMPARADA A HORA INI
                $data2_aux['3'] = $hora_ini;
                $data2_aux['4'] = "00";
                $data2_aux['5'] = "00";
                $data2 = $data2_aux['0'] . "-" . $data2_aux['1'] . "-" . $data2_aux['2'] . " " . $data2_aux['3'] . ":" . $data2_aux['4'] . ":" . $data2_aux['5'];
            } else
            if (($data2_aux['3'] >= ($meio_dia - 1)) && ($data2_aux['3'] < $meio_dia) && $meio_dia != 0) { //FECHAMENTO COMPARADA A HORA MEIO DIA

                #CONTROLE PARA IDENTIFICAR CHAMADOS ABERTOS E CONSULTADOS NO INTERVALO (DENTRO DO MESMO DIA)
                $abDiasMesAno = $data1_aux['0'] . "-" . $data1_aux['1'] . "-" . $data1_aux['2'];
                $feDiasMesAno = $data2_aux['0'] . "-" . $data2_aux['1'] . "-" . $data2_aux['2'];

                if ($abDiasMesAno == $feDiasMesAno && $data1_aux['3'] == $meio_dia) {
                    $data2_aux['3'] = $meio_dia;
                } else {
                    $data2_aux['3'] = $meio_dia - 1;
                }
                $data2_aux['4'] = "00";
                $data2_aux['5'] = "00";

                $data2 = $data2_aux['0'] . "-" . $data2_aux['1'] . "-" . $data2_aux['2'] . " " . $data2_aux['3'] . ":" . $data2_aux['4'] . ":" . $data2_aux['5'];
            }

            //dump($data1,'DATA 1 MODIFICADA');
            //dump($data2,'DATA 2 MODIFICADA');

            //Verifica se existem feriados nos dias uteis cadastrados na tabela feriados
            //    entre as duas datas (também verifica os feriados permanentes);
            $sql = "SELECT data_feriado AS dia_semana, fixo_feriado as permanente " .
                "\nFROM feriados " .
                "\nWHERE " .
                "\n\t(data_feriado BETWEEN '" . $data1 . "' AND '" . $data2 . "' AND date_format( data_feriado, '%w' ) NOT IN ( 0, 6 ))" .
                "\n\t\tOR ( fixo_feriado = 1 AND " .

                "\n\t\t\tdate_format(data_feriado,'%m-%d' ) BETWEEN date_format('" . $data1 . "' , '%m-%d' ) " .
                "\n\t\t\tAND date_format('" . $data2 . "' , '%m-%d' ) " .
                "\n\t\t\tAND CONCAT_WS('-','" . $data2_aux['0'] . "', date_format(data_feriado , '%m-%d' )) BETWEEN  '" . $data1 . "' AND '" . $data2 . "' " .
                "\n\t\t\tAND date_format( CONCAT_WS('-','" . $data2_aux['0'] . "', date_format(data_feriado , '%m-%d' )) , '%w' ) NOT IN ( 0, 6 ) " .
                "\n\t\t ) " .
                "\n\tGROUP BY date_format(data_feriado,'%m-%d' )";

            $resultado = mysql_query($sql);
            $feriados = mysql_num_rows($resultado); //Em dias uteis

            //Verifica os feriados que cairam em Domingo;
            $sql2 = "SELECT data_feriado AS dia_semana, fixo_feriado as permanente " .
                "\nFROM feriados " .
                "\nWHERE " .
                "\n\t(data_feriado BETWEEN '" . $data1 . "' AND '" . $data2 . "' AND date_format( data_feriado, '%w' ) IN ( 0 ))" .
                "\n\t\tOR ( fixo_feriado = 1 AND " .

                "\n\t\t\tdate_format(data_feriado,'%m-%d' ) BETWEEN date_format('" . $data1 . "' , '%m-%d' ) " .
                "\n\t\t\tAND date_format('" . $data2 . "' , '%m-%d' ) " .

                "\n\t\t\tAND CONCAT_WS('-','" . $data2_aux['0'] . "', date_format(data_feriado , '%m-%d' )) BETWEEN  '" . $data1 . "' AND '" . $data2 . "' " .
                "\n\t\t\tAND date_format( CONCAT_WS('-','" . $data2_aux['0'] . "', date_format(data_feriado , '%m-%d' )) , '%w' ) IN ( 0 ) " .
                "\n\t\t ) " .
                "\n\tGROUP BY date_format(data_feriado,'%m-%d' )";

            $resultado2 = mysql_query($sql2);
            $feriados_domingo = mysql_num_rows($resultado2);

            //Verifica os feriados que cairam em Sábados;
            $sql3 = "SELECT data_feriado AS dia_semana, fixo_feriado as permanente " .
                "\nFROM feriados " .
                "\nWHERE " .
                "\n\t(data_feriado BETWEEN '" . $data1 . "' AND '" . $data2 . "' AND date_format( data_feriado, '%w' ) IN ( 6 ))" .
                "\n\t\tOR ( fixo_feriado = 1 AND " .

                "\n\t\t\tdate_format(data_feriado,'%m-%d' ) BETWEEN date_format('" . $data1 . "' , '%m-%d' ) " .
                "\n\t\t\tAND date_format('" . $data2 . "' , '%m-%d' ) " .

                "\n\t\t\tAND CONCAT_WS('-','" . $data2_aux['0'] . "', date_format(data_feriado , '%m-%d' )) BETWEEN  '" . $data1 . "' AND '" . $data2 . "' " .
                "\n\t\t\tAND date_format( CONCAT_WS('-','" . $data2_aux['0'] . "', date_format(data_feriado , '%m-%d' )) , '%w' ) IN ( 6 ) " .
                "\n\t\t ) " .
                "\n\tGROUP BY date_format(data_feriado,'%m-%d' )";

            $resultado3 = mysql_query($sql3);
            $feriados_sabado = mysql_num_rows($resultado3);

            $feriados += $feriados_domingo + $feriados_sabado;
            $invalidos = 0; //Inicializando o numero de horas inválidas do intervalo!!

            //$diffSegundos = diff_em_segundos($data1,$data2); //Diferença total em segundos entre as duas datas!
            $this->diff_time($data1, $data2);
            $diffSegundos = $this->diff["sFull"];
            $dias_cheios = $this->diff["dFull"];

            //dump($dias_cheios,'DIAS CHEIOS SEM INVALIDOS');
            //dump($diffSegundos,'SEGUNDOS SEM INVALIDOS');

            ##
            $data1_aux = explode("-", date("d-m-Y-H-i-s", strtotime($data1))); //EXTRAINDO OS ELEMENTOS DA DATA
            $data2_aux = explode("-", date("d-m-Y-H-i-s", strtotime($data2)));

            $dia_abert = $data1_aux[0] . $data1_aux[1] . $data1_aux[2];
            $dia_fech = $data2_aux[0] . $data2_aux[1] . $data2_aux[2];
            //$t_horas = $horas_completas[0]; //Diferença em horas completas!
            $t_horas = $this->diff["hFull"];

            //dump($t_horas,'HORAS FULL SEM INVALIDOS');

            $hora_1 = $data1_aux[3];
            $hora_2 = $data2_aux[3];

            //dump($hora_1,'HORA_1');
            //dump($hora_2,'HORA_2');

            if ($t_horas >= 1) {

                //Horas invalidas dos dias cheios
                if ($dias_cheios >= 1) { //>=
                    //for ($i=0;$i<24; $i++){
                    for ($i = 1; $i <= 24; $i++) {
                        if ($i > $hora_fim || ($i <= $hora_ini) || ($i == $meio_dia && $meio_dia != "0")) {
                            //if ($i>$hora_fim || ($i<=$hora_ini && $hora_ini!="0") || ($i==$meio_dia && $meio_dia!="0")) {
                            //if ($i>$hora_fim || ($i<$hora_ini) || ($i==$meio_dia && $meio_dia!="0")) {
                            $invalidos++;
                        }
                    }
                    $invalidos *= $dias_cheios;

                }

                //dump($invalidos,'INVALIDOS PRIMEIRO LOOP');
                //dump($hora_ini,'HORA INICIO');
                //dump($hora_fim,'HORA FIM');

                if ($dia_abert != $dia_fech) {

                    //Retirando as horas invalidas do primeiro dia
                    for ($i = $hora_1 + 1; $i <= 24; $i++) {

                        if ($i > $hora_fim || ($i <= $hora_ini && $hora_ini != "0") || ($i == $meio_dia && $meio_dia != "0")) {
                            $invalidos++;
                        }
                    }

                    //dump($invalidos,'INVALIDOS PRIMEIRO DIA');

                    //Retirando as horas inválidas do último dia
                    for ($i = 1; $i < $hora_2 + 1; $i++) {
                        if ($i > $hora_fim || ($i <= $hora_ini && $hora_ini != "0") || ($i == $meio_dia && $meio_dia != "0")) {
                            $invalidos++;
                        }
                    }

                    //dump($invalidos,'INVALIDOS ULTIMO DIA');

                } else { //Verifica as horas inválidas no período dentro do mesmo dia!!
                    for ($i = $hora_1 + 1; $i <= $hora_2; $i++) {
                        if ($i > $hora_fim || ($i <= $hora_ini && $hora_ini != "0") || ($i == $meio_dia && $meio_dia != "0")) {
                            $invalidos++;
                        }

                    }

                    //dump($invalidos,'INVALIDOS MESMO DIA');
                }
            }

            //dump($invalidos,'HORAS INVALIDAS');

            $horas_invalidas_segundos = $invalidos * 3600; //Total de horas invalidas em segundos

            //$domingos = dias_invalidos($data1,$data2)-$feriados_domingo;##### //Quantos Domingos existem no período

            $domingos = $this->diasDomingo($data1, $data2) - $feriados_domingo;
            $sabados = $this->diasDomingo($data1, $data2) - $feriados_sabado;

            $domingo = $hora_fim - $hora_ini; //período de horas normalmente trabalhadas durante a semana que precisam ser...
            //.. descontadas dos Domingos!!
            if ($meio_dia > $hora_ini && $meio_dia < $hora_fim && $meio_dia != "0") { //Se existe intervalo (almoÃ§o) na carga horária!
                $domingo--;
            }
            $domingo *= 3600; //Transformo em segundos

            $sabado_parametro = $sabado;

            //dump($sabado_parametro,'SABADO PARAMETRO');

            if ($sabado_parametro != "48" && $sabado_parametro != "72") {

                $sabado *= 3600; //Transformo em segundos

            } else {
                $sabado = 24 * 3600;
            }
            //se for 48 ou 72 significa que eh sabado cheio = 24 horas

            $feriados *= $domingo; //A quantidade de horas inválidas de um feriado é igual às horas de um Domingo!
            $sabado = $domingo - $sabado; //A quantidade de horas inválidas do Sábados é iqual às horas do Domingo menos..
            // ... as horas trabalhadas no Sábados.

            if ($sabado_parametro == "48") { //TRABALHA SABADOS E DOMINGOS

                $final_de_semana = (($sabado * $sabados) + $feriados);

            } else
            if ($sabado_parametro == "72") { //TRABALHA SABADOS, DOMINGOS E FERIADOS

                $final_de_semana = (($sabado * $sabados)); //Total de horas inválidas em todo o período!!

            } else {
                $final_de_semana = (($sabado * $sabados) + ($domingo * $domingos) + $feriados);
            }
            //Total de horas inválidas em todo o período!!

            $total_tempo_valido = $diffSegundos - ($horas_invalidas_segundos + $final_de_semana);
            //$total_tempo_valido_horas = segundos_em_horas($total_tempo_valido);//$total_tempo_valido_horas;
            $total_tempo_valido_horas = $this->secToHour($total_tempo_valido);
            $auxiliar = explode(":", $total_tempo_valido_horas);

            if (strlen($auxiliar[0]) == 1) {$auxiliar[0] = "0" . $auxiliar[0];}; //Coloca um zero antes
            if (strlen($auxiliar[1]) == 1) {$auxiliar[1] = "0" . $auxiliar[1];}; //Coloca um zero antes
            if (strlen($auxiliar[2]) == 1) {$auxiliar[2] = "0" . $auxiliar[2];}; //Coloca um zero antes

            if ($auxiliar['1'] < 0) {
                $auxiliar['1'] = "00";
            }

            if ($auxiliar['2'] < 0) {
                $auxiliar['2'] = "00";
            }

        }
        if ($noData) {
            $msg = "Data vazia!";
            return $msg;
        } else
        if ($saida == "S") {
            $this->diff["hValido"] = $auxiliar[0];
            $this->diff["sValido"] = $total_tempo_valido;
            $this->tValido = $total_tempo_valido;
            return $total_tempo_valido;
        } else
        if ($saida == "H") {
            $this->diff["hValido"] = $auxiliar[0];
            $this->diff["sValido"] = $total_tempo_valido;
            $this->tValido = $auxiliar[0] . ":" . $auxiliar[1] . ":" . $auxiliar[2];
            return $auxiliar[0] . ":" . $auxiliar[1] . ":" . $auxiliar[2];
        }
    }
}
