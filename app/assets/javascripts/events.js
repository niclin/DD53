$(document).on("click", ".open-AddBookDialog", function () {
     var myBookId = $(this).data('id');
     var food = $(this).data('food');
     $(".modal-body #bookId").val( food );
     // As pointed out in comments,
     // it is superfluous to have to manually call the modal.
     // $('#addBookDialog').modal('show');
});
