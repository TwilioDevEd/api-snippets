<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');

$client = new Client($sid, $token);

$number = $client->lookups
    ->phoneNumbers("+16502530000")
    ->fetch(
        array("type" => "caller-name")
    );

echo $number->callerName['caller_type'] . "\r\n";
echo $number->callerName['caller_name'];
