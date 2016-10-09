<?php
// Heading
$_['heading_title']                 = 'Smart SMS - СМС оповещения v0.1.3.3.4 [by addist.ru]';
$_['heading_general']               = 'Основные настройки';
$_['heading_provider']              = 'Настройки провайдера';

// Text
$_['text_module']                   = 'Модули';
$_['text_test_message']             = 'Smart SMS - Тестовое Сообщение!';
$_['text_success']                  = 'Настройки успешно обновлены!';
$_['text_success_sent']             = 'Тестовый СМС успешно отправлено!';
$_['text_confirm']                  = 'Вы уверены?';

// Entry
$_['entry_status']                  = 'Статус';
$_['entry_statuses']                = 'Статусы заказов';
$_['entry_notify_admin']            = 'СМС администратору при заказе';
$_['entry_notify_signup']           = 'СМС администратору о новом клиенте';
$_['entry_notify_customer']         = 'СМС покупателям при заказе';
$_['entry_notify_update']           = 'СМС покупателям при обновлении статуса заказа';
$_['entry_use_checkbox']            = 'Если отмечена галочка';
$_['entry_message_admin']           = 'Сообщение администратору о новом заказе';
$_['entry_message_customer']        = 'Сообщение покупателю о новом заказе';
$_['entry_message_update']          = 'Сообщение об обновлении статуса заказа';
$_['entry_provider']                = 'Провайдер';
$_['entry_admin_phone']             = 'Номер телефона администратора';
$_['entry_log']                     = 'Лог';
$_['entry_debug']                   = 'Тестовый режим';

// Button
$_['button_test']                   = 'Тестировать!';

// Help
$_['help_order_variables']          = 'Переменные:<br/>{order_id} - ID заказа,<br/>{firstname} - имя покупателя,<br/>{lastname} - фамилия покупателя,<br/>{telephone} - номер телефона покупателя,<br/>{product_names} - список наименований и количество заказанных товаров,<br/>{product_models} - список моделей и количество заказанных товаров,<br/>{total} - итого,<br/>{currency} - код валюты,<br/>{shipping_city} - город доставки,<br/>{shipping_address} - адрес доставки,<br/>{status} - статус заказа,<br/>{comment} - комментарий к смене статуса.<br/>';

// Default
$_['default_message_admin']         = "Привет, админ!\nУ вас новый заказ!\nИтого: {total}{currency}";
$_['default_message_customer']      = "Привет, {firstname}!\nВаш заказ #{order_id} принят!\nИтого: {total}{currency}";
$_['default_message_update']        = "Привет, {firstname}!\nВаш заказ #{order_id} обновлен!";


// Error
$_['error_undefined']               = 'Неизвестная ошибка!';
?>