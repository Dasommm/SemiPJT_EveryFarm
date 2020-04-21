$("input[type='submit']").click(function(){
   /* To make the demo more alive */
   event.preventDefault();
  $(".warning").hide();
  $(".warning").fadeIn(200);
});