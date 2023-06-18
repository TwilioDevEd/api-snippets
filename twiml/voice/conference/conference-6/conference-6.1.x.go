package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	conference := &twiml.VoiceConference{}
	conference.Name = "NoMusicNoBeepRoom"
	conference.Beep = "false"
	conference.WaitUrl = "http://your-webhook-host.com"
	conference.StartConferenceOnEnter = "true"
	conference.EndConferenceOnExit = "true"

	dial.InnerElements = []twiml.Element{conference}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}