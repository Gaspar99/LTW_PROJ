<?php 
include_once("../includes/database.php");
include_once("../database/db_user.php");

/* ---------- GETTERS ---------- */
function get_usr_notifications($email){
    $usr_id = get_user_id($email); 

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT usr_notification.id AS id, 
                usr_notification.notification_date AS notification_date, 
                usr_notification.is_read AS is_read, 
                reservation.check_in AS check_in, 
                reservation.check_out AS check_out, 
                reservation.num_guests AS num_guests,
                place.title AS place_title,
                place.id AS place_id
        FROM usr_notification, reservation, place 
        WHERE usr = ? 
            AND usr_notification.reservation = reservation.id 
            AND reservation.place_id = place.id "
    );

    $stmt->execute(array($usr_id));

    return $stmt->fetchAll(); 
}

function get_unseen_notification($id){
    
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT COUNT(usr_notification.is_read) AS unseen_num
        FROM usr_notification 
        WHERE usr_notification.is_read = 1 
        AND usr_notification.usr = ? "
    );

    $stmt->execute(array($id));

    return $stmt->fetch(); 
}


/* ---------- INSERTIONS ---------- */

/**
 * Generate notify reservation
 */
function add_reservation_notification($reservation){
    
    $db = Database::instance()->db();

    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $notification_time = gmdate("Y/m/j H:i:s", $time_stamp);
    $usr = get_reservation_owner($reservation)['owner_id']; 
    print_r($usr); 
    $stmt = $db->prepare(
        "INSERT INTO usr_notification
            (notification_date, is_read, usr, reservation)
            VALUES (?, ?, ?, ?)"
    );

    $stmt->execute(array($notification_time,0,$usr,$reservation));

}

/**
 * Generate comment notification
 */
function add_comment_notification($usr,$reservation){
    
    $db = Database::instance()->db();

    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $notification_time = gmdate("Y/m/j H:i:s", $time_stamp);

    $stmt = $db->prepare(
        "INSERT INTO usr_notification
            (notification_date, is_read, usr, reservation)
            VALUES (?, ?, ?, ?)"
    );

    $stmt->execute(array($notification_time,0,$usr,$reservation));

    return $db->lastInsertId();
}
/**
 *  Generate message notification 
 */
function add_message_notitfication($content,$from,$to){
    $db = Database::instance()->db();

    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $notification_time = gmdate("Y/m/j H:i:s", $time_stamp);

    $stmt = $db->prepare(
        "INSERT INTO usr_message
            (message_txt, message_date, from_usr, to_usr)
            VALUES (?, ?, ?, ?)"
    );

    $stmt->execute(array($content,$notification_time,$from,$to));

    return $db->lastInsertId();
}

?>