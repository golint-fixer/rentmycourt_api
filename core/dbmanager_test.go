package core

import (
  "fmt"
  "testing"
)

func TestStatus(t *testing.T) {
  status := Status()
  fmt.Sprintf("hello")

  if status != "Okay" {
    t.Errorf("OMG")
  }
}
