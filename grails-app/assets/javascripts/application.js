// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.1.3.js
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $('#spinner').ajaxStart(function() {
            $(this).fadeIn();
        }).ajaxStop(function() {
            $(this).fadeOut();
        });
    })(jQuery);
}

function fixPaginationA() {
    $(".pagination a").each(function( index ) {
        var href = $(this).attr("href");
        $(this).attr("href","#");
        $(this).on("click",function() {
            var reg = /offset=(\d+)&/g;
            var result = reg.exec(href);
            $("#offset").val(result[1]);
            loadPage();
        });
    });
}
