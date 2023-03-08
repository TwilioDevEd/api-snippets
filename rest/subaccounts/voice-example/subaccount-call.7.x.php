<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sAsid = getenv('TWILIO_ACCOUNT_SID');
$sAtoken = getenv('TWILIO_AUTH_TOKEN');
$sAClient = new Client($sAsid, $sAtoken);

$sAClient->calls->create(
    '+16518675310', // The visitor's phone number
    '+14158141829', // A Twilio number in your subaccount
    array(
        "url" => 'http://twimlets.com/message?Message%5B0%5D=Hello%20from%20your%20subaccount'
    )
);
