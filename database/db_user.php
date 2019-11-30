<?php
    include_once('../includes/database.php');

    /**
    * 
    */
    function getUserName($user_email) {
        $db = Database::instance()->db();

        $stmt = $db->prepare(   
            'SELECT usr.usr_first_name AS first_name, usr.usr_last_name AS last_name,
                usr.usr_profile_picture AS profile_pic
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
    function getUserId($email) {
        $db = Database::instance()->db();

        $stmt = $db->prepare(
            'SELECT usr.usr_id AS id
            FROM usr 
            WHERE usr.usr_email = ?');
        
        $stmt->execute(array($email));
        return $stmt->fetch(); 
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
            password_hash($user['password'], PASSWORD_DEFAULT, $options),
            $user['phone_num'],
            $user['country_id']
        ));
    }
    
    /**
    * 
    */
    function getUserInfo($user_id) { #should i get password?
        $db = Database::instance()->db();
        $stmt = $db->prepare(
            'SELECT 
                usr_first_name AS first_name,
                usr_last_name AS last_name,
                usr_email AS email, 
                usr_phone_number AS phone_number,
                usr_profile_picture AS profile_pic,
                rating AS rating, 
                country_id AS country,
                usr_password AS password 
            FROM usr 
            WHERE usr_id = ?' 
        );

        $stmt->execute(array($user_id));

        return $stmt->fetch(); 
    }

    /**
    * 
    */
    function update_profile($user){
        #todo fix this
        $db = Database::instance()->db();

        $stmt = $db->prepare(
            'UPDATE 
                usr 
            SET 
                usr_first_name = ?, 
                usr_last_name = ?, 
                usr_email = ?, 
                usr_phone_number = ?, 
                usr_password = ?
            WHERE usr_id = ?' 
        );
        
        $stmt->execute(array(
            $user['first_name'],
            $user['last_name'],
            $user['email'],
            $user['phone_number'],
            password_hash($user['password'], PASSWORD_DEFAULT),
            $user['id']
        ));
   }

    /**
    * 
    */
    function getUserPlacesId($user_id) {
        $db = Database::instance()->db();

        $stmt = $db->prepare(
            'SELECT id AS place_id FROM place WHERE owner_id = ?' 
        );

        $stmt->execute(array($user_id));

        return $stmt->fetchAll(); 
    }
?>