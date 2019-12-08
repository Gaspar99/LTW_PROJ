<?php
include_once("../includes/database.php");

/**
 * 
 */
function get_countries()
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT country.id AS id, country.country_name AS country_name 
            FROM country 
            ORDER BY country_name"
    );

    $stmt->execute();

    return $stmt->fetchAll();
}

/**
 * 
 */
function get_cities($country_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT city.city_name AS city_name 
            FROM city WHERE country_id = ? 
            ORDER BY city_name"
    );

    $stmt->execute(array($country_id));

    return $stmt->fetchAll();
}
