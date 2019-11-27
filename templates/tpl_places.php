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
                <h2 class="place-city-country"><?=$place['city']?> - <?=$place['country']?></h2>
                <img class="place-image"  src="../images/places/<?=$place['image_name']?>" alt="Place Image" />
                <h1 class="place-title"><?=$place['title']?></h1>
                <ul call="place-footer">
                    <li class="place-rating"><?=$place['rating']?></li>
                    <li class="place-price"><?=$place['price_per_night']?></li>
                    <li class="place-num-people"><?=$place['num_people']?></li>
                </ul>
            </a>
        </article>

    <?php } ?>