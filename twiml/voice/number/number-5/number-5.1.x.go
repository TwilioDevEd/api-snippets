package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	number := &twiml.VoiceNumber{}
	number.PhoneNumber = "415-123-4567"
	number.Url = "http://example.com/agent_screen_call"

	dial.InnerElements = []twiml.Element{number}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
