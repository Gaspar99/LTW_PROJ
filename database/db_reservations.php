<?php
include_once("../includes/database.php");

/**
 * 
 */
function add_reservation($reservation)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "INSERT INTO reservation
            (check_in, check_out, price, num_guests, tourist, place_id)
            VALUES(?, ?, ?, ?, ?, ?)"
    );

    $stmt->execute(array(
        $reservation["check_in"],
        $reservation["check_out"],
        $reservation["price"],
        $reservation["num_guests"],
        $reservation["tourist"],
        $reservation["place_id"]
    ));
}

function get_reservations($places){
    $db = Database::instance()->db();

    $reservations[]=""; 
    foreach($places as $place){
        
        $stmt = $db->prepare(
            "SELECT id,place_id, check_in,check_out 
            FROM reservation
            WHERE ? = place_id"
        );

        $stmt->execute(array(
            $place["id"]      
        ));

        array_push($reservations,$stmt->fetchAll()); 
    }    
    return $reservations; 

}
