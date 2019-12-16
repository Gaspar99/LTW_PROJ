<?php
    include_once("../includes/database.php");

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT check_in,check_out 
        FROM reservation 
        WHERE place_id = ?"
    );

    $stmt->execute(array($_GET['place_id']));

    $ret = $stmt->fetchAll();

    echo json_encode($ret)
?>