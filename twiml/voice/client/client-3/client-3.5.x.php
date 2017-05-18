<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$dial = $response->dial();
$dial->client('jenny', ['statusCallbackEvent' => 'initiated ringing answered completed', 'statusCallback' => 'https://myapp.com/calls/events', 'statusCallbackMethod' => 'POST']);


echo $response;