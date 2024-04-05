<?php

// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account SID and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
$sid = getenv("TWILIO_ACCOUNT_SID");
$token = getenv("TWILIO_AUTH_TOKEN");
$twilio = new Client($sid, $token);

$composition = $twilio->video->v1->compositions
                                 ->create("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", // roomSid
                                          [
                                              "audioSources" => ["*"],
                                              "videoLayout" => [
                                                  "chess_table" => [
                                                      "x_pos" => 10,
                                                      "y_pos" => 0,
                                                      "width" => 1260,
                                                      "height" => 720,
                                                      "max_rows" => 3,
                                                      "max_columns" => 3,
                                                      "reuse" => "show_newest",
                                                      "cells_excluded" => [
                                                          1,
                                                          3,
                                                          5,
                                                          7
                                                      ],
                                                      "video_sources" => [
                                                          "*"
                                                      ]
                                                  ]
                                              ],
                                              "statusCallback" => "https://www.example.com/callbacks",
                                              "resolution" => "1280x720",
                                              "format" => "mp4"
                                          ]
                                 );

print($composition->sid);
