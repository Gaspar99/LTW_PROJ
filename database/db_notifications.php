<?php 
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