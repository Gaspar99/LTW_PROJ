"use strict"

// Get target elements
let open_review_box= document.getElementById("open_review_box")
let close_review_box = document.getElementById("close_review_box")

/**
 * 
 */
if(open_review_box != null){
    open_review_box.onclick = function(event){  
        let box = event.target.nextElementSibling
    
        box.style.display = "flex"
    }
}

/**
 * 
 */
if(close_review_box != null){
    close_review_box.onclick = function(event) {
        let box = event.target.parentElement.parentElement
        box.style.display = "none"
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

    request.onreadystatechange = function () {

        if (request.readyState === 4) {

            let parser =  new DOMParser()
            let response = parser.parseFromString(request.responseText, "text/xml")

            let message = response.getElementById("messages")

            document.body.appendChild(message)
        }
    }

    request.open("post", "../ajax/cancel_reservation.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({ id: id}))
}

/**
 * 
 * @param {*} price_per_night 
 */
function calculate_rent_price(price_per_night) 
{
    let check_in = document.getElementById("reservation_check_in")
    let check_out = document.getElementById("reservation_check_out")
    let num_guests = document.querySelector("#place_page #num_guests_input input")

    console.log(check_in.value)
    console.log(check_out.value)
    console.log(num_guests.value)

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

function encodeForAjax(data) {
    return Object.keys(data).map(function (k) {
        return encodeURIComponent(k) + '=' + encodeURIComponent(data[k])
    }).join('&')
}
