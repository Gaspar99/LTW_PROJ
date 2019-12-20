<?php
include_once("../includes/database.php");
include_once("../database/db_user.php");
include_once("../database/db_reservations.php");


/*========================= GETS ============================== */

/**
 * 
 */
function get_all_usr_notifications($usr_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            usr_notification.id AS id, usr_notification.reservation as R_ID,
            usr_notification.notification_content AS notification_content,
            usr_notification.notification_date AS notification_date, 
            usr_notification.is_read AS is_read, 
            reservation.check_in AS check_in, 
            reservation.check_out AS check_out, 
            reservation.num_guests AS num_guests,
            place.title AS place_title,
            place.id AS place_id
        FROM 
            usr_notification JOIN reservation, place 
        WHERE 
            usr = ?
        AND  
            usr_notification.reservation = reservation.id AND reservation.place_id = place.id"
    );

    $stmt->execute(array($usr_id));

    return $stmt->fetchAll();
}

/**
 * 
 */
function get_new_usr_notifications($usr_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            usr_notification.id AS id,
            usr_notification.reservation as R_ID,
            usr_notification.notification_content AS notification_content,
            usr_notification.notification_date AS notification_date, 
            usr_notification.is_read AS is_read, 
            reservation.check_in AS check_in, 
            reservation.check_out AS check_out, 
            reservation.num_guests AS num_guests,
            place.title AS place_title,
            place.id AS place_id
        FROM    
            usr_notification, 
            reservation, 
            place 
        WHERE 
            usr = ? AND  
            usr_notification.reservation = reservation.id AND 
            reservation.place_id = place.id
        ORDER BY 
            usr_notification.id DESC 
        LIMIT 1"
    );

    $stmt->execute(array($usr_id));

    return $stmt->fetch();
}

/**
 * 
 */
function get_unseen_notification($id)
{

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT COUNT(usr_notification.is_read) AS unseen_num,
        (SELECT COUNT(usr_notification.id) 
        FROM usr_notification 
        WHERE usr_notification.usr = (SELECT usr_notification.usr AS usr_id
                                        FROM usr_notification 
                                        WHERE usr_notification.usr = ?) ) as notification_num
    FROM usr_notification 
    WHERE usr_notification.is_read = 1 
    AND usr_notification.usr = (SELECT usr_notification.usr AS usr_id
                                FROM usr_notification 
                                WHERE usr_notification.usr = ?) "
    );

    $stmt->execute(array($id, $id));

    return $stmt->fetch();
}

/**
 * 
 */
function get_read_notification_num($notification_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT COUNT(usr_notification.is_read) AS unseen_num,
        (SELECT COUNT(usr_notification.id) 
        FROM usr_notification 
        WHERE usr_notification.usr = (SELECT usr_notification.usr AS usr_id
                                        FROM usr_notification 
                                        WHERE usr_notification.id = ?) ) as notification_num
    FROM usr_notification 
    WHERE usr_notification.is_read = 1 
    AND usr_notification.usr = (SELECT usr_notification.usr AS usr_id
                                FROM usr_notification 
                                WHERE usr_notification.id = ?)"
    );

    $stmt->execute(array($notification_id, $notification_id));

    return $stmt->fetch();
}


/*========================= ADDS ============================== */

/**
 * Generate notify reservation
 */
function add_notification_reservation($reservation)
{

    $db = Database::instance()->db();

    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $notification_time = gmdate("Y/m/j H:i:s", $time_stamp);

    $usr = get_reservation_owner($reservation)['owner_id'];

    $stmt = $db->prepare(
        "INSERT INTO usr_notification
            (notification_content,notification_date, is_read, usr, reservation)
            VALUES (?,?, ?, ?, ?)"
    );

    $stmt->execute(array("New Reservation", $notification_time, 0, $usr, $reservation));
}

function add_notification_review($reservation)
{

    $db = Database::instance()->db();

    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $notification_time = gmdate("Y/m/j H:i:s", $time_stamp);

    $usr = get_reservation_owner($reservation)['owner_id'];
    $stmt = $db->prepare(
        "INSERT INTO usr_notification
            (notification_content,notification_date, is_read, usr, reservation)
            VALUES (?,?, ?, ?, ?)"
    );

    $stmt->execute(array("New Review", $notification_time, 0, $usr, $reservation));
}

function add_notification_reply($reservation)
{
    $db = Database::instance()->db();

    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $notification_time = gmdate("Y/m/j H:i:s", $time_stamp);

    $usr = get_reservation_tourist($reservation)['tourist'];
    $stmt = $db->prepare(
        "INSERT INTO usr_notification
            (notification_content,notification_date, is_read, usr, reservation)
            VALUES (?,?, ?, ?, ?)"
    );

    $stmt->execute(array("New Reply", $notification_time, 0, $usr, $reservation));
}

function add_notification_cancel($reservation)
{

    $db = Database::instance()->db();

    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $notification_time = gmdate("Y/m/j H:i:s", $time_stamp);

    $usr = get_reservation_owner($reservation)['owner_id'];

    $stmt = $db->prepare(
        "INSERT INTO usr_notification
            (notification_content,notification_date, is_read, usr, reservation)
            VALUES (?,?, ?, ?, ?)"
    );

    $stmt->execute(array("Reservation Cancelled", $notification_time, 0, $usr, $reservation));
}


/**
 *  Generate message notification 
 */
function add_message_notification($content, $from, $to)
{
    $db = Database::instance()->db();

    $date = new DateTime();
    $time_stamp = $date->getTimestamp();
    $notification_time = gmdate("Y/m/j H:i:s", $time_stamp);

    $stmt = $db->prepare(
        "INSERT INTO usr_message
            (message_txt, message_date, from_usr, to_usr)
            VALUES (?, ?, ?, ?)"
    );

    $stmt->execute(array($content, $notification_time, $from, $to));

    return $db->lastInsertId();
}

/*========================= UPDATES ============================== */

function update_to_read($notification_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "UPDATE
             usr_notification 
        SET 
            is_read = 1
        WHERE 
            id = ?"
    );

    $stmt->execute(array($notification_id));
}

function update_to_unread($notification_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "UPDATE 
            usr_notification 
        SET 
            is_read = 0
        WHERE 
            id = ?"
    );

    $stmt->execute(array($notification_id));
}

/*========================= REMOVE ============================== */

function remove_notification($notification_id)
{

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "DELETE FROM usr_notification
            WHERE id = ?"
    );

    $stmt->execute(array($notification_id));
}

function remove_reservation_notification($reservation_id)
{

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "DELETE FROM usr_notification
            WHERE reservation = ?"
    );

    $stmt->execute(array($reservation_id));
}
