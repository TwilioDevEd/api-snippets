<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$client->account
    ->messages("MM800f449d0399ed014aae2bcc0cc2f2ec")
    ->media("ME557ce644e5ab84fa21cc21112e22c485")
    ->delete();
