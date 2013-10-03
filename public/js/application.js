$(document).ready(function() {

  $('#new-event').on('submit', function(e) {
    e.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url,data,function(response) {
      $('#events').append(response);
    });
  });

});