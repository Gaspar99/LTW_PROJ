<?php
include_once("../includes/session.php");
include_once("../database/db_reservations.php");
include_once("../database/db_places.php");
include_once("../database/db_search.php");
include_once("../util/security_checks.php");

// Not checking if user is logged in. Anyone can perfom a places search

// Security checks
if (
    !verify_text($_POST["search"], "Location") ||
    !verify_date($_POST["check_in"], "Check In") ||
    !verify_date($_POST["check_out"], "Check Out") ||
    !verify_number($_POST["num_guests"], "Num. Guests") ||
    !verify_number($_POST["min"], "Min") ||
    !verify_number($_POST["max"], "Max")
) die(header("Location: ../pages/home.php"));

// Process input data
$geo = process_string($_POST["search"]);
$check_in = date("Y-m-d", strtotime($_POST["check_in"]));
$check_out = date("Y-m-d", strtotime($_POST["check_out"]));

// Create search form array 
$search_form = array(
    "country"   => $geo[0],
    "city"      => $geo[1],
    "geo_type"  => $geo[2],
    "num_guests" => $_POST["num_guests"],
    "min_price"     => $_POST["min"],
    "max_price"     => $_POST["max"]
);

$search_results = search_places($search_form);
$reservations = get_search_reservations($search_results);

//get those available during time 
//loop over reservations and remove from search_results those ocupied during that the time inputed 
foreach ($reservations as $place_reservations) {
    foreach ($place_reservations as $reservation) {

        if (($reservation["check_in"] >= $check_in && $reservation["check_in"] <= $check_out) &&
            ($reservation["check_out"] >= $check_in && $reservation["check_out"] <= $check_out)
        ) {

            if (is_element($reservation["place_id"], $search_results)) {
                $search_results = delete_elem($reservation["place_id"], $search_results);
            }
        }
    }
}

$_SESSION["search_results"] = $search_results;
header("Location: ../pages/search_results.php");
