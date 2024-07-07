var msgList = document.querySelector('.msgs')
var msgAreaScrollbar = document.querySelector('.chatbot')
function appendChats(inputTxt, person) {
    var li = document.createElement("li")
    if (person === 'user') {
        li.className = 'user bubble';
        li.innerHTML = '<div class="col avatar-box" ><i class="bx bx-user avatar"></i><p class="avatar-text user-color-text">USER</p></div ><p class="user-msg">' + inputTxt + '</p>'
    }
    else if(person === 'user_img'){
        var confirmation = document.querySelector('.confirmation-upload')
        li.className = 'user bubble';
        li.innerHTML = '<div class="col avatar-box" ><i class="bx bx-user avatar"></i><p class="avatar-text user-color-text">USER</p></div><div class="col width"><p class="user-msg">' + inputTxt + '</p>'+confirmation.innerHTML+'</div>'
    }
    else if (person === 'start_bot') {
        li.className = 'bot bubble';
        li.innerHTML = '<div class="col avatar-box"><i class="bx bx-bot avatar"></i><p class="avatar-text bot-color-text">BOT</p></div><div class="col width"><p class="bot-msg">' + inputTxt + '</p><div class="btn" id="firstUpload"><button class="upload_btn raisin-black-btn" onclick="startingImgUpload()"><i class="bx bxs-image-add"></i>Upload Image</button></div></div>'
    }
    else {
        li.className = 'bot bubble';
        li.innerHTML = '<div class="col avatar-box"><i class="bx bx-bot avatar"></i><p class="avatar-text bot-color-text">BOT</p></div><p class="bot-msg">' + inputTxt + '</p>';
    }
    msgList.appendChild(li)
    msgAreaScrollbar.scrollTop = msgAreaScrollbar.scrollHeight;
}
