<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->record(['transcribe' => 'true',
    'transcribeCallback' => '/handle_transcribe.php']);

echo $response;
