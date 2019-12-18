<?php
include_once("../includes/session.php");
include_once("../database/db_reservations.php");
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
verify_date($_POST["check_in"], "Check In");
verify_date($_POST["check_out"], "Check Out");
verify_number($_POST["num_guests"], "Num. Guests");
verify_number($_POST["tourist"], "Tourist");
verify_number($_POST["place_id"], "Place");

//Calculate price
$price_per_night = get_place_info($_POST["place_id"])["price"];
$check_in = $_POST["check_in"];
$check_out = $_POST["check_out"];
$time_diff = strtotime($check_out) - strtotime($check_in);

$num_days = round($time_diff / (86400)); // 86,400 = 60 * 60 * 24

$price = $num_days *  $price_per_night * $_POST["num_guests"];

// Create reservation array
$reservation = array(
    "check_in" => date("Y-m-d", strtotime($check_in)),
    "check_out" => date("Y-m-d", strtotime($check_out)),
    "price" => $price,
    "num_guests" => $_POST["num_guests"],
    "tourist" => $_POST["tourist"],
    "place_id" => $_POST["place_id"]
);

try {
    $reservation_id = add_reservation($reservation); 
} catch (PDOException $e) {

    die($e->getMessage());
}

// Generate reservation notification 
try {
    add_reservation_notification($reservation_id); 
} catch (PDOException $e) {

    die($e->getMessage());
}

header("Location: ../pages/home.php");
