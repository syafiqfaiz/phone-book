$(document).on('ready page:load', function () {

 $('#newPersonForm').click(function(click){
   click.preventDefault();
   $.ajax({
     url: $(this).attr('href')
     }).done(function(html){
       $('.peopleList').append(html)
     })
 })

  $('a#editPersonForm').click(function(click){
    click.preventDefault();
    var person_id = $(this).attr('data-person-id') 
    var selector = "#person_"+ person_id + "> div.panel-body"
    $.ajax({
      url: $(this).attr('href')
      }).done(function(html){
        $(selector).prepend(html)
      })
  })

});