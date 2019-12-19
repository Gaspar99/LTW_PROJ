//GLOBALS 
var last_message_id = -1
var last_notification_id = -1 

/* ---- HEADER ----- */

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

        check_if_bell_active(id)
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

            check_if_bell_active(id)

            console.log(notification_icon)
        })
        request.open("post", "../ajax/unmark_as_seen.php", true)
        request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
        request.send(encodeForAjax({ id: id}))
}
/**
 * 
 */
function check_if_bell_active(id){

    let request = new XMLHttpRequest()
    request.addEventListener("load",function(){      
        let num = JSON.parse(this.responseText)
        if(num['unseen_num'] == num['notification_num'])
            change_bell_icon(false)
        else change_bell_icon(true)
    })
    request.open("post", "../ajax/notification_seen.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({id: id}))
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
        check_if_bell_active(id);
    })
    request.open("post", "../ajax/delete_notification.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({ id: id}))
}

/* ---- POLLING ---- */

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
}

function notifications_handler(){  
    let last_id = JSON.parse(this.responseText);
   
    //in case no notifications
    if(last_notification_id == -1 && last_id.id != null)
        last_notification_id = last_id.id

    if(last_id.id > last_notification_id){
        console.log("new")
        
        change_bell_icon(true);
        
        //add notification generated
        //add new notification to the list
        let notifications_list = document.getElementById("notification_list")

        //make li 
        let new_notification = document.createElement("li") 
        new_notification.id = "unread_notification"
        new_notification.setAttribute("name", "notification_id"+last_id.id)

        //make link a
        let notification_place = document.createElement("a")
        notification_place.setAttribute("href","../pages/place.php?id="+last_id.place_id)
       
        //todo
        //make header span 
        let notification_content = document.createElement("span")
        notification_content.innerHTML = last_id.notification_content
        notification_place.appendChild(notification_content)
      
        let notification_time = document.createElement("span")
        let time = new Date(last_id.notification_date)
        let formatted_date = convert_month(time.getMonth()) + "-" + time.getDate() +" "+ time.getHours() + ":" + time.getMinutes()
        notification_time.innerHTML = formatted_date; 
        notification_place.appendChild(formatted_date)

        new_notification.appendChild(notification_place)

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

/**
 * change bell icon 
 * state true bell active 
 * stae false bell off
 */

function change_bell_icon(state){
    let notification_bell = document.querySelector("#notification_bell")
    notification_bell.innerText = "notifications"

    let new_bell = document.createElement("i")
    new_bell.setAttribute("class","material-icons")
    if(state)
        new_bell.innerHTML = "notifications_active"
    else
        new_bell.innerHTML = "notifications"

    notification_bell.innerHTML= ""
    notification_bell.appendChild(new_bell)
 }

 function convert_month(month){
     switch(month){
        case 0:
            return 'Jan'
        case 1:
            return 'Fev'
        case 2:
            return 'Mar'    
        case 3:
            return 'Apr'
        case 4:
            return 'May'
        case 5:
            return 'Jun'
        case 6:
            return 'Jul'
        case 7:
            return 'Aug'
        case 8:
            return 'Sep'
        case 9:
            return 'Oct'
        case 10:
            return 'Nov'
        case 11:    
            return 'Dec'        
    }
 }