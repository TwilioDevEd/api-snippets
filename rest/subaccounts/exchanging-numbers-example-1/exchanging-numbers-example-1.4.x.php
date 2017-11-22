<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "your_auth_token"; 
$client = new Services_Twilio($sid, $token);

// In the case you want to transfer numbers between subaccounts, you need to 
// know three things - the account SID of the phone number's current owner, 
// the account SID of the account you'd like to transfer the number to, and 
// the SID of the phone number you'd like to transfer
$currentNumberOwnerAccountSid = "ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";
$newNumberOwnerAccountSid = "ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz";
$phoneNumberSid = "PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$number = $client->accounts->get($currentNumberOwnerAccountSid)
    ->incoming_phone_numbers->get($phoneNumberSid);

$number->update(array(
    "AccountSid" => $newNumberOwnerAccountSid,
));
echo $number->phone_number;
