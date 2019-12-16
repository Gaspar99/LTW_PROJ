<?php
include_once("../includes/database.php");
include_once("../includes/db_notifications.php");

$id = $_POST["id"];

$db = Database::instance()->db();

$stmt = $db->prepare(
    "SELECT COUNT(usr_notification.is_read) AS unseen_num ,
        (SELECT COUNT(usr_notification.id) 
        FROM usr_notification 
        WHERE usr_notification.usr = (SELECT usr_notification.usr AS usr_id
                                        FROM usr_notification 
                                        WHERE usr_notification.id = ?) ) as notification_num
    FROM usr_notification 
    WHERE usr_notification.is_read = 1 
    AND usr_notification.usr = (SELECT usr_notification.usr AS usr_id
                                FROM usr_notification 
                                WHERE usr_notification.id = ?) "
);

$stmt->execute(array($id,$id));

$ret = $stmt->fetch();

echo json_encode($ret);