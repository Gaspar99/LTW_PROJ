<?php
include_once("../includes/database.php");
include_once("../database/db_location.php");
include_once("../util/security_checks.php");

if (!verify_number($_GET["country_id"], "Country id")) {
    die(header("Location: ../pages/home.php"));
}

$cities = get_cities($_GET["country_id"]);

// JSON encode them
echo json_encode($cities);
