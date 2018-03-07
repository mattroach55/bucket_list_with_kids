// Setup for hidden tabs to ensure backup pipe line tactic
// This is needed for the bucket list js function
$(function(){

  $(".tab").on("click", function(e){
    // CHANGE TAB
    $(".active").removeClass('active')
    $(this).addClass('active');

    // HIDE ALL WITH HIDDEN CLASS
    $(".tab-content").addClass("hidden");

    // SHOW TAB
    var id = $(".active").data("target");
    $(id).removeClass("hidden");
  });
});
