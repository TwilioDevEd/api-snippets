<?php
require 'vendor/autoload.php';

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use Twilio\TwiML\VoiceResponse;

$app = new \Slim\App;

$app->post('/voice', function (Request $request, Response $response) {
    $twiml = new VoiceResponse;
    $twiml->say('Hi! I want to know what do you think about coding.');
    $twiml->record(['maxLength' => 10, 'action' => '/recording']);
    $twiml->hangup();

    $response->getBody()->write("$twiml");
    return $response;
});

$app->post('/recording', function (Request $request, Response $response) {
    $twiml = new VoiceResponse;
    $body = $request->getParsedBody();
    $recordingUrl = $body['RecordingUrl'];

    $twiml->say('Thanks for howling... take a listen to what you howled.');
    $twiml->play($recordingUrl);
    $twiml->say('Goodbye.');

    $response->getBody()->write("$twiml");
    return $response;
});

$app->post('/callback', function (Request $request, Response $response) {
    $body = $request->getParsedBody();
    $addOns = json_decode($body['AddOns'], true);

    if (!(array_key_exists('ibm_watson_speechtotext', $addOns['results']))) {
        return 'Add Watson Speech to Text add-on in your Twilio console';
    }

    $payloadUrL = $addOns['results']['ibm_watson_speechtotext']['payload'][0]['url'];
    $accountSID = $_ENV['TWILIO_ACCOUNT_SID'];
    $authToken = $_ENV['TWILIO_AUTH_TOKEN'];

    $client = new \GuzzleHttp\Client();
    $resp = $client->request('GET', $payloadUrL, ['auth' => [$accountSID, $authToken]]);
    $resp_body = (string) $resp->getBody();
    $results = json_decode($resp_body, true)['results'][0]['results'];

    $transcripts = array_map(function ($item) {
        return $item['alternatives'][0]['transcript'];
    }, $results);

    $response->getBody()->write(implode(' ', $transcripts));
});

$app->run();
