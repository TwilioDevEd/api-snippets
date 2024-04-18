<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($sid, $token);

$client->video->rooms('RMXXXX')->participants('Customer')
->subscribeRules->update(“rules” => [[“type” => “include”, “all” => true], [“type” => “exclude”, “publisher” => “Supervisor”]]);

echo 'Subscribe Rules updated successfully';
