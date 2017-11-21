


$(document).ready(function(){
    var init_from_lookup;

init_from_lookup = function(){
     $('#stock-lookup-form').on("ajax:before",function(event, data, error){
        $('#spinner').show();
    });
    
     $('#stock-lookup-form').on("ajax:after",function(event, data, error){
        $('#spinner').hide();
    });
    
    $('#stock-lookup-form').on("ajax:success",function(event, data, error){
        $('#stock-lookup').replaceWith(data);
        init_from_lookup();
        
    })
    
     $('#stock-lookup-form').on("ajax:error",function(event, data, error){
        $('#spinner').hide(); 
        $('#stock-lookup-results').replaceWith("<p>Please enter valid symbol</p>");
    })
}
    init_from_lookup();
})
