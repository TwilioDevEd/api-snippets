<?php

// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/twilio-php/Services/Twilio.php'; // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$client = new Services_Twilio($accountSid, $authToken);

$message = $client->account->messages->create(
    array(
        'To'   => '+15005550006',
        'From' => '+14108675310',
        'Body' => 'All in the game, yo'
    )
);

echo $message->sid;
