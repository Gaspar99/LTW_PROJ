<?php
    /**
    * 
    */
    function draw_places($places) { ?>

        <section id="places">

        <?php foreach ($places as $place)
            draw_place($place);
        ?>

    <?php } ?> 

    <?php 
    /**
    * 
    */ 
    function draw_place($place) { ?>

        <article class="place">


        </article>

    <?php } ?>