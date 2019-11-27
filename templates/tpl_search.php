<?php 

    function draw_search_bar($countries){ 
        ?>
        <div id ='searchForm' class='modal'>
            <form action="TODO">              
                <label for="country">Country</label>
                <select name="country">
                    <?
                    foreach($countries as $country){?>
                        <option value=<?=$country['country_name']?>><?=$country['country_name']?></option>
                   <? }
                    ?>                  
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
                <input type="date" value="2019-01-01"> <!-- script neede for the current date -->
                <input type="submit" value="Search">
            </form>
            <button type="button" onclick="closeSearchForm()">Close </button>
        </div>
        
<?  } 

?>  