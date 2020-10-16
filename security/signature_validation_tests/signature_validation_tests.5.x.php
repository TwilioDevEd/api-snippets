<?php
// To download and install Twilio helper library visit
// https://www.twilio.com/docs/libraries/php
require_once 'vendor/autoload.php';

use Twilio\Security\RequestValidator;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;

// Your auth token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$token = getenv('TWILIO_AUTH_TOKEN');

// Initialize the validator
$validator = new RequestValidator($token);

$url = 'https://mycompany.com/myapp';

$postVars = array(
    'CallSid' => 'CA1234567890ABCDE',
    'Caller' => '+12349013030',
    'Digits' => '1234',
    'From' => '+12349013030',
    'To' => '+18005551212'
);

function testUrl($method, $url, $params, $valid) {
    global $validator;
    $client = new Client();
    
    if($method == 'GET'){
        $url .= "?" . http_build_query($params);
        $params = [];
    }

    $signature = $validator->computeSignature($valid ? $url : 'http://invalid.com', $params);
    echo $signature . "\n";
    try {
        $response = $client->request($method, $url, [
            'form_params' => $params,
            'headers' => [
                'X-Twilio-Signature' => $signature,
            ]
        ]);
    } catch (ClientException $e) {
        $response = $e->getResponse();
    }
    $validStr = $valid ? "valid" : "invalid";
    echo "HTTP {$method} with {$validStr} signature returned {$response->getStatusCode()}\n";
}

testUrl('GET', $url, $postVars, true);
testUrl('GET', $url, $postVars, false);
testUrl('POST', $url, $postVars, true);
testUrl('POST', $url, $postVars, false);
