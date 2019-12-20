<?php
include_once("../includes/database.php");
include_once("../database/db_notifications.php");
include_once("../util/security_checks.php");

//Security check
if (verify_number($_POST["id"], "Notification")) {
    update_to_unread($_POST["id"]);
}

