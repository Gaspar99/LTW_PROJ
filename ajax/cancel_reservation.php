<?php
include_once("../includes/database.php");
include_once("../database/db_notifications.php");

$reservation_id = $_POST["id"];

/* //todo problems bc it loses the reservation db reference
try{
    add_notification_cancel($reservation_id); 
}catch (PDOException $e) {

    die($e->getMessage());
}
*/
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

$stmt = $db->prepare(
    "DELETE FROM usr_notification   
    WHERE
        reservation = ?"
);

$stmt->execute(array($reservation_id));

$stmt->fetch();

//turn on foreign keys again
$stmt = $db->prepare(
    "PRAGMA foreign_keys = 0"
);

$stmt->execute(); 
$stmt->fetch();
