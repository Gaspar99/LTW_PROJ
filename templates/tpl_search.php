<?php 
    include_once('tpl_countries.php');

    /**
    * 
    */
    function draw_search_bar($countries) { ?>

        <form id="searchForm">
            <span class="close" onclick="closeSearchForm()" title="Close Form">&times;</span>

            <div class="form-country">
                <label for="country">Country</label>
                <select name="country" class="country_select" oninput="getCityByCountry(event)">
                    <?php draw_countryOptions($countries); ?> 
                </select>
            </div>

            <div class="form-city">
                <label for="city">City</label>
                <select name="city" class="city_select">
                    <option disabled selected>Select City</option>
                </select>
            </div>
                
            <div class="form-date">
                <label for="check_in">Check In</label>
                <input type="date" name="check_in">
            </div>
                
            <div class="form-date">
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
                <input class="price_input" type="number" value= "0" min="0" step="10" name="price" required>
            </div>

            <button class="submit-button" type="submit"><img src="../images/site/loupe.png"></button>
        </form>
        
<?php  }  ?>  

