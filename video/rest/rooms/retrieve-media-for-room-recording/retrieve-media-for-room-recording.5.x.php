<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
$apiKeySid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$apiKeySecret = "your_auth_apiKeySecret";
$client = new Client($apiKeySid, $apiKeySecret);

$roomSid = "RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$uri = "https://video.twilio.com/v1/" +
       "Rooms/$roomSid/" +
       "Recordings/$recordingSid/" +
       "Media/";
$response = $client->request("POST", $uri);
$mediaLocation = json_decode($response->content)["location"];

$media_content = file_get_contents($mediaLocation);
print_r($media_content);
