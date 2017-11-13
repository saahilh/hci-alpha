  $('#new-course-code').keydown(function (event) {
    var keypressed = event.keyCode || event.which;
    if (keypressed == 13 && $(this).val()!="")
        $("#new-class-link .btn").click();
  });

  $(document).keydown(function (event) {
    var keypressed = event.keyCode || event.which;
    if (keypressed == 13)
        $('#new-course-code').select();
  });