var imgInput = document.getElementById("image-upload")
var imgName = ''

imgInput.addEventListener("change", function (event) {
    var imgShow = document.querySelector(".img-show")
    imgShow.style.display = 'none'
    imgName = event.target.files[0]
    var imgURL = URL.createObjectURL(event.target.files[0])
    imgShow.firstElementChild.src = imgURL
    imgShow.style.display = 'flex'
    msgList.lastChild.lastChild.lastElementChild.lastElementChild.lastElementChild.style.display = "block"
    msgAreaScrollbar.scrollTop = msgAreaScrollbar.scrollHeight;
});

function chooseImage(){
    imgInput.click();
}