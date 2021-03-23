<?php

/* Source CODE MySQL / GODOT by_DIEGOT PRODUCTIONS
 * *
 * DDTank Online v.3.1 - SERVER_S1: Luna de Sombra
 */

// Your MySQL main config : db_ROOT
$con = mysqli_connect("localhost", "root", "", "dibertz_wp690");
$table = "wpb6_clients";

if(mysqli_connect_errno()){
    
	echo "Hubo un error de conexi&oacute;n con el Servidor S1: Luna de Sombra. " . mysqli_connect_errno() . PHP_EOL;
        
}else {

    $query = "select * from $table";
    $res = mysqli_query($con, $query);
    # echo "Conexi&oacute;n exitosa con el Servidor S1: Luna de Sombra.</br>". PHP_EOL;

$json = "{";

while($field = mysqli_fetch_array($res, MYSQLI_ASSOC)){
    
    $json = $json . "'" . "Player" . "'" . " : " . "'" . $field["user_login"] . "'"
                  . " , "
                  . "'" . "Nivel" . "'" . " : " . $field["user_level"]
                  . " , "
                  . "'" . "Cupones" . "'" . " : " . $field["user_voucher"]
                  . " , "
                  . "'" . "Dinero" . "'" . " : " . $field["user_money"];
    
}

$json = $json . "}";

if($_GET["action"] == "query"){
    
    echo $json;
}

if($_GET["action"] == "register"){
    
    $username = $_GET["player"];
    $wallet = $_GET["cash"];
    
    if(($username != "") && ($wallet != "")) {
        
        $auth = "UPDATE " . $table ." SET user_login=" . "'" . $username . "'" . ", user_money=" . $wallet;
        echo $auth;
        mysqli_query($con, $auth);
        echo "\nActualización de usuario exitosa.";
        
    }else{
        
        echo "error catch ", $username;
        
    }
    
}

// Closed connection
mysqli_close($con);

}