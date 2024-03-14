package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	number := &twiml.VoiceNumber{}
	number.PhoneNumber = "+12349013030"
	number.StatusCallbackEvent = "initiated ringing answered completed"
	number.StatusCallback = "https://myapp.com/calls/events"
	number.StatusCallbackMethod = "POST"

	dial.InnerElements = []twiml.Element{number}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
