<?php
// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "your_AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

// Delete the message
$message = $client->chat
    ->services("SERVICE_SID")
    ->channels("CHANNEL_SID")
    ->messages("MESSAGE_SID")
    ->update(
        array("body" => "New message text")
    );

echo $message->body;
