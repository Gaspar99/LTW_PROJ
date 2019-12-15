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

    let icon = document.getElementById("notification_bell")
    if(icon.innerText = "notifications_active"){
        let new_icon = document.createElement("i")
        new_icon.setAttribute("class","material-icons")
        new_icon.innerHTML = "notifications"
        icon.innerHTML = ""
        icon.appendChild(new_icon)
    }
    console.log(icon);
    

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
 * mark notification as seen  
 * @param {*} id - notification id
 */
function mark_as_seen(id){  
    //remove reservation from table 
    let request = new XMLHttpRequest()
    request.addEventListener("load", function () {
        console.log('unmarked as seen')
        //delete html displaying the reservation
        let notification_tile = document.getElementsByName("notification_id"+id)[0]
        notification_tile.setAttribute("id","read_notification")
        let notification_icon = document.getElementsByName("icon_visibility"+id)[0]
        notification_icon.innerHTML="visibility_off"
        let notification_button = document.getElementsByName("button_type"+id)[0]
        notification_button.setAttribute("onclick","unmark_as_seen("+id+")")

        console.log(notification_icon)
    })
    request.open("post", "../ajax/mark_as_seen.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({ id: id}))
}

/**
 * unmark notification as seen 
 * @param {*} id - notification id
 */
function unmark_as_seen(id){
        //remove reservation from table 
        let request = new XMLHttpRequest()
        request.addEventListener("load", function () {
            console.log('marked as seen')
            //delete html displaying the reservation
            let notification_tile = document.getElementsByName("notification_id"+id)[0]
            notification_tile.setAttribute("id","unread_notification")
            let notification_icon = document.getElementsByName("icon_visibility"+id)[0]
            notification_icon.innerHTML="visibility"
            let notification_button = document.getElementsByName("button_type"+id)[0]
            notification_button.setAttribute("onclick","mark_as_seen("+id+")")
            console.log(notification_icon)
        })
        request.open("post", "../ajax/unmark_as_seen.php", true)
        request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
        request.send(encodeForAjax({ id: id}))
}

/**
 * remove notification from the db 
 * @param {*} id - notification id
 */
function remove_notification(id){
    //delete html displaying the reservation
    let notification_tile = document.getElementsByName("notification_id"+id)[0]
    notification_tile.remove(notification_tile.selectedIndex)

    //remove reservation from table 
    let request = new XMLHttpRequest()
    request.addEventListener("load", function () {
        alert('Successufully deleted notification')
    })
    request.open("post", "../ajax/delete_notification.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({ id: id}))
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
    let menu = document.getElementsByClassName("user_menu_option")

    for (let i = 0; i < menu.length; i++) {
        if (menu[i].style.display == "block")
            menu[i].style.display = "none"
        else
            menu[i].style.display = "block"
    }
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

//  Place Gallery - a slider to display multiple images
let slideIndex = 1
let fullscreen = false
showDivs(slideIndex)

function plusDivs(n) {
    showDivs(slideIndex += n)
}

function showDivs(n) {

    let images = document.getElementsByClassName("image_slide")
    let originals = document.getElementsByClassName("fullscreen_slide")

    if (n > images.length)
        slideIndex = 1

    if (n < 1)
        slideIndex = images.length

    for (let i = 0; i < images.length; i++) {
        images[i].style.display = "none"
        originals[i].style.display = "none"
    }

    if (images.length) {
        if (fullscreen) 
            originals[slideIndex - 1].style.display = "block"
        else
            images[slideIndex - 1].style.display = "block"
    }
}

function toggle_image_fullscreen() {
    fullscreen = (!fullscreen)

    let place_gallery = document.getElementById("place_gallery")
    let fullscreen_icon = place_gallery.querySelector(".material-icons")

    if (fullscreen) {
        place_gallery.style.position = "fixed"
        place_gallery.style.left = "0"
        place_gallery.style.top = "0"
        place_gallery.style.width = "100%"
        place_gallery.style.height = "100%"

        fullscreen_icon.innerHTML = "fullscreen_exit"
    }
    else {
        place_gallery.style.position = "static"
        place_gallery.style.width = "auto"
        place_gallery.style.height = "auto"

        fullscreen_icon.innerHTML = "fullscreen"
    }

    showDivs(slideIndex)
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

/**
 * Polling notifications 
 */

//GLOBALS 
let last_message_id = -1
let last_notification_id = -1 

function polling_notification(usr_id){  
    //todo
    /* 
    let msg_request = new XMLHttpRequest()
    msg_request.open("get", "../ajax/message_polling.php", true)
    msg_request.send()
    */
    let notification_request = new XMLHttpRequest() 
    notification_request.addEventListener("load",notifications_handler)
    notification_request.open("post", "../ajax/notification_polling.php", true)
    notification_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    notification_request.send(encodeForAjax({usr_id: usr_id}))
 
    console.log(last_notification_id)

}

function notifications_handler(){  
    let last_id = JSON.parse(this.responseText);
   
    //in case no notifications
    if(last_notification_id == -1 && last_id.id != null)
        last_notification_id = last_id.id

    if(last_id.id > last_notification_id){
        console.log("new")
        let notification_bell = document.querySelector("#notification_bell")
        notification_bell.innerText = "notifications"

        let new_bell = document.createElement("i")
        new_bell.setAttribute("class","material-icons")
        new_bell.innerHTML = "notifications_active"

        notification_bell.innerHTML= ""
        notification_bell.appendChild(new_bell)
        
        //add notification generated
        //add new notification to the list
        let notifications_list = document.getElementById("notification_list")

        //make li 
        let new_notification = document.createElement("li") 
        new_notification.id = "unread_notification"
        new_notification.setAttribute("name", "notification_id"+last_id.id)

        //make header span 
        let notification_title = document.createElement("span")
        notification_title.innerHTML = "Notification type TODO" + " + " + last_id.notification_date
        new_notification.appendChild(notification_title)

        //make link a
        let notification_place = document.createElement("a")
        notification_place.setAttribute("href","../pages/place.php?id="+last_id.place_id)
        notification_place.innerHTML = last_id.title
        new_notification.appendChild(notification_place)
        
        //make check in check out
        let notification_check = document.createElement("span")
        notification_check.setAttribute("class","notification")
        notification_check.innerHTML = last_id.check_in + " - " + last_id.check_out
        new_notification.appendChild(notification_check)

        //make unseen
        let notification_seen = document.createElement("span")
        notification_seen.setAttribute("name","button_type"+last_id.id)
        notification_seen.setAttribute("onclick","mark_as_seen("+last_id.id+")")
        let seen_icon = document.createElement("i")
        seen_icon.setAttribute("class","material-icons")
        seen_icon.setAttribute("name","icon_visibility"+last_id.id)
        seen_icon.innerHTML="visibility"
        notification_seen.appendChild(seen_icon)
        new_notification.appendChild(notification_seen)

        //make rmv button
        let notification_remove = document.createElement("span")
        notification_remove.setAttribute("onclick","remove_notification("+last_id.id+")")
        let rmv_icon = document.createElement("i")
        rmv_icon.setAttribute("class","material-icons")
        rmv_icon.innerHTML="delete"
        notification_remove.appendChild(rmv_icon)
        new_notification.appendChild(notification_remove)

        console.log(new_notification.innerHTML)

        notifications_list.appendChild(new_notification)
              
        //update last notification id 
    }
    if(last_id.id == null)
        last_notification_id = 0
    else 
        last_notification_id = last_id.id
}

function handle_messages(){

}