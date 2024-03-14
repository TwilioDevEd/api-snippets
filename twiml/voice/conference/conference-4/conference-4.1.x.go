package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	conference := &twiml.VoiceConference{}
	conference.Name = "EventedConf"
	conference.StatusCallback = "https://myapp.com/events"
	conference.StatusCallbackEvent = "start end join leave mute hold"

	dial.InnerElements = []twiml.Element{conference}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
