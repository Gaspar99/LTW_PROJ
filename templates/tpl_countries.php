<?php
    /**
    * 
    */
    function draw_countryOptions($countries) { 
        foreach ($countries as $country)
            draw_country($country);  
    } 
?>

<?php 
    /**
    * 
    */
    function draw_country($country) { ?>
        <option value=<?=$country['id']?>>
            <?=$country['country_name']?>
        </option>
    <?php }  ?>



