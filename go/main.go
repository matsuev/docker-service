package main

import (
	"fmt"
	"net/http"
	"os"
)

var (
	dbUser = ""
	dbHost = ""
	dbPort = ""
	dbPass = ""
)

func init() {
	dbHost, _ = os.LookupEnv("DB_HOST")
	dbPort, _ = os.LookupEnv("DB_PORT")
	dbUser, _ = os.LookupEnv("DB_USER")
	dbPass, _ = os.LookupEnv("DB_PASS")
}

func main() {
	fmt.Println(dbHost, dbPort, dbUser, dbPass)

	http.HandleFunc("/", rootHandler)

	http.ListenAndServe(":8080", nil)
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("<h1>Hello from my Golang server!</h1>"))
}
