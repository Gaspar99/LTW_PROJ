<?php
include_once("tpl_countries.php");

/**
 * 
 */
function draw_search_bar()
{ ?>
    <form id="search_form" action="../actions/action_search.php" method="post">
        <span class="close" onclick="close_search_form()" title="Close Form">&times;</span>

        <div class="search_type" >
            <label for= "search"> Search </label> 
            <input id="search_input" type = "text" name="search" autocomplete="off" placeholder="Where to go?" onkeydown="option_navigate(event)" >
            <ul id="search_suggestions"> </ul>
        </div>
        
        <div class="form_date">
            <label for="check_in">Check In</label>  
            <input id="litepicker_in" name="check_in" required>
            <script>
                let picker_in = new Litepicker({element: document.getElementById('litepicker_in'),
                    minDate: new Date().getTime(),
                    format: "D MMM, YYYY",
                    numberOfMonths: 1,
                    numberOfColumns: 1})
            </script>
        </div>
        
        <div class="form_date">
            <label for="check_out">Check Out</label>
            <!--<input type="date" name="check_out" required>-->
            <input id="litepicker_out" name="check_out" required>
            <script>
                let picker_out = new Litepicker({element: document.getElementById('litepicker_out'),
                    minDate: new Date().getTime(),
                    format: "D MMM, YYYY",
                    numberOfMonths: 1,
                    numberOfColumns: 1})
            </script>

            </input>
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
            <label id="show_price" for="price">Price: 0€</label>
            <input id="price_input" type="range" value="0" min="0" max='1000' step="100" name="price" onChange="price_change()" class= "slider" required>
        </div>

        <button class="submit_button" type="submit"><img src="../images/site/loupe.jpeg"></button>
    </form>

<?php  }  ?>