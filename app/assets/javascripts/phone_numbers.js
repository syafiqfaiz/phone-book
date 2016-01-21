$(document).on('ready page:load', function () {

  $('a#newPhoneNumber').click(function(click){
    click.preventDefault();
    var person_id = $(this).attr('data-person-id') 
    var selector = "#person_"+ person_id + "> div.panel-body > div.row"
    $.ajax({
      url: $(this).attr('href')
      }).done(function(html){
        $(selector).html(html)
      })
  })

  $('a#editPhoneNumber').click(function(click){
    click.preventDefault();
    var number_id = $(this).attr('data-number-id') 
    var selector = "li#number_"+ number_id 
    $.ajax({
      url: $(this).attr('href')
      }).done(function(html){
        $(selector).html(html)
      })
  })
});