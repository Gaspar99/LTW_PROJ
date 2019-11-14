<?php
    /**
    * 
    */
    function draw_places($places) { ?>

        <section class="places">
        <?php foreach ($places as $place)
            draw_place($place);
        ?>
        </section>

    <?php } ?> 

    <?php 
    /**
    * 
    */ 
    function draw_place($place) { ?>

        <article class="place">
            <a href="">
                <h2><?=$place['city']?> - <?=$place['country']?></h2>
                <img src="../images/places/<?=$place['image_name']?>" alt="Place Image" />
                <h1><?=$place['title']?></h1>
                <ul>
                    <li><?=$place['rating']?></li>
                    <li><?=$place['price_per_night']?></li>
                    <li><?=$place['num_people']?></li>
                </ul>
            </a>
        </article>

    <?php } ?>