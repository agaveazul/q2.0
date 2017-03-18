$(document).on("ready", function(){

  $('.song-in-queue')
    .on('mouseenter', function(){ $(this).addClass('blue-grey darken-4') })
    .on('mouseleave', function() { $(this).removeClass('blue-grey darken-4') });

  $('.upvote').on('click', function() {
    if ($(this).hasClass("clicked"))  {
      $(this).removeClass("clicked btn-flat blue darken-2")
      $(this).addClass("blue lighten-2 btn")
    } else {
      $(this).addClass("clicked btn-flat darken-2")
      $(this).removeClass("lighten-2 btn")
      $(this).siblings('button').removeClass('clicked btn-flat darken-2').addClass('red lighten-2 btn')
    };
  });
  $('.downvote').on('click', function() {
    if ($(this).hasClass("clicked"))  {
      $(this).removeClass("clicked btn-flat red darken-2")
      $(this).addClass("red lighten-2 btn")
    } else {
      $(this).addClass("clicked btn-flat red darken-2")
      $(this).removeClass("lighten-2 btn")
      $(this).siblings('button').removeClass('clicked btn-flat darken-2').addClass('blue lighten-2 btn')
    };
  });



});
