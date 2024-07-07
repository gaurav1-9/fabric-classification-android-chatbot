function botRevive() {
    inputArea.classList.remove("hide")
    reviveBtn.classList.add("hide")
    while (msgList.firstChild) {
        msgList.removeChild(msgList.firstChild)
    }
    fetch(`http://127.0.0.1:65432/chat?text_value=hi`)
        .then((response) => response.json())
        .then((data) => {
            sendBtn.onclick = analyzeInput;
            appendChats(data.bot_response[0] + "<br>" + data.bot_response[1] + `<br>`, 'start_bot')
        })
        .catch(() => {
            serverWarning('server');
        })
}