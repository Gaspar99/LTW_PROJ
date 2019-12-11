<?php
include_once("../includes/session.php");
include_once("../database/db_reservations.php");
include_once("../database/db_places.php");
include_once("../database/db_search.php");

echo('pesquisa:');
print_r($_POST); 

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

//header("Location: ../pages/search_results.php");
?>