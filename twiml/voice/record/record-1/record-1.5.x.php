<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->record(['timeout' => 10, 'transcribe' => 'true']);

echo $response;
