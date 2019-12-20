<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");

include_once("../database/db_user.php");

include_once("../templates/tpl_places.php");

// Verify if user is logged in
if (!isset($_SESSION["user_email"]))
    die(header('Location: ../pages/home.php'));

    
$place_id = $_POST["place_id"];
$user_id = get_user_id($_SESSION["user_email"]);

$styles = array(
    "style_generic.css",
    "style_common.css",
    "style_header.css",
    "style_search.css",
    "style_add_&_edit_place.css"
);

$scripts = array(
    "close_tabs.js",
    "common.js",
    "notifications.js",
    "search.js",
    "image_gallery.js",
    "user_dropdown.js"
);

draw_site_header($styles, $scripts);
draw_edit_place($user_id, $place_id);
draw_footer();