var nextBtn = document.querySelector(".process-img-btn")
var inputArea = document.querySelector(".prompt-field")
var reviveBtn = document.querySelector(".revive-btn")

function processingImage(){
    msgList.lastChild.lastChild.lastElementChild.firstElementChild.style.display = "none"
    msgList.lastChild.lastChild.lastElementChild.lastElementChild.lastElementChild.style.display = "none"
    appendChats("Image Uploaded!!<br>Please wait...your result is being processed<img class='spinner' src='CSS/Assets/spinner.gif'>",'bot')
    sendBtn.disabled = true
    capabilities.removeEventListener('click', showCapabilities)
    botImageResponse()
}

function botImageResponse(){
    if(imgName.name !=""){
        fetch(`http://127.0.0.1:65432/image?image_name=${imgName.name}`)
        .then((response) => response.json())
        .then((data)=> {
            msgList.lastChild.remove()
            appendChats("<b style='color:var(--raisin-black);'>Image Name:</b> "+data.image_name+"<br>"+data.bot_response,'bot')
            sendBtn.disabled = false
            capabilities.addEventListener('click', showCapabilities);
            sendBtn.onclick = botInitiate

            inputArea.classList.add("hide")
            reviveBtn.classList.remove("hide")
        })
        .catch(() => {
            msgList.lastChild.lastChild.innerHTML = "Processing failed!!"
            sendBtn.disabled = false
            capabilities.addEventListener('click', showCapabilities);
            sendBtn.onclick = botInitiate;
            inputArea.classList.add("hide")
            reviveBtn.classList.remove("hide")
        })
    }
}