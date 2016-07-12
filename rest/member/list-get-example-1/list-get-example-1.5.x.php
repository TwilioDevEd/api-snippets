<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$members = $client->account
    ->queues("QU5ef8732a3c49700934481addd5ce1659")
    ->members
    ->read();

// Loop over the list of members and echo a property for each one
foreach ($members as $member) {
    echo $member->position;
}
