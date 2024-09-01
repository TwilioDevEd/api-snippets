package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	client := &twiml.VoiceClient{}
	client.Identity = "joey"
	client.StatusCallbackEvent = "initiated ringing answered completed"
	client.StatusCallback = "https://myapp.com/calls/events"
	client.StatusCallbackMethod = "POST"

	dial.InnerElements = []twiml.Element{client}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
