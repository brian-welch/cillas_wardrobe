function make_the_sku() {
  $(".sku-suffix-component").on('change', function(){
    let base = $('#product_product_number').val();
    let size_code = $('#product_size_id option:selected').attr('data-code-num');
    let color_code = $('#product_color_id option:selected').attr('data-code-num');
    let pattern_code = $('#product_pattern_id option:selected').attr('data-code-num');
    $("#product_sku").val(base + "-" + size_code + "-" + color_code + "-" + pattern_code); // $(".sku-suffix-component").val());
  });
}

window.make_the_sku = make_the_sku


export { make_the_sku };
