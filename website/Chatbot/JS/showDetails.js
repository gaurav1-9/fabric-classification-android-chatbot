infoBtn = document.querySelector(".info_btn")
fltBtn = document.querySelector(".filter_btn")

infoBtn.addEventListener('mouseover',showDetails)
infoBtn.addEventListener('mouseout',hideDetails)

fltBtn.addEventListener('mouseover',showFltDetails)
fltBtn.addEventListener('mouseout',hideFltDetails)

function showDetails(){
    document.querySelector('.info_details').style.visibility = "visible"
}
function hideDetails(){
    document.querySelector('.info_details').style.visibility = "hidden"
}
function showFltDetails(){
    document.querySelector('.flt_details').style.visibility = "visible"
}
function hideFltDetails(){
    document.querySelector('.flt_details').style.visibility = "hidden"
}