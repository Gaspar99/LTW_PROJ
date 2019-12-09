<?php
include_once("tpl_countries.php");

/**
 * 
 */
function draw_search_bar($countries)
{ ?>

    <form id="search_form">
        <span class="close" onclick="close_search_form()" title="Close Form">&times;</span>

        <div class="search_type">
            <label for= "search"> Search </label> 
            <input id="search_input" type = "text" name="search" >
            <ul id="search_suggestions"> </ul>
        </div>
        <!--
        <div class="form_country">
            <label for="country">Country</label>
            <select name="country" class="country_select" oninput="get_city_by_country(event)">
                <?= draw_country_options($countries); ?>
            </select>
        </div>

        <div class="form_city">
            <label for="city">City</label>
            <select name="city" class="city_select">
                <option disabled selected>Select City</option>
            </select>
        </div>
-->
        <div class="form_date">
            <label for="check_in">Check In</label>
            <input type="date" name="check_in">
        </div>

        <div class="form_date">
            <label for="check_out">Check Out</label>
            <input type="date" name="check_out">
        </div>

        <div class="num_guests">
            <label for="num_guests">Max. Guests</label>
            <div id="num_guests_input">
                <span class="button" onclick="update_guests(event, -1)">-</span>
                <input disabled type="number" value="1" min="1" max="10" step="1" name="num_guests" required>
                <span class="button" onclick="update_guests(event, +1)">+</span>
            </div>
        </div>

        <div class="price">
            <label for="price">Price</label>
            <input class="price_input" type="number" value="0" min="0" step="10" name="price" required>
        </div>

        <button class="submit_button" type="submit"><img src="../images/site/loupe.png"></button>
    </form>

<?php  }  ?>