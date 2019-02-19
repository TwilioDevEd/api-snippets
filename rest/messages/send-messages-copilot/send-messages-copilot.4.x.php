<?php

// this line loads the library
require('/path/to/twilio-php/Services/Twilio.php');

// Download the PHP helper library from twilio.com/docs/php/install
// These vars are your accountSid and authToken from twilio.com/user/account
$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$auth_token = 'your_auth_token';
$client = new Services_Twilio($account_sid, $auth_token);

$client->account->messages->create(array(
    'To' => "+441632960675",
    'MessagingServiceSid' => "MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    'Body' => "Phantom Menace was clearly the best of the prequel trilogy.",
));