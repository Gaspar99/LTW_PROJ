<?php
include_once("../includes/session.php");
include_once("../database/db_places.php");
include_once("../database/db_user.php");
include_once("../database/db_tags.php");
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
if (
    !verify_text($_POST["title"], "Title") ||
    !verify_number($_POST["price"], "Price") ||
    !verify_text($_POST["address"], "Address") ||
    !verify_text($_POST["description"], "Description") ||
    !verify_number($_POST["num_guests"], "Num. Guests") ||
    !verify_number($_POST["owner"], "Owner") ||
    !verify_number($_POST["city"], "City")
) die(header("Location: ../pages/home.php"));

if (array_key_exists("tags", $_POST)) {
    foreach ($_POST["tags"] as $tag) {
        if (!verify_number($tag, "Tag")) {
            die(header("Location: ../pages/home.php")); 
        }
    }
}

// Create place array
$place = array(
    "title" => $_POST["title"],
    "price" => $_POST["price"],
    "address" => $_POST["address"],
    "description" => $_POST["description"],
    "num_guests" => $_POST["num_guests"],
    "owner" => $_POST["owner"],
    "city" => $_POST["city"]
);

try {
    $place_id = add_place($place);
    add_place_photo($place_id);

    if (array_key_exists("tags", $_POST)) {
        add_place_tags($place_id, $_POST["tags"]);
    }

} catch (PDOException $e) {

    die($e->getMessage());
}

$user_id = get_user_id($_SESSION["user_email"]);
header("Location: ../pages/profile.php?id=$user_id");
