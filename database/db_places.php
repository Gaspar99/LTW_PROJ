<?php
include_once("../includes/database.php");
include_once("../util/upload.php");

/**
 * 
 */
function get_places()
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT place.id AS place_id,city.city_name AS city_name, country.country_name AS country_name, 
                    place.title AS title, owner_photo.photo_path AS image_name,
                    place.rating AS rating, place.price_per_night AS price_per_night,
                    place.num_guests AS num_guests
            FROM place, city, country, owner_gallery, owner_photo
            WHERE place.city_id = city.id AND city.country_id = country.id
                    AND owner_gallery.place = place.id 
                    AND owner_gallery.photo = owner_photo.id"
    );

    $stmt->execute();

    return $stmt->fetchAll();
}

function get_place_card_info($place_id){
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT place.id AS place_id,city.city_name AS city_name, country.country_name AS country_name, 
                    place.title AS title, owner_photo.photo_path AS image_name,
                    place.rating AS rating, place.price_per_night AS price_per_night,
                    place.num_guests AS num_guests
            FROM place, city, country, owner_gallery, owner_photo
            WHERE place.city_id = city.id AND city.country_id = country.id
                    AND owner_gallery.place = place.id 
                    AND owner_gallery.photo = owner_photo.id AND place.id = ?"
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
    $img_name = hash("sha256", $string_to_hash);

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
    $originalFileName = "../images/places/originals/$img_name.jpeg";
    $mediumFileName = "../images/places/thumbs_medium/$img_name.jpeg";
    $smallFileName = "../images/places/thumbs_small/$img_name.jpeg";

    move_uploaded_file($_FILES["image"]["tmp_name"], $originalFileName);

    //Create an image representation of the original image
    $original = imagecreatefromfile($originalFileName);

    $width = imagesx($original);     // width of the original image
    $height = imagesy($original);    // height of the original image

    // Create and save a small square thumbnail
    $small_width = 350;
    $small_height = 230;

    if ($width < $small_width) {
        $small_width = $width;
        $mediumheight = $$small_height * ($small_height / $width);
    }
        
    $small = imagecreatetruecolor($small_width, $small_height);
    imagecopyresized($small, $original, 0, 0, 0, 0, $small_width, $small_height, $width, $height);
    imagejpeg($small, $smallFileName);

    // Calculate width and height of medium sized image (max width: 400)
    $mediumwidth = $width;
    $mediumheight = $height;
    if ($mediumwidth > 400) {
        $mediumwidth = 400;
        $mediumheight = $mediumheight * ($mediumwidth / $width);
    }
    
    // Create and save a medium image
    $medium = imagecreatetruecolor($mediumwidth, $mediumheight);
    imagecopyresized($medium, $original, 0, 0, 0, 0, $mediumwidth, $mediumheight, $width, $height);
    imagejpeg($medium, $mediumFileName);
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
                owner_gallery.place = ? 
                AND owner_gallery.photo = owner_photo.id"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetchAll();
}

/**
 * 
 */
function get_place_tags($place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT tag.tag_name 
            FROM place_tag, tag
            WHERE 
                place_tag.place = ? AND 
                tag.id = place_tag.tag"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetchAll();
}

/**
 * 
 */
function get_tags()
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT id, tag_name 
            FROM tag"
    );

    $stmt->execute();

    return $stmt->fetchAll();
}
