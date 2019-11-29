<?php
    include_once('../includes/database.php');

    /**
    * 
    */
    function getUserName($user_email) {
        $db = Database::instance()->db();

        $stmt = $db->prepare(   
            'SELECT usr.usr_first_name AS first_name, usr.usr_last_name AS last_name
            FROM usr WHERE usr_email = ?');

        $stmt->execute(array($user_email));
        
        return $stmt->fetch();
    }

    /**
    * Verifies if a certain email and password combination
    * exists in the database. Use the sha1 hashing function.
    */
    function checkUserPassword($email, $password) {
        $db = Database::instance()->db();

        $stmt = $db->prepare(
            'SELECT usr.usr_password AS usr_password
            FROM usr 
            WHERE usr.usr_email = ?');

        $stmt->execute(array($email));
        $user = $stmt->fetch();

        return $user !== false && password_verify($password, $user['usr_password']);
    }

    /**
    * 
    */
    function addUser($user) {
        $db = Database::instance()->db();

        $options = ['cost' => 12];

        $stmt = $db->prepare(
            'INSERT INTO usr
            (usr_first_name, usr_last_name, usr_email, usr_phone_number, usr_password, country_id)
            VALUES(?, ?, ?, ?, ?, ?)'
        );

        $stmt->execute(array(
            $user['first_name'], 
            $user['last_name'],
            $user['email'],
            $user['phone_num'],
            password_hash($user['password'], PASSWORD_DEFAULT, $options),
            $user['country_id']
        ));
    }

?>