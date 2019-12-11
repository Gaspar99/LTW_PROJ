<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");
include_once("../templates/tpl_places.php");
include_once("../database/db_places.php");

session_start();

//receive places by post
if (isset($_SESSION['search_results'])){
    $search_results = $_SESSION['search_results'];

}
$places[] = "";  //todo rm this afterwards

//get place info to draw
foreach($search_results as $sr){
    array_push($places,get_place_card_info($sr['id'])); 
}
draw_site_header();
draw_title("Search Results");
//todo function to draw search inputed
draw_places($places); //draw search results
draw_footer();

?>