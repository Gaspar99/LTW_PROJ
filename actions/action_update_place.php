<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");
include_once("../database/db_places.php");
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
verify_number($_POST["id"], "Id");
verify_text($_POST["title"], "Title");
verify_number($_POST["price"], "Price");
verify_text($_POST["description"], "Description");
verify_number($_POST["num_guests"], "Num. Guests");
if (array_key_exists("tags", $_POST)) {
    foreach ($_POST["tags"] as $tag) {
        verify_number($tag, "Tag");
    }
}
if (!is_owner(get_user_id($_SESSION["user_email"]), $_POST["id"])) {
    $_SESSION['messages'][] = array('type' => 'error', 'content' => 'Can\'t edit this place!');
    die(header('Location: ../pages/home.php'));
}

// Set up of array with input data
$place_info = array(
    "id" => $_POST["id"],
    "title" => $_POST["title"],
    "price" => $_POST["price"],
    "description" => $_POST["description"],
    "num_guests" => $_POST["num_guests"]
);
$place_id = $_POST["id"];

update_place_info($place_info);

if (array_key_exists("tags", $_POST)) {
    update_place_tags($place_id, $_POST["tags"]);
}

if ($_FILES["image"]["name"] != "") {
    add_place_photo($place_id);
}

header("Location: ../pages/place.php?id=$place_id");
