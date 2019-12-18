<?php
include_once("../includes/database.php");
include_once("../util/upload.php");

/*========================= GETS ============================== */

/**
 * 
 */
function get_places()
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
            owner_gallery.photo = owner_photo.id
        GROUP BY place_id"
    );

    $stmt->execute();

    return $stmt->fetchAll();
}

function get_place_card_info($place_id)
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
                place.id = ?"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetch();
}

/**
 * 
 */
function get_place_info($place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT DISTINCT
                place.title AS title, 
                place.price_per_night AS price,
                place.place_address AS place_address, 
                place.place_description AS place_description, 
                place.num_guests AS num_guests,  
                place.rating AS rating,
                place.owner_id AS place_owner,
                city.city_name AS city_name,
                country.country_name AS country_name
            FROM place, country, city, owner_gallery 
            WHERE 
                place.id = ? AND 
                place.city_id = city.id AND
                city.country_id = country.id"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetch();
}

/**
 * 
 */

function get_owner_place_reservations($place_id)
{

    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            usr.usr_id,reservation.check_in, 
            reservation.check_out, 
            reservation.price,
            reservation.num_guests
        FROM 
            reservation, usr
        WHERE 
            place_id = ? AND 
            usr.usr_id = reservation.tourist"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetchAll();
}

/**
 * 
 */
function get_place_gallery($place_id)
{
    $db = Database::instance()->db();

    // Get photos uploaded by owner
    $stmt = $db->prepare(
        "SELECT 
            owner_photo.photo_path AS img_name
        FROM 
            owner_gallery,
            owner_photo
        WHERE 
            owner_gallery.place = ? AND 
            owner_gallery.photo = owner_photo.id"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetchAll();
}


/*========================= ADDS ============================== */

/**
 * 
 */
function add_place($place)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "INSERT INTO place
            (title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
            VALUES (?, ?, ?, ?, ?, ?, ?)"
    );

    $stmt->execute(array(
        $place["title"],
        $place["price"],
        $place["address"],
        $place["description"],
        $place["num_guests"],
        $place["owner"],
        $place["city"]
    ));

    return $db->lastInsertId();
}

/**
 * 
 */
function add_place_photo($place_id)
{
    //Hash image name based on user email and current time
    $string_to_hash = $place_id + time();
    $file_type = strtolower(pathinfo($_FILES["image"]["name"], PATHINFO_EXTENSION));
    $img_name = hash("sha256", $string_to_hash) . "." . $file_type;

    $db = Database::instance()->db();

    // Add new owner photo
    $stmt = $db->prepare(
        "INSERT INTO owner_photo
        (photo_path)
        VALUES (?)"
    );

    $stmt->execute(array(
        $img_name
    ));

    $photo_id = $db->lastInsertId();

    //Add owner photo to owner gallery
    $stmt = $db->prepare(
        "INSERT INTO owner_gallery 
        (place, photo)
        VALUES (?, ?)"
    );

    $stmt->execute(array(
        $place_id,
        $photo_id
    ));

    // Generate filenames for original, medium and small sizes 
    $original_file_name = "../images/places/originals/$img_name";
    $medium_file_name = "../images/places/thumbs_medium/$img_name";
    $small_file_name = "../images/places/thumbs_small/$img_name";

    move_uploaded_file($_FILES["image"]["tmp_name"], $original_file_name);

    //Create an image representation of the original image
    $original = image_create_from_file($file_type, $original_file_name);
    imagealphablending($original, true);

    $width = imagesx($original);     // width of the original image
    $height = imagesy($original);    // height of the original image

    // Create and save a small square thumbnail
    $small_width = 350;
    $small_height = 230;

    if ($width < $small_width) {
        $small_width = $width;
        $small_height = $small_height * ($small_width / $width);
    }

    $small = imagecreatetruecolor($small_width, $small_height);
    imagealphablending($small, false);
    imagesavealpha($small, true);
    imagecopyresized($small, $original, 0, 0, 0, 0, $small_width, $small_height, $width, $height);
    file_create_from_image($file_type, $small, $small_file_name);

    // Calculate width and height of medium sized image 
    $medium_width = 550;
    $medium_height = 400;

    if ($width < $medium_width) {
        $medium_width = $width;
        $medium_height = $medium_height * ($medium_width / $width);
    }

    // Create and save a medium image
    $medium = imagecreatetruecolor($medium_width, $medium_height);
    imagealphablending($medium, false);
    imagesavealpha($medium, true);
    imagecopyresized($medium, $original, 0, 0, 0, 0, $medium_width, $medium_height, $width, $height);
    file_create_from_image($file_type, $medium, $medium_file_name);
}

/*========================= REMOVES ============================== */

/**
 * 
 */
function remove_place($place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "DELETE FROM 
            place 
        WHERE 
            id = ?"
    );

    $stmt->execute(array($place_id));
}

/**
 * 
 */
function remove_place_photos($place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "DELETE FROM 
            owner_gallery 
        WHERE 
            place = ?"
    );

    $stmt->execute(array($place_id));
}

/*========================= UPDATES ============================== */

/**
 * 
 */
function update_place_info($place)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "UPDATE 
            place 
        SET 
            title = ?, 
            price_per_night = ?, 
            place_description = ?,
            num_guests = ?
        WHERE
            id = ?"
    );

    $stmt->execute(array(
        $place["title"],
        $place["price"],
        $place["description"],
        $place["num_guests"],
        $place["id"]
    ));
}

/**
 * 
 */
function update_place_rating($place_id)
{
    $db = Database::instance()->db();
 
    $stmt = $db->prepare(
        "UPDATE 
            place
        SET 
            rating = (
                SELECT 
                    AVG(usr_rating)
                FROM 
                    reservation
                WHERE 
                    place_id = ? AND
                    usr_comment <> ''
            )
        WHERE 
            id = ?"
    );   

    $stmt->execute(array($place_id, $place_id)); 
}

/*========================= VERIFICATIONS ============================== */

/**
 * 
 */
function is_owner($usr_id, $place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            * 
        FROM 
            place 
        WHERE 
            place.id = ? AND 
            place.owner_id = ?"
    );

    $stmt->execute(array($place_id, $usr_id));

    $ret = $stmt->fetch();

    return ($ret != null);
}

