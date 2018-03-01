// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function() {
  jQuery(function() {
    var subcategories;
    $('#project_subcategory_id').parent().hide();
    subcategories = $('#project_subcategory_id').html();
    return $('#project_category_id').change(function() {
      var category, escaped_category, options;
      category = $('#project_category_id :selected').text();
      escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
      options = $(subcategories).filter("optgroup[label=" + escaped_category + "]").html();
      console.log(options);
      if (options) {
        $('#project_subcategory_id').html(options);
        return $('#project_subcategory_id').parent().show();
      } else {
        $('#project_subcategory_id').empty();
        return $('#project_subcategory_id ').parent().hide();
      }
    });
  });
});
