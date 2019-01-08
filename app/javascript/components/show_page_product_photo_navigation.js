function change_product_photo_show_page() {
  $(".product-image-number-button").on('click', function(){
    let x = $(this).html().trim();
    $('.show-page-product-image').removeClass('top-photo');
    $('[data-photo-num="' + x + '"]').addClass('top-photo');
    $('.product-image-number-button').removeClass('active');
    $(this).addClass('active');
  });
}

window.change_product_photo_show_page = change_product_photo_show_page

export { change_product_photo_show_page };
