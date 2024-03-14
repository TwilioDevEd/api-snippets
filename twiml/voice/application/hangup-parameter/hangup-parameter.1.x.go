package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	hangup := &twiml.VoiceHangup{}

	parameter := &twiml.VoiceParameter{}
	parameter.Name = "hangup_reason"
	parameter.Value = "no agents available"

	hangup.InnerElements = []twiml.Element{parameter}

	twimlResult, err := twiml.Voice([]twiml.Element{hangup})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
