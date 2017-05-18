<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->record(['transcribe' => 'true', 'transcribeCallback' => '/handle_transcribe.php']);

echo $response;