<?php
include_once("../includes/database.php");

$db = Database::instance()->db();

$stmt = $db->prepare(
    "SELECT usr_notification.id, usr_notification.is_read 
    FROM usr_notification  
    WHERE usr_notification.id  
    ORDER BY usr_notification.id DESC 
    LIMIT 1"
);

$stmt->execute();

$ret = $stmt->fetch();

echo json_encode($ret);

//todo generate a notification canceling????