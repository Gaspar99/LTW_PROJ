<?php
include_once("tpl_countries.php");

/**
 * 
 */
function draw_search_bar()
{ ?>
    <form id="search_form" action="../actions/action_search.php" method="post">
        

        <div class="search_type">
            <label for="search">Location</label>
            <input id="search_input" type="text" name="search" autocomplete="off" placeholder="Where to go?" onkeydown="option_navigate(event)"
                pattern="^[a-z A-Z0-9\\/\\\\.'\"]+$">
            <ul id="search_suggestions"></ul>
        </div>

        <div class="form_date">
            <div class="check_in">
                <label for="check_in">Check In</label>
                <input id="search_check_in" name="check_in" required autocomplete="off">
            </div>

            <div class="check_out">
                <label for="check_out">Check Out</label>
                <input id="search_check_out" name="check_out" required autocomplete="off">
            </div>
        </div>

        <div class="num_guests">
            <label for="num_guests">Max. Guests</label>
            <div id="num_guests_input">
                <span class="button" onclick="update_guests(event, -1)">-</span>
                <input onkeydown="return false" onmousedown="return false" type="number" value="1" min="1" max="10" step="1" name="num_guests" required>
                <span class="button" onclick="update_guests(event, +1)">+</span>
            </div>
        </div>

        <div id="min_price">
            <label for="price">Min Price</label>
            <input name="min" id="min_price_input" type="range" value="50" min="0" max="500" step="10" />
            <span id="min_price_value">50 €</span>
        </div>

        <div id="max_price">
            <label for="price">Max Price</label>
            <input name="max" id="max_price_input" type="range" value="150" min="0" max="500" step="10" />
            <span id="max_price_value">150 €</span>
        </div>


        <button class="submit_button" type="submit"><img src="../images/site/loupe.jpeg"></button>
    </form>

<?php  }  ?>