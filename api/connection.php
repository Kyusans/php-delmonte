<?php
    $servername = "localhost";
    $dbusername = "kyusans";
    $dbpassword = "kyusans!123";
    $dbname = "dbdelmonte";

    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $dbusername, $dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }catch(PDOException $e){
        echo "Connection failed: " . $e->getMessage();
    }
?>