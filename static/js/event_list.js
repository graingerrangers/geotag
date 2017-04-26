$(document).ready(function(){
    $('.delete').click(function(){
        var button = $(this);
        $.post('/attend', {'event_id': button.attr('id')}, function(){
            button.attr('disabled', 'disabled');
            button.html('Attending');
        });
    });
});
