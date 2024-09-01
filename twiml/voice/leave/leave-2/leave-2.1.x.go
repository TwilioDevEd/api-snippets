package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	play := &twiml.VoicePlay{}
	play.Url = "http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3"

	twimlResult, err := twiml.Voice([]twiml.Element{play})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
