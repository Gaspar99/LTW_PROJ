<?php
include_once("../includes/database.php");
include_once("../database/db_reservations.php");
include_once("../templates/tpl_places.php");
include_once("../database/db_notifications.php");
include_once("../util/security_checks.php");

// Security checks
if (
    !verify_number($_POST["id"], "Reservation") ||
    !verify_text($_POST["reply"], "Reply")
) die(header("Location: ../pages/home.php"));

$reservation_id = $_POST["id"];
$reply_content = $_POST["reply"];

$date = new DateTime();
$time_stamp = $date->getTimestamp();
$reply_date = gmdate("Y-m-d", $time_stamp);

$comment_info = array(
    "reservation_id" => $reservation_id,
    "content" => $reply_content,
    "date" => $reply_date
);

update_reservation_comment($comment_info);

// Generate reservation notification 
try {
    add_notification_reply($reservation_id); 
} catch (PDOException $e) {
    die($e->getMessage());
}

// Draw reply
$owner = get_reservation_owner($reservation_id);
$comment["owner_reply_date"] = $reply_date;
$comment["owner_reply"] = $reply_content;

draw_owner_reply($comment, $owner["owner_id"]);
