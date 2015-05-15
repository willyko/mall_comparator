$(document).ready(function () {
  $('.mall-name').click( function () {
    $(this).siblings('.form-control').toggle();
  });

  $('.list-block').on('click', '.mall-name', function () {
    $(this).siblings('.search-bar').slideToggle();
  });


  $('.list-block').on('mouseenter', 'li',  function () {
    $(this).css('background-color' , 'LightGray');
  });

  $('.list-block').on('mouseleave', 'li', function () {
    $(this).css('background-color' , '#222222');
  });


  $('#filter-list').keyup(function (e) {
    if(e.keyCode == 8) {
      $('li:contains(' + $(this).val() + ')').fadeIn();
      $('li:not(:contains(' + $(this).val() + '))').fadeOut();
    } else {
      $('li:not(:contains(' + $(this).val() + '))').fadeOut();
    }
  });
});
