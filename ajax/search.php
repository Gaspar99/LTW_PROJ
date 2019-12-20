<?php
include_once("../includes/database.php");
include_once("../database/db_location.php");
include_once("../util/security_checks.php");

// Security check
if (verify_text($_GET["name"], "Country name")) {
    $countries_search = get_countries_by_name($_GET["name"]);
    $countries_cities_search = get_countries_by_city($_GET["name"]);
    
    $search = array_merge($countries_search, $countries_cities_search);
    
    // JSON encode them
    echo json_encode($search);
}

