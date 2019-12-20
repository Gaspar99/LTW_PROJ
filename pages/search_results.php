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

$styles = array(
    "style_generic.css",
    "style_common.css",
    "style_header.css",
    "style_search.css",
    "style_places_cards.css"
);

// Verify if user is not logged in
if (!isset($_SESSION["user_email"])) {
    $styles[] = "style_animation.css";
    $styles[] = "style_auth.css";
    $styles[] = "style_modal.css";
}

draw_site_header($styles);
draw_title("Search Results");
?> <script src="../script/title.js" onload="update_title('Search Results')" defer></script> <?php
draw_places($places); //draw search results
draw_footer();

