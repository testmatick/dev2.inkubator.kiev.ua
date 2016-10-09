function minicart(){
  $('#cart > a > div#cart-tt').load('index.php?route=common/cart/info a div#cart-tt').hide().fadeIn('slow');
  $('#cart > ul').load('index.php?route=common/cart/info ul li');
}

$(document).ready(function(){
  $(".quickview").fancybox({ 
  type: 'iframe',
  closeEffect: 'elastic',
  autoSize: false,
  width: 800,
  maxWidth: 800, 
  maxHeight: 700,
  padding: 0,
  afterClose: function() {
  minicart();
  return;}, 
  });
});
