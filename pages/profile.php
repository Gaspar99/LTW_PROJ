<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");
include_once("../templates/tpl_places.php");
include_once("../templates/tpl_auth.php");
include_once("../templates/tpl_search.php");
include_once("../templates/tpl_profile.php");

$user_id = $_GET["id"];

draw_site_header();
draw_profile($user_id);
draw_footer();
