<?php
// Get the Node helper library from https://twilio.com/docs/libraries/php
require './vendor/autoload.php';
use Twilio\Rest\Client;
// Get your Account SID and Auth Token from https://twilio.com/console
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
// Initialize the client
$client = new Client($sid, $token);
$msgInteraction = $client
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

echo $msgInteraction->sid, PHP_EOL;
