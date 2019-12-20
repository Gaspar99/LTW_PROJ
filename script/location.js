"use strict"

// Get target elements
let get_city_by_country_button = document.getElementById("country_select")

// Add event listeners
get_city_by_country_button.onclick = get_city_by_country

/**
 * 
 * @param {*} event 
 */
function get_city_by_country(event) {
    let country_id_selected = event.target
    let current_country = country_id_selected.options[country_id_selected.selectedIndex].value

    let request = new XMLHttpRequest()
    request.addEventListener("load", cities_received)
    request.open("get", "../ajax/get_cities.php?country_id=" + current_country, true)
    request.send()
}

/**
 * 
 * @param {*} country_select_element 
 * @param {*} obj 
 */
function cities_received() {
    let cities = JSON.parse(this.responseText)

    let list = document.getElementById("city_select")
    list.innerHTML = "" // Clean current cities

    // Add new suggestions
    cities.forEach((city) => {
        let item = document.createElement("option")
        item.value = city.city_id
        item.innerHTML = city.city_name
        list.appendChild(item)
    })
}