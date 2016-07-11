<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$client->account->sip
    ->credentialLists("CL32a3c49700934481addd5ce1659f04d2")
    ->credentials("SC32a3c49700934481addd5ce1659f04d2")
    ->delete();
