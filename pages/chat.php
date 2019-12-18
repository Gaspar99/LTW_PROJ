<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");

include_once("../templates/tpl_chat.php");


#get_messages 

draw_site_header();
draw_title("My messages");
draw_chat();
draw_footer();
