package routes

import (
    "net/http"

    "github.com/gorilla/mux"
)

type route struct {
    Name        string
    Method      string
    Pattern     string
    HandlerFunc http.HandlerFunc
}

type routesCollection []route

// NewRouter present all routes of application
func NewRouter() *mux.Router {

    router := mux.NewRouter().StrictSlash(true)
    for _, route := range routes {
        router.
            Methods(route.Method).
            Path(route.Pattern).
            Name(route.Name).
            Handler(route.HandlerFunc)
    }

    return router
}

var routes = routesCollection{
    route{
        "Index",
        "GET",
        "/",
        Index,
    },
    route{
        "Status",
        "GET",
        "/status",
        AppStatus,
    },
}
