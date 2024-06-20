package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.Number = "415-123-4567"
	dial.Action = "/handleDialCallStatus"
	dial.Method = "GET"

	say := &twiml.VoiceSay{}
	say.Message = "I am unreachable"

	twimlResult, err := twiml.Voice([]twiml.Element{dial, say})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
