<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->enqueue('support', ['waitUrl' => 'wait-music.xml']);

echo $response;
