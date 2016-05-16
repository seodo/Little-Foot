$(document).ready(function() {
  $('#register').on('click', function(event){
    event.preventDefault();
      var $target = $(event.target)
        $.ajax({
          url: $target.attr('href')
        }).done(function(response){
            $('#buttons-box').hide();
            // $('#horse-list').append(response);
            $('#main').html(response).hide().fadeIn(500);
        })
    })

//   $('#horse-form').on('submit', function(event){
//     event.preventDefault();
//     var $target = $(event.target)
//       $.ajax({
//         url: $target.attr('action'),
//         method: $target.attr('method'),
//         data: $target.serialize()
//       }).done(function(response){
//         $('#horse-list').append(response);
//         $('#new-horse').show();
//         $('#horse-list').remove();
//       })
//   })

//   $('#horse-list').on('click', 'a', function(event){
//     event.preventDefault();
//     var $target = $(event.target)
//     if (($target.parent().parent()).children().hasClass("hidden-horse")) {
//       $('.hidden-horse').remove();
//     } else {
//       $.ajax({
//         url: $target.attr('href')
//       }).done(function(response){
//       $('.hidden-horse').remove();
//         $target.parent().after(response);
//       })
//     }
//   })
});

