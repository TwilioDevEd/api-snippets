<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->record(['timeout' => 10, 'transcribe' => 'true']);

echo $response;