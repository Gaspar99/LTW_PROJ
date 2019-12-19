"use strict"

/* ------ RESERVATION BOOKING -------- */

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

var locked_days = [ ] //sample

function get_locked_days(place_id){
    let request = new XMLHttpRequest()
    request.addEventListener("load", function(){
        let dates = JSON.parse(this.responseText)
        locked_days= []
        for(let i = 0; i< dates.length; i++){
            let check_in = dates[i].check_in
            let check_out = dates[i].check_out
            if(check_in != check_out){
                locked_days.push([check_in,check_out])
            }else 
                locked_days.push(check_in)
           
        }
    })
    request.open("get", "../ajax/get_booked_days.php?place_id="+place_id, true)
    request.send()
}
if(typeof reservation_check_in != 'undefined'){
    let reservation_picker = new Litepicker({
        element: document.getElementById('reservation_check_in'),
        elementEnd: document.getElementById('reservation_check_out'),
        singleMode: false,
        minDate: new Date().getTime(),
        hotelMode: true,
        format: "D - MMM - YYYY",
        startDate: reservation_check_in,
        endDate: reservation_check_out,
        numberOfMonths: 1,
        numberOfColumns: 1,
        disallowLockDaysInRange: true,
        onShow: function() { this.setLockDays(locked_days) }
    }) 
}  