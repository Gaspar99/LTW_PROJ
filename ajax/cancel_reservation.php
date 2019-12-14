<?php
include_once("../includes/database.php");

$reservation_id = $_POST["id"];

$db = Database::instance()->db();

$stmt = $db->prepare(
    "DELETE FROM reservation    
    WHERE
        id = ?"
);

$stmt->execute(array($reservation_id));

$ret = $stmt->fetch();

//todo generate a notification canceling????