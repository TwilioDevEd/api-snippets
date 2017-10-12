<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once "/path/to/vendor/autoload.php"; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
$apiKeySid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$apiKeySecret = "your_auth_api_key_secret";
$client = new Client($apiKeySid, $apiKeySecret);

$recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$uri = "https://video.twilio.com/v1/Recordings/$recordingSid/Media";
$response = $client->request("GET", $uri);
$mediaLocation = json_decode($response->content)["location"];

$media_content = file_get_contents($mediaLocation);
print_r($media_content);
