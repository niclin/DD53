$(document).ready(function() {

    $('#menu-foods').bind('cocoon:before-insert', function(e,task_to_be_added) {
        console.log(task_to_be_added);
        task_to_be_added.fadeIn('slow');
    });

    $('#menu-foods').bind('cocoon:before-remove', function(e, task) {
        $(this).data('remove-timeout', 1000);
        task.fadeOut('slow');
    })
});
