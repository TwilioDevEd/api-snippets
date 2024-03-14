package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	connect := &twiml.VoiceConnect{}

	agent := &twiml.VoiceVirtualAgent{}
	agent.ConnectorName = "uniqueName"

	config1 := &twiml.VoiceConfig{}
	config1.Name = "language"
	config1.Value = "en-us"

	config2 := &twiml.VoiceConfig{}
	config2.Name = "voiceName"
	config2.Value = "en-US-Wavenet-C"

	agent.InnerElements = []twiml.Element{config1, config2}

	connect.InnerElements = []twiml.Element{agent}

	twimlResult, err := twiml.Voice([]twiml.Element{connect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
