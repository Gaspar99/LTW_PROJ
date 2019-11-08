<?php 
    include_once('../database/db_user.php');

    /**
    * Draws the header for all pages. Receives an user id 
    * if the user is logged in in order to know what to draw
    */
    function draw_header($user_id) { ?>

        <!DOCTYPE html>
        <html lang="en-US">
            <head>
                <title>Web Site Title</title>
                <meta charset="utf-8">
            </head>
            
            <body>
                <header>
                    <a href="../pages/main_page.php"><img src="../images/logo.png" alt="Web site Logo"></a>
                    <a href="">Search</a>
                    <?php if ($user_id == null) { ?>
                        <a href="">Sign In</a>
                        <a href="">Sign Up</a>
                    <?php } else { 
                        $user = getUserName($user_id); ?>
                        <a href=""><?=$user[first_name]?> <?=$user[last_name]?></a>
                    <?php } ?>
                </header>
    <?php } ?>


<?php
    /**
    * Draws the footer for all pages.
    */ 
    function draw_footer() { ?>

                <footer>Copyright © 2019 LTW FEUP</footer>
            </body>
        </html>
    <?php } ?>
    

