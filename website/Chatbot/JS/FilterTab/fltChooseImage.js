var fltImgInput = document.getElementById("flt-image-upload")
var fltImgName = ''

fltImgInput.addEventListener("change", function (event) {
    if(fltMsgList.childElementCount>1){
        fltMsgList.lastElementChild.remove()
    }
    var fltImgShow = document.querySelector(".fltImgShow")
    fltImgShow.style.display = 'none'
    fltImgName = event.target.files[0]
    var fltImgURL = URL.createObjectURL(event.target.files[0])
    fltImgShow.firstElementChild.firstElementChild.src = fltImgURL
    fltAppendChats(undefined,'img')
    console.log(fltImgName.name)
    msgAreaScrollbar.scrollTop = msgAreaScrollbar.scrollHeight;
});

function fltChooseImage(){
    fltImgInput.click()
}