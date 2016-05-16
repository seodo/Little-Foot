$(document).ready(function() {
  $('#login').on('click', function(event){
    event.preventDefault();
      var $target = $(event.target)
        $.ajax({
          url: $target.attr('href')
        }).done(function(response){
            $('#buttons-box').hide();
            $('#main').html(response).hide().fadeIn(500);
        })
    })
});
