package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/twilio/twilio-go/twiml"
)

func main() {
	router := gin.Default()

	router.POST("/sms", func(context *gin.Context) {
		message := &twiml.MessagingMessage{
			Body: "The Robots are coming! Head for the hills!",
		}

		twimlResult, _ := twiml.Messages([]twiml.Element{message})

		context.Header("Content-Type", "text/xml")
		context.String(http.StatusOK, twimlResult)
	})

	router.Run(":3000")
}
