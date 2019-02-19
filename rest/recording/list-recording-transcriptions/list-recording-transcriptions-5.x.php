<?php
require_once './vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
$sid    = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token  = "your_auth_token";

$twilio = new Client($sid, $token);

$recording = $twilio->recordings("REXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                    ->fetch();

foreach ($recording->transcriptions->read() as $transcription) {
    print($transcription->sid);
    print($transcription->transcriptionText);
}
