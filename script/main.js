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
function toggle_notifications() {
    let box = document.getElementById("notifications_box")

    if (box.style.display == "flex")
        box.style.display = "none"
    else
        box.style.display = "flex"
}
/**
 * 
 */
function close_notifications() {
    let box = document.getElementById("notifications_box")
    box.style.display = "none"
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
function toggle_review_box(id) { //todo ajax 
    let box = document.getElementById("review_box" + id)

    if (box.style.display == "flex")
        box.style.display = "none"
    else
        box.style.display = "flex"
}
/**
 * 
 */
function close_review_box(id) {
    let box = document.getElementById("review_box" + id)
    box.style.display = "none"
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
/**
 * 
 * @param {*} event 
 */
function cancel_reservation(id) {


    //delete html displaying the reservation
    let reservation_box = document.getElementsByName("reservation_id"+id)[0]

    reservation_box.remove(reservation_box.selectedIndex)
    //remove reservation from table 
    let request = new XMLHttpRequest()
    request.addEventListener("load", function () {
        alert('Successufully canceled reservation!')
    })
    request.open("post", "../ajax/cancel_reservation.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({ id: id}))

}

//  Place Gallery - a slider to display multiple images˜
var slideIndex = 1
showDivs(slideIndex)

function plusDivs(n) {
    showDivs(slideIndex += n)
}

function showDivs(n) {

    let images = document.getElementsByClassName("image_slide")

    if (n > images.length)
        slideIndex = 1

    if (n < 1)
        slideIndex = images.length

    for (let i = 0; i < images.length; i++)
        images[i].style.display = "none"

    if (images.length)
        images[slideIndex - 1].style.display = "block"
}

/**
 * 
 * @param {*} event 
 */
function option_navigate(event) {
    let options = document.getElementById("search_suggestions")
    console.log(options);
    if (e.keyCode == '38') {
        console.log('up')
    }
    else if (e.keyCode == '40') {
        console.log('down')
    }
}

function price_change() {
    //get price selected
    let price = document.getElementById("price_input")
    let show_price = document.getElementById("show_price")

    show_price.textContent = 'Price: ' + price.value + '€'
    //create new element to display price
    let div = document.getElementById("price")//.innerHTML += "<label>"+price+"</label>"

    div.insertBefore(show_price, div.firstChild)

}


//::::: AJAX STUFF ::::::://

function encodeForAjax(data) {
    return Object.keys(data).map(function (k) {
        return encodeURIComponent(k) + '=' + encodeURIComponent(data[k])
    }).join('&')
}
/*------ Search Bar ----*/

/**
 * 
 * @param {*} event 
 */
function get_city_by_country(event) {

    let country_id_selected = event.target
    let current_country = country_id_selected.options[country_id_selected.selectedIndex].value

    let request = new XMLHttpRequest()
    request.addEventListener("load", function () {
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
        item.value = city.city_id
        item.innerHTML = city.city_name
        list.appendChild(item)
    })
}

/*------ Search Bar ----*/
let text = document.getElementById("search_input")
text.addEventListener("keyup", country_city_changed)

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
        //console.log(country)
        if (countries[country].city_name == null) {
            let item = document.createElement("li")
            item.id = "result_suggestions" //css 
            item.innerHTML = countries[country].country_name
            //item.addEventListener("click", fill_search_bar(countries[country].country_name));
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
    Array.prototype.indexOf = function (element) {
        for (var i = 0, l = this.length; i < l; i++) {
            if (this[i] == element) return i;
        }
        return -1;
    };
}

// PRICE

let min_price = document.getElementById("min_price")
let max_price = document.getElementById("max_price")

min_price.oninput = update_price
max_price.oninput = update_price

function update_price() {
    let min_price_input = parseFloat(min_price.value)
    let max_price_input = parseFloat(max_price.value)

    if (min_price_input > max_price_input)
        [min_price_input, max_price_input] = [max_price_input, min_price_input]

    let min_price_value = document.getElementById("min_price_value")
    let max_price_value = document.getElementById("max_price_value")

    min_price_value.innerHTML = "" + min_price_input + "€"
    max_price_value.innerHTML = "" + max_price_input + "€"

}

/** reviews  */
/**
 * 
 */
function upload_comment(id) {
    let comment = document.getElementById("comment_holder" + id).value
    let rating = document.getElementById("rating_holder" + id).value
    console.log(comment)
    console.log(rating)
    if (comment == "" || rating == "") {
        alert('All sections must be filled')
        return
    }
    alert(id)

    let request = new XMLHttpRequest()

    request.addEventListener("update", function () {
        alert('Comment submitted')
    })
    request.addEventListener("error", function () {
        alert('Failed to upload comment')
    })

    request.open("post", "../ajax/make_review.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({ id: id, comment: comment, rating: rating }))
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
/**
 * password validation
 */
//todo
/*
let password = document.getElementById("password")
confirm_password = document.getElementById("confirm_password")

function validatePassword(){

  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match")
  } else {
    confirm_password.setCustomValidity('')
  }

}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
*/