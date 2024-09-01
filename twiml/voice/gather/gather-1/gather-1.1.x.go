package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	gather := &twiml.VoiceGather{}
	gather.Input = "speech dtmf"
	gather.Timeout = "3"
	gather.NumDigits = "1"

	say := &twiml.VoiceSay{}
	say.Message = "Please press 1 or say sales for sales."

	gather.InnerElements = []twiml.Element{say}

	twimlResult, err := twiml.Voice([]twiml.Element{gather})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
