<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC81e0ca4b0af06b833b6726957613c5d4"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$connect_app = $client->account->connect_apps->get("CNb989fdd207b04d16aee578018ef5fd93");
echo $connect_app->homepage_url;
