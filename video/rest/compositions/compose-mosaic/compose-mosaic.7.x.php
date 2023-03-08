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
                                              "audioSourcesExcluded" => ["advisor-audio"],
                                              "videoLayout" => [
                                                  "interviewed" => [
                                                      "z_pos" => 2,
                                                      "x_pos" => 400,
                                                      "y_pos" => 180,
                                                      "width" => 480,
                                                      "height" => 360,
                                                      "video_sources" => [
                                                          "interviewed-video"
                                                      ]
                                                  ],
                                                  "interviewers" => [
                                                      "z_pos" => 1,
                                                      "x_pos" => 10,
                                                      "y_pos" => 0,
                                                      "width" => 1260,
                                                      "height" => 720,
                                                      "max_rows" => 3,
                                                      "max_columns" => 3,
                                                      "cells_excluded" => [
                                                          4
                                                      ],
                                                      "reuse" => "show_newest",
                                                      "video_sources" => [
                                                          "interviewer-*"
                                                      ]
                                                  ]
                                              ],
                                              "statusCallback" => "https://www.example.com/callbacks",
                                              "resolution" => "1280x720",
                                              "format" => "mp4"
                                          ]
                                 );

print($composition->sid);
