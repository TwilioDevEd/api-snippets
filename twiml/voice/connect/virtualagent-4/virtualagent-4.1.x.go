package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	connect := &twiml.VoiceConnect{}

	agent := &twiml.VoiceVirtualAgent{}
	agent.ConnectorName = "project"
	agent.SentimentAnalysis = "true"

	connect.InnerElements = []twiml.Element{agent}

	twimlResult, err := twiml.Voice([]twiml.Element{connect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
