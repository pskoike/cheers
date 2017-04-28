new Clipboard('.btn');

$(document).ready(function() {
  $("#center_address_btn").on("click", function(e){
    e.preventDefault();
    $("#center_address").toggleClass('visibility');
  });
});

