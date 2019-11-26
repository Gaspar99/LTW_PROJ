<?php
    include_once('../includes/database.php');

    /**
    * 
    */
    function get_places() {
        $db = Database::instance()->db();

        $stmt = $db->prepare(   
            'SELECT city.city_name as city, country.country_name as country, 
                    place.title AS title, owner_photo.photo_path as image_name,
                    place.rating AS rating, place.price_per_night AS price_per_night,
                    place.num_people AS num_people
            FROM place, city, country, owner_gallery, owner_photo
            WHERE place.city_id = city.id AND city.country_id = country.id
                    AND owner_gallery.place = place.id 
                    AND owner_gallery.photo = owner_photo.id
            GROUP BY place.id
            LIMIT 1');
        
        $stmt->execute();

        return $stmt->fetchAll();
    }
?>