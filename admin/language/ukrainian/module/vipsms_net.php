<?php

// Heading
$_['heading_title'] = 'VipSMS.net';
$_['text_module']   = 'Модулі';

$_['vipsms_net_saved_success'] = 'Успішно збережено налаштування';
$_['vipsms_net_smssend_success'] = 'Повідомлення успішно надіслано на шлюз';

// Error
$_['vipsms_net_error_permission'] = 'Ви не маєте повноважень для зміни налаштувань у модулі!';
$_['vipsms_net_error_request'] = 'Помилка запиту';
$_['vipsms_net_error_auth_info'] = 'Необхідно спочатку вказаити ідентифікаційні дані SMS-шлюза';
$_['vipsms_net_error_login_field'] = 'Необхідно вказати логін';
$_['vipsms_net_error_password_field'] = 'Необхідно вказати пароль';
$_['vipsms_net_error_sign_field'] = 'Необходимо підпис для повідомлень';
$_['vipsms_net_error_admphone_field'] = 'Вкажіть номер телефону адміністратора';
$_['vipsms_net_error_sign_to_large'] = 'Підпис занадто довга. Максимум 11 символів.';
$_['vipsms_net_error_empty_frmsms_message'] = 'Необхідно вказати текст повідомлення.';

// Tabs name in view
$_['vipsms_net_tab_connection'] = 'Налаштування шлюза';
$_['vipsms_net_tab_signature'] = 'Підпис для повідомлень';
$_['vipsms_net_tab_events'] = 'Виконувати для дій';
$_['vipsms_net_tab_about'] = 'Про модуль';
$_['vipsms_net_tab_sendsms'] = 'Надістали SMS';

// Text messges
$_['vipsms_net_text_gate_settings'] = 'Налаштування шлюзу';
$_['vipsms_net_text_login'] = 'Логін';
$_['vipsms_net_text_password'] = 'Пароль';
$_['vipsms_net_text_sign'] = 'Підпис повідомлень';
$_['vipsms_net_text_admphone'] = 'Телефон адміністратора';
$_['vipsms_net_text_notify_sms_to_admin'] = 'Повідомляти про події адміністратора';
$_['vipsms_net_text_notify_sms_to_customer'] = 'Повідомляти про події покупця';
$_['vipsms_net_text_connection_established'] = 'З`єднання з SMS-шлюзом встановлено';
$_['vipsms_net_text_connection_error'] = 'Відсутній зв`язок із SMS-шлюзом';
$_['vipsms_net_events_admin_new_customer'] = 'Новий покупець зареєструвався';
$_['vipsms_net_events_admin_new_order'] = 'Здійснили нове замовлення';
$_['vipsms_net_events_admin_new_email'] = 'Надійшов лист з контактної форми магазину';
$_['vipsms_net_text_frmsms_message'] = 'Текст повыдомлення';
$_['vipsms_net_text_frmsms_phone'] = 'Номер отримувача';
$_['vipsms_net_text_button_send_sms'] = 'Надіслати SMS';
$_['vipsms_net_events_admin_gateway_connection_error'] = 'Повідомляти на email у випадках неполадок з`єднання із шлюзом';
$_['vipsms_net_events_customer_new_order_status'] = 'Зміна статусу замовлення';
$_['vipsms_net_events_customer_new_order'] = 'Покупцю повідомлення про нове замовлення';
$_['vipsms_net_events_customer_new_register'] = 'Вдале завершення реєтрації';

$_['vipsms_net_message_customer_new_order_status'] = 'Статус замовлення #%s змінено на "%s"';

$_['vipsms_net_text_connection_tab_description'] =
'Вкажіть вірні дані для подключения до шлюзу VipSMS.net через SOAP протокол.<br/>';

$_['vipsms_net_text_about_tab_description'] =
'<b>%s &copy; %s Всі права захищено</b><br/>
<br/>
Модуль призначено для розсилки SMS повідомлень за допомогою шлюза VipSMS.net.
<br/><br/>
Дана робота розповсюджується на основі ліцензії BSD<br/><br/>
Поточна версія: %s<br/>';

# vi:ts=2:sw=2:ai:et:ft=php:enc=utf8
