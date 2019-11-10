<?php
    include_once('../includes/database.php');

    /**
    * 
    */
    function getUserName($user_id) {
        $db = Database::instance()->db();

        $stmt = $db->prepare(   
            'SELECT user.usr_first_name AS first_name, user.usr_last_name AS last_name
            FROM user WHERE user_id = ?');

        $stmt->execute(array($user_id));
        
        return $stmt->fetch();
    }

?>