<?php

/**
 * 
 */
function draw_country_options($countries)
{
    foreach ($countries as $country)
        draw_country($country);
}


/**
 * 
 */
function draw_country($country)
{ ?>
    <option value=<?= $country['id'] ?>>
        <?= $country['country_name'] ?>
    </option>
<?php }  ?>