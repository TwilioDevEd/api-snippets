<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial();
$dial->number('+14158675310', [
  'statusCallbackEvent' => array('initiated', 'ringing', 'answered', 'completed'),
  'statusCallback' => 'https://myapp.com/calls/events',
  'statusCallbackMethod' => 'POST'
]);

echo $response;
