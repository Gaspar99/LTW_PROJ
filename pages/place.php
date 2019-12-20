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

$scripts = array(
    "close_tabs.js",
    "common.js",
    "search.js",
    "comments.js",
    "image_gallery.js",
    "place_utils.js",
    "reservation.js"
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
draw_place_info($place_id);
draw_footer();
