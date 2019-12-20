<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");
include_once("../templates/tpl_places.php");
include_once("../templates/tpl_auth.php");
include_once("../templates/tpl_search.php");
include_once("../templates/tpl_profile.php");

$user_id = $_GET["id"];

$styles = array(
    "style_generic.css",
    "style_common.css",
    "style_header.css",
    "style_search.css",
    "style_animation.css",
    "style_modal.css",
    "style_places_cards.css",
    "style_profile_page.css"
);

$scripts = array(
    "close_tabs.js",
    "common.js",
    "search.js",
    "comments.js",
    "place_utils.js",
    "reservation.js"
);

// Verify if user is not logged in
if (!isset($_SESSION["user_email"])) {
    $styles[] = "style_auth.css";

    $scripts[] = "auth.js";
    $scripts[] = "confirm_password.js";
}
else {
    $scripts[] = "user_dropdown.js";
    $scripts[] = "notifications.js";
}

draw_site_header($styles, $scripts);
draw_profile($user_id);
draw_footer();
