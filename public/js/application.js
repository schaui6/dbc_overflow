$(document).ready(function() {
	$('.register').on('click', function(e){
		e.preventDefault()
		$('#LogIn').modal('hide')
		$('#Register').modal('show')

	})
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('#question-form').on('click', createQuestion);

  $(window).bind("pageshow", function(event) {
    if(event.originalEvent.persisted) {
      window.location.reload()
    }
  });
});

var createQuestion = function(event){
  even.preventDefault();
  var formData = $(this).serialize();
  var formRoute = $(this).attr('action');
  $.ajax({
    url: formRoute,
    type: 'post',
    data: 'formData',
  }).done(function(response){
    console.log(response).fail(function(error){
      console.log(error)
    })
  });

};
