<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");

include_once("../database/db_location.php");
include_once("../database/db_user.php");

include_once("../templates/tpl_places.php");
include_once("../templates/tpl_profile.php");

$user_id = get_user_id($_SESSION["user_email"]);

$countries = get_countries();

$styles = array(
    "style_generic.css",
    "style_common.css",
    "style_header.css",
    "style_search.css",
    "style_edit_profile.css"
);

$scripts = array(
    "close_tabs.js",
    "common.js",
    "notifications.js",
    "search.js",
    "confirm_password.js",
    "user_dropdown.js"
);

draw_site_header($styles, $scripts);
draw_edit_profile($user_id);
draw_footer();
