// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).on('page:change',function(){$(document).on('click', ".modal-backdrop", function(){$(".modal").click();});});

$("#new-course-code").keydown(function (event) {
	var keypressed = event.keyCode || event.which;
	if (keypressed == 13 && $(this).val()!="")
		$(this).submit();
});

$(document).on('page:change', function(){
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

  $("#questions-container").attr("style", $("#questions-container").attr("style") + ";height:" + ($(document).height() - 400) + "px");
});
// $(document).on('page:change',function(){
//   $(document).on("click", ".response-button", function(){
//     $("#poll-question").hide();
//     $("#poll-answer").show();
//     var data= { labels: ['1', '2', '3'], series: [{data:[10, 5, 15]}]};
//     var options = {
//       axisX: {
//         labelInterpolationFnc: function(value) {
//           if(value=='1')
//            return "Apple";
//          else if(value=='2')
//            return "Orange";
//          else
//            return "Banana";
//        }
//      }
//    };
//    new Chartist.Bar("#results_chart", data, options, null);
//  });
// });

  $(document).on('click', ".icon-flag", function(){$(this).closest(".question.row").hide();})
  $(document).on('click', ".modal-backdrop", function(){$(".modal").click();});