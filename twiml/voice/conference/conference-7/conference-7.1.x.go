package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	conference := &twiml.VoiceConference{}
	conference.Name = "Customer Waiting Room"
	conference.Beep = "false"

	dial.InnerElements = []twiml.Element{conference}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
