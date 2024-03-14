package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say := &twiml.VoiceSay{}
	say.Message = "Hello! You will be now be connected to a virtual agent."

	connect := &twiml.VoiceConnect{}
	connect.Action = "https://myactionurl.com/virtualagent_ended"

	agent := &twiml.VoiceVirtualAgent{}
	agent.ConnectorName = "project"
	agent.StatusCallback = "https://mycallbackurl.com"

	connect.InnerElements = []twiml.Element{agent}

	twimlResult, err := twiml.Voice([]twiml.Element{say, connect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
