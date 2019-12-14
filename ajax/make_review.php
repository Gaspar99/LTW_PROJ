<?php
include_once("../includes/database.php");

$reservation_id = $_POST["id"];
$comment_info = $_POST["comment"];
$rating = $_POST["rating"];

$date = new DateTime();
$time_stamp = $date->getTimestamp();
$comment_date = gmdate("Y-m-d", $time_stamp);

print_r($comment_date);

$db = Database::instance()->db();

$stmt = $db->prepare(
    "UPDATE reservation
        SET usr_rating = ?,
        usr_comment= ?,
        usr_comment_date = ?
    WHERE
        id=?"
);

$stmt->execute(array($rating,$comment_info,$comment_date,$reservation_id));

$ret = $stmt->fetch();

//after updating database generate a notification 



#todo generate a notification 