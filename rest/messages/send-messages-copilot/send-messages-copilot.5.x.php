<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once 'vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client; 
 
// Download the Node helper library from twilio.com/docs/php/install
// These vars are your accountSid and authToken from twilio.com/user/account
$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$auth_token = 'your_auth_token'; 
$client = new Client($account_sid, $auth_token);
 
$client->account->messages->create(
    "+15558675309",
    array(
        'messagingServiceSid' => "MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        'body' => "Phantom Menace was clearly the best of the prequel trilogy."
    )
);
