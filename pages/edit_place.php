<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");
include_once("../templates/tpl_common.php");
include_once("../templates/tpl_places.php");

$place_id = $_POST['place_id'];
$user_id = get_user_id($_SESSION["user_email"]);

draw_site_header();
draw_edit_place($user_id, $place_id);
draw_footer();