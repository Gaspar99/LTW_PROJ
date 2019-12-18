<?php
include_once("../includes/session.php");
include_once("../database/db_places.php");
include_once("../database/db_user.php");
include_once("../database/db_tags.php");

// Verify if user is logged in
if (!isset($_SESSION["user_email"]))
    die(header('Location: ../pages/home.php'));

$user_id = get_user_id($_SESSION["user_email"]);

$place["title"] = $_POST["title"];
$place["price"] = $_POST["price"];
$place["address"] = $_POST["address"];
$place["description"] = $_POST["description"];
$place["num_guests"] = $_POST["num_guests"];
$place["owner"] = $_POST["owner"];
$place["city"] = $_POST["city"];

$tags = $_POST["tags"];

try {
    $place_id = add_place($place);
    add_place_photo($place_id);
    add_place_tags($place_id, $tags);
} catch (PDOException $e) {
    die($e->getMessage());
}

header("Location: ../pages/profile.php?id=$user_id");
