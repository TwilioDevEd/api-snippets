<?php
// Get the Twilio-PHP library from twilio.com/docs/libraries/php,
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\Rest\Client;

// put your Twilio API credentials here
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken  = getenv('TWILIO_AUTH_TOKEN');

$workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

// instantiate a new Twilio Rest Client
$client = new Client($accountSid, $authToken);

// update the reservation
$client->taskrouter
    ->workspaces($workspaceSid)
    ->tasks($taskSid)
    ->reservations($reservationSid)
    ->update(['reservationStatus' => 'accepted']);
