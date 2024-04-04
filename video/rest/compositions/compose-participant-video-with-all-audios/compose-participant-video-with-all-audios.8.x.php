<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$apiKeySid = getenv('TWILIO_API_KEY');
$apiKeySecret = getenv('TWILIO_API_KEY_SECRET');
$client = new Client($apiKeySid, $apiKeySecret);

$composition = $client->video->compositions->create('RMXXXX', [
    'audioSources' => '*',
    'videoLayout' =>  array(
                        'single' => array (
                          'video_sources' => array('PAXXXX')
                        )
                      ),
    'statusCallback' => 'http://my.server.org/callbacks',
    'format' => 'mp4'
]);

echo $composition->sid;
