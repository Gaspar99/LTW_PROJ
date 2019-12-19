<?php
include_once("../includes/database.php");
include_once("../databse/db_notifications.php");
include_once("../util/security_checks.php");

// Security check
verify_number($_POST["id"], "Notification");

remove_notification($_POST["id"]);

