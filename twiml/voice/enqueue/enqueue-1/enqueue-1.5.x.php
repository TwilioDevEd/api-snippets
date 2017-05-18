<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->enqueue('support', ['waitUrl' => 'wait-music.xml']);

echo $response;