<?php
include_once("../includes/database.php");
include_once("../templates/tpl_common.php");
include_once("../database/db_notifications.php");
include_once("../database/db_reservations.php");
include_once("../database/db_notifications.php");
include_once("../util/security_checks.php");

// Security check
if (!verify_number($_POST["id"], "Reservation")) {
    die(header("Location: ../pages/home.php"));
}

// Remove notification
remove_reservation_notification($_POST["id"]);

//Remove reservation
remove_reservation($_POST["id"]);

$_SESSION["messages"][] = array("type" => "success", "content" => "Reservation canceled!");

draw_messages();


