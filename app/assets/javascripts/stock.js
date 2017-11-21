


$(document).ready(function(){
    var init_from_lookup;

init_from_lookup = function(){
    $('#stock-lookup-form').on("ajax:success",function(event, data, error){
        $('#stock-lookup').replaceWith(data);
        init_from_lookup();
        
    })
}
    init_from_lookup();
})
