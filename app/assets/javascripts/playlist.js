function getRandomInt() {
  min = Math.ceil(1);
  max = Math.floor(7);
  return Math.floor(Math.random() * (max - min)) + min;
}

function randomColor() {
  var num = getRandomInt()
  if (num === 1) {
    return 'pink lighten-3'
  } else if (num === 2){
    return 'purple accent-2'
  } else if (num === 3) {
    return 'indigo accent-1'
  } else if (num === 4) {
    return 'green accent-4'
  } else if (num === 5) {
    return 'teal lighten-1'
  } else if (num === 6) {
    return 'orange lighten-1'
  }
};

$(document).on("ready", function(){

  $('.song-in-queue')
    .on('mouseenter', function(){ $(this).addClass('blue-grey darken-4') })
    .on('mouseleave', function() { $(this).removeClass('blue-grey darken-4') });

  $("body").delegate('.upvote', 'click', function (event){


    if ($(this).hasClass("darken-2"))  {
      console.log("darken-2!");
      Materialize.toast("Vote withdrawn!", 3000, randomColor());
      // $(this).removeClass("clicked btn-flat blue darken-2")
      // $(this).addClass("blue lighten-2 btn")
    } else {
      Materialize.toast("Voted Up!", 3000, randomColor());

      // $(this).addClass("clicked btn-flat darken-2")
      // $(this).removeClass("lighten-2 btn")
      // $(this).siblings('button').removeClass('clicked btn-flat darken-2').addClass('red lighten-2 btn')
    };
  });
  $("body").delegate('.downvote', 'click', function (event){


    if ($(this).hasClass("darken-2"))  {
      Materialize.toast("Vote Withdrawn!", 3000, randomColor());
      // $(this).removeClass("clicked btn-flat red darken-2")
      // $(this).addClass("red lighten-2 btn")
    } else {
      Materialize.toast("Voted Down!", 3000, randomColor());
      // $(this).addClass("clicked btn-flat red darken-2")
      // $(this).removeClass("lighten-2 btn")
      // $(this).siblings('button').removeClass('clicked btn-flat darken-2').addClass('blue lighten-2 btn')
    };
  });



});
