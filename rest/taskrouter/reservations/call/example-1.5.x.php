<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$reservationSid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new Client($accountSid, $authToken);

$workspace = $client->taskrouter->workspaces()->getContext($workspaceSid);

// call using a reservation
$reservation = $workspace->tasks($taskSid)
    ->reservations($reservationSid)->fetch();

$reservation->update(
    $reservation->reservationStatus,
    [
        'instruction' => 'call',
        'callFrom' => '+15558675309',
        'callUrl' => 'http://example.com/agent_answer',
        'callStatusCallbackUrl' => 'http://example.com/agent_answer_status_callback',
        'callAccept' => 'true'
    ]
);
