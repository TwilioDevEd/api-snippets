<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require './vendor/autoload.php';
use Twilio\Rest\Client;
// Get your Account SID and Auth Token from https://twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
// Initialize the client
$client = new Client($sid, $token);
$msgInteraction = $client
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
