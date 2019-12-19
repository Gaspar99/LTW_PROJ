<?php
include_once("../includes/database.php");

/*========================= GETS ============================== */

/**
 * 
 */
function get_place_comments($place_id)
{

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT
            reservation.id AS reservation_id,  
            usr.usr_id AS usr_id, 
            usr.usr_first_name AS usr_first_name,
            usr.usr_last_name AS usr_last_name,
            usr.usr_profile_picture AS usr_profile_picture,
            reservation.usr_comment AS usr_comment,
            reservation.usr_comment_date AS usr_comment_date,
            reservation.owner_reply AS owner_reply,
            reservation.owner_reply_date AS owner_reply_date
        FROM  
            reservation, usr 
        WHERE 
            place_id = ? AND  
            reservation.tourist = usr.usr_id AND
            reservation.usr_rating != 0 AND 
            reservation.usr_comment NOT NULL
        ORDER BY 
            usr_comment_date"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetchAll();
}

/*========================= ADDS ============================== */

/**
 * 
 */
function add_comment($review)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "UPDATE 
            reservation
        SET 
            usr_rating = ?,
            usr_comment = ?,
            usr_comment_date = ?
        WHERE
            id = ?"
    );

    $stmt->execute(array(
        $review["rating"], 
        $review["comment"],
        $review["date"],
        $review["reservation_id"])
    );
}


