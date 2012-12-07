$(function() {  
  var availableTags = $('#locales').data('source');

  $( "#locales" ).autocomplete({
      source: availableTags
  });
});
