new Clipboard('.btn-small');

$(document).ready(function() {
  $("#center_address_btn").on("click", function(e){
    e.preventDefault();
    $("#center_address").toggleClass('visibility');
  });
    $(".button-collapse").sideNav();
    $('.collapsible').collapsible();

});
