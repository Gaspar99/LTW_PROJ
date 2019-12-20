<?php
include_once("../includes/database.php");

/*========================= GETS ============================== */

/**
 * Gets the id and name of all countries in the database
 */
function get_countries()
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            country.id AS id, 
            country.country_name AS country_name 
        FROM 
            country 
        ORDER BY 
            country_name"
    );

    $stmt->execute();

    return $stmt->fetchAll();
}

/**
 *  Get the countries that start with $name
 */
function get_countries_by_name($name)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        'SELECT 
            id AS country_id, 
            country_name
        FROM 
            country
        WHERE 
            country_name
        LIKE 
            upper(?) 
        ORDER BY 
            country_name ASC
        LIMIT 2'
    );

    $stmt->execute(array("$name%"));

    return $stmt->fetchAll();
}

/**
 * Gets all the countries that have a city that starts with $name
 */
function get_countries_by_city($name)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        'SELECT DISTINCT 
            country.id AS country_id, 
            city.id AS city_id, 
            country_name, 
            city_name
        FROM 
            country, city 
        WHERE 
            city_name LIKE upper(?) AND 
            city.country_id = country.id
        ORDER BY city_name ASC
        LIMIT 8'
      );

    $stmt->execute(array("$name%"));

    return $stmt->fetchAll();
}


/**
 * Gets all the cities from the country with id equal to the parameter
 */
function get_cities($country_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            id AS city_id, 
            city.city_name AS city_name 
        FROM 
            city 
        WHERE 
            country_id = ? 
        ORDER BY 
            city_name"
    );

    $stmt->execute(array($country_id));

    return $stmt->fetchAll();
}
