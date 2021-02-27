package main

import (
	"log"
	"time"
)

var AppVersion string

func main() {
	valid := true
	i := 0

	// This loop continues while "valid" is true.
	for valid {
		time.Sleep(10 * time.Second)
		// $((i+1))
		// if i == 7777 {
		//   valid = false
		// }
		t := time.Now()
		log.Println("This is sample log from my-logger-app", i, "Current time UTC:"+t.Format("2006-01-02 15:04:05 Monday"))
		i++
	}
}
