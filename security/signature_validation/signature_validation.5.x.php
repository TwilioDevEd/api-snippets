<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Security\RequestValidator;

// Your auth token from twilio.com/user/account
$token = "12345";

// The X-Twilio-Signature header - in PHP this should be
// $_SERVER["HTTP_X_TWILIO_SIGNATURE"];
$signature = 'GvWf1cFY/Q7PnoempGyD5oXAezc=';

// Initialize the validator
$validator = new RequestValidator($token);

// The Twilio request URL. You may be able to retrieve this from
// $_SERVER['SCRIPT_URI']
$url = 'https://mycompany.com/myapp.php?foo=1&bar=2';

// The post variables in the Twilio request. You may be able to use
// $postVars = $_POST
$postVars = array(
    'CallSid' => 'CA1234567890ABCDE',
    'Caller' => '+14158675310',
    'Digits' => '1234',
    'From' => '+14158675310',
    'To' => '+18005551212'
);

if ($validator->validate($signature, $url, $postVars)) {
    echo "Confirmed to have come from Twilio.";
} else {
    echo "NOT VALID. It might have been spoofed!";
}
