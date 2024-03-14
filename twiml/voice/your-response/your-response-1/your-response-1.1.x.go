package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say := &twiml.VoiceSay{}
	say.Message = "Hello World"

	play := &twiml.VoicePlay{}
	play.Url = "https://api.twilio.com/Cowbell.mp3"

	twimlResult, err := twiml.Voice([]twiml.Element{say, play})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
