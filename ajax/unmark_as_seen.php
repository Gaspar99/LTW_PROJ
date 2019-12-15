<?php

include_once("../includes/database.php");

$notification_id = $_POST["id"];

$db = Database::instance()->db();

$stmt = $db->prepare(
    "UPDATE usr_notification 
    SET is_read = 0
    WHERE id = ?"
);

$stmt->execute(array($notification_id));

$ret = $stmt->fetch();

//todo generate a notification canceling????