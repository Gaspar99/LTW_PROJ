<?php
include_once("../includes/database.php");

/**
 * Searches for places in the database with the corresponding options
 */
function search_places($options)
{ 
    $db = Database::instance()->db();

    if($options["geo_type"]){
        if($options["country"] == "" && $options["city"] == ""){
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
    
            return $stmt->fetchAll();
        }
        if($options["country"] == "" && strlen($options["city"]) != 0){   
            $stmt = $db->prepare(
            "SELECT place.id
            FROM    place,city
            WHERE place.num_guests <= ? AND 
                place.price_per_night >= ? AND
                place.price_per_night <= ? AND
                place.city_id = city.id AND 
                city.city_name  = ? COLLATE NOCASE" 
            );
            
            $stmt->execute(array(
                $options["num_guests"],
                $options["min_price"],
                $options["max_price"],
                $options["city"]
            ));
          
            return $stmt->fetchAll();
        }
        if(strlen($options["country"]) != 0 && $options["city"] == ""){
            $stmt = $db->prepare(
                "SELECT 
                                    place.id
                FROM    
                    place,country,city
                WHERE 
                    place.num_guests <= ? AND 
                    place.price_per_night >= ? AND
                    place.price_per_night <= ? AND
                    country.country_name = ? COLLATE NOCASE AND
                    place.city_id  = city.id AND
                    city.country_id = country.id " 
            );
            $stmt->execute(array(
                $options["num_guests"],
                $options["min_price"],
                $options["max_price"],
                $options["country"]
            ));
    
            return $stmt->fetchAll();
        }
        if($options["country"] != "" && $options["city"] != ""){
            $stmt = $db->prepare(
                "SELECT 
                place.id
            FROM    
                place,country,city
            WHERE 
                place.num_guests <= ? AND 
                place.price_per_night >= ? AND
                place.price_per_night <= ? AND
                country.country_name = ? COLLATE NOCASE AND
                place.city_id  = city.id AND
                city.country_id = country.id AND
                ? = city.city_name COLLATE NOCASE" 
            );
            $stmt->execute(array(
                $options["num_guests"],
                $options["min_price"],
                $options["max_price"],
                $options["country"],
                $options["city"]
            ));
    
            return $stmt->fetchAll();
        } 
    }else{
        $stmt = $db->prepare(
            "SELECT place.id
            FROM place,country,city
            WHERE place.num_guests <= ? AND 
                place.price_per_night >= ? AND
                place.price_per_night <= ? AND
                (country.country_name LIKE upper(?) OR  city.city_name LIKE upper(?))AND
                place.city_id = city.id AND city.country_id = country.id" 
        );
        $str =  $options["country%"];
        $stmt->execute(array(
            $options["num_guests"],
            $options["min_price"],
            $options["max_price"],
            "$str%",
            "$str%"
        ));

        return $stmt->fetchAll();
    }
  
    //return search 
}
/**
 * Aux function to verify if a certain element is in the search results array
 */
function is_element($elem, $search_results){
    foreach($search_results as $e){
        if($e['id'] == $elem)
            return true;
    }
    return false;
}
/**
 * Removes an element from the search results
 */
function delete_elem($elem, $search_results){
    foreach($search_results as $e){
        if($e['id'] == $elem){
           $key = array_search ($e, $search_results);
           unset($search_results[$key]);
           return $search_results;
        }
    }
}

/**
 * Processes the string input by the user to get places
 */
