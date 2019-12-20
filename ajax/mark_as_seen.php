<?php
include_once("../includes/database.php");
include_once("../database/db_notifications.php");
include_once("../util/security_checks.php");

// Security check
verify_number($_POST["id"], "Notification");

update_to_read($_POST["id"]);
