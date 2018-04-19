<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

$client = new Client($sid, $token);

// Loop over the list of messages and echo a property for each one
$params = array('to' => 'to_number', 'from' => 'from_number', 'dateSent' => date('2016-09-06'));
$result = $client->messages->read($params);

foreach ($result as $message) {
    echo $message->body;
}
