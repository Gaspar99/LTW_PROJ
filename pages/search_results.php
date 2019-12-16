<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");
include_once("../templates/tpl_places.php");
include_once("../database/db_places.php");

//receive places by post
if (isset($_SESSION['search_results'])){
    $search_results = $_SESSION['search_results'];

}
$places[] = ""; 

//get place info to draw
foreach($search_results as $sr){
    array_push($places, get_place_card_info($sr['id'])); 
}
$rm = array_shift($places);  //remove empty value 
draw_site_header();
draw_title("Search Results");
?> <script src="../script/title.js" onload="update_title('Search Results')" defer></script> <?php
//todo function to draw search inputed


draw_places($places); //draw search results
draw_footer();

?>