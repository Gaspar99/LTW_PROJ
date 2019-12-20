<?php
include_once("../includes/database.php");

/*========================= GETS ============================== */

/**
 * Gets all reservations made by an user
 */
function get_user_reservations($user_id)
{
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
 * Gets the owner of the place of a reservation
 */
function get_reservation_owner($reservation_id)
{

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
 * Returns the id of the tourist that made the reservation
 */
function get_reservation_tourist($reservation_id)
{

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            tourist 
        FROM 
            reservation
        WHERE 
            reservation.id = ? "
    );

    $stmt->execute(array($reservation_id));

    return $stmt->fetch();
}

/**
 * Gets the id of the place of a reservation
 */
function get_reservation_place_id($reservation_id)
{

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            place_id 
        FROM 
            reservation
        WHERE 
            reservation.id = ? "
    );

    $stmt->execute(array($reservation_id));

    return $stmt->fetch();
}

/**
 * Gets all the reservations for the places in the parameter
 */
function get_search_reservations($places)
{
    $db = Database::instance()->db();

    $reservations[] = "";

    foreach ($places as $place) {

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

        array_push($reservations, $stmt->fetchAll());
    }

    return  $reservations;
}

/**
 * Gets the check in and check out dates of the reservations booked for a place
 */
function get_dates($place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            check_in, 
            check_out 
        FROM 
            reservation 
        WHERE 
            place_id = ?"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetchAll();
}

/*========================= ADDS ============================== */

/**
 * Inserts a new reservations into the database
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

/*========================= REMOVES ============================== */

/**
 * Deleted all the reservation of a place
 */
function remove_place_reservations($place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "DELETE FROM 
            reservation 
        WHERE 
            place_id = ?"
    );

    $stmt->execute(array($place_id));
}

/**
 * Deletes the reservation with id equal to the one given in the parameter
 * from the database
 */
function remove_reservation($reservation_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "DELETE FROM 
            reservation 
        WHERE 
            id = ?"
    );

    $stmt->execute(array($reservation_id));
    $stmt->fetch();
}

/*========================= UPDATES ============================== */

/**
 * Updates a reservation to insert a comment by the user during a review
 */
function update_reservation_comment($comment_info)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "UPDATE 
            reservation
        SET 
            owner_reply = ?,
            owner_reply_date = ?
        WHERE
            id = ?"
    );

    $stmt->execute(array(
        $comment_info["content"], 
        $comment_info["date"], 
        $comment_info["reservation_id"])
    );
}

/*========================= VERIFICATIONS ============================== */

/**
 * Verifies if a reservation can be cancelled. This is, there is more than 24 hours left until
 * the check in
 */
function can_be_cancelled($reservation_id)
{
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

    return ($compare_time < $check_in['check_in']);
}

/**
 * Verifies if a reservation can be reviewd. This is, if the checkout has already been done and
 * a review has not been made yet about the place
 */
function can_be_reviewed($reservation_id)
{
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
