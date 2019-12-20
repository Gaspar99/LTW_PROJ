"use strict"

/* ---- SELECT DATE FOR SEARCH BAR ----- */
let search_picker = new Litepicker({
    element: document.getElementById('search_check_in'),
    elementEnd: document.getElementById('search_check_out'),
    singleMode: false,
    minDate: new Date().getTime(),
    hotelMode: true,
    format: "D - MMM - YYYY",
    startDate: search_check_in,
    endDate: search_check_out,
    numberOfMonths: 1,
    numberOfColumns: 1,
    disallowLockDaysInRange: true
})

// Get target elements
let search_button = document.getElementById("search_button")
let close_search_form_button = document.getElementById("close_search_form")
let min_price = document.getElementById("min_price_input")
let max_price = document.getElementById("max_price_input")
let search_input = document.getElementById("search_input")

// Add event listeners
search_button.onclick = toggle_search_form
close_search_form_button.onclick = close_search_form
min_price.oninput = update_price
max_price.oninput = update_price
search_input.addEventListener("keyup", country_city_changed)

// Event listeners

/**
 * Toggles search form
 */
function toggle_search_form() {
    let form = document.getElementById("search_form")

    if (form.style.display == "flex") {
        form.style.display = "none"
    }
    else {
        form.style.display = "flex"
    }
}

/**
 * Closes search form
 */
function close_search_form() {
    let form = document.getElementById("search_form")
    form.style.display = "none"
}

/**
 * Updates the min and max price on the search bar
 */
function update_price() {
    let min_price_input = parseFloat(min_price.value)
    let max_price_input = parseFloat(max_price.value)

    let min_price_value = document.getElementById("min_price_value")
    let max_price_value = document.getElementById("max_price_value")

    min_price_value.innerHTML = "" + min_price_input + "€"
    max_price_value.innerHTML = "" + max_price_input + "€"
}

/**
 * Responsible to get new suggestions when the user inputs text in the search bar
 */
function country_city_changed(event) {

    let text = event.target
    let request = new XMLHttpRequest()

    request.addEventListener("load", countries_received)
    if (text.value != "")
        request.open("get", "../ajax/search.php?name=" + text.value, true)
    else (document.getElementById("search_suggestions").innerHTML = "")
    request.send()
}

// Handler for ajax response received
function countries_received() {

    let countries = JSON.parse(this.responseText)
    let list = document.getElementById("search_suggestions")
    list.innerHTML = ""; // Clean current countries
    // Add new suggestions
    for (let country in countries) {
        if (countries[country].city_name == null) {
            let item = document.createElement("li")
            item.id = "result_suggestions" //css 
            item.innerHTML = countries[country].country_name

            item.addEventListener("click", function () {
                document.getElementById("search_input").value = countries[country].country_name
                document.getElementById("search_suggestions").innerHTML = ""
            });

            list.appendChild(item)
        }
        if (countries[country].city_name != null) {
            let item = document.createElement("li")
            item.id = "result_suggestions" //css 
            item.innerHTML = countries[country].country_name + ', ' + countries[country].city_name
            item.addEventListener("click", function () {
                document.getElementById("search_input").value = countries[country].country_name + ', ' + countries[country].city_name
                document.getElementById("search_suggestions").innerHTML = ""
            });
            list.appendChild(item)
        }
    }
}