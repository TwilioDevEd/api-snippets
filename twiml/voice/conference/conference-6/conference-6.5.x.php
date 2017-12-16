<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$dial = $response->dial();
$dial->conference('NoMusicNoBeepRoom', ['beep' => 'false', 'waitUrl' => 'http://your-webhook-host.com',
    'startConferenceOnEnter' => 'true', 'endConferenceOnExit' => 'true']);

echo $response;
