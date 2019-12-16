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

    return $db->lastInsertId();
}
/**
 * 
 */
function get_search_reservations($places){
    $db = Database::instance()->db();

    $reservations[]=""; 
    
    foreach($places as $place){
        
        $stmt = $db->prepare(
            "SELECT 
                id, 
                place_id, 
                check_in,
                check_out 
            FROM 
                reservation
            WHERE 
                place_id = ?"
        );

        $stmt->execute(array(
            $place["id"]      
        ));

        array_push($reservations,$stmt->fetchAll()); 
    }    

    return  $reservations;

}
/**
 * 
 */
function get_reservation_owner($reservation_id) {
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            place.owner_id AS owner_id 
        FROM 
            place,reservation
        WHERE 
            reservation.id = ? AND
            reservation.place_id = place.id"
    );
  
    $stmt->execute(array($reservation_id));

    return $stmt->fetch(); 
}
/**
 * 
 */
function cancel_reservation($reservation_id){
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "DELETE FROM 
            reservation 
        WHERE 
            id=?"
    );

    $stmt->execute(array($reservation_id));
    $stmt->fetch();
}
/**
 * 
 */
function get_user_reservations($user_id){
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            * 
        FROM 
            reservation 
        WHERE 
            tourist = ?"
    );

    $stmt->execute(array($user_id));

    return $stmt->fetchAll();
}


/**
 * 
 */
function can_be_cancelled($reservation_id){
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            check_in 
        FROM 
            reservation
        WHERE 
            id = ?"
    );

    $stmt->execute(array($reservation_id));

    $check_in = $stmt->fetch(); 

    //compare with current date
    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $compare_time = date("Y-m-d", strtotime('+24 hours', $time_stamp));

    return ($compare_time >= $check_in['check_in']);
}

function can_be_reviewed($reservation_id) {
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            check_out,
            usr_comment
        FROM 
            reservation
        WHERE 
            id = ?"
    );

    $stmt->execute(array($reservation_id));

    $reservation = $stmt->fetch();
    
    // User has already make a review for this reservation
    if ($reservation["usr_comment"] != null) return false;

    //compare with current date
    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $current_time = gmdate("Y-m-d", $time_stamp);

    return ($current_time > $reservation["check_out"]);
}

?>