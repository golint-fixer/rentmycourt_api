package routes

import (
  "net/http/httptest"
  "testing"
)

func TestNewRouter(t *testing.T) {
  // Just try to initialize router
  httptest.NewServer(NewRouter())
}
