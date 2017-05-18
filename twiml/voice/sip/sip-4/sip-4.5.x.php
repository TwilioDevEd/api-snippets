<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$dial = $response->dial();
$dial->sip('sip:jack@example.com;transport=tcp');


echo $response;