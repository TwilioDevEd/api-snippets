<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$gather = $response->gather(['timeout' => 10, 'finishOnKey' => '*']);
$gather->say('Please enter your pin number and then press star.');


echo $response;