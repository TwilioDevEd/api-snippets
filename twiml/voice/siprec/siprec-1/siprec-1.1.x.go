package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	start := &twiml.VoiceStart{}

	siprec := &twiml.VoiceSipRec{}
	siprec.Name = "My SIPREC Stream"
	siprec.ConnectorName = "Gridspace_1"

	start.InnerElements = []twiml.Element{siprec}

	twimlResult, err := twiml.Voice([]twiml.Element{start})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
