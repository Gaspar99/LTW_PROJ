<?php
include_once("../includes/session.php");
include_once("../database/db_reservations.php");
include_once("../database/db_places.php");
include_once("../database/db_search.php");

session_start();

$geo = process_string($_POST['search']);

$search_form = array(
    "country"   => $geo[0],
    "city"      => $geo[1],
    "num_guests"=> $_POST["num_guests"],
    "price"     => $_POST["price"]
); 

$search_results = search_places($search_form);

$reservations = get_reservations($search_results); //todo test with reservations maded 

//get those available during time 
//loop over reservations and remove from search_results those ocupied during that the time inputed 
foreach($reservations as $reservation){
    if($reservation['check_in'] >= $_POST['check_in'] && $reservation['check_out'] <= $_POST['check_out']){
        //todo rm element with that id 
        //$search_results.
    }
}

$_SESSION["search_results"] = $search_results;
header("Location: ../pages/search_results.php");
?>