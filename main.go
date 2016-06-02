package main

import (
    "log"
    "os"
    "net/http"
    "github.com/bdronneau/rentmycourt_api/routes"
)

func main() {
    router := routes.NewRouter()
    port := "8080"

    if len(os.Getenv("GO_PORT")) > 0 {
        port = os.Getenv("GO_PORT")
    }

    log.Fatal(http.ListenAndServe(":" + port , router))
}
