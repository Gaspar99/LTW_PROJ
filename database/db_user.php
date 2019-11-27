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
    * Verifies if a certain email, password combination
    * exists in the database. Use the sha1 hashing function.
    */
    function checkUserPassword($email, $password) {
        $db = Database::instance()->db();

        $stmt = $db->prepare('SELECT * FROM usr WHERE usr_email = ?');
        $stmt->execute(array($email));

        $user = $stmt->fetch();

        return password_verify($password, $user['password']) ? $user['usr_email'] : null;
    }

    /**
    * 
    */
    function addUser($user) {
        $db = Database::instance()->db();

        $stmt = $db->prepare('INSERT INTO usr VALUES(NULL, ?, ?, ?, ?, ?, NULL, NULL, ?)');
        $stmt->execute(array(
            $user['first_name'], 
            $user['last_name'],
            $user['email'],
            password_hash($user['password'], PASSWORD_DEFAULT),
            $user['phone_num'],
            $user['country_id']
        ));
    }

?>