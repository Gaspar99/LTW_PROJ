<?php
    include_once("../includes/database.php");

    function search_places($options){
        //open db connection 
        $db = Database::instance()->db();

        //todo geography stuff
        //execute querry 
        $stmt = $db->prepare(
            "SELECT *
            FROM place
            WHERE num_guests < ? AND price_per_night < ? "
        );
    
        $stmt->execute(array(
            $options["num_guests"],
            $options["price"]
        ));

        //get each place reservation

        //select those avaliable

        //return search 
        return $stmt->fetchAll(); 
    }
    /**
     * 
     */
    function process_string($search_str){//todo - improve algorithm   
        $country=""; 
        $city= ""; 
        if(strpos($search_str,',') || strpos($search_str,', ') || strpos($search_str,' ')){
            
          
        }
        //check for the comma 

       return $geo= [$country,$city];
    }
?>