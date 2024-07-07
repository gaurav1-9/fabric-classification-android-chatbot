var inputField = document.getElementById('msg-box');
var sendBtn = document.getElementById('send-btn');

inputField.addEventListener('keydown', function (event) {
    if (inputField.value != '') {
        if (event.key === 'Enter') {
            event.preventDefault();
            sendBtn.click();
        }
    }
})