package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	gather := &twiml.VoiceGather{}
	gather.Action = "/completed"
	gather.Input = "speech"

	say := &twiml.VoiceSay{}
	say.Message = "Welcome to Twilio, please tell us why you're calling"

	gather.InnerElements = []twiml.Element{say}

	twimlResult, err := twiml.Voice([]twiml.Element{gather})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
