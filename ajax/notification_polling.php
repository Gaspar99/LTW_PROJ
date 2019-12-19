<?php
include_once("../includes/database.php");
include_once("../databse/db_notifications.php");
include_once("../util/security_checks.php");

//Security check
verify_number($_POST["usr_id"], "Notification");

$notification = get_new_usr_notifications($_POST["usr_id"]);

echo json_encode($notification);