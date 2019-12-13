<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");
include_once("../database/db_places.php");

$user_id = get_user_id($_SESSION["user_email"]);
$place_id = $_POST["id"];
$tags = $_POST["tags"];

update_place_info($_POST);
add_place_tags($place_id, $tags); 

if ($_FILES["image"]["name"] != "") {
    add_place_photo($place_id);  
}

header("Location: ../pages/profile.php?id=$user_id");