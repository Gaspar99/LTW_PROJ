<?php
  include_once("../includes/database.php");

  $name = $_GET['name'];
  
  $db = Database::instance()->db();
  // Get the countries that start with $name
  $stmt = $db->prepare(
      'SELECT id AS country_id, country_name
        FROM country
        WHERE country_name
            LIKE upper(?) 
            ORDER BY country_name ASC
            LIMIT 2'
  );
  $stmt->execute(array("$name%"));
  $countries_search = $stmt->fetchAll();

  $stmt = $db->prepare(
    'SELECT DISTINCT country.id AS country_id, city.id AS city_id, country_name, city_name
      FROM country,city 
      WHERE city_name 
            LIKE upper(?) 
            AND city.country_id = country.id
            ORDER BY city_name ASC
            LIMIT 8'
  );
  $stmt->execute(array("$name%"));
  $countries_cities_search = $stmt->fetchAll();

  $search = array_merge($countries_search,$countries_cities_search);
  
  // JSON encode them
  echo json_encode($search);
