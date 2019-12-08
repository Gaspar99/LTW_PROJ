<?php
include_once("../includes/session.php");
include_once("../database/db_places.php");

$user_id = get_user_id($_SESSION["user_email"]);

$place["title"] = $_POST["title"];
$place["price"] = $_POST["price"];
$place["address"] = $_POST["address"];
$place["description"] = $_POST["description"];
$place["num_guests"] = $_POST["num_guests"];
$place["owner"] = $_POST["owner"];
$place["city"] = $_POST["city"];

try {
    add_place($place);
    //add_place_photo()
} catch (PDOException $e) {
    die($e->getMessage());
}

header("Location: ../pages/usr_profile.php?id=$user_id");