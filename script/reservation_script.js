/* ------ RESERVATION BOOKING -------- */

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
        console.log(locked_days);
    })
    request.open("get", "../ajax/get_booked_days.php?place_id="+place_id, true)
    request.send()
}

let reservation_picker = new Litepicker({
    element: document.getElementById('reservation_check_in'),
    elementEnd: document.getElementById('reservation_check_out'),
    singleMode: false,
    minDate: new Date().getTime(),
    hotelMode: true,
    format: "D - MMM - YYYY",
    startDate: reservation_check_in,
    endDate: reservation_check_out,
    numberOfMonths: 2,
    numberOfColumns: 2,
    disallowLockDaysInRange: true,
    onShow: function() { this.setLockDays(locked_days) }
})   