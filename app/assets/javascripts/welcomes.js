$(document).on('ready page:load', function () {
  $('#newPersonForm').click(function(click){
    click.preventDefault();
    $.ajax({
      url: $(this).attr('href')
      }).done(function(html){
        $('.peopleList').append(html)
      })
  })

  

});