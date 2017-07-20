// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $("i.post_like_button").click(function() {
    var post_id = this.id;
    $.ajax({
      url: '/likes/toggle_like',
      type: 'post',
      success: function(data) {
        var count = $("span#"+post_id+".post_likes_count").html();
        $("span#"+post_id+".post_likes_count").html(parseInt(count) + parseInt(1));
        $("i#"+post_id+".post_like_button").css("display", "none");
        $("i#"+post_id+".post_unlike_button").css("display", "");
      },
      data: {
        like_type: 'post',
        like_id: post_id,
      }
    });
  });

  $("i.post_unlike_button").click(function() {
    var post_id = this.id;
    $.ajax({
      url: '/likes/toggle_like',
      type: 'post',
      success: function(data) {
        var count = $("span.post_likes_count").html();
        $("span#"+post_id+".post_likes_count").html(parseInt(count) - parseInt(1));
        $("i#"+post_id+".post_like_button").css("display", "");
        $("i#"+post_id+".post_unlike_button").css("display", "none");
      },
      data: {
        like_type: 'post',
        like_id: post_id,
      }
    });
  });
});
