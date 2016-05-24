$(document).ready(function() {

    $('#menu-foods').bind('cocoon:before-insert', function(e,task_to_be_added) {
        console.log(task_to_be_added);
        task_to_be_added.fadeIn('slow');
    });

    $('#menu-foods').bind('cocoon:before-remove', function(e, task) {
        $(this).data('remove-timeout', 1000);
        task.fadeOut('slow');
    })


    $('#menu-foods').bind('cocoon:after-insert',
         function(e, tag) {
             console.log('inserting new tag ...');
             $(".food-fields a.add-tag").
                 data("association-insertion-position", 'after').
                 data("association-insertion-node", 'this');
             $(this).find('.food-fields').bind('cocoon:after-insert',
                  function() {
                    console.log('insert new tag ...');
                    console.log($(this));
                    $(this).find(".menu_foods_price").remove();
                  });
         });

});
