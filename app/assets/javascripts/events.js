$(function() {
  return $(document).on('change', '#cart_item_quantity', function(evt) {
    $('[id^=edit_cart_item] #cart_item_quantity').on('blur', function() {
      $(this).parents('form').submit();
    });
  });
});
