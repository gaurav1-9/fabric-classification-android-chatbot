function analyzeInput() {
    var userValue = inputField.value
    if (userValue != "") {
        fetch(`http://127.0.0.1:65432/chat?text_value=${userValue}`)
            .then((response) => response.json())
            .then((data) => {
                if (data.response_type == 'greet') {
                    greetResponse(userValue, data.bot_response);
                }
                else if (data.response_type == 'bye') {
                    byeResponse(userValue, data.bot_response);
                    sendBtn.onclick = botInitiate;
                }
                else if (data.response_type == 'image_upload') {
                    var prevText = msgList.lastChild.lastChild.firstChild.textContent
                    if (prevText != "Upload an image" ) {
                        imageResponse(userValue)
                    }
                    else {
                        serverWarning('img-warn')
                    }
                }
                else if(data.response_type == 'web_master'){
                    getWebMaster(userValue,data.bot_response)
                }
                else if(data.response_type == 'time'){
                    getCurrentTime(userValue)
                }
                else {
                    unknownResponse(userValue, data.bot_response + '<br>Check the \'<i class="bx bx-info-circle"></i>\' button for the commands that I can perform');
                }
                msgAreaScrollbar.classList.add('scrollToBottom');
                inputField.value = '';
            })
            .catch(() => {
                serverWarning('server');
            })
    }
}