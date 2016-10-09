<div id="cart" class="btn-group btn-block buttons-header">
  <a data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn dropdown-toggle">
  <div id="cart-tt"><div id="cart-total" class="button-i"><?php echo $text_items; ?></div></div>
  <span class="button-text"><?php echo $text_shopping_cart; ?></span>
  </a>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><span class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            <small><?php echo $text_recurring; ?>: <?php echo $product['recurring']; ?></small>
            <?php } ?>
            <br />
            <span class="price"><?php echo $product['total']; ?></span></td>
          <td class="text-right"><span class="quantity">x<?php echo $product['quantity']; ?></span></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-xs item-remove"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table cart-total">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <div class="checkout"><a href="<?php echo $cart; ?>" class="btn btn-xs btn-default"><?php echo $text_cart; ?></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo $checkout; ?>" class="btn btn-xs btn-primary"><?php echo $text_checkout; ?></a></div>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
