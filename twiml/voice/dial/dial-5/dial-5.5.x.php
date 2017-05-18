<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$dial = $response->dial(['record' => 'record-from-ringing-dual', 'recordingStatusCallback' => 'www.myexample.com']);
$dial->number('+15558675309');


echo $response;