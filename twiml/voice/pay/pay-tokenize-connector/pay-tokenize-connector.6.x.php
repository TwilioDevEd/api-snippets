<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->pay(
    [
        'chargeAmount' => '0', 
        'paymentConnector' => 'My_Pay_Connector', 
        'action' => 'https://your-callback-function-url.com/pay'
    ]
);

echo $response;
