<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");
include_once("../templates/tpl_places.php");
include_once("../templates/tpl_auth.php");
include_once("../templates/tpl_search.php");
include_once("../templates/tpl_profile.php");
include_once("../database/db_places.php");
include_once("../database/db_geography.php");

$user_id = get_user_id($_SESSION["user_email"]);

$countries = get_countries();

draw_site_header();
draw_edit_profile($user_id);
draw_footer();
