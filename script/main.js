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