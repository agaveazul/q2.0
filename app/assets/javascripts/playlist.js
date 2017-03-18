$(document).on("ready", function(){

  $('.song-in-queue')
    .on('mouseenter', function(){ $(this).addClass('blue-grey darken-4') })
    .on('mouseleave', function() { $(this).removeClass('blue-grey darken-4') });

  $("body").delegate('.upvote', 'click', function (event){


    if ($(this).hasClass("darken-2"))  {
      console.log("darken-2!");
      Materialize.toast("Vote withdrawn!", 3000);
      // $(this).removeClass("clicked btn-flat blue darken-2")
      // $(this).addClass("blue lighten-2 btn")
    } else {
      Materialize.toast("Voted Up!", 3000, 'blue');

      // $(this).addClass("clicked btn-flat darken-2")
      // $(this).removeClass("lighten-2 btn")
      // $(this).siblings('button').removeClass('clicked btn-flat darken-2').addClass('red lighten-2 btn')
    };
  });
  $("body").delegate('.downvote', 'click', function (event){


    if ($(this).hasClass("darken-2"))  {
      Materialize.toast("Vote Withdrawn!", 3000);
      // $(this).removeClass("clicked btn-flat red darken-2")
      // $(this).addClass("red lighten-2 btn")
    } else {
      Materialize.toast("Voted Down!", 3000, 'red');
      // $(this).addClass("clicked btn-flat red darken-2")
      // $(this).removeClass("lighten-2 btn")
      // $(this).siblings('button').removeClass('clicked btn-flat darken-2').addClass('blue lighten-2 btn')
    };
  });



});
