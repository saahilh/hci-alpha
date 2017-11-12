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

  $(document).ready(function(){
    $(document).on('click', '.icon-trash', function(){
      $(this).closest('.question, .question-separator').hide();
    });

    $("#questions-container").attr("style", $("#questions-container").attr("style") + ";height:" + ($(document).height() - 400) + "px");
  });

  $(".btn.btn-success").click(function(){
   $(this).toggleClass("active");
   $(this).parent().parent().find(".btn.btn-primary").removeClass("active");
 });

  $(".btn.btn-primary").click(function(){
   $(this).toggleClass("active");
   $(this).parent().parent().find(".btn.btn-success").removeClass("active");
 });