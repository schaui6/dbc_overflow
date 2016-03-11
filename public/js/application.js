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
  $(window).bind("pageshow", function(event) {
    if(event.originalEvent.persisted) {
      window.location.reload()
    }
  });
});
