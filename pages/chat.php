<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");

include_once("../templates/tpl_chat.php");

// Verify if user is logged in
if (!isset($_SESSION["user_email"]))
    die(header('Location: ../pages/home.php'));

$new_msg = [];

#get_messages 

$styles = array(
    "style_generic.css",
    "style_common.css",
    "style_header.css",
    "style_search.css",
    "style_chat.css"
);

$scripts = array(
    "close_tabs.js",
    "common.js",
    "notifications.js",
    "search.js",
    "send_message.js",
    "user_dropdown.js"
);

draw_site_header($styles, $scripts);
draw_title("My messages");
draw_chat($new_msg);
draw_footer();
