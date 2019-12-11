<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");
include_once("../templates/tpl_places.php");
include_once("../database/db_places.php");

//receive places by post
$places = get_places();

draw_site_header();
draw_title("Search Results");
//todo function to draw search inputed
draw_places($places); //draw search results
draw_footer();
