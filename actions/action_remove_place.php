<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");
include_once("../database/db_places.php");
include_once("../database/db_tags.php");
include_once("../database/db_reservations.php");

$user_id = get_user_id($_SESSION["user_email"]);
$place_id = $_POST["place_id"];

remove_place_photos($place_id);
remove_place_tags($place_id);
remove_place_reservations($place_id); 
remove_place($place_id);

header("Location: ../pages/profile.php?id=$user_id");


