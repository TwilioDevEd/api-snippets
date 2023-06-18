package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	number1 := &twiml.VoiceNumber{}
	number1.PhoneNumber = "+14155555555"
	number1.StatusCallbackEvent = "initiated ringing answered completed"
	number1.StatusCallback = "https://myapp.com/calls/events"
	number1.StatusCallbackMethod = "POST"

	number2 := &twiml.VoiceNumber{}
	number2.PhoneNumber = "+14153333333"
	number2.StatusCallbackEvent = "initiated ringing answered completed"
	number2.StatusCallback = "https://example.com/events"
	number2.StatusCallbackMethod = "POST"

	dial.InnerElements = []twiml.Element{number1, number2}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
