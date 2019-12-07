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
        
        $user = $stmt->fetch();  

        return $user['id'];
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

   function update_profile_pic($user){

        #todo fix this 
        $db = Database::instance()->db();

        $stmt = $db->prepare(
            'UPDATE 
                usr 
            SET 
                usr_profile_picture = ?
            WHERE usr_id = ?' 
        );
    
        $stmt->execute(array(
            $_FILES['image']['name'],
            $user['id']
        )); 

        //todo see smth to better handle image id 
        //get id image 
        //$id = $db->lastInsertId();
        $img_name=  $_FILES['image']['name'];
        //generate filenames dor original, medium and small sizes 
        //todo check how should i storage 
        $originalFileName = "../images/profiles/originals/$img_name";
        $smallFileName = "../images/profiles/thumbs_small/$img_name";
        $mediumFileName = "../images/profiles/thumbs_medium/$img_name";
                 
        move_uploaded_file($_FILES['image']['tmp_name'], $originalFileName);    
       
        //Create an image representation of the original image
        $original = imagecreatefromjpeg($originalFileName);

        $width = imagesx($original);     // width of the original image
        $height = imagesy($original);    // height of the original image
        $square = min($width, $height);  // size length of the maximum square

        // Create and save a small square thumbnail
        $small = imagecreatetruecolor(200, 200);
        imagecopyresized($small, $original, 0, 0, ($width>$square)?($width-$square)/2:0, ($height>$square)?($height-$square)/2:0, 200, 200, $square, $square);
        imagejpeg($small, $smallFileName);

        // Calculate width and height of medium sized image (max width: 400)
        $mediumwidth = $width;
        $mediumheight = $height;
        if ($mediumwidth > 400) {
            $mediumwidth = 400;
            $mediumheight = $mediumheight * ( $mediumwidth / $width );
        }
        // Create and save a medium image
        $medium = imagecreatetruecolor($mediumwidth, $mediumheight);
        imagecopyresized($medium, $original, 0, 0, 0, 0, $mediumwidth, $mediumheight, $width, $height);
        imagejpeg($medium, $mediumFileName);
    }

    /**
    * 
    */
    function getUserPlaces($user_id) {
        $db = Database::instance()->db();

        $stmt = $db->prepare(
            'SELECT place.id AS place_id,city.city_name AS city, country.country_name AS country, 
                place.title AS title, owner_photo.photo_path AS image_name,
                place.rating AS rating, place.price_per_night AS price_per_night,
                place.num_guests AS num_guests
            FROM place, city, country, owner_gallery, owner_photo
            WHERE place.city_id = city.id AND city.country_id = country.id
                AND owner_gallery.place = place.id 
                AND owner_gallery.photo = owner_photo.id AND place.owner_id=?' 
        );

        $stmt->execute(array($user_id));

        return $stmt->fetchAll(); 
    }
?>