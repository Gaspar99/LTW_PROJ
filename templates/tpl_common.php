<?php
include_once("../database/db_user.php");
include_once("../database/db_geography.php");
include_once("../templates/tpl_auth.php");
include_once("../templates/tpl_search.php");

/**
 * 
 */
function draw_site_header()
{
    $countries = get_countries();

    if (isset($_SESSION["user_email"])) {
        draw_header($_SESSION["user_email"]);
        draw_dropdrown($_SESSION["user_email"]);
    } else {
        draw_header(null);
        draw_sign_in();
        draw_sign_up($countries);
    }

    draw_search_bar($countries);
    draw_messages();
    init_site_content();
}

/**
 * Draws the html header for all pages. Receives an user id 
 * if the user is logged in in order to know what to draw
 */
function draw_header($user_email)
{ ?>

    <!DOCTYPE html>
    <html lang="en-US">

    <head>
        <title>Rental Eye</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto&display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="../script/main.js" defer></script>
    </head>

    <body id="site_container">
        <header id="site_header">
            <div id="site_logo">
                <a href="../pages/home.php">
                    <img src="../images/site/logo.jpeg" alt="Web site Logo">
                    <div id="site_name">Rental Eye</div>
                </a>
            </div>
            <button id="search_button" onclick="toggle_search_form()">Search</button>
            <?php if ($user_email == null) { ?>
                <div id="auth_forms_buttons">
                    <button onclick="open_sign_in_form()">Log In</button>
                    <button onclick="open_sign_up_form()">Sign Up</button>
                </div>
            <?php } else {
                    $user = get_user_name($user_email); ?>
                <button id="username_tile" onclick="toggle_dropdown_menu()">
                    <img src="../images/profiles/thumbs_small/<?= $user["profile_pic"] ?>.jpeg" alt="User Profile Picture">
                    <div id="username"><?= $user["first_name"] ?> <?= $user["last_name"] ?></div>
                    <i class="material-icons">arrow_drop_down</i>
                </button>
            <?php } ?>
        </header>

<?php } 


/**
 * 
 */
function draw_title($title)
{ ?>
    <h1><?= $title ?></h1>
    <hr>
<?php }


/**
 * 
 */
function draw_messages()
{
    if (isset($_SESSION["messages"])) { ?>

        <section id="messages">
            <?php foreach ($_SESSION["messages"] as $message) { ?>
                <div class="<?= $message["type"] ?>"><?= $message["content"] ?></div>
            <?php } ?>
        </section>

        <?php unset($_SESSION["messages"]);
    }
}


/**
 * 
*/
function init_site_content()
{ ?>
    <main id="site_content">
<?php }


/**
 * Draws the footer for all pages.
*/
function draw_footer()
{ ?>
                </main>
            <footer id="site_footer">Copyright © 2019 LTW FEUP</footer>
        </body>
    </html>
<?php } ?>