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
            LIMIT 10'
  );
  $stmt->execute(array("$name%"));
  $countries = $stmt->fetchAll();

  // JSON encode them
  echo json_encode($countries);
