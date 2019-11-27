<?php 
    include_once('../database/db_user.php');

    /**
    * Draws the header for all pages. Receives an user id 
    * if the user is logged in in order to know what to draw
    */
    function draw_header($user_email) { ?>

        <!DOCTYPE html>
        <html lang="en-US">
            <head>
                <title>Rental Eye</title>
                <meta charset="utf-8">
                <link rel="stylesheet" href="../css/style.css">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto&display=swap">
                <script src="../script/main.js" defer></script>
            </head>
            
            <body class="site-container">
                <header class="site-header">
                    <a href="../pages/home.php"><img class="site-logo" src="../images/logo.png" alt="Web site Logo"></a>
                    <button onclick="openSearchForm()">Search</button>
                    <?php if ($user_email == null) { ?>
                        <button onclick="openSignInForm()">Log In</button>
                        <button onclick="openSignUpForm()">Sign Up</button>
                    <?php } else { 
                        $user = getUserName($user_email); ?>
                        <a class="button" href="../pages/home.php"><?=$user['first_name']?> <?=$user['last_name']?></a>
                    <?php } ?>
                </header>

                <main class="site-content">
    <?php } ?>


<?php
    /**
    * Draws the footer for all pages.
    */ 
    function draw_footer() { ?>
                </main>
                <footer class="site-footer">Copyright © 2019 LTW FEUP</footer>
            </body>
        </html>
    <?php } ?>
    

