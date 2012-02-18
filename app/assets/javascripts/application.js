// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
$(document).ready(function(){

  var swapDone = function(tr1, tr2){
      var tr1IsDone = tr1.hasClass('done');
      var tr2IsDone = tr2.hasClass('done');
  
      if (tr1IsDone) {
        tr2.addClass('done');
      }
      else {
        tr2.removeClass('done');
      }
      
      if (tr2IsDone) {
        tr1.addClass('done');
      }
      else {
        tr1.removeClass('done');
      }
  };
  
  $('.move_up').live('ajax:success', function(){
    var current = $(this).closest('tr');
    var previous = current.prev('tr');
    
    if (previous.length) {
      var currentHTML = current.html();
      var previousHTML = previous.html();      
      
      current.html(previousHTML);
      previous.html(currentHTML);
      
      swapDone(previous, current);
    }
  });

  $('.move_down').live('ajax:success', function(){
    var current = $(this).closest('tr');
    var next = current.next('tr');
    
    if (next.length) {
      var currentHTML = current.html();
      var nextHTML = next.html();
      
      current.html(nextHTML);
      next.html(currentHTML);

      swapDone(next, current);
    }   
  });
  
  $('.toggle_status').live('ajax:success', function(){
    var image = $('img', this);

    if (image.attr("src") == "/images/pending.png"){
      image.attr("src", "/images/done.png").attr("alt", "[YES]").attr("title", "Yes");
      image.closest('tr').addClass('done');
    }
    else {
      image.attr("src", "/images/pending.png").attr("alt", "[NO]").attr("title", "No");
      image.closest('tr').removeClass('done');
    }
  });

});
