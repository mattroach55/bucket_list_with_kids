// Setup for hidden tabs to ensure backup pipe line tactic
// This is needed for the bucket list js function
$(function(){

  $(".tab").on("click", function(e){
    // CHANGE TAB
    $(".tab").removeClass('active')
    $(this).addClass('active');

    // // HIDE ALL WITH HIDDEN CLASS
    var content = $(this).data("target");
    $(".tab-content").addClass("hidden");
    $(content).removeClass("hidden");

    // // SHOW TAB
    var id = $(this).data("target");
    $(id).removeClass("hidden");
  });
});
