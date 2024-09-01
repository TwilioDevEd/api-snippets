package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say1 := &twiml.VoiceSay{
		Message: "We're sorry. All of our agents are busy right now.",
	}

	say2 := &twiml.VoiceSay{
		Message: "We will call you back as soon as possible.",
	}

	say3 := &twiml.VoiceSay{
		Message: "Please stay on the line to be redirected to the main menu.",
	}

	hangup := &twiml.VoiceHangup{}
	parameter := &twiml.VoiceParameter{}
	parameter.Name = "payment_collected"
	parameter.Value = "false"

	hangup.InnerElements = []twiml.Element{parameter}

	twimlResult, err := twiml.Voice([]twiml.Element{
		say1,
		say2,
		say3,
		hangup,
	})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
