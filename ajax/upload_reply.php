<?php
include_once("../includes/database.php");
include_once("../database/db_reservations.php");
include_once("../templates/tpl_places.php");

$reservation_id = $_POST["id"];
$reply_content = $_POST["reply"];

$date = new DateTime();
$time_stamp = $date->getTimestamp();
$reply_date = gmdate("Y-m-d", $time_stamp);

$db = Database::instance()->db();

$stmt = $db->prepare(
    "UPDATE 
        reservation
    SET 
        owner_reply = ?,
        owner_reply_date = ?
    WHERE
        id = ?"
);

$stmt->execute(array($reply_content, $reply_date, $reservation_id));

$owner = get_reservation_owner($reservation_id);
$comment["owner_reply_date"] = $reply_date;
$comment["owner_reply"] = $reply_content;

draw_owner_reply($comment, $owner["owner_id"]);
