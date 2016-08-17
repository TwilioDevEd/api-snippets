<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{#accountSid}}{{accountSid}}{{/accountSid}}";
$token = "{{#authToken}}{{authToken}}{{/authToken}}";
$client = new Client($sid, $token);

$client->messages->create(
    "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}",
    array(
        'from' => '{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}',
        'body' => "{{#messageBody}}{{messageBody}}{{/messageBody}}",
        'mediaUrl' => "{{#messageMediaUrl}}{{messageMediaUrl}}{{/messageMediaUrl}}",
    )
);
