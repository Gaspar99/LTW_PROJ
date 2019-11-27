<?php 
    include_once('tpl_countries.php');

    /**
    * 
    */
    function draw_search_bar($countries){  ?>

        <div id ='searchForm'>
            <form>

                <label for="country">Country</label>
                <select name="country">
                    <?php draw_countryOptions($countries); ?> 
                </select>

                <label for="city">City</label>
                <select name="city">
                    <option value="orange">Orange</option>
                    <option value="banana" selected>Banana</option>
                    <option value="tomato">Tomato</option>
                    <option value="apple">Apple</option> 
                </select>
                
                <label for="check_in">Check In</label>
                <input type="date" value="2019-01-01">
                
                <label for="check_out">Check Out</label>
                <input type="date" value="2019-01-01"> <!-- script needed for the current date -->

                <input class="submit-button" type="submit" value="Search">
            </form>
            <button type="button" onclick="closeSearchForm()">Close </button>
        </div>
        
<?php  }  ?>  

