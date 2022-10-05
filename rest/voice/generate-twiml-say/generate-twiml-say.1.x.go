package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/twilio/twilio-go/twiml"
)

func main() {
	router := gin.Default()

	router.POST("/answer", func(context *gin.Context) {
		say := &twiml.VoiceSay{
			Message: "Hello from your pals at Twilio! Have fun.",
		}

		twimlResult, err := twiml.Voice([]twiml.Element{say})
		if err != nil {
			context.String(http.StatusInternalServerError, err.Error())
		} else {
			context.Header("Content-Type", "text/xml")
			context.String(http.StatusOK, twimlResult)
		}
	})

	router.Run(":1337")
}
