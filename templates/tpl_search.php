<?php
include_once("tpl_countries.php");

/**
 * Displays the search bar form
 */
function draw_search_bar()
{ ?>
    <form id="search_form" action="../actions/action_search.php" method="post">
        <span class="close" id="close_search_form" title="Close Form">&times;</span>
        
        <div class="search_type">
            <label for="search">Location</label>
            <input id="search_input" type="text" name="search" autocomplete="off" placeholder="Where to go?"
                pattern="^[ \w\s.,;\/()!?\$#@%&{}<>\"']+$">
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
                <span class="button dec_button">-</span>
                <input type="number" value="1" min="1" max="10" step="1" name="num_guests" required readonly>
                <span class="button inc_button">+</span>
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