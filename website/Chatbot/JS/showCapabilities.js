var capabilities = document.querySelector(".capabilities")

capabilities.addEventListener('click', showCapabilities);
function showCapabilities() {
    if (msgList.lastChild.lastChild.lastElementChild.tagName === 'DIV') {
        msgList.lastChild.lastChild.removeChild(msgList.lastChild.lastChild.lastElementChild)
    }
    var botCapabilities = "I am designed to inspect a fabric image provided by the user and identify or classify the fabric image by using cutting-edge computer vision algorithms by showing the result to the user in a user friendly manner.<br>Moreover, I am able to understand basic user prompts and try to give an appropriate response to the user."
    appendChats("What are your capabilities?", "user");
    setTimeout(() => {
        appendChats(botCapabilities, "bot")
    }, 800);
}