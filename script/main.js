"use strict"

/**
 * 
 */
function open_sign_in_form() {
    let form = document.getElementById("sign_in_form")
    form.style.display = "block"
}

/**
 * 
 */
function close_sign_in_form() {
    let form = document.getElementById("sign_in_form")
    form.style.display = "none"
}

/**
 * 
 */
function open_sign_up_form() {
    let form = document.getElementById("sign_up_form")
    form.style.display = "block"
}

/**
 * 
 */
function close_sign_up_form() {
    let form = document.getElementById("sign_up_form")
    form.style.display = "none"
}

/**
 * 
 */
function toggle_search_form() {
    let form = document.getElementById("search_form")

    if (form.style.display == "flex")
        form.style.display = "none"
    else
        form.style.display = "flex"
}

/**
 * 
 */
function close_search_form() {
    let form = document.getElementById("search_form")
    form.style.display = "none"
}

/**
 * 
 */
function toggle_dropdown_menu() {
    let menu = document.getElementById("user_dropdown_menu")

    if (menu.style.display == "flex")
        menu.style.display = "none"
    else
        menu.style.display = "flex"
}

//go through images 
//TODO

/*
var slideIndex = 1
showDivs(slideIndex)

function plusDivs(n) {
  showDivs(slideIndex += n)
}

function showDivs(n) {
  var i
  var x = document.getElementsByClassName("mySlides")
  if (n > x.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = x.length} 
  for (i = 0 i < x.length i++) {
    x[i].style.display = "none" 
  }
  x[slideIndex-1].style.display = "block" 
}*/

//::::: AJAX STUFF ::::::://

/*------ Search Bar ----*/

/**
 * 
 * @param {*} event 
 */
function get_city_by_country(event) {

    let country_id_selected = event.target
    let current_country = country_id_selected.options[country_id_selected.selectedIndex].value

    let request = new XMLHttpRequest()
    request.addEventListener("load", function() {
        cities_received(event.target, this)
    })
    request.open("get", "../ajax/get_cities.php?country_id=" + current_country, true)
    request.send()
}

/**
 * 
 * @param {*} country_select_element 
 * @param {*} obj 
 */
function cities_received(country_select_element, obj) {
    let cities = JSON.parse(obj.responseText)

    let common_acestor_id = ""
    let city_selects = document.getElementsByClassName("city_select")
    for (let i = 0; i < city_selects.length; i++) {
        let element = find_first_common_ancestor(country_select_element, city_selects[i])
        if (element.id != "site_container") {
            common_acestor_id = element.id
            break
        }
    }

    let list = document.querySelector("#" + common_acestor_id + " .city_select")
    list.innerHTML = "" // Clean current cities

    // Add new suggestions
    cities.forEach((city) => {
        let item = document.createElement("option")
        item.innerHTML = city.city_name
        list.appendChild(item)
    })
}

/**
 * 
 * @param {*} node_a 
 * @param {*} node_b
 * @param {*} ancestors_b 
 */
function find_first_common_ancestor(node_a, node_b, ancestors_b) {
    var ancestors_b = ancestors_b || get_ancestors(node_b);
    if (ancestors_b.length == 0) return null;
    else if (ancestors_b.indexOf(node_a) > -1) return node_a;
    else if (node_a == document) return null;
    else return find_first_common_ancestor(node_a.parentNode, node_b, ancestors_b);
}

/**
 * 
 * @param {*} node 
 */
function get_ancestors(node) {
    if (node != document) return [node].concat(get_ancestors(node.parentNode));
    else return [node];
}

//
if (Array.prototype.indexOf === undefined) {
    Array.prototype.indexOf = function(element) {
        for (var i = 0, l = this.length; i < l; i++) {
            if (this[i] == element) return i;
        }
        return -1;
    };
}

/**
 * 
 * @param {*} price_per_night 
 */
function calculate_rent_price(price_per_night) {
    let check_in = document.getElementById("check_in_value")
    let check_out = document.getElementById("check_out_value")
    let num_guests = document.querySelector("#place_page #num_guests_input input")

    //One of the inputs required was not defined yet
    if (check_in.value.length == 0 || check_out.value.length == 0 || num_guests.value.length == 0) {
        return
    }

    // Calculation of number of days
    let check_in_value = new Date(check_in.value)
    let check_out_value = new Date(check_out.value)
    let diff = Math.abs(check_out_value.getTime() - check_in_value.getTime())
    let num_days = Math.ceil(diff / (1000 * 3600 * 24))

    let final_price = num_days * price_per_night * num_guests.value

    //Add final price to rent section
    let rent_section = document.getElementById("rent_section")

    // Get price tag div inside rent section
    let price_tag = document.getElementById("price_tag")

    //Price tag does not exist yet 
    if (price_tag == null) {

        //Price tag
        price_tag = document.createElement("div")
        price_tag.id = "price_tag"

        //Price title
        let price_title = document.createElement("h3")
        price_title.id = "price_title"
        price_title.innerHTML = "Price"

        //Price value
        let price_value = document.createElement("h2")
        price_value.id = "price_value"
        price_value.innerHTML = final_price + "€"

        price_tag.appendChild(price_title)
        price_tag.appendChild(price_value)
        rent_section.appendChild(price_tag)
    } else {
        //Price was previsouly calculated. Just need to change its value
        let price_value = document.getElementById("price_value")
        price_value.innerHTML = final_price + "€"
    }
}

/**
 * 
 * @param {*} event 
 * @param {*} number 
 */
function update_guests(event, number) {
    let num_guests

    if (number < 0)
        num_guests = event.target.nextElementSibling
    else
        num_guests = event.target.previousElementSibling

    num_guests.value = +num_guests.value + number

    if (+num_guests.value < +num_guests.min)
        num_guests.value = num_guests.min
    else if (+num_guests.value > +num_guests.max)
        num_guests.value = num_guests.max
}

/**
 * 
 * @param {*} event 
 */
function toggle_checkbox(event) {
    let checkmark = event.target.nextElementSibling

    if (checkmark.style.display == "block")
        checkmark.style.display = "none"
    else
        checkmark.style.display = "block"
}