<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");
include_once("../database/db_places.php");

$user_id = get_user_id($_SESSION["user_email"]);
$place_id = $_POST["place_id"];

remove_place($place_id);
remove_place_photos($place_id); 

header("Location: ../pages/profile.php?id=$user_id");


