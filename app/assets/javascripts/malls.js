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

  $('#btn-compare').on('click', function () {
    $('#filter-list').slideUp();
    $('#mall1 ul').find('li').each(function(index,value) {
      selector_1 = $(this);
      $('#mall2 ul').find('li').each(function(index) {
        if ($(this).hasClass('matched')) {
          // skip if already been matched
          return true;
        }
        if(selector_1.text().toLowerCase().replace(/\s+/g, '') != $(this).text().toLowerCase().replace(/\s+/g, ''))  {
          return true;
        }
        selector_1.addClass('matched');
        $(this).addClass('matched');
      });
    });
    $('.list-block li').each(function() {
      if ($(this).hasClass('matched')) {
        $(this).show();
        $(this).removeClass('matched');
      } else {
        $(this).hide();
      }
    });
  });

  $('#btn-contra').on('click', function () {
    $('#filter-list').slideUp();
    $('#mall1 ul').find('li').each(function(index,value) {
      selector_1 = $(this);
      $('#mall2 ul').find('li').each(function(index) {
        if ($(this).hasClass('matched')) {
          // skip if already been matched
          return true;
        }
        if(selector_1.text().toLowerCase().replace(/\s+/g, '') != $(this).text().toLowerCase().replace(/\s+/g, ''))  {
          return true;
        }
        selector_1.addClass('matched');
        $(this).addClass('matched');
      });
    });
    $('.list-block li').each(function() {
      if ($(this).hasClass('matched')) {
        $(this).hide();
        $(this).removeClass('matched');
      } else {
        $(this).show();
      }
    });
  });

  $('#btn-reset').on('click', function () {
    $('#filter-list').slideDown();
    $('.list-block li').each(function() {
        $(this).show();
    });
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
