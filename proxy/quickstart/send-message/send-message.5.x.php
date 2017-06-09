<?php
// This line loads the library
require './vendor/autoload.php';
use Twilio\Rest\Client;
// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
// Initialize the client
$client = new Client($sid, $token);
$session = $client
    ->preview
    ->proxy
    ->services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->sessions("KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->participants("KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->messageInteractions->create(
        array(
            "body" => "Reply to this message to chat!"
        )
    );

echo $session->sid, PHP_EOL;