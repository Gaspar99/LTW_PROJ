<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");

include_once("../templates/tpl_places.php");

$place_id = $_GET["id"];

$styles = array(
    "style_generic.css",
    "style_common.css",
    "style_header.css",
    "style_search.css",
    "style_animation.css",
    "style_place_page.css"
);

// Verify if user is not logged in
if (!isset($_SESSION["user_email"])) {
    $styles[] = "style_auth.css";
    $styles[] = "style_modal.css";
}

draw_site_header($styles);
draw_place_info($place_id);
draw_footer();
