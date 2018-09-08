<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial();
$dial->number('+14155555555',
    ['statusCallbackEvent' => array('initiated', 'ringing', 'answered', 'completed'),
    'statusCallback' => 'https://myapp.com/calls/events',
    'statusCallbackMethod' => 'POST']);
$dial->number('+14153333333',
    ['statusCallbackEvent' => array('initiated', 'ringing', 'answered', 'completed'),
    'statusCallback' => 'https://example.com/events',
    'statusCallbackMethod' => 'POST']);

echo $response;
