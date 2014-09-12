// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require select2
//= require jquery_ujs
//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker
//= require turbolinks
//= require jquery.remotipart
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require best_in_place
//= require best_in_place.purr
//= require jquery.ui.all
//= require bootstrap-datepicker
//= require private_pub
//= require_tree .

jQuery(function () {
    $( document ).tooltip();

    $('.best_in_place').best_in_place()
    $(document).on('click', '.in_place_class', function () {
        $('.in_place_class span form input:text').addClass('form-control input-sm');
        $('.in_place_class span form input:button').addClass('btn btn-danger');
        $('.in_place_class span form input:submit').addClass('btn btn-primary');
    })
})
//function alert message
function delayedAlert(msg, time) {
    $('#notifications').html("<div class='alert alert-success alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>" + msg + "</div>");
    setTimeout(function () {
        $('#notifications').html('');
    }, time);
};

//effect border
function borderEffect(selector, cssEffect, num_effect, deplay){
    var i=0
    var temp = setInterval(function(){
        i++;
        if (i ==num_effect*2){
            clearInterval(temp)
        }
        $(selector).toggleClass(cssEffect);
    },deplay)
}
