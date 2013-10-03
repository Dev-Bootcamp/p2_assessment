$(document).ready(function() {

  $('#new-event').on('submit', function (e) {
    e.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    console.log(data);
    $.post(url,data, function (response) {
      $('#events').append(response);
    });
  });

});