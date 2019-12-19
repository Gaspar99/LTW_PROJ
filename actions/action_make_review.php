<?php
include_once("../includes/session.php");
include_once("../database/db_comments.php");
include_once("../database/db_notifications.php");
include_once("../database/db_places.php");
include_once("../util/security_checks.php");

// Verify if user is logged in
if (!isset($_SESSION["user_email"]))
    die(header('Location: ../pages/home.php'));

// Verifies CSRF token
if ($_SESSION["csrf"] != $_POST["csrf"]) {
    $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid request!");
    die(header("Location: ../pages/home.php"));
}

// Security checks
verify_number($_POST["reservation_id"], "Reservation");
verify_text($_POST["comment"], "Comment");
verify_number($_POST["rating"], "Rating");
verify_number($_POST["place_id"], "Place");

// Get current date
$date = new DateTime();
$time_stamp = $date->getTimestamp();
$comment_date = gmdate("Y-m-d", $time_stamp);

// Create review array
$review = array(
    "reservation_id" => $_POST["reservation_id"],
    "rating" => $_POST["rating"],
    "comment" => $_POST["comment"],
    "date" => $comment_date
);

try {
    add_comment($review);
    update_place_rating($place_id);
} catch (PDOException $e) {
    die($e->getMessage());
}
//todo test
try{
    add_notification_review($_POST["reservation_id"]); 
}catch (PDOException $e) {

    die($e->getMessage());
}

$place_id = $_POST["place_id"];
header("Location: ../pages/place.php?id=$place_id");
