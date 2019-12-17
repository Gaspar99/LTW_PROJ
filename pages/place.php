<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");
include_once("../templates/tpl_places.php");

$place_id = $_GET["id"];

draw_site_header();
draw_place_info($place_id);
draw_footer();
