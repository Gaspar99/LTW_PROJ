<?php
    include_once('../database/db_countries.php');


    /**
    * 
    */
    function draw_countryOptions() { 

        $countries = get_countries(); ?>

        <select>
            <?php 
                foreach ($countries as $country)
                    draw_country($country);
            ?>
        </select>

    <?php } ?>

<?php 
    /**
    * 
    */
    function draw_country() { ?>

        <option>

            <?php ?>

        </option>

    <?php }  ?>



