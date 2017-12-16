<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$workerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$reservationSid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new Client($accountSid, $authToken);

// call using a reservation
$client->taskrouter
    ->workspaces($workspaceSid)
    ->workers($workerSid)
    ->reservations($reservationSid)
    ->update(
        array(
            'instruction' => 'call',
            'callFrom' => '+15558675309',
            'callUrl' => 'http://example.com/agent_answer',
            'callStatusCallbackUrl' => 'http://example.com/agent_answer_status_callback',
            'callAccept' => 'true'
        )
    );
