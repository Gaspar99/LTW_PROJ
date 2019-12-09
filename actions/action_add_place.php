<?php
include_once("../includes/session.php");
include_once("../database/db_places.php");
include_once("../database/db_user.php");

$user_id = get_user_id($_SESSION["user_email"]);

$place["title"] = $_POST["title"];
$place["price"] = $_POST["price"];
$place["address"] = $_POST["address"];
$place["description"] = $_POST["description"];
$place["num_guests"] = $_POST["num_guests"];
$place["owner"] = $_POST["owner"];
$place["city"] = $_POST["city"];

try {
    $place_id = add_place($place);
    add_place_photo($place_id);
} catch (PDOException $e) {
    die($e->getMessage());
}

header("Location: ../pages/profile.php?id=$user_id");