<?php
    include_once('../includes/database.php');

    /**
    * 
    */
    function get_countries() {
        $db = Database::instance()->db();

        $stmt = $db->prepare(   
            'SELECT id,country_name FROM country ORDER BY country_name'
        );
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function get_cities($country_id) {
        $db = Database::instance()->db();
        $stmt = $db->prepare(   
            'SELECT city_name FROM city WHERE country_id = $country_id ORDER BY city_name'
        );
        $stmt->execute();
        return $stmt->fetchAll();
    }

?>