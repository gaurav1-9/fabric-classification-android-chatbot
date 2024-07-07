function botInitiate() {
    var userValue = inputField.value
    if (userValue != "") {
        fetch(`http://127.0.0.1:65432/chat?text_value=${userValue}`)
            .then((response) => response.json())
            .then((data) => {
                if (data.response_type == 'greet') {
                    startingGreetResponse(userValue, data.bot_response)
                    sendBtn.onclick = analyzeInput;
                }
                else {
                    serverWarning('invalid');
                }
                inputField.value = '';
                msgAreaScrollbar.classList.add('scrollToBottom');
            })
            .catch(() => {
                serverWarning('server');
            })
    }
}