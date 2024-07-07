function startingImgUpload(){
    let firstUploadBtn = document.getElementById('firstUpload')
    firstUploadBtn.style.display = 'none'
    msgList.lastChild.lastChild.lastElementChild.firstElementChild.style.display = "block"
    appendChats("Upload an image",'user_img')
}