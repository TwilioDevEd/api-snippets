<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial();
$dial->conference('EventedConf', [
  'statusCallback' => 'https://myapp.com/events',
  'statusCallbackEvent' => array('start', 'end', 'join', 'leave', 'mute', 'hold')
]);

echo $response;
