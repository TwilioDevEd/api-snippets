package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	play := &twiml.VoicePlay{}
	play.Url = "https://api.twilio.com/cowbell.mp3"

	twimlResult, err := twiml.Voice([]twiml.Element{play})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