function process_string($search_str)
{    
    $country = "";
    $city = "";

    if(strlen($search_str) == 0){
        return [$country, $city, 1];
    }

    if(strpos($search_str, ',')){
        //check what is the country and what is the city 
        $search_str = explode(",",$search_str);
        $piece1 = $search_str[0]; 
        $piece2 = $search_str[1]; 

        if($piece2[0] == " "){
            $piece2 = ltrim($piece2, ' '); 
        }
        $country = $piece1; 
        $city= $piece2;

        $db = Database::instance()->db();

        $stmt = $db->prepare(
            "SELECT * FROM city WHERE city.city_name = ? COLLATE NOCASE"
        );
        $stmt->execute(array($city));
        
        $city_state = $stmt->fetch();

        if($city_state == false){
            //check if order is changed 
            $stmt = $db->prepare(
                "SELECT * FROM country WHERE country.country_name = ? COLLATE NOCASE"
            );
            $stmt->execute(array($city));

            $country_state = $stmt->fetch();
            
            if($country_state == false) {
            
                $stmt = $db->prepare(
                    "SELECT * FROM city WHERE city.city_name = ? COLLATE NOCASE"
                );
                $stmt->execute(array($country));
                
                $city_state = $stmt->fetch();

                if($city_state == false)
                    return $geo = ["", " ",1];
                
                return $geo = ["", $country,1]; 
            }else{
                $stmt = $db->prepare( 
                    "SELECT * FROM city WHERE city.city_name = ? COLLATE NOCASE"
                );
                    $stmt->execute(array($country));
            
                    $city_state = $stmt->fetch();

                    if($city_state == false)
                        return $geo = [$city, " ",1];

                return $geo = [$city, $country,1]; 
            }
        }

        $stmt = $db->prepare(
            "SELECT * FROM country WHERE country.country_name = ? COLLATE NOCASE"
        );
        $stmt->execute(array($country));
        
        $country_state = $stmt->fetch();

        if($country_state == false)
            return $geo = [" ", $city,1];

        return $geo = [$country, $city,1];
    }

    if(strpos($search_str, " ") > 1){
        $search_str = explode(" ",$search_str);

        $piece1 = $search_str[0]; 
        $piece2 = $search_str[1]; 

        if($piece2[0] == " "){
            $piece2 = ltrim($piece2, ' '); 
        }
        $country = $piece1; 
        $city= $piece2;

        $db = Database::instance()->db();

        $stmt = $db->prepare(
            "SELECT * FROM city WHERE city.city_name = ? COLLATE NOCASE"
        );
        $stmt->execute(array($city));
        
        $city_state = $stmt->fetch();

        if($city_state == false){
            //check if order is changed 
            $stmt = $db->prepare(
                "SELECT * FROM country WHERE country.country_name = ? COLLATE NOCASE"
            );

            $stmt->execute(array($city));

            $country_state = $stmt->fetch();
            
            if($country_state == false){
            
                $stmt = $db->prepare(
                    "SELECT * FROM city WHERE city.city_name = ? COLLATE NOCASE"
                );

                $stmt->execute(array($country));
                
                $city_state = $stmt->fetch();

                if($city_state == false)
                    return $geo = ["", " ",1];
                
                return $geo = ["", $country,1]; 
            }else{
                $stmt = $db->prepare( 
                    "SELECT * FROM city WHERE city.city_name = ? COLLATE NOCASE"
                );
                    $stmt->execute(array($country));
            
                    $city_state = $stmt->fetch();

                    if($city_state == false)
                        return $geo = [$city, " ",1];

                return $geo = [$city, $country,1]; 
            }
        }

        $stmt = $db->prepare(
            "SELECT * FROM country WHERE country.country_name = ? COLLATE NOCASE"
        );

        $stmt->execute(array($country));
        
        $country_state = $stmt->fetch();

        if($country_state == false)
            return $geo = [" ", $city,1];

        return $geo = [$country, $city,1];
    }

    if(strpos($search_str, " ") === false){
        //check if country   
        $db = Database::instance()->db();

        $stmt = $db->prepare(
            "SELECT * FROM country WHERE country.country_name = ? COLLATE NOCASE"
        );

        $stmt->execute(array($search_str));
        
        $country_state = $stmt->fetch();
        if($country_state != false){
            return $geo = [$search_str, "",1];
        }
        //check if city 
        $stmt = $db->prepare(
            "SELECT * FROM city WHERE city.city_name = ? COLLATE NOCASE"
        );

        $stmt->execute(array($search_str));
        
        $city_state = $stmt->fetch();
        if($city_state != false){
            return $geo = ["", $search_str,1];
        }
        
        return $geo = [$search_str, $search_str,0];
    }
}
