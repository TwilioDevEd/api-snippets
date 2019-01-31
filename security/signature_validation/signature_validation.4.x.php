<?php

// Your auth token from twilio.com/user/account
$authToken = '12345';

// Download the twilio-php library from twilio.com/docs/php/install, include it
// here
require_once('/path/to/twilio-php/Services/Twilio.php');
$validator = new Services_Twilio_RequestValidator($authToken);

// The Twilio request URL. You may be able to retrieve this from
// $_SERVER['SCRIPT_URI']
$url = 'https://mycompany.com/myapp.php?foo=1&bar=2';

// The post variables in the Twilio request. You may be able to use
// $postVars = $_POST
$postVars = array(
    'CallSid' => 'CA1234567890ABCDE',
    'Caller' => '+12349013030',
    'Digits' => '1234',
    'From' => '+12349013030',
    'To' => '+18005551212'
);

// The X-Twilio-Signature header - in PHP this should be
// $_SERVER["HTTP_X_TWILIO_SIGNATURE"];
$signature = '0/KCTR6DLpKmkAf8muzZqo1nDgQ=';

if ($validator->validate($signature, $url, $postVars)) {
    echo "Confirmed to have come from Twilio.";
} else {
    echo "NOT VALID. It might have been spoofed!";
}
