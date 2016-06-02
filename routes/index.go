package routes

import (
    "fmt"
    "net/http"
)

// Index main route
func Index(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello !")
}
