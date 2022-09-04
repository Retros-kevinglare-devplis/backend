//= require jquery3
//= require bootstrap-sprockets
//= require popper

$(document).ready(function () {
    $(".alert").click(function (e) {
        $(e.target).alert('close')
    })
})
