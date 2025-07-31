﻿
// Add active class to the current button (highlight it)
var header = document.getElementById("bs-example-navbar-collapse-1");
var btns = header.getElementsByClassName("btn-default");
for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function () {
        var current = document.getElementsByClassName("active");
        if (current.length > 0) {
            current[0].className = current[0].className.replace(" active", "");
        }
        this.className += " active";
    });
}
