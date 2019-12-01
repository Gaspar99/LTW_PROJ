<?php 
    include_once('tpl_countries.php');

    /**
    * 
    */
    function draw_search_bar($countries){  ?>

        <form id ="searchForm">
            <span class="close" onclick="closeSearchForm()" title="Close Form">&times;</span>

            <div class="form-country">
                <label for="country">Country</label>
                <select name="country" id="country_select" onclick="getCityByCountry()">
                    <?php draw_countryOptions($countries); ?> 
                </select>
            </div>

            <div class="form-city">
                <label for="city">City</label>
                <select name="city" id="city_select">
                    <option disabled selected>Select City</option>
                </select>
            </div>
                
            <div class="form-date">
                <label for="check_in">Check In</label>
                <input type="date" value="2019-01-01">
            </div>
                
            <div class="form-date">
                <label for="check_out">Check Out</label>
                <input type="date" value="2019-01-01"> <!-- script needed for the current date -->
            </div>

            <button class="submit-button" type="submit"><img src="../images/site/loupe.png"></button>
        </form>
        
<?php  }  ?>  

