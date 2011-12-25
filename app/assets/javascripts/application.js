// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$('#product_cata_level_1').live('change', function() {
  $.ajax({ url: '/products/update_cata_level_2/',
    data: 'cata_level_1=' + this.value,
    success: function(data) {
      $('#trainerCalendar').html(data);
    }
  })
});


