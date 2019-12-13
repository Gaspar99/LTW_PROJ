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
/**
 * 
 */
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
/**
 * 
 */
function cancel_reservation($reservation_id){
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "DELETE FROM reservation WHERE id=?"
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
        "SELECT * FROM reservation WHERE tourist=?"
    );

    $stmt->execute(array($user_id));

    return $stmt->fetchAll();
}
/**
 * 
 */
function get_place_reserved($place_id){
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT place.title AS title,
                country.country_name ,
                city.city_name, 
                place.place_address AS address,
                place.owner_id AS owner_id,
                usr.usr_first_name AS owner_first_name,
                usr.usr_last_name AS owner_last_name,
                usr.usr_profile_picture AS owner_profile_pic
        FROM place, country, city, usr 
        WHERE place.id=? 
            AND place.city_id = city.id 
            AND city.country_id = country.id 
            AND place.owner_id = usr.usr_id"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetch();
}
?>