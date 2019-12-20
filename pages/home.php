<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");

include_once("../database/db_places.php");

include_once("../templates/tpl_places.php");


$places = get_places();

$styles = array(
    "style_generic.css",
    "style_common.css",
    "style_header.css",
    "style_search.css",
    "style_places_cards.css"
);

$scripts = array(
    "close_tabs.js",
    "common.js",
    "search.js",
);

// Verify if user is not logged in
if (!isset($_SESSION["user_email"])) {
    $styles[] = "style_animation.css";
    $styles[] = "style_auth.css";
    $styles[] = "style_modal.css";

    $scripts[] = "auth.js";
    $scripts[] = "confirm_password.js";
}
else {
    $scripts[] = "user_dropdown.js";
    $scripts[] = "notifications.js";
}

draw_site_header($styles, $scripts);
draw_title("Places for Rent");
draw_places($places);
draw_footer();
