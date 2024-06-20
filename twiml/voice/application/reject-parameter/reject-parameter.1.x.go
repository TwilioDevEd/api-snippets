package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	reject := &twiml.VoiceReject{}

	parameter := &twiml.VoiceParameter{}
	parameter.Name = "reject_reason"
	parameter.Value = "no agents available"

	reject.InnerElements = []twiml.Element{parameter}

	twimlResult, err := twiml.Voice([]twiml.Element{reject})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
