<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$reservationSid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid);

// call using a reservation
$reservation = $client->workspace->tasks->get($taskSid)->reservations->get($reservationSid);
$reservation->update(
    array(
        'Instruction' => 'call',
        'CallFrom' => '+15558675310',
        'CallUrl' => 'http://example.com/agent_answer',
        'CallStatusCallbackUrl' => 'http://example.com/agent_answer_status_callback',
        'CallAccept' => 'true'
    )
);
