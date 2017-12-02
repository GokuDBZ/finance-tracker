$( document ).ajaxStart(function() {
  $('#spinner').show();
});

$("document").ready(function(){
    
    // $("document").on("ajax:start",function(event,data,error){
    //     $('#spinner').show();
    // })
    
    $("#friend-lookup-form").on("ajax:success",function(event, data, error){
        $('#spinner').hide();
        $(".results").html(data)
    })
    
    // if we use replcaceWith we need to add event again

    // $("#friend-lookup-form").on("ajax:complete",function(event,data,error){
    //      $('#spinner').html(data.responseText)
    // })

    // $("#friend-lookup-form").on("ajax:end",function(event, data, error){
    //   $('#spinner').hide();
    // })
})
