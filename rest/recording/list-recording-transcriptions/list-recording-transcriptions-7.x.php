<?php
require_once './vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$sid    = getenv('TWILIO_ACCOUNT_SID');
$token  = getenv('TWILIO_AUTH_TOKEN');

$twilio = new Client($sid, $token);

$recording = $twilio->recordings("REXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                    ->fetch();

foreach ($recording->transcriptions->read() as $transcription) {
    print($transcription->sid);
    print($transcription->transcriptionText);
}
