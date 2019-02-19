<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "your_auth_token"; 
$client = new Services_Twilio($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$short_code = $client->account->short_codes->get("SC6b20cb705c1e8f00210049b20b70fce3");
$short_code->update(array(
        "SmsUrl" => "http://demo.twilio.com/docs/sms.xml"
    ));
echo $short_code->short_code;