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

// Verify if user is not logged in
if (!isset($_SESSION["user_email"])) {
    $styles[] = "style_auth.css";
}

draw_site_header($styles);
draw_profile($user_id);
draw_footer();
