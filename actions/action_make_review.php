<?php
include_once("../includes/session.php");
include_once("../database/db_comments.php");
include_once("../database/db_places.php");

$reservation_id = $_POST["reservation_id"];
$comment = $_POST["comment"];
$rating = $_POST["rating"];
$place_id = $_POST["place_id"];

$date = new DateTime();
$time_stamp = $date->getTimestamp();
$comment_date = gmdate("Y-m-d", $time_stamp);

$review = array(
    "reservation_id" => $reservation_id,
    "rating" => $rating,
    "comment" => $comment,
    "date" => $comment_date
);

try {
    add_comment($review);
    update_place_rating($place_id); 
} catch (PDOException $e) {
    die($e->getMessage());
}

header("Location: ../pages/place.php?id=$place_id");