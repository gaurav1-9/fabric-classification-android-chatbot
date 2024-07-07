const iconResponse = document.querySelector(".filter_btn");
const fltDiv = document.querySelector("#filter_tab");
const exit = document.getElementById('exit');
const overlay = document.querySelector(".overlay");
const flt_msg = document.querySelector(".flt_msg")
fltDiv.style.display = "none";
overlay.style.display = "none";
var isNodisplay = true;


iconResponse.addEventListener("click", function () {
    if (isNodisplay == true) {
        fltDiv.classList.remove('flt_tab_slide_left')
        fltDiv.classList.add('flt_tab_slide_right')

        overlay.classList.remove('overlay-off')
        overlay.classList.add('overlay-on')

        fltDiv.style.display = "block";
        overlay.style.display = "block";
        isNodisplay = false;
        setTimeout(() => {
            fltAppendChats(undefined, 'start_bot_upload')
        }, 400);
    }
    else {
        fltDiv.style.display = "none";
        isNodisplay = true;
    }
});
exit.addEventListener('click', function () {
    isNodisplay = true;
    fltDiv.classList.remove('flt_tab_slide_right');
    fltDiv.classList.add('flt_tab_slide_left');
    overlay.classList.add('overlay-off')
    overlay.classList.remove('overlay-on')
    overlay.style.display = 'none';

    fltDiv.addEventListener('animationend', function () {
        while (flt_msg.firstChild) {
            flt_msg.removeChild(flt_msg.firstChild);
        }
        fltImg1.style.display = 'none'
        fltImg2.style.display = 'none'
        fltImg3.style.display = 'none'
        imgShow.style.display = "none"
        fltDiv.style.display = "none";
    }, { once: true });
});

