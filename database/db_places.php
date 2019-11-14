<?php
    include_once('../includes/database.php');

    /**
    * 
    */
    function get_places() {
        $db = Database::instance()->db();

        $stmt = $db->prepare(   
            'SELECT city.city_name AS city, country.country_name AS country,
                    photo.file_path AS image_name, place.title AS title,
                    place.rating AS rating, place.price_per_night AS price_per_night,
                    place.num_people AS num_people
            FROM place, city, country, photo
            WHERE place.city_id = city.id AND city.country_id = country.id
                    AND photo.place = place.id');
        
        $stmt->execute();

        return $stmt->fetchAll();
    }
?>