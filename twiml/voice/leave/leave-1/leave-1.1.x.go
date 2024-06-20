package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	enqueue := &twiml.VoiceEnqueue{}
	enqueue.Name = "support"
	enqueue.WaitUrl = "wait.xml"

	say := &twiml.VoiceSay{}
	say.Message = "Unfortunately, the support line has closed. Please call again tomorrow."

	twimlResult, err := twiml.Voice([]twiml.Element{enqueue, say})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
