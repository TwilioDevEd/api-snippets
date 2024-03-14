package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.Action = "handleLeaveConference.php"
	dial.Method = "POST"
	dial.HangupOnStar = "true"
	dial.TimeLimit = "30"

	conference := &twiml.VoiceConference{}
	conference.Name = "LoveTwilio"

	dial.InnerElements = []twiml.Element{conference}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
