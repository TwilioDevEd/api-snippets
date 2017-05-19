<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

// In the case you want to transfer numbers between subaccounts, you need to
// know three things - the account SID of the phone number's current owner,
// the account SID of the account you'd like to transfer the number to, and
// the SID of the phone number you'd like to transfer
$currentNumberOwnerAccountSid = "ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";
$newNumberOwnerAccountSid = "ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz";
$phoneNumberSid = "PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$number = $client->api->accounts($currentNumberOwnerAccountSid)
    ->incomingPhoneNumbers($phoneNumberSid)
    ->update(array("accountSid" => $newNumberOwnerAccountSid));

echo $number->phoneNumber;
