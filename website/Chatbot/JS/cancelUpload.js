function cancelUpload() {
    if (msgList.lastChild.lastChild.lastElementChild.tagName == "DIV") {
        msgList.lastChild.lastChild.removeChild(msgList.lastChild.lastChild.lastElementChild)
    }
    appendChats("Image upload cancelled!!", "bot");
    sendBtn.onclick = botInitiate;
}
