'use strict'

function openSignInForm() {
    let form = document.getElementById('signInForm')
    form.style.display='block'
}

function closeSignInForm() {
    let form = document.getElementById('signInForm')
    form.style.display='none'
}

function openSignUpForm() {
    let form = document.getElementById('signUpForm')
    form.style.display='block'
}

function closeSignUpForm() {
    let form = document.getElementById('signUpForm')
    form.style.display='none'
}

function toggleSearchForm(){
    let form  = document.getElementById('searchForm')

    if (form.style.display=='flex')
        form.style.display='none'
    else
        form.style.display='flex'
}

function closeSearchForm(){
    let form  = document.getElementById('searchForm')
    form.style.display='none'
}

function toggleDropDownMenu() {
    let menu = document.getElementById('userDropdownMenu')

    if (menu.style.display == 'flex')
        menu.style.display='none'
    else 
        menu.style.display='flex'
}

//go through images 
//TODO

/*
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName('mySlides');
  if (n > x.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none'; 
  }
  x[slideIndex-1].style.display = 'block'; 
}*/

//::::: AJAX STUFF ::::::://

/*------ Search Bar ----*/

let countryIdSelected = document.getElementById('country_select')
countryIdSelected.addEventListener('change', getCityByCountry)

function getCityByCountry() {

    let countryIdSelected = document.getElementById('country_select')
    let currentCountry = countryIdSelected.options[countryIdSelected.selectedIndex].value
    
    let request = new XMLHttpRequest()
    request.addEventListener('load',citiesReceived)
    request.open('get','../ajax/get_cities.php?country_id=' + currentCountry,true)
    request.send()
}

function citiesReceived() {
    let cities = JSON.parse(this.responseText)
    let list = document.getElementById('city_select')
    list.innerHTML = ''; // Clean current cities

    // Add new suggestions
    for (let i = 0; i<cities.length; i++) {
        let item = document.createElement('option')
        item.innerHTML = cities[i].city_name
        list.appendChild(item)
    }
}

function calculateRentPrice(price_per_night) {
    let check_in = document.getElementById('check_in_value')
    let check_out = document.getElementById('check_out_value')
    let num_people = document.getElementById('num_people_value')

    //One of the inputs required was not defined yet
    if (check_in.value.length == 0 || check_out.value.length == 0 || num_people.value.length == 0) {
        return 
    }

    // Calculation of number of days
    let check_in_value = new Date(check_in.value)
    let check_out_value = new Date(check_out.value)
    let diff = Math.abs(check_out_value.getTime() - check_in_value.getTime())
    let num_days = Math.ceil(diff / (1000 * 3600 * 24))

    let final_price = num_days * price_per_night * num_people.value

    //Add final price to rent section
    let rent_section = document.getElementById('rent_section')

    // Get price tag div inside rent section
    let price_tag = document.getElementById('price_tag')

    //Price tag does not exist yet 
    if (price_tag == null) {

        //Price tag
        price_tag = document.createElement('div')
        price_tag.id = 'price_tag'

        //Price title
        let price_title = document.createElement('h3')
        price_title.id = 'price_title'
        price_title.innerHTML = 'Price'
    
        //Price value
        let price_value = document.createElement('h2')
        price_value.id = 'price_value'
        price_value.innerHTML = final_price + '€'

        price_tag.appendChild(price_title)
        price_tag.appendChild(price_value)
        rent_section.appendChild(price_tag)
    }
    else {
        //Price was previsouly calculated. Just need to change its value
        let price_value = document.getElementById('price_value')
        price_value.innerHTML = final_price + '€';
    }
    
}