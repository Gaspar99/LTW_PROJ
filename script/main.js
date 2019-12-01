'use strict'

function openSignInForm() {
    let form = document.getElementById('signInForm');
    form.style.display='block';
}

function closeSignInForm() {
    let form = document.getElementById('signInForm');
    form.style.display='none';
}

function openSignUpForm() {
    let form = document.getElementById('signUpForm');
    form.style.display='block';
}

function closeSignUpForm() {
    let form = document.getElementById('signUpForm');
    form.style.display='none';
}

function toggleSearchForm(){
    let form  = document.getElementById('searchForm');

    if (form.style.display=='flex')
        form.style.display='none';
    else
        form.style.display='flex';
}

function closeSearchForm(){
    let form  = document.getElementById('searchForm');
    form.style.display='none';
}

function toggleDropDownMenu() {
    let menu = document.getElementById('userDropdownMenu');

    if (menu.style.display == 'flex')
        menu.style.display='none';
    else 
        menu.style.display='flex';
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
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none"; 
  }
  x[slideIndex-1].style.display = "block"; 
}*/

//::::: AJAX STUFF ::::::://

/*------ Search Bar ----*/

let countryIdSelected = document.getElementById('country_select');
countryIdSelected.addEventListener('change',getCityByCountry);

function getCityByCountry(){

    let countryIdSelected = document.getElementById('country_select');
    let currentCountry = countryIdSelected.options[countryIdSelected.selectedIndex].value;
    
    let request = new XMLHttpRequest();
    request.addEventListener("load",citiesReceived);
    request.open("get","../database/get_cities.php?country_id=" + currentCountry,true);
    request.send();
}

function citiesReceived(){
    let cities = JSON.parse(this.responseText);
    let list = document.getElementById("city_select");
    list.innerHTML = ""; // Clean current cities

    // Add new suggestions
    for (let i = 0; i<cities.length; i++) {
        let item = document.createElement("option");
        item.innerHTML = cities[i].city_name;
        list.appendChild(item);
    }
}