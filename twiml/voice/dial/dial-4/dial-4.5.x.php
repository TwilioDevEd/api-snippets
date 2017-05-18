<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$dial = $response->dial(['callerId' => '+15551112222']);
$dial->number('+15558675309');


echo $response;