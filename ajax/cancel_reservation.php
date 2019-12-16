<?php
include_once("../includes/database.php");

$reservation_id = $_POST["id"];

$db = Database::instance()->db();

//turn off foreign keys constraint 
$stmt = $db->prepare(
    "PRAGMA foreign_keys = 0"
);

$stmt->execute(); 
$stmt->fetch();

//delete the row 
$stmt = $db->prepare(
    "DELETE FROM reservation    
    WHERE
        id = ?"
);

$stmt->execute(array($reservation_id));

$stmt->fetch();

//turn on foreign keys again
$stmt = $db->prepare(
    "PRAGMA foreign_keys = 0"
);

$stmt->execute(); 
$stmt->fetch();

//todo generate a notification canceling????