package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	gather := &twiml.VoiceGather{}
	gather.Action = "/process_gather.php"
	gather.Method = "GET"

	say := &twiml.VoiceSay{}
	say.Message = "Enter something, or not"

	gather.InnerElements = []twiml.Element{say}

	redirect := &twiml.VoiceRedirect{}
	redirect.Method = "GET"
	redirect.Url = "/process_gather.php?Digits=TIMEOUT"

	twimlResult, err := twiml.Voice([]twiml.Element{gather, redirect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
