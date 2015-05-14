$(document).ready(function () {
  $('.mall-name').click( function () {
    $(this).siblings('.form-control').toggle();
  });

  $('#selection1').hide();
  $('#selection2').hide();

  //$('.mall-name').mouseleave( function () {
  //  $(this).children('#selection').remove();
  //  $(this).children('h2').show();
  //});
  $('li').mouseenter( function () {
    $(this).css('background-color' , 'LightGray');
  });

  $('li').mouseleave( function () {
    $(this).css('background-color' , '#222222');
  });

  //$('#selection1').autocomplete({
  //  minLength: 0,
  //  source: "malls",
  //  focus: function(event, ui) {
  //    $('selection1').val(ui.item.mall.name);
  //    return false;
  //  },
  //  select: function(event, ui) {
  //    $('selection1').val(ui.item.mall.name);
  //    return false;
  //  }
  //}).autocomplete("instance")._renderItem = function(ul, item) {
  //    return $( "<li>" )
  //      .data( "ui-autocomplete-item", item)
  //      .append( "<a>" + item.mall.name + "</a>" )
  //      .appendTo( ul );

  //  };

  $('#filter-list').keyup(function (e) {
    if(e.keyCode == 8) {
      $('li:contains(' + $(this).val() + ')').fadeIn();
      $('li:not(:contains(' + $(this).val() + '))').fadeOut();
    } else {
      $('li:not(:contains(' + $(this).val() + '))').fadeOut();
    }
  });
});
