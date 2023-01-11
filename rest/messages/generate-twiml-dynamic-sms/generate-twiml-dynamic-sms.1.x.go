package main

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/twilio/twilio-go/twiml"
)

func main() {
	router := gin.Default()

	router.POST("/sms", func(context *gin.Context) {
		incomingBody := strings.ToLower(strings.TrimSpace(context.PostForm("Body")))

		var body string
		if incomingBody == "hello" {
			body = "Hi!"
		} else if incomingBody == "bye" {
			body = "Goodbye"
		} else {
			body = "No Body param match, Twilio sends this in the request to your server."
		}

		message := &twiml.MessagingMessage{
			Body: body,
		}

		twimlResult, err := twiml.Messages([]twiml.Element{message})
		if err != nil {
			context.String(http.StatusInternalServerError, err.Error())
		} else {
			context.Header("Content-Type", "text/xml")
			context.String(http.StatusOK, twimlResult)
		}
	})

	router.Run(":3000")
}
