<?php

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');

// Initialize the client
$client = new Client($sid, $token);

//Delete the role
$client->chat
    ->services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->roles("RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->delete();
