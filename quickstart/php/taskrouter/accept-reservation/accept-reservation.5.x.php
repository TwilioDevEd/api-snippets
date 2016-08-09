<?php
// Get the Twilio-PHP library from twilio.com/docs/libraries/php,
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\Rest\Client;

// put your Twilio API credentials here
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken  = 'your_auth_token';

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
    ->update('accepted');
