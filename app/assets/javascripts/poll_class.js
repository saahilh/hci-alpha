  var optionCount = 0;

  function addOption(){
    $("#poll-form").append($('<div class="separator-md"></div>'));
    optionCount += 1;   
    var e = '<div id="option' + optionCount + '" class="row"><div class="col-md-1"><span>Option ' + optionCount + '</span></div><div class="col-md-11 big-line"><input id="opt' + optionCount + '" name="opt' + optionCount + '" type="textarea" class="form-control" placeholder="Type an answer for the poll here"/></div></div>'
    $("#poll-form").append($(e));
  }

  $(document).on('page:change',function(){ addOption(); addOption(); addOption();});

  function removeOption(){
    $("#poll-form separator-md").last().remove();
    $("#option" + optionCount).remove();
    optionCount -= 1;
  }

  $(document).on("click", "#add-option", addOption);
  $(document).on("click", "#remove-option", removeOption);

  $(document).on("click", "#start_polling", function(){
    $("#add_or_remove_options").hide();
    $("#response_counter").show();
    $(this).hide();
    $("#stop_polling").show();
    $(".form-control").attr("disabled", "disabled");
  });

  $(document).on('click', ".modal-backdrop", function(){$(".modal").click();});