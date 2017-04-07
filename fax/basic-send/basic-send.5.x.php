<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$fax = $client->fax->v1->faxes->create(
    "+15017250604",
    "+15558675309",
    "https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf"
);

echo $fax->$sid;
