var headerContainer = document.querySelector('.header');
var header = document.querySelector('.main');
var briefDescription = document.querySelector('.header-desc');
var footerDescription = document.querySelector('.desc');
var serverMsg = document.querySelector(".server-warning");

function serverWarning(msgType) {
    if (msgType === 'server') {
        serverMsg.innerHTML = "<i class='bx bxs-error'></i><p>Oops there was a server error<br>Try again later</p>";
    }
    else if (msgType === 'img-warn') {
        serverMsg.innerHTML = "<i class='bx bxs-message-square-x' ></i><p>Upload menu already present</p>";
    }
    else if (msgType === 'process-fail') {
        serverMsg.innerHTML = "<i class='bx bxs-error-alt'></i><p>Processing failed</p>";
    }
    else {
        if (msgList.childElementCount === 0) {
            serverMsg.innerHTML = "<i class='bx bxs-message-square-error'></i><p>Say 'HI' to initiate the bot</p>";
        }
        else {
            serverMsg.innerHTML = "<i class='bx bxs-message-square-error'></i><p>Say 'HI' to initiate the bot again</p>";
        }
    }
    serverMsg.classList.remove("server-animation-rev");
    serverMsg.classList.add("server-animation");
    serverMsg.style.display = "flex"
    setTimeout(() => {
        serverMsg.classList.remove("server-animation");
        serverMsg.classList.add("server-animation-rev");
        setTimeout(() => {
            serverMsg.style.display = "none"
        }, 300);
    }, 4000);
}

function startingGreetResponse(userValue, bot_response) {
    if (msgList.childElementCount === 0) {
        headerContainer.classList.remove('collapse-animation-rev')
        headerContainer.classList.add('collapse-animation')
        footerDescription.classList.remove('opacity-visible-rev')
        footerDescription.classList.add('opacity-visible')
        footerDescription.style.opacity = '1'
        headerContainer.style.height = '12vh';
        briefDescription.style.display = 'none';
        setTimeout(() => {
            appendChats(userValue, 'user')
            setTimeout(() => {
                appendChats(bot_response[0] + "<br>" + bot_response[1] + `<br>`, 'start_bot')
            }, 800);
        }, 600);
    }
    else {
        appendChats(userValue, 'user')
        setTimeout(() => {
            appendChats(bot_response[0] + "<br>" + bot_response[1] + `<br>`, 'start_bot')
        }, 800);
    }
}

function byeResponse(userValue, bot_response) {
    if (msgList.lastChild.lastChild.lastElementChild.tagName === 'DIV') {
        msgList.lastChild.lastChild.removeChild(msgList.lastChild.lastChild.lastElementChild)
    }
    appendChats(userValue, 'user')
    setTimeout(() => {
        appendChats(bot_response, 'bot')
    }, 800);
    setTimeout(() => {
        while (msgList.firstChild) {
            msgList.removeChild(msgList.firstChild)
        }
        headerContainer.classList.remove('collapse-animation')
        headerContainer.classList.add('collapse-animation-rev')
        footerDescription.classList.add('opacity-visible-rev')
        footerDescription.classList.remove('opacity-visible')
        footerDescription.style.opacity = '0'
        headerContainer.style.height = '65vh';
        briefDescription.style.display = 'block';
    }, 2700);
}

function unknownResponse(userValue, bot_response) {
    if (msgList.lastChild.lastChild.lastElementChild.tagName === 'DIV') {
        msgList.lastChild.lastChild.removeChild(msgList.lastChild.lastChild.lastElementChild)
    }
    appendChats(userValue, 'user')
    setTimeout(() => {
        appendChats(bot_response, 'bot')
    }, 800);
}
function imageResponse(userValue) {
    if (msgList.lastChild.lastChild.lastElementChild.tagName === 'DIV') {
        msgList.lastChild.lastChild.removeChild(msgList.lastChild.lastChild.lastElementChild)
    }
    appendChats(userValue, "user")
    setTimeout(() => {
        appendChats("Upload an image", 'user_img')
    }, 800);
}
function greetResponse(userValue, bot_response) {
    if (msgList.lastChild.lastChild.lastElementChild.tagName === 'DIV') {
        msgList.lastChild.lastChild.removeChild(msgList.lastChild.lastChild.lastElementChild)
    }
    appendChats(userValue, 'user')
    setTimeout(() => {
        appendChats(bot_response[0] + "<br>" + "Try typing <b>'image'</b> or <b>'picture'</b> to upload an image", 'bot')
    }, 800);
}
function getWebMaster(userValue, bot_response) {
    if (msgList.lastChild.lastChild.lastElementChild.tagName === 'DIV') {
        msgList.lastChild.lastChild.removeChild(msgList.lastChild.lastChild.lastElementChild)
    }
    appendChats(userValue, 'user')
    setTimeout(() => {
        appendChats(bot_response[0] + "<br>" + bot_response[1] + "<br>❤️❤️❤️", 'bot')
    }, 800);
}

function getCurrentTime(userValue) {
    if (msgList.lastChild.lastChild.lastElementChild.tagName === 'DIV') {
        msgList.lastChild.lastChild.removeChild(msgList.lastChild.lastChild.lastElementChild)
    }
    appendChats(userValue, 'user')
    setTimeout(() => {
        dateTimeCalculation()
    }, 800);
}

function dateTimeCalculation() {
    var nameOfDays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', "Thursday", 'Friday', 'Saturday']
    var nameOfMonth = ['January', 'February', 'March', 'April', "May", 'June', 'July', 'August', "September", 'October', 'November', 'December']

    const currentTime = new Date();
    var day = currentTime.getDay()
    var date = currentTime.getDate()
    var month = currentTime.getMonth()
    var hr = currentTime.getHours();
    var min = currentTime.getMinutes();

    var dayNight = hr >= 12 ? 'PM' : 'AM'
    hr = (hr == 12 || hr == 0) ? 12 : hr % 12

    var formattedHour = (hr < 10) ? '0' + hr : hr
    var formattedMinute = (min < 10) ? '0' + min : min

    appendChats("<span class='largeText'>" + formattedHour + ":" + formattedMinute + "</span> " + dayNight + "<br>" + nameOfDays[day % 7] + ", " + nameOfMonth[month % 12] + " " + date)
}