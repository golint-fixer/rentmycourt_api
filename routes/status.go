package routes

import (
    "fmt"
    "net/http"

    "github.com/bdronneau/rentmycourt_api/core"
)

func AppStatus(w http.ResponseWriter, r *http.Request) {
    status := core.Status()
    fmt.Fprintln(w, status)
}
