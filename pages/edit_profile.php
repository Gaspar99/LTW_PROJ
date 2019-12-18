<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");

include_once("../database/db_location.php");
include_once("../database/db_user.php");

include_once("../templates/tpl_places.php");

$user_id = get_user_id($_SESSION["user_email"]);

$countries = get_countries();

draw_site_header();
draw_edit_profile($user_id);
draw_footer();
