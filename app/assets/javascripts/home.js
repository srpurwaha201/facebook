// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  $(document).on("click", "div.comments_info", function(){
    var post_id = this.id;
    var display = $("footer#"+post_id+".comments").css("display");
    if (display == "none"){
      $("footer#"+post_id+".comments").show();
    }
    else {
      $("footer#"+post_id+".comments").hide();
    }
  })
  $(document).on("click", "i.post_like_button",   function() {
      var me = $(this);


      if ( me.data('requestRunning') ) {
          return;
      }

      me.data('requestRunning', true);

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
  if ( me.data('requestRunning') ) {
      return;
  }

  me.data('requestRunning', true);

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
    complete: function() {
          me.data('requestRunning', false);
      },
    data: {
      like_type: 'post',
      like_id: post_id,
    }
  });
})










 $(document).on("click", "i.comment_like_button",   function() {
     var me = $(this);


     if ( me.data('requestRunning') ) {
         return;
     }

     me.data('requestRunning', true);

     var comment_id = this.id;
     $.ajax({
       url: '/likes/toggle_like',
       type: 'post',
       success: function(data) {
         var count = $("span#"+comment_id+".comment_likes_count").html();
         $("span#"+comment_id+".comment_likes_count").html(parseInt(count) + parseInt(1));
         $("i#"+comment_id+".comment_like_button").css("display", "none");
         $("i#"+comment_id+".comment_unlike_button").css("display", "");
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


$(document).on("click", "i.comment_unlike_button",function() {
    var me = $(this);
    if ( me.data('requestRunning') ) {
        return;
    }

    me.data('requestRunning', true);

    var comment_id = this.id;
    $.ajax({
      url: '/likes/toggle_like',
      type: 'post',
      success: function(data) {
        var count = $("span.comment_likes_count").html();
        $("span#"+comment_id+".comment_likes_count").html(parseInt(count) - parseInt(1));
        $("i#"+comment_id+".comment_like_button").css("display", "");
        $("i#"+comment_id+".comment_unlike_button").css("display", "none");
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
} )
