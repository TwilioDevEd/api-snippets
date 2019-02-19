<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
$apiKeySid = "SKXXXX";
$apiKeySecret = "your_auth_apiKeySecret";
$client = new Client($apiKeySid, $apiKeySecret);

$composition = $client->video->compositions->create([
    'roomSid' => 'RMXXXX',
    'audioSources' => 'teacher-audio-sess-*',
    'videoLayout' =>  array(
                        'sequence' => array (
                          'max_rows' => 1,
                          'max_columns' => 1,
                          'reuse' => 'show_newest',
                          'video_sources' => array('teacher-video-sess-*')
                        )
                      ),
    'statusCallback' => 'http://my.server.org/callbacks',
    'format' => 'mp4'
]);

echo $composition->sid;
