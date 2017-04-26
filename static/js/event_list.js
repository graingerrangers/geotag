$(document).ready(function(){
    $('#delete').click(function(){
        $.post('/is_attending', {'event_id': $(this).attr('id')}, function(){
            
        });
    });
});
