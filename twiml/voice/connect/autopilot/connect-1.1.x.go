package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	connect := &twiml.VoiceConnect{}

	autopilot := &twiml.VoiceAutopilot{}
	autopilot.Name = "UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

	connect.InnerElements = []twiml.Element{autopilot}

	twimlResult, err := twiml.Voice([]twiml.Element{connect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
