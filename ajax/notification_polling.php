<?php
include_once("../includes/database.php");

$db = Database::instance()->db();

$usr_id = $_POST["usr_id"];

$stmt = $db->prepare(
    "SELECT usr_notification.id AS id,
        usr_notification.usr AS usr,
        usr_notification.notification_date AS notification_date, 
        reservation.place_id AS place_id,
        reservation.check_in AS check_in, 
        reservation.check_out AS check_out, 
        place.title AS title
    FROM usr_notification, reservation, place  
    WHERE usr_notification.usr = ? AND reservation.id = usr_notification.reservation AND reservation.place_id = place.id
    ORDER BY usr_notification.id DESC 
    LIMIT 1"
);

$stmt->execute(array($usr_id));

$ret = $stmt->fetch();

echo json_encode($ret);

//todo generate a notification canceling????