// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  window.load_more_active = false;
  window.offset = 10;
  document.addEventListener('scroll', function(event) {
    if (!window.load_more_active) {
      if (window.scrollMaxY - event.pageY < 50) {
        window.load_more_active = true;
        $.ajax({
          url: '/',
          type: 'get',
          dataType: 'script',
          data: {
            offset: window.offset,
            format: 'js'
          }
        });
      }
    }
  });


  $(document).on("click", "div.comments_info", function() {
    var post_id = this.id;
    var display = $("footer#" + post_id + ".comments").css("display");
    if (display == "none") {
      $("footer#" + post_id + ".comments").show();
    } else {
      $("footer#" + post_id + ".comments").hide();
    }
  })
  $(document).on("click", "i.post_like_button", function() {
    var me = $(this);


    if (me.data('requestRunning')) {
      return;
    }

    me.data('requestRunning', true);

    var post_id = this.id;
    $.ajax({
      url: '/likes/toggle_like',
      type: 'post',
      success: function(data) {
        var count = $("span#" + post_id + ".post_likes_count").html();
        $("span#" + post_id + ".post_likes_count").html(parseInt(count) + parseInt(1));
        $("i#" + post_id + ".post_like_button").css("display", "none");
        $("i#" + post_id + ".post_unlike_button").css("display", "");
      },
      complete: function() {
        me.data('requestRunning', false);
      },
      data: {
        like_type: 'post',
        like_id: post_id,
      }
    });
  })

  $(document).on("click", "i.post_unlike_button", function() {
    var me = $(this);
    if (me.data('requestRunning')) {
      return;
    }

    me.data('requestRunning', true);

    var post_id = this.id;
    $.ajax({
      url: '/likes/toggle_like',
      type: 'post',
      success: function(data) {
        var count = $("span.post_likes_count").html();
        $("span#" + post_id + ".post_likes_count").html(parseInt(count) - parseInt(1));
        $("i#" + post_id + ".post_like_button").css("display", "");
        $("i#" + post_id + ".post_unlike_button").css("display", "none");
      },
      complete: function() {
        me.data('requestRunning', false);
      },
      data: {
        like_type: 'post',
        like_id: post_id,
      }
    });
  })









  $(document).on("click", "i.comment_like_button", function() {
    var me = $(this);


    if (me.data('requestRunning')) {
      return;
    }

    me.data('requestRunning', true);

    var comment_id = this.id;
    $.ajax({
      url: '/likes/toggle_like',
      type: 'post',
      success: function(data) {
        var count = $("span#" + comment_id + ".comment_likes_count").html();
        $("span#" + comment_id + ".comment_likes_count").html(parseInt(count) + parseInt(1));
        $("i#" + comment_id + ".comment_like_button").css("display", "none");
        $("i#" + comment_id + ".comment_unlike_button").css("display", "");
      },
      complete: function() {
        me.data('requestRunning', false);
      },
      data: {
        like_type: 'comment',
        like_id: comment_id,
      }
    });
  })


  $(document).on("click", "i.comment_unlike_button", function() {
    var me = $(this);
    if (me.data('requestRunning')) {
      return;
    }

    me.data('requestRunning', true);

    var comment_id = this.id;
    $.ajax({
      url: '/likes/toggle_like',
      type: 'post',
      success: function(data) {
        var count = $("span.comment_likes_count").html();
        $("span#" + comment_id + ".comment_likes_count").html(parseInt(count) - parseInt(1));
        $("i#" + comment_id + ".comment_like_button").css("display", "");
        $("i#" + comment_id + ".comment_unlike_button").css("display", "none");
      },
      complete: function() {
        me.data('requestRunning', false);
      },
      data: {
        like_type: 'comment',
        like_id: comment_id,
      }
    });
  });

  $(document).on("focusin","form#new_post.new_post", function(){
    if (!$("textarea#post_content").val()) {
      $("form#new_post.new_post div.actions").css("display", "unset");
    // textarea is empty
  }

    //$("div.actions").css("display", "show");
    console.log("fin triggered!");
  })

  $(document).on("focusout","form#new_post.new_post", function(){
    if (!$("textarea#post_content").val()) {
      $("form#new_post.new_post div.actions").css("display", "none");
    // textarea is empty
  }
    //$("div.actions").toggle();
    console.log("f out triggered!");
  })


})
