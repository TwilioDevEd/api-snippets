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
                        'main' => array (
                            'z_pos' => 1,
                            'video_sources' => array('teacher-screen-video')
                        ),
                        'pip' => array(
                            'z_pos' => 2,
                            'x_pos' => 1000,
                            'y_pos' => 30,
                            'width' => 240,
                            'height' => 180,
                            'video_sources' => array('teacher-webcam-video')
                        ),
                        'column' => array(
                            'z_pos' => 3,
                            'x_pos' => 40,
                            'y_pos' => 10,
                            'width' => 190,
                            'height' => 700,
                            'max_rows' => 5,
                            'max_columns' => 1,
                            'reuse' => 'show_newest',
                            'video_sources' => array('student-*')
                        )
                      ),
    'statusCallback' => 'http://my.server.org/callbacks',
    'resolution' => '1280x720',
    'format' => 'mp4'
]);

echo $composition->sid;
