const imgShow = document.querySelector(".fltAppliedImg");
var fltImg3 = document.getElementById("fltImgShow3")
var fltImg2 = document.getElementById("fltImgShow2")
var fltImg1 = document.getElementById("fltImgShow1")
function fltImgProceed() {
    const fltChooseImageBtn = document.querySelector("#flt-img-choose")
    fltMsgList.lastElementChild.lastElementChild.lastElementChild.remove()
    fltChooseImageBtn.disabled = true
    
    if (fltImgName.name != "") {
        var fltImage = fltImgName.name.replace(/\.[^/.]+$/, '');
        setTimeout(() => {
            imgShow.style.display = "block"
            var newFltImg = fltImage+"_gaussian.jpg"
            fltImg1.style.display = "block"
            fltImg1.src = "../../../Classification/Filters/filter images/"+newFltImg
            console.log(fltImg1)
            fltMsgAreaScrollbar.scrollTop = fltMsgAreaScrollbar.scrollHeight
        }, 500);


        setTimeout(() => {
            var newFltImg = fltImage+"_median.jpg"
            fltImg2.style.display = "block"
            fltImg2.src = "../../../Classification/Filters/filter images/"+newFltImg
            console.log(fltImg2)
            fltMsgAreaScrollbar.scrollTop = fltMsgAreaScrollbar.scrollHeight
        }, 1000);


        setTimeout(() => {
            var newFltImg = fltImage+"_sharp.jpg"
            fltImg3.style.display = "block"
            fltImg3.src = "../../../Classification/Filters/filter images/"+newFltImg
            console.log(fltImg3)
            fltMsgAreaScrollbar.scrollTop = fltMsgAreaScrollbar.scrollHeight
        }, 1500);
    }
    fltMsgAreaScrollbar.scrollTop = fltMsgAreaScrollbar.scrollHeight
}
