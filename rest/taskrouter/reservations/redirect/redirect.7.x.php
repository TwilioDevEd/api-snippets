<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken = getenv('TWILIO_AUTH_TOKEN');
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$reservationSid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new Client($accountSid, $authToken);

// redirect using a reservation
$reservation = $client->taskrouter
    ->workspaces($workspaceSid)
    ->tasks($taskSid)
    ->reservations($reservationSid)
    ->fetch();

$reservation->update(
    array(
        'instruction' => 'Redirect',
        'redirectCallSid' => 'CA123456789',
        'redirectUrl' => 'http://example.com/assignment_redirect'
    )
);
