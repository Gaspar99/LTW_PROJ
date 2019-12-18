<?php
include_once("../includes/database.php");

$db = Database::instance()->db();

$usr_id = $_POST["usr_id"];

$stmt = $db->prepare(
    "SELECT usr_notification.id AS id, usr_notification.reservation as R_ID,
    usr_notification.notification_content AS notification_content,
    usr_notification.notification_date AS notification_date, 
    usr_notification.is_read AS is_read, 
    reservation.check_in AS check_in, 
    reservation.check_out AS check_out, 
    reservation.num_guests AS num_guests,
    place.title AS place_title,
    place.id AS place_id
FROM usr_notification  ,reservation, place 
WHERE usr = ?
AND  usr_notification.reservation = reservation.id AND reservation.place_id = place.id
    ORDER BY usr_notification.id DESC LIMIT 1"
);

$stmt->execute(array($usr_id));

$ret = $stmt->fetch();

echo json_encode($ret);