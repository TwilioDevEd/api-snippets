package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	router.POST("/message-status", func(c *gin.Context) {

		messageSid := c.PostForm("MessageSid")
		messageStatus := c.PostForm("MessageStatus")

		fmt.Printf("MessageSid: %s, MessageStatus: %s ", messageSid, messageStatus)

		c.JSON(http.StatusOK, nil)
	})

	router.Run(":3000")
}
