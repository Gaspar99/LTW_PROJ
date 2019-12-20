<?php
include_once("../includes/database.php");
include_once("../database/db_notifications.php");
include_once("../util/security_checks.php");

//Security check
if (!verify_number($_POST["usr_id"], "Notification")) {
    die(header("Location: ../pages/home.php"));
}

$notification = get_new_usr_notifications($_POST["usr_id"]);

echo json_encode($notification);