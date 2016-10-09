<?php
// Heading
$_['heading_title']                 = 'Smart SMS - SMS Alerts v0.1.3.3.4 [by addist.ru]';
$_['heading_general']               = 'General settings';
$_['heading_provider']              = 'Provider settings';

// Text
$_['text_module']                   = 'Modules';
$_['text_test_message']             = 'Smart SMS - Test Message!';
$_['text_success']                  = 'Settings successfully updated!';
$_['text_success_sent']             = 'Test message successfully sent!';
$_['text_confirm']                  = 'Are you sure?';

// Entry
$_['entry_status']                  = 'Status';
$_['entry_statuses']                = 'Order statuses';
$_['entry_notify_admin']            = 'Notify admin';
$_['entry_notify_signup']           = 'Notify admin about new customer';
$_['entry_notify_customer']         = 'Notify customer';
$_['entry_notify_update']           = 'Notify when order updated';
$_['entry_message_admin']           = 'New order notification message to admin';
$_['entry_message_customer']        = 'New order notification message to customer';
$_['entry_message_update']          = 'Order update notification message to customer';
$_['entry_use_checkbox']            = 'If checkbox is checked';
$_['entry_provider']                = 'Provider';
$_['entry_admin_phone']             = 'Admin phone';
$_['entry_log']                     = 'Log';
$_['entry_debug']                   = 'Test mode';

// Button
$_['button_test']                   = 'Test!';

// Help
$_['help_order_variables']          = 'Accepted variables:<br/>{order_id} - Order ID,<br/>{firstname} - customer\'s first name,<br/>{lastname} - customer\'s last name,<br/>{telephone} - customer\'s phone number,<br/>{product_names} - product names and quantities list,<br/>{product_models} - models and quantities list,<br/>{total} - total amount,<br/>{currency} - order currency,<br/>{shipping_city} - shipping city,<br/>{shipping_address} - shipping address,<br/>{status} - order status,<br/>{comment} - status comment.<br/>';

// Default
$_['default_message_admin']         = "Hello, admin!\nYou have received an order!\nTotal amount: {total}{currency}";
$_['default_message_customer']      = "Hello, {firstname}!\nYour order #{order_id} received!\nTotal amount: {total}{currency}";
$_['default_message_update']        = "Hello, {firstname}!\nYour order #{order_id} has been changed!";

// Error
$_['error_undefined']               = 'Undefined error!';
?>