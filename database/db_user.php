<?php
include_once("../includes/database.php");
include_once("../util/upload.php");


/*========================= GETS ============================== */

/**
 * Goes through the database and gets the user name with the email passed
 * as argument
 */
function get_user_name($user_email)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            usr.usr_first_name AS first_name, 
            usr.usr_last_name AS last_name,
            usr.usr_profile_picture AS profile_pic
        FROM 
            usr 
        WHERE usr_email = ?"
    );

    $stmt->execute(array($user_email));

    return $stmt->fetch();
}
/**
 * Goes through the database and returns the id of the user
 * with the email passed as argument
 */
function get_user_id($email)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT usr.usr_id AS id
            FROM usr 
            WHERE usr.usr_email = ?"
    );

    $stmt->execute(array($email));

    $user = $stmt->fetch();

    return $user["id"];
}

/**
 * Returns an array with the info of the user with the id passed 
 * in as an argument
 */
function get_user_info($user_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
                usr_first_name AS first_name,
                usr_last_name AS last_name,
                usr_email AS email, 
                usr_phone_number AS phone_number,
                usr_profile_picture AS profile_pic,
                rating AS rating, 
                country_id AS country
            FROM usr 
            WHERE usr_id = ?"
    );

    $stmt->execute(array($user_id));

    return $stmt->fetch();
}

/**
 * Gets all the places owned by a user
 */
function get_user_places($user_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            place.id AS place_id, 
            city.city_name AS city, 
            country.country_name AS country, 
            place.title AS title, 
            owner_photo.photo_path AS image_name,
            place.rating AS rating,
            place.price_per_night AS price_per_night,
            place.num_guests AS num_guests
        FROM 
            place, city, country, owner_gallery, owner_photo
        WHERE 
            place.city_id = city.id AND 
            city.country_id = country.id AND 
            owner_gallery.place = place.id AND 
            owner_gallery.photo = owner_photo.id AND 
            place.owner_id = ?
        GROUP BY place_id"
    );

    $stmt->execute(array($user_id));

    return $stmt->fetchAll();
}

/**
 * Gets the id of user with the email given
 */
function get_id_by_email($user_email)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            usr_id AS id 
        FROM 
            usr 
        WHERE usr_email=?"
    );

    $stmt->execute(array($user_email));

    return $stmt->fetch();
}

/*========================= ADDS ============================== */

/**
 * Adds a new user to the database
 */
function add_user($user)
{
    $db = Database::instance()->db();

    $options = ["cost" => 12];

    $stmt = $db->prepare(
        "INSERT INTO usr
            (usr_first_name, usr_last_name, usr_email, usr_phone_number, usr_password, country_id)
            VALUES(?, ?, ?, ?, ?, ?)"
    );

    $stmt->execute(array(
        $user["first_name"],
        $user["last_name"],
        $user["email"],
        $user["phone_num"],
        password_hash($user["password"], PASSWORD_DEFAULT, $options),
        $user["country_id"]
    ));
}

/*========================= UPDATES ============================== */

/**
 * Updated the profile info of a user
 */
function update_profile($user)
{
    $db = Database::instance()->db();

    if ($user["password"] == null) {

        $stmt = $db->prepare(
            "UPDATE 
                usr 
            SET 
                usr_first_name = ?, 
                usr_last_name = ?, 
                usr_email = ?, 
                usr_phone_number = ?
            WHERE 
                usr_id = ?"
        );

        $stmt->execute(array(
            $user["first_name"],
            $user["last_name"],
            $user["email"],
            $user["phone_number"],
            $user["id"]
        ));
    } else {

        $stmt = $db->prepare(
            "UPDATE 
                usr 
            SET 
                usr_first_name = ?, 
                usr_last_name = ?, 
                usr_email = ?, 
                usr_phone_number = ?, 
                usr_password = ?
            WHERE 
                usr_id = ?"
        );

        $stmt->execute(array(
            $user["first_name"],
            $user["last_name"],
            $user["email"],
            $user["phone_number"],
            password_hash($user["password"], PASSWORD_DEFAULT),
            $user["id"]
        ));
    }
}

/**
 * Updates the profile picture of a user
 */
function update_profile_pic($user_id)
{
    //Hash image name based on user email and current time
    $string_to_hash = $user_id + time();
    $file_type = strtolower(pathinfo($_FILES["image"]["name"], PATHINFO_EXTENSION));
    $img_name = hash("sha256", $string_to_hash) . "." . $file_type;

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "UPDATE 
            usr 
        SET 
            usr_profile_picture = ?
        WHERE 
            usr_id = ?"
    );

    $stmt->execute(array(
        $img_name,
        $user_id
    ));

    // Generate filenames for original, medium and small sizes 
    $original_file_name = "../images/profiles/originals/$img_name";
    $medium_file_name = "../images/profiles/thumbs_medium/$img_name";
    $small_file_name = "../images/profiles/thumbs_small/$img_name";

    move_uploaded_file($_FILES["image"]["tmp_name"], $original_file_name);

    //Create an image representation of the original image
    $original = image_create_from_file($file_type, $original_file_name);
    imagealphablending($original, true);

    $width = imagesx($original);     // width of the original image
    $height = imagesy($original);    // height of the original image
    $square = min($width, $height);  // size length of the maximum square

    // Create and save a small square thumbnail
    $small = imagecreatetruecolor(100, 100);
    imagealphablending($small, false);
    imagesavealpha($small, true);
    imagecopyresized($small, $original, 0, 0, ($width > $square) ? ($width - $square) / 2 : 0, ($height > $square) ? ($height - $square) / 2 : 0, 100, 100, $square, $square);
    file_create_from_image($file_type, $small, $small_file_name);


    // Create and save a medium image
    $medium = imagecreatetruecolor(400, 400);
    imagealphablending($medium, false);
    imagesavealpha($medium, true);
    imagecopyresized($medium, $original, 0, 0, ($width > $square) ? ($width - $square) / 2 : 0, ($height > $square) ? ($height - $square) / 2 : 0, 400, 400, $square, $square);
    file_create_from_image($file_type, $medium, $medium_file_name);
}


/*========================= VERIFICATIONS ============================== */

/**
 * Verifies if a certain email and password combination
 * exists in the database. Use the sha1 hashing function.
 */
function check_user_password($email, $password)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            usr.usr_password AS usr_password
        FROM 
            usr 
        WHERE 
            usr.usr_email = ?"
    );

    $stmt->execute(array($email));

    $user = $stmt->fetch();

    return $user !== false && password_verify($password, $user["usr_password"]);
}

