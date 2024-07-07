var fltMsgList = document.querySelector('.flt_msg')
var fltMsgAreaScrollbar = document.querySelector('.application-area')

function fltAppendChats(inputTxt,person){
    var li = document.createElement("li")
    if(person == 'start_bot_upload' && inputTxt===undefined){
        var fltStartUpload = document.querySelector(".flt-start-upload")
        li.className = "flt-bot-msg";
        li.innerHTML = fltStartUpload.innerHTML
        
    }
    if(person=="img"){
        var fltImgShow = document.querySelector(".fltImgShow")
        li.className = "flt-user-msg"
        li.innerHTML = fltImgShow.innerHTML

    }
    fltMsgList.appendChild(li)
    fltMsgAreaScrollbar.scrollTop = fltMsgAreaScrollbar.scrollHeight
}
