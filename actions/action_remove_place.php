<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");
include_once("../database/db_places.php");
include_once("../database/db_tags.php");
include_once("../database/db_reservations.php");
include_once("../util/security_checks.php");

// Verify if user is logged in
if (!isset($_SESSION["user_email"]))
    die(header('Location: ../pages/home.php'));

// Verifies CSRF token
if ($_SESSION["csrf"] != $_POST["csrf"]) {
    $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid request!");
    die(header("Location: ../pages/home.php"));
}

$user_id = get_user_id($_SESSION["user_email"]);

// Security check
if (!verify_number($_POST["place_id"], "Place")) {
    die(header('Location: ../pages/home.php'));
}

if (!is_owner($user_id, $_POST["place_id"])) {
    $_SESSION['messages'][] = array('type' => 'error', 'content' => 'Can\'t delete this place!');
    die(header('Location: ../pages/home.php'));
}

// Get place id
$place_id = $_POST["place_id"];

remove_place_photos($place_id);
remove_place_tags($place_id);
remove_place_reservations($place_id); 
remove_place($place_id);

$user_id = get_user_id($_SESSION["user_email"]);
header("Location: ../pages/profile.php?id=$user_id");


