<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$gather = $response->gather(['action' => '/process_gather.php',
    'method' => 'GET']);
$gather->say('Enter something, or not');
$response->redirect('/process_gather.php?Digits=TIMEOUT', ['method' => 'GET']);

echo $response;
