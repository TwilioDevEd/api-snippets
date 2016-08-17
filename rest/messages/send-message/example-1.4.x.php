<?php

// this line loads the library
require('/path/to/twilio-php/Services/Twilio.php');

$account_sid = '{{#accountSid}}{{accountSid}}{{/accountSid}}';
$auth_token = '{{#authToken}}{{authToken}}{{/authToken}}';
$client = new Services_Twilio($account_sid, $auth_token);

$client->account->messages->create(array(
    'To' => "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}",
    'From' => "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}",
    'Body' => "{{#messageBody}}{{messageBody}}{{/messageBody}}",
    'MediaUrl' => "{{#messageMediaUrl}}{{messageMediaUrl}}{{/messageMediaUrl}}",
));
