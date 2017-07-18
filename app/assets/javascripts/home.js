// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$( document ).ready(function() {
  var show_comments= document.getElementsByClassName('show_comments')[0];
  function toggle_show(){
    console.log("clicked");
  };
  show_comments.addEventListener('onclick', toggle_show);
});
