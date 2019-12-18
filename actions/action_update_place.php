<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");
include_once("../database/db_places.php");
include_once("../database/db_tags.php");

// Verify if user is logged in
if (!isset($_SESSION["user_email"]))
    die(header('Location: ../pages/home.php'));

// Verifies CSRF token
if ($_SESSION["csrf"] != $_POST["csrf"]) {
    $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid request!");
    die(header("Location: ../pages/home.php"));
}

$user_id = get_user_id($_SESSION["user_email"]);
$place_id = $_POST["id"];

$tags = [];

if(array_key_exists("tags", $_POST)) {
    $tags = $_POST["tags"];
}
    
update_place_info($_POST);
update_place_tags($place_id, $tags); 

if ($_FILES["image"]["name"] != "") {
    add_place_photo($place_id);  
}

header("Location: ../pages/place.php?id=$place_id");