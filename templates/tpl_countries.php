<?php

/**
 * Displays all the country options to be selected
 */
function draw_country_options($countries)
{
    foreach ($countries as $country)
        draw_country($country);
}

/**
 * Displays a single country option to be selected
 */
function draw_country($country)
{ ?>
    <option value=<?= $country['id'] ?>>
        <?= $country['country_name'] ?>
    </option>
<?php }  ?>