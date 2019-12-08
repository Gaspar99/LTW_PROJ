<?php
include_once("../includes/database.php");

/**
 * 
 */
function get_places()
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT place.id AS place_id,city.city_name AS city, country.country_name AS country, 
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
}

/**
 * 
 */
function get_place_gallery($place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT DISTINCT 
                owner_photo.photo_path AS img_name
            FROM 
                place, 
                owner_gallery,
                owner_photo
            WHERE place.owner_id = owner_gallery.place AND 
                place.owner_id = ?"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetch();
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
