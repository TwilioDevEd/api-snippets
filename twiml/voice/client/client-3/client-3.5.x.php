<?php
require './vendor/autoload.php';
use Twilio\Twiml;

$response = new TwiML();
$dial = $response->dial();
$dial->client('joey',
    [
      'statusCallbackEvent' => array('initiated', 'ringing', 'answered', 'completed'),
      'statusCallback' => 'https://myapp.com/calls/events',
      'statusCallbackMethod' => 'POST'
    ]);

echo $response;
