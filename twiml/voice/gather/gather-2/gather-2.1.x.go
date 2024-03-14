package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	gather := &twiml.VoiceGather{}

	twimlResult, err := twiml.Voice([]twiml.Element{gather})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
