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
$service = $client
    ->proxy
    ->services
    ->create([
      "uniqueName" => "My Awesome Service",
      "callbackUrl" => "https://www.example.com/"
    ]);

echo $service->uniqueName;
