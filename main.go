package main

import (
	"fmt"
	"net/http"
	"os/exec"

	"github.com/gin-gonic/gin"
)

type Deployment struct {
	Service string `json:"service"`
	Version string `json:"version"`
}

type IDeploy struct {
	Tag     string `json:"tag"`
	Service string `json:"service"`
}

func main() {
	fmt.Println("Hello, World")

	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})
	r.GET("/pong", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "ping",
		})
	})

	r.POST("/deploy", func(c *gin.Context) {
		var person Deployment
		if err := c.ShouldBindJSON(&person); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}
		scriptPath := "./kube_deploy.sh"

		cmd := exec.Command("/bin/bash", scriptPath, person.Service)

		output, err := cmd.CombinedOutput()
		if err != nil {
			fmt.Println("Error executing script:", err)
			return
		}

		result := fmt.Sprintf("ids: %v; names: %v output: %v", person.Service, person.Version, string(output))
		c.JSON(http.StatusOK, gin.H{
			"message": result,
		})
	})
	r.Run()
}
