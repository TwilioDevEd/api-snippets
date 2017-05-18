<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$dial = $response->dial();
$dial->queue('support', ['url' => 'about_to_connect.xml']);


echo $response;