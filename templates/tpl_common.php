<?php 
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
                    <a href="../pages/main_page.php"><img src="logo.png" alt="Web site Logo"></a>
                    <a href="">Search</a>
                    <a href="">Sign In</a>
                    <a href="">Sign Up</a>
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
    

