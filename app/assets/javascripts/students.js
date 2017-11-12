$(document).ready(function(){
  $(document).on("click", ".response-button", function(){
    $("#poll-question").hide();
    $("#poll-answer").show();
    var data= { labels: ['1', '2', '3'], series: [{data:[10, 5, 15]}]};
    var options = {
      axisX: {
        labelInterpolationFnc: function(value) {
          if(value=='1')
	    return "Apple";
	  else if(value=='2')
	    return "Orange";
	  else
	    return "Banana";
        }
      }
    };
    new Chartist.Bar("#results_chart", data, options, null);
  });
});
    (function($){
        $(window).on("load",function(){
            $(".custom-bar").mCustomScrollbar({
                axis: "y",
                alwaysShowScrollBar: 2,
                theme: "3d-thick",
		scrollInertia:0,
		mouseWheelPixels: 170
            });
        });
    })(jQuery);

  var submit_question = function(){
    if($("#poll input").val()!=""){
      //addQuestion($("#poll input").val(), "Pending", 0, 0);
      $("#poll input").val("");
    }
  }

  $("#poll .btn").click(submit_question);

  $("#questions-container").attr("style", $("#questions-container").attr("style") + ";height:" + ($(document).height() - 400) + "px");

  $('#poll input').keydown(function (event) {
    var keypressed = event.keyCode || event.which;
    if (keypressed == 13)
        submit_question();
  });

  $(document).keydown(function (event) {
    var keypressed = event.keyCode || event.which;
    if (keypressed == 13)
        $('#poll input').select();
  });

  $(document).ready(function(){
    $(document).on('click', '.icon-trash', function(){
      $(this).closest('.my-question, .question-separator').hide();
    });

    $(document).on('click', ".modal-backdrop", function(){$(".modal").click();});

    $(".icon-thumbs-up").click(function(){
      if(!($(this).parent().parent().find(".icon-thumbs-down").hasClass("white"))){
	$(this).parent().parent().find(".icon-thumbs-down").addClass("white");
	$(this).parent().parent().find(".icon-thumbs-down").removeClass("text-danger");
      }

      $(this).toggleClass("white");
      $(this).toggleClass("text-primary");
    });

    $(".icon-thumbs-down").click(function(){
      if(!($(this).parent().parent().find(".icon-thumbs-up").hasClass("white"))){
	$(this).parent().parent().find(".icon-thumbs-up").addClass("white");
	$(this).parent().parent().find(".icon-thumbs-up").removeClass("text-primary");
      }

      $(this).toggleClass("white");
      $(this).toggleClass("text-danger");
    });
  });