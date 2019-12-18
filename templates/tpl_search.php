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
            <input id="search_input" type="text" name="search" autocomplete="off" placeholder="Where to go?" onkeydown="option_navigate(event)">
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

        <div id="price" class="price">
            <label id="show_price" for="price">Price</label>
            <div class="price_slider">
                <input name="min" id="min_price" type="range" value="50" min="0" max="1000" step="10" />
                <input name="max" id="max_price" type="range" value="500" min="0" max="1000" step="10" />
            </div>
            <span id="min_price_value">50 €</span>
            <span id="max_price_value">500 €</span>
        </div>

        <button class="submit_button" type="submit"><img src="../images/site/loupe.jpeg"></button>
    </form>

<?php  }  ?>