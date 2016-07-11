<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sAsid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$sAtoken = "your_auth_token";
$sAClient = new Client($sAsid, $sAtoken);

$sAClient->account->calls->create(
    '+16518675309', // The visitor's phone number
    '+14158141829', // A Twilio number in your subaccount
    array(
        "url" => 'http://twimlets.com/message?Message%5B0%5D=Hello%20from%20your%20subaccount'
    )
);
