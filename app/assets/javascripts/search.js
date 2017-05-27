$(document).on("ready", function(){
  console.log('this is running');
  $("add-search-container").on('click', function(){
    console.log('recognized the click');
    var search-container = $('<div>').addClass('search-container');
    var search-bar = $('<div>').addClass('search-bar');
    var search-area = $('<div>').addClass('search-area');
    var search-button = $('<div>').addClass('.search-button');
    $('.container').html(' ');
    $('.container').append(search-container, search-bar, search-area, search-button);
  });
});
