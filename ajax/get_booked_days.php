<?php
include_once("../includes/database.php");
include_once("../database/db_reservations.php");
include_once("../util/security_checks.php");

// Security check
verify_number($_GET["place_id"], "Place id");

$dates = get_dates($_GET["place_id"]);

echo json_encode($dates);
