<?php
include_once("../includes/database.php");

function search_places($options)
{
    //open db connection 
    $db = Database::instance()->db();

    //todo geography stuff

    //execute querry 
    $stmt = $db->prepare(
        "SELECT 
            id
        FROM    
            place
        WHERE 
            num_guests <= ? AND 
            price_per_night >= ? AND
            price_per_night <= ?"
    );

    $stmt->execute(array(
        $options["num_guests"],
        $options["min_price"],
        $options["max_price"]
    ));

    //return search 
    return $stmt->fetchAll();
}
/**
 * 
 */
function is_element($elem, $search_results){
    foreach($search_results as $e){
        if($e['id'] == $elem)
            return true;
    }
    return false;
}
/**
 * 
 */
function delete_elem($elem, $search_results){
    foreach($search_results as $e){
        if($e['id'] == $elem){
           $key = array_search ($e, $search_results);
           print_r($key);
           unset($search_results[$key]);
           return $search_results;
        }
    }
}

/**
 * 
 */
function process_string($search_str)
{ //todo - improve algorithm   
    $country = "";
    $city = "";
    if (strpos($search_str, ',') || strpos($search_str, ', ') || strpos($search_str, ' ')) { }
    //check for the comma 

    return $geo = [$country, $city];
}
