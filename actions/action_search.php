<?php
include_once("../includes/session.php");
include_once("../database/db_reservations.php");
include_once("../database/db_places.php");
include_once("../database/db_search.php");

$geo = process_string($_POST['search']);

print_r($geo);

$check_in = date("Y-m-d", strtotime($_POST['check_in']));
$check_out = date("Y-m-d", strtotime($_POST['check_out']));

$search_form = array(
    "country"   => $geo[0],
    "city"      => $geo[1],
    "geo_type"  => $geo[2],
    "num_guests"=> $_POST["num_guests"],
    "min_price"     => $_POST["min"],
    "max_price"     => $_POST["max"]
); 

$search_results = search_places($search_form);

$reservations = get_search_reservations($search_results); //todo test with reservations maded 

//get those available during time 
//loop over reservations and remove from search_results those ocupied during that the time inputed 

foreach($reservations as $place_reservations){
        foreach($place_reservations as $reservation){
         if(($reservation['check_in'] >= $check_in && $reservation['check_in'] <= $check_out ) && 
         ($reservation['check_out'] >= $check_in && $reservation['check_out'] <= $check_out ) ){
             print_r($reservation['place_id']);
            if(is_element($reservation['place_id'],$search_results)){
               $search_results = delete_elem($reservation['place_id'],$search_results);
            }
        }
    }
} 
print_r($search_results);
$_SESSION["search_results"] = $search_results;
header("Location: ../pages/search_results.php");
?>