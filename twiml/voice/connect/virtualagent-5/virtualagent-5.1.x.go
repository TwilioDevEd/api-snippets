package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	connect := &twiml.VoiceConnect{}

	agent := &twiml.VoiceVirtualAgent{}
	agent.ConnectorName = "uniqueName"

	parameter := &twiml.VoiceParameter{}
	parameter.Name = "customer_name"
	parameter.Value = "Burton Guster"

	agent.InnerElements = []twiml.Element{parameter}

	connect.InnerElements = []twiml.Element{agent}

	twimlResult, err := twiml.Voice([]twiml.Element{connect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
