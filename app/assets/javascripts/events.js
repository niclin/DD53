$(document).on('page:change', function() {
  $('[id^=edit_cart_item] #cart_item_quantity').on('blur', function() {
    $(this).parents('form').submit();
  });
});
