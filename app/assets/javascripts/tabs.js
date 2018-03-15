// HIDE AND SHOW VIA BAR
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

// HIDE AND SHOW VIA ICONS
$(function(){
  $(".icon-bucket").on("click", function(e){
    // CHANGE TAB
    $(".icon-bucket").removeClass('active')
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


(function(){
  $("a.bucket-button").on("click", function(e){
    // CHANGE TAB
    e.preventDefault();
  });
});
